/* Copyright (C) 2010 FlameScripts <http://www.flame-wow.org/>
* This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/* ScriptData
SDName: boss_razorscale
SD%Complete: 90%
SDComment: missing knockback at beggining of phase2. yells and emotes missing, need to use harpoons to start ground phase instead of timer
SDCategory: Ulduar
EndScriptData */

#include "precompiled.h"
#include "ulduar.h"

enum
{
    //yells/emotes

    //razorscale air phase
    SPELL_FIREBALL                = 62796,
    SPELL_FIREBALL_H            = 63815,
    SPELL_WING_BUFFET            = 62666,
    SPELL_STUN                    = 62794,
    //both
    SPELL_BERSERK                = 47008,
    DEVOURING_FLAME_VISUAL        = 63236,
    SPELL_FLAME_BREATH            = 63317,
    SPELL_FLAME_BREATH_H        = 64021,
    //ground
    SPELL_FLAME_BUFFET            = 64016,
    SPELL_FLAME_BUFFET_H        = 64023,
    SPELL_FUSE_ARMOR            = 64771,

    //devouring flame target
    AURA_DEVOURING_FLAME        = 64709,
    AURA_DEVOURING_FLAME_H        = 64734,

    //dark rune watcher
    SPELL_LIGHTNING_BOLT        = 63809,
    SPELL_LIGHTNING_BOLT_H        = 64696,
    SPELL_CHAIN_LIGHTNING        = 64758,
    SPELL_CHAIN_LIGHTNING_H        = 64759,

    //dark rune sentinel
    SPELL_BATTLE_SHOUT            = 46763,
    SPELL_BATTLE_SHOUT_H        = 64062,
    SPELL_WHIRLWIND                = 63808,

    //dark rune guardian
    SPELL_STORMSTRIKE            = 64757,

    //NPC ids
    MOB_DARK_RUNE_WATCHER        = 33453,
    MOB_DARK_RUNE_SENTINEL        = 33846,
    MOB_DARK_RUNE_GUARDIAN        = 33388
};

#define GOSSIP_START     "Bring Razorscale down!"

//expedition commander
struct FLAMEMU_DLL_DECL npc_expedition_commanderAI : public ScriptedAI
{
    npc_expedition_commanderAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
        SetCombatMovement(false);
    }

    ScriptedInstance* m_pInstance;

    void Reset()
    {
    }

    void BeginRazorscaleEvent(Player* pPlayer)
    {
        debug_log("SD2: Razorscale - event initiated by player %s", pPlayer->GetName());

        if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_RAZORSCALE))))
                {
                    pTemp->SetInCombatWithZone();
                    pTemp->AddThreat(pPlayer,0.0f);
                    pTemp->AI()->AttackStart(pPlayer);
                }
    }

    void UpdateAI(const uint32 diff)
    {
        DoMeleeAttackIfReady();

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim()) return;

        if (!m_pInstance)
            return;
    }
};

CreatureAI* GetAI_npc_expedition_commander(Creature* pCreature)
{
    return new npc_expedition_commanderAI(pCreature);
}

bool GossipHello_npc_expedition_commander(Player* pPlayer, Creature* pCreature)
{
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_START, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_expedition_commander(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        ((npc_expedition_commanderAI*)pCreature->AI())->BeginRazorscaleEvent(pPlayer);
    }

    return true;
}

// devouring_flame_target
struct FLAMEMU_DLL_DECL mob_devouring_flame_targetAI : public ScriptedAI
{
    mob_devouring_flame_targetAI(Creature* pCreature) : ScriptedAI(pCreature) 
    {
        Reset();
        SetCombatMovement(false);
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    uint32 Death_Timer;

    void Reset()
    {
        Death_Timer = 25500;
        m_creature->SetDisplayId(11686);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        DoCast(m_creature,  m_bIsRegularMode ? AURA_DEVOURING_FLAME : AURA_DEVOURING_FLAME_H);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (Death_Timer < diff)
        {
            m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        }else Death_Timer -= diff;
    }
};

CreatureAI* GetAI_mob_devouring_flame_target(Creature* pCreature)
{
    return new mob_devouring_flame_targetAI(pCreature);
}

// dark rune watcher
struct FLAMEMU_DLL_DECL mob_dark_rune_watcherAI : public ScriptedAI
{
    mob_dark_rune_watcherAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    uint32 Spell_Timer;

