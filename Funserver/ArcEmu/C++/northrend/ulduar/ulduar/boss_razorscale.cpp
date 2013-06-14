/*
 * Copyright (C) 2008 - 2009 Trinity <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

/* ScriptData
SDName: razorscale
SDAuthor: MaXiMiUS
SD%Complete: 65
EndScriptData */

#include "ScriptedPch.h"
#include "ulduar.h"

//not in db
#define SAY_AGGRO                   -1000000
#define SAY_KILL                    -1000001
#define SAY_PHASE_2_TRANS           -1000002
#define SAY_PHASE_3_TRANS           -1000003
#define EMOTE_BREATH                -1000004

#define SPELL_DEVOURINGFLAME   RAID_MODE(64709,64734)
#define SPELL_FLAMEBREATH      RAID_MODE(63317,34021)
#define SPELL_FIREBALL         RAID_MODE(62796,63815)
#define SPELL_LIGHTNING_BOLT   RAID_MODE(63809,64696)
#define SPELL_CHAIN_LIGHTNING  RAID_MODE(64758,64759)
#define SPELL_BATTLE_SHOUT     RAID_MODE(46763,64062)

enum Spells
{
    SPELL_FLAMEBUFFET      = 64016,
    SPELL_MORTAL_EFFECT	   = 63046,
    DEVOURING_FLAME_VISUAL = 63236,
    NPC_VISUAL_HITT	   = 33233,

    SPELL_WINGBUFFET       = 62666,
    SPELL_FUSEARMOR        = 64771,
    SPELL_STUN		   = 47923,
    SPELL_WHIRLWIND	   = 63808,
    SPELL_STORMSTRIKE	   = 64757
};

enum Mobs
{
    NPC_DARK_RUNE_SENTINEL = 33846,
    NPC_DARK_RUNE_WATCHER  = 33453,
    NPC_DARK_RUNE_GUARDIAN = 33388,
    GO_BROKEN_HARPOON	   = 194565
};

struct boss_razorscaleAI : public BossAI
{
    boss_razorscaleAI(Creature *pCreature) : BossAI(pCreature, TYPE_RAZORSCALE) 
    {
    pInstance = pCreature->GetInstanceData();
    me->RemoveAllAuras();
    DoCast(me, SPELL_DEVOURINGFLAME);
    Reset();
    }
    
    ScriptedInstance* pInstance;

    uint8 Phase;

    uint32 FlameBreathTimer;
    uint32 FuseArmorTimer;
    uint32 DevouringFlameTimer;
    uint32 FlameBuffetTimer;
    uint32 SummonAddsTimer;
    uint32 WingBuffetTimer;
    uint32 FireballTimer;
    uint32 bFlyPhaseTimer;
    uint32 uiTimer;
    uint32 StunTimer;
    uint32 SpawnHarpoonTimer;


    bool InitialSpawn;
    bool IsFlying;
    bool bFly;
    bool bFlyPhase1;

    void Reset()
    {
        Phase = 0;

        FlyPhase(Phase, 3000);
	bFlyPhaseTimer = 40000;
	uiTimer = 0;
	StunTimer = 0;
	SpawnHarpoonTimer = 60000;
        FlameBreathTimer = 20000;
        DevouringFlameTimer = 6000;
        FuseArmorTimer = 15000;
        FlameBuffetTimer = 3000;
        SummonAddsTimer = 8000;
        WingBuffetTimer = 17000;
        FireballTimer = 18000;

        InitialSpawn = false;
        IsFlying = false;
	bFly = false;
	bFlyPhase1 = false;

        me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, true);
        me->ApplySpellImmune(1, IMMUNITY_EFFECT,SPELL_EFFECT_ATTACK_ME, true);
    }

    void EnterCombat(Unit* who)
    {
	if (!who)
	return;
        DoScriptText(SAY_AGGRO, me);
        DoZoneInCombat();
	if (pInstance)
	pInstance->SetData(TYPE_RAZORSCALE,IN_PROGRESS);
    }

    void JustDied(Unit* /*Killer*/)
    {
    if (pInstance)
    pInstance->SetData(TYPE_RAZORSCALE,DONE);
    }
    
    void SpellHitTarget(Unit *pTarget, const SpellEntry *spell)
    {
        if (spell->Id == SPELL_MORTAL_EFFECT)
            bFlyPhase1 = true;
    }


    void KilledUnit(Unit * /*victim*/)
    {
        DoScriptText(SAY_KILL, me);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
	Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0);
	if (!pTarget)
	return;

        if(me->GetPositionY() > -60 || me->GetPositionX() < 450) // Not Blizzlike, anti-exploit to prevent players from pulling bosses to vehicles.
        {
            me->RemoveAllAuras();
            me->DeleteThreatList();
            me->CombatStop(false);
            me->GetMotionMaster()->MoveTargetedHome();
        }

        if (me->getVictim() && !me->getVictim()->GetCharmerOrOwnerPlayerOrPlayerItself())
            me->Kill(me->getVictim());
	    
	if ((me->GetHealth()*100 / me->GetMaxHealth()) < 90 && Phase == 0)
        {
	Phase = 1;
	bFly = true;
	}

        if ((me->GetHealth()*100 / me->GetMaxHealth()) < 50 && Phase == 1)
        {
	    me->RemoveAllAuras();
	    Phase = 2;
	    InitialSpawn = false;
	    if (IsFlying)
		{
		    me->SetFlying(false);
                    me->GetMotionMaster()->MoveTargetedHome();
		    IsFlying = false;
		    me->SetReactState(REACT_AGGRESSIVE);
		    me->SendMovementFlagUpdate();
		}
            DoScriptText(SAY_PHASE_2_TRANS, me); 
        }

        if ((me->GetHealth()*100 / me->GetMaxHealth()) < 33 && Phase == 2)
        {
            Phase = 3;
            DoScriptText(SAY_PHASE_3_TRANS, me);
        }

        if (Phase >= 2)
        {
            if (FuseArmorTimer <= diff)
            {
                DoCastVictim(SPELL_FUSEARMOR);
                FuseArmorTimer = 10000;
            } else FuseArmorTimer -= diff;

            if (WingBuffetTimer <= diff)
            {
                DoCast(SPELL_WINGBUFFET);
                WingBuffetTimer = urand(27000,34000);
            } else WingBuffetTimer -= diff;

            if (FireballTimer <= diff)
            {
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 200, true))
                {
                    me->SetInFront(pTarget);
                    DoCast(pTarget, SPELL_FIREBALL);
                }
                FireballTimer = 18000;
            } else FireballTimer -= diff;

            if (Phase == 3)
            {
                if (FlameBuffetTimer <= diff)
                {
                    DoScriptText(EMOTE_BREATH, me);
                    std::list<Unit*> pTargets;
                    SelectTargetList(pTargets, RAID_MODE(3,9), SELECT_TARGET_RANDOM, 100, true);
                    uint8 i = 0;
                    for (std::list<Unit*>::const_iterator itr = pTargets.begin(); itr != pTargets.end();)
                    {
                        if (me->HasInArc(M_PI, *itr))
                        {
                            DoCast(*itr, SPELL_FLAMEBUFFET, true);
                            ++i;
                        }
                        if (++itr == pTargets.end() || i == RAID_MODE(3,9))
                        {
                            AttackStart(*--itr);
                            break;
                        }
			if (!i)
			return;
                    }
                    FlameBuffetTimer = 25000;
                } else FlameBuffetTimer -= diff;
		
		if (FlameBreathTimer <= diff)
		{
                DoScriptText(EMOTE_BREATH, me);
                DoCastVictim(SPELL_FLAMEBREATH);
                FlameBreathTimer = 15000;
		} else FlameBreathTimer -= diff;
	  }
	  DoMeleeAttackIfReady();
        }
        else if (Phase == 1)
        {
	     if (bFly)
	     {
		FlyPhase(Phase, diff);
		SummonAddsTimer = 8000;
		bFly = false;
	     }
	     
	     Creature* pSpellHitt;
		pSpellHitt = NULL;
    
	     if (pSpellHitt = me->FindNearestCreature(NPC_VISUAL_HITT, 5.0f, true))
	     {
	            me->GetMotionMaster()->MoveTargetedHome();
		    me->SetFlying(false);
		    me->SendMovementFlagUpdate();
		    IsFlying = false;
		    bFlyPhase1 = true;
		    bFlyPhaseTimer = 35000;
		    bFly = false;
		    InitialSpawn = false;
		    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
		    StunTimer = 2000;
		}
		 if (!bFly && bFlyPhase1 && !IsFlying && StunTimer <= diff)
		    {
		    DoCast(me,SPELL_STUN);
		    StunTimer = 2000;
		    } else StunTimer -= diff;
	     
	     if (bFlyPhase1 && bFlyPhaseTimer <= diff)
		    {
		    me->RemoveAllAuras();
		    me->SetReactState(REACT_AGGRESSIVE);
		    me->SendMovementFlagUpdate();
		    DoScriptText(EMOTE_BREATH, me);
		    DoCastVictim(SPELL_FLAMEBREATH);
		    DoCast(SPELL_WINGBUFFET);
		    bFlyPhaseTimer = 40000;
		    SpawnHarpoonTimer = 60000;
		    bFly = true;
		    bFlyPhase1 = false;
		    } else bFlyPhaseTimer -= diff;

            if (FireballTimer <= diff)
            {
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 200, true))
                {
                    me->SetInFront(pTarget);
                    DoCast(pTarget, SPELL_FIREBALL);
                }
                FireballTimer = 12000;
            } else FireballTimer -= diff;

            if (DevouringFlameTimer <= diff)
            {
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 200, true))
                {
                    me->SetInFront(pTarget);
                    DoCast(pTarget, DEVOURING_FLAME_VISUAL);
                }
                DevouringFlameTimer = 6000;
            } else DevouringFlameTimer -= diff;
	    
	    if (InitialSpawn)
	    {
              if (SummonAddsTimer <= diff)
	      {
                SummonAdds();
		InitialSpawn = true;
	      } else SummonAddsTimer -= diff;
	    }
	    
	    if (InitialSpawn && SpawnHarpoonTimer <= diff)
	    {
	    if (pInstance)
	    pInstance->SetData(DATA_HARPOON, pInstance->GetData(DATA_HARPOON)+1);
	    //if(!GetClosestGameObjectWithEntry(me, GO_BROKEN_HARPOON, 200.0f))
	      //if (GameObject* pGo = me->SummonGameObject(GO_BROKEN_HARPOON, 607.613, -134.207, 391.297, 4.10138, 0, 0, 0, 0,0))
		 
	    SpawnHarpoonTimer = 60000;
	    } else SpawnHarpoonTimer -= diff;
	    
	    //EnterEvadeIfOutOfCombatArea(diff);
        }
    }

    void SummonAdds()
    {
	if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 200, true))
	{
                float x = std::max(500.0f, std::min(650.0f, pTarget->GetPositionX() + irand(-20,20)));   // Safe range is between 500 and 650
                float y = std::max(-235.0f, std::min(-145.0f, pTarget->GetPositionY() + irand(-20,20))); // Safe range is between -235 and -145
                float z = me->GetBaseMap()->GetHeight(x, y, MAX_HEIGHT);                         // Ground level
	    switch(urand(0, 2)) //33% chance of spawning
            {
                case 0:
                break;
                case 1:
			if (Creature *pAdd = me->SummonCreature(NPC_DARK_RUNE_SENTINEL, x, y, z, 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 30000))
			  if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 200, true)) 
			      {
			      pAdd->AddThreat(pTarget,0.0f); 
			      pAdd->AI()->AttackStart(pTarget);
			      }
		break;
                case 2:
                break;
	    }
	    
	uint8 random = urand(1,2);
        for (uint8 i = 0; i < random; ++i)
        {    
	    if (Creature* pTemp = me->SummonCreature(NPC_DARK_RUNE_WATCHER, x, y, z, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                {
                    pTemp->AddThreat(pTarget,0.0f);
                    pTemp->AI()->AttackStart(pTarget);
                }
	}
	uint8 randomg = urand(1,2);
        for (uint8 i = 0; i < randomg; ++i)
        {    
	
	    if (Creature* pTemp = me->SummonCreature(NPC_DARK_RUNE_GUARDIAN, x, y, z, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                {
                    pTemp->AddThreat(pTarget,0.0f);
                    pTemp->AI()->AttackStart(pTarget);
                }
	}
        SummonAddsTimer = 45000;
      }
    }

    void FlyPhase(uint8 Phase, const uint32 /*diff*/)
    {
        if (bFly && Phase == 1)
        {
	    IsFlying = true;
	    InitialSpawn = true;
	    me->SendMovementFlagUpdate();
	    me->SetReactState(REACT_PASSIVE);
	    me->GetMotionMaster()->MovePoint(0,587.54,-174.92,415.51);
	    me->SetFlying(IsFlying);
	    me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        }
    }
};

struct mob_devouring_flame_targetAI : public ScriptedAI
{
    mob_devouring_flame_targetAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        SetCombatMovement(false);
        m_pInstance = pCreature->GetInstanceData();
    }
 
    ScriptedInstance* m_pInstance;
 
    uint32 Death_Timer;
 
    void Reset()
    {
        Death_Timer = 25500;
        me->SetDisplayId(11686);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        DoCast(me, SPELL_DEVOURINGFLAME);
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!me->getVictim())
            return;
 
        if (Death_Timer < diff)
        {
            me->DealDamage(me, me->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        }else Death_Timer -= diff;
    }
};