    void Reset()
    {
        Spell_Timer = 10000;
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (Spell_Timer < diff)
        {
            switch(urand(0, 1))
            {
                case 0:
                    DoCast(m_creature->getVictim(), m_bIsRegularMode ? SPELL_LIGHTNING_BOLT : SPELL_LIGHTNING_BOLT_H);
                break;
                case 1:
                    DoCast(m_creature->getVictim(), m_bIsRegularMode ? SPELL_CHAIN_LIGHTNING : SPELL_CHAIN_LIGHTNING_H);
                break;
            }
            Spell_Timer = urand(7000, 11000);
        }else Spell_Timer -= diff;        
        
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_dark_rune_watcher(Creature* pCreature)
{
    return new mob_dark_rune_watcherAI(pCreature);
}

// dark rune sentinel
struct FLAMEMU_DLL_DECL mob_dark_rune_sentinelAI : public ScriptedAI
{
    mob_dark_rune_sentinelAI(Creature* pCreature) : ScriptedAI(pCreature) 
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    uint32 Whirl_Timer;
    uint32 Shout_Timer;

    void Reset()
    {
        Whirl_Timer = 10000;
        Shout_Timer = 2000;
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (Whirl_Timer < diff)
        {
            DoCast(m_creature, SPELL_WHIRLWIND);
            Whirl_Timer = urand(10000, 15000);
        }else Whirl_Timer -= diff;

        if (Shout_Timer < diff)
        {
            DoCast(m_creature, m_bIsRegularMode ? SPELL_BATTLE_SHOUT : SPELL_BATTLE_SHOUT_H);
            Shout_Timer = 30000;
        }else Shout_Timer -= diff;
        
        DoMeleeAttackIfReady();
    }

};

CreatureAI* GetAI_mob_dark_rune_sentinel(Creature* pCreature)
{
    return new mob_dark_rune_sentinelAI(pCreature);
}

// dark rune guardian
struct FLAMEMU_DLL_DECL mob_dark_rune_guardianAI : public ScriptedAI
{
    mob_dark_rune_guardianAI(Creature* pCreature) : ScriptedAI(pCreature) 
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    uint32 Stormstrike_Timer;

    void Reset()
    {
        Stormstrike_Timer = 10000;
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (Stormstrike_Timer < diff)
        {
            DoCast(m_creature->getVictim(), SPELL_STORMSTRIKE);
            Stormstrike_Timer = urand(7000, 13000);
        }else Stormstrike_Timer -= diff;
        
        DoMeleeAttackIfReady();
    }

};

CreatureAI* GetAI_mob_dark_rune_guardian(Creature* pCreature)
{
    return new mob_dark_rune_guardianAI(pCreature);
}

float RazorscaleAddX[4];
float RazorscaleAddY[4];
float RazorscaleAddZ[4];
float RazorscaleBossX[2];
float RazorscaleBossY[2];
float RazorscaleBossZ[2];

//razorscale
struct FLAMEMU_DLL_DECL boss_razorscaleAI : public ScriptedAI
{
    boss_razorscaleAI(Creature* pCreature) : ScriptedAI(pCreature) 
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();

        RazorscaleAddX[3] = 621.633301; RazorscaleAddY[3] = -228.671371; RazorscaleAddZ[3] = 391.180328; //right
        RazorscaleAddX[1] = 564.140198; RazorscaleAddY[1] = -222.049149; RazorscaleAddZ[1] = 391.517212; //left
        RazorscaleAddX[2] = 591; RazorscaleAddY[2] = -209; RazorscaleAddZ[2] = 392; //middle
        RazorscaleBossX[2] = 587.629761; RazorscaleBossY[2] = -179.022522; RazorscaleBossZ[2] = 391.625061; //ground
        RazorscaleBossX[1] = 587.629761; RazorscaleBossY[1] = -179.022522; RazorscaleBossZ[1] = 435.415070; //air

        Reset();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    uint32 Fireball_Timer;
    uint32 Devouring_Flame_Timer;
    uint32 Flame_Buffet_Timer;
    uint32 Fuse_Armor_Timer;
    uint32 Flame_Breath_Timer;
    uint32 wave1_spawn;  //right side, 1 of each
    uint32 wave2_spawn; //left side, 1 of each
    uint32 wave3_spawn; // big guy
    uint32 Berserk_Timer;
    uint32 Grounded_Timer; // 8 secs after ground fase is over, adds come
    uint32 Ground_Cast;
    uint32 Ground_Knockback;
    uint32 Timetoground;
    uint32 Stun_Timer;
    bool airphase;
    bool grounded;
    bool berserk;

    void Reset()
    {
        Fireball_Timer = 10000;  // 10 secs for the first, fckin spam after that ~2secs
        Devouring_Flame_Timer = 18000; // 18 secs first, 12 seconds after
        wave1_spawn = 7000; // 54
        wave2_spawn = 9000; //52
        wave3_spawn = 11000; //56
        Berserk_Timer = 900000;
        Timetoground = 80000;
        airphase = false;
        grounded = false;
        berserk = false;
        if (m_pInstance)
            m_pInstance->SetData(TYPE_RAZORSCALE, NOT_STARTED);
    }

    void JustDied(Unit* pKiller)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_RAZORSCALE, DONE);
    }