struct mob_dark_rune_watcherAI : public ScriptedAI
{
    mob_dark_rune_watcherAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = pCreature->GetInstanceData();
    }
 
    ScriptedInstance* m_pInstance;
 
    uint32 Spell_Timer;
 
    void Reset()
    {
        Spell_Timer = 10000;
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!me->getVictim())
            return;
 
        if (Spell_Timer < diff)
        {
            switch(urand(0, 1))
            {
                case 0:
                    DoCast(me->getVictim(), SPELL_LIGHTNING_BOLT);
                break;
                case 1:
                    DoCast(me->getVictim(), SPELL_CHAIN_LIGHTNING);
                break;
            }
            Spell_Timer = urand(7000, 11000);
        }else Spell_Timer -= diff;
        
        DoMeleeAttackIfReady();
    }
};

// dark rune sentinel
struct mob_dark_rune_sentinelAI : public ScriptedAI
{
    mob_dark_rune_sentinelAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = pCreature->GetInstanceData();
    }
 
    ScriptedInstance* m_pInstance;
 
    uint32 Whirl_Timer;
    uint32 Shout_Timer;
 
    void Reset()
    {
        Whirl_Timer = 10000;
        Shout_Timer = 2000;
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!me->getVictim())
            return;
 
        if (Whirl_Timer < diff)
        {
            DoCast(me, SPELL_WHIRLWIND);
            Whirl_Timer = urand(10000, 15000);
        }else Whirl_Timer -= diff;
 
        if (Shout_Timer < diff)
        {
            DoCast(me, SPELL_BATTLE_SHOUT);
            Shout_Timer = 30000;
        }else Shout_Timer -= diff;
        
        DoMeleeAttackIfReady();
    }
 
};
 
// dark rune guardian
struct mob_dark_rune_guardianAI : public ScriptedAI
{
    mob_dark_rune_guardianAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = pCreature->GetInstanceData();
    }
 
    ScriptedInstance* m_pInstance;

 
    uint32 Stormstrike_Timer;
 
    void Reset()
    {
        Stormstrike_Timer = 10000;
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!me->getVictim())
            return;
 
        if (Stormstrike_Timer < diff)
        {
            DoCast(me->getVictim(), SPELL_STORMSTRIKE);
            Stormstrike_Timer = urand(7000, 13000);
        }else Stormstrike_Timer -= diff;
        
        DoMeleeAttackIfReady();
    }
 
};

CreatureAI* GetAI_mob_dark_rune_watcher(Creature* pCreature)
{
    return new mob_dark_rune_watcherAI(pCreature);
}
 
CreatureAI* GetAI_mob_dark_rune_sentinel(Creature* pCreature)
{
    return new mob_dark_rune_sentinelAI(pCreature);
}

CreatureAI* GetAI_mob_dark_rune_guardian(Creature* pCreature)
{
    return new mob_dark_rune_guardianAI(pCreature);
}
 
CreatureAI* GetAI_mob_devouring_flame_target(Creature* pCreature)
{
    return new mob_devouring_flame_targetAI(pCreature);
}

CreatureAI* GetAI_boss_razorscale(Creature* pCreature)
{
    return new boss_razorscaleAI (pCreature);
}

void AddSC_boss_razorscale()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_razorscale";
    newscript->GetAI = &GetAI_boss_razorscale;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "mob_devouring_flame_target";
    newscript->GetAI = &GetAI_mob_devouring_flame_target;
    newscript->RegisterSelf();
 
    newscript = new Script;
    newscript->Name = "mob_dark_rune_watcher";
    newscript->GetAI = &GetAI_mob_dark_rune_watcher;
    newscript->RegisterSelf();
 
    newscript = new Script;
    newscript->Name = "mob_dark_rune_sentinel";
    newscript->GetAI = &GetAI_mob_dark_rune_sentinel;
    newscript->RegisterSelf();
 
    newscript = new Script;
    newscript->Name = "mob_dark_rune_guardian";
    newscript->GetAI = &GetAI_mob_dark_rune_guardian;
    newscript->RegisterSelf();
}