    void Aggro(Unit* pWho)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_RAZORSCALE, IN_PROGRESS);
        airphase = true;
        SetCombatMovement(false);
        m_creature->GetMotionMaster()->MoveIdle();
        m_creature->GetMap()->CreatureRelocation(m_creature, RazorscaleBossX[1], RazorscaleBossY[1], RazorscaleBossZ[1], 0.0f);
        m_creature->SendMonsterMove(RazorscaleBossX[1], RazorscaleBossY[1], RazorscaleBossZ[1], SPLINETYPE_NORMAL, m_creature->GetSplineFlags(), 1);
    }

    void JustReachedHome()
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_RAZORSCALE, FAIL);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (Fireball_Timer < diff && airphase && !grounded)
        {
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(target, m_bIsRegularMode ? SPELL_FIREBALL : SPELL_FIREBALL_H);
            Fireball_Timer = 2000;
        }else Fireball_Timer -= diff;   

        if (Devouring_Flame_Timer < diff && !grounded)
        {
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(target, DEVOURING_FLAME_VISUAL);
            Devouring_Flame_Timer = 12000;
        }else Devouring_Flame_Timer -= diff;  

        if (wave1_spawn < diff && airphase && !grounded)
        {
            if (Creature* pTemp = m_creature->SummonCreature(MOB_DARK_RUNE_WATCHER, RazorscaleAddX[3], RazorscaleAddY[3], RazorscaleAddZ[3], 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                {
                    pTemp->AddThreat(pTarget,0.0f);
                    pTemp->AI()->AttackStart(pTarget);
                }
            if (Creature* pTemp = m_creature->SummonCreature(MOB_DARK_RUNE_GUARDIAN, RazorscaleAddX[3], RazorscaleAddY[3], RazorscaleAddZ[3], 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                {
                    pTemp->AddThreat(pTarget,0.0f);
                    pTemp->AI()->AttackStart(pTarget);
                }
            wave1_spawn = 54000;
        }else wave1_spawn -= diff;

        if (wave2_spawn < diff && airphase && !grounded)
        {
            if (Creature* pTemp = m_creature->SummonCreature(MOB_DARK_RUNE_WATCHER, RazorscaleAddX[1], RazorscaleAddY[1], RazorscaleAddZ[1], 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                {
                    pTemp->AddThreat(pTarget,0.0f);
                    pTemp->AI()->AttackStart(pTarget);
                }
            if (Creature* pTemp = m_creature->SummonCreature(MOB_DARK_RUNE_GUARDIAN, RazorscaleAddX[1], RazorscaleAddY[1], RazorscaleAddZ[1], 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                {
                    pTemp->AddThreat(pTarget,0.0f);
                    pTemp->AI()->AttackStart(pTarget);
                }
            wave2_spawn = 54000;
        }else wave2_spawn -= diff;

        if (wave3_spawn < diff && airphase && !grounded)
        {
            switch(urand(0, 2)) //33% chance of spawning
            {
                case 0:
                break;
                case 1:
                    if (Creature* pTemp = m_creature->SummonCreature(MOB_DARK_RUNE_SENTINEL, RazorscaleAddX[2], RazorscaleAddY[2], RazorscaleAddZ[2], 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
                        if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                        {
                            pTemp->AddThreat(pTarget,0.0f);
                            pTemp->AI()->AttackStart(pTarget);
                        }
                break;
                case 2:
                break;
            }
            wave3_spawn = 54000;
        }else wave3_spawn -= diff;

        if (Berserk_Timer < diff && !berserk)
        {
            DoCast(m_creature, SPELL_BERSERK);
            berserk = true;
        }else Berserk_Timer -= diff;

        if (Timetoground < diff && airphase)
        {
            m_creature->GetMap()->CreatureRelocation(m_creature, RazorscaleBossX[2], RazorscaleBossY[2], RazorscaleBossZ[2], 1.5);
            m_creature->SendMonsterMove(RazorscaleBossX[2], RazorscaleBossY[2], RazorscaleBossZ[2], SPLINETYPE_NORMAL, m_creature->GetSplineFlags(), 1);
            grounded = true;
            Stun_Timer = 2000;
            Ground_Cast = 40000;
            Grounded_Timer = 45000;
            Timetoground = 130000;
        }else Timetoground -= diff;

        if (Stun_Timer < diff && grounded)
        {
            DoCast(m_creature, SPELL_STUN);
            Stun_Timer = 60000;
        }else Stun_Timer -= diff;

        if (Ground_Cast < diff && grounded)
        {
            m_creature->RemoveAurasDueToSpell(SPELL_STUN);
            DoCast(m_creature, m_bIsRegularMode ? SPELL_FLAME_BREATH : SPELL_FLAME_BREATH_H);
            Ground_Cast = 10000;
            Ground_Knockback = 1000;
        }else Ground_Cast -= diff;

        if (Ground_Knockback < diff && grounded)
        {
            DoCast(m_creature, SPELL_WING_BUFFET);
            Ground_Knockback = 10000;
        }else Ground_Knockback -= diff;

        if (Grounded_Timer < diff && grounded)
        {
            m_creature->GetMap()->CreatureRelocation(m_creature, RazorscaleBossX[1], RazorscaleBossY[1], RazorscaleBossZ[1], 0.0f);
            m_creature->SendMonsterMove(RazorscaleBossX[1], RazorscaleBossY[1], RazorscaleBossZ[1], SPLINETYPE_NORMAL, m_creature->GetSplineFlags(), 1);
            grounded = false;
            Fireball_Timer = 10000;
            Devouring_Flame_Timer = 18000;
            wave1_spawn = 7000;
            wave2_spawn = 9000;
            wave3_spawn = 11000;
        }else Grounded_Timer -= diff;

        if (airphase && (m_creature->GetHealth()*100 / m_creature->GetMaxHealth()) < 50)
        {
            if (m_creature->HasAura(SPELL_STUN))
                m_creature->RemoveAurasDueToSpell(SPELL_STUN);
            airphase = false;
            grounded = false;
            Devouring_Flame_Timer = 12000;
            Flame_Buffet_Timer = 10000; //every 10 secs
            Fuse_Armor_Timer = 13000; //every ~13
            Flame_Breath_Timer = 6000; //every 14
            SetCombatMovement(true);
            m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim());
        }

        if (Fuse_Armor_Timer < diff && !airphase)
        {
            DoCast(m_creature->getVictim(), SPELL_FUSE_ARMOR);
            Fuse_Armor_Timer = 13000;
        }else Fuse_Armor_Timer -= diff;

        if (Flame_Buffet_Timer < diff && !airphase)
        {
            DoCast(m_creature, m_bIsRegularMode ? SPELL_FLAME_BUFFET : SPELL_FLAME_BUFFET_H);
            Flame_Buffet_Timer = 13000;
        }else Flame_Buffet_Timer -= diff;

        if (Flame_Breath_Timer < diff && !airphase)
        {
            DoCast(m_creature, m_bIsRegularMode ? SPELL_FLAME_BREATH : SPELL_FLAME_BREATH_H);
            Flame_Breath_Timer = 14000;
        }else Flame_Breath_Timer -= diff;

        if (!airphase && !grounded)
            DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_razorscale(Creature* pCreature)
{
    return new boss_razorscaleAI(pCreature);
}

void AddSC_boss_razorscale()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "boss_razorscale";
    NewScript->GetAI = GetAI_boss_razorscale;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "mob_devouring_flame_target";
    NewScript->GetAI = &GetAI_mob_devouring_flame_target;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "mob_dark_rune_watcher";
    NewScript->GetAI = &GetAI_mob_dark_rune_watcher;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "mob_dark_rune_sentinel";
    NewScript->GetAI = &GetAI_mob_dark_rune_sentinel;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "mob_dark_rune_guardian";
    NewScript->GetAI = &GetAI_mob_dark_rune_guardian;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "npc_expedition_commander";
    NewScript->GetAI = &GetAI_npc_expedition_commander;
    NewScript->pGossipHello = &GossipHello_npc_expedition_commander;
    NewScript->pGossipSelect = &GossipSelect_npc_expedition_commander;
    NewScript->RegisterSelf();
}