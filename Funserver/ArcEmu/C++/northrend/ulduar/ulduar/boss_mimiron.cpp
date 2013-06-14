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

#include "ScriptedPch.h"
#include "ulduar.h"

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

#include "ScriptedPch.h"
#include "ulduar.h"
#define NPC_LIVIATHAN_MK_II	33432
#define NPC_VX001		33651
#define NPC_AERIAL_UNIT		33670
//Summon mobs
#define NPC_ASSAULT_BOT		34057
#define NPC_BOMB_BOT		33836
#define NPC_JANC_BOT		33855
//Spells
//MK II
#define SPELL_PROXIMITY_MINES	63016
#define SPELL_EXPLOSION		RAID_MODE(66351,63009)
#define SPELL_NAPALM_SHELL	RAID_MODE(63666,65026)
#define SPELL_PLASMA_BLAST	RAID_MODE(62997,64529)
#define SPELL_SHOCK_BLAST	63631
// VX-001
#define SPELL_REPID_BURST_L	RAID_MODE(63387,64351)
#define SPELL_REPID_BURST_R	RAID_MODE(64019,64532)
#define SPELL_LASER_BARRAGE	63293
#define SPELL_ROCKET_STRIKE	64064
#define SPELL_HEAL_WAVE		RAID_MODE(63677,64533)
#define SPELL_SPINNING_UP       63414
// Aerial Command Unit
#define SPELL_PLASMA_BALL	RAID_MODE(63689,64535)
// Mimiron
#define SPELL_HAND_PULSEL	RAID_MODE(64348,64536)
#define SPELL_HAND_PULSER	RAID_MODE(64352,64537)
enum
{
SAY_INTRO	= -1900400,
SAY_AGGRO	= -1900401,
SAY_DEATH	= -1900402,
SAY_MK_II_START	= -1900403,
SAY_KILL_MK_1	= -1900404,
SAY_KILL_MK_2   = -1900405,
SAY_VX001_START	= -1900406,
SAY_VX001_AGGRO = -1900407,
SAY_KILL_VX_1	= -1900408,
SAY_KILL_VX_2	= -1900409,
SAY_UNIT_START	= -1900410,
SAY_UNIT_AGGRO  = -1900411,
SAY_KILL_UNIT_1 = -1900412,
SAY_KILL_UNIT_2 = -1900413,
SAY_VOLTRON	= -1900414
};

const Position Posit [3] = 
{
{2744.64,2569.45,364.39,3.14},
{2796.86,2597.0,364.3,3.5},
{2795.65,2540.0,364.3,3.0}
};
struct boss_mimironAI : public BossAI
{
    boss_mimironAI(Creature* pCreature) : BossAI(pCreature, TYPE_MIMIRON)
    {
        m_pInstance = pCreature->GetInstanceData();
        //Reset();
	pBoss = NULL;
    }

    ScriptedInstance* m_pInstance;
    Creature* pBoss;
    
    uint32 ProximityMinesTimer;
    uint32 ShockBlastTimer;
    uint32 RocketStrikeTimer;
    uint32 LaserBarrageTimer;
    uint32 PlasmaBallTimer;
    uint32 HandPulselTimer;
    uint32 HandPulserTimer;
    uint64 AggroTargetGUID;
    uint32 AggroTimer;
    uint32 uiTimer;
    uint8 uiPhase;
    uint8 uiSteep;
    bool MK_Phase;
    bool VX_Phase;
    bool UnitPhase;
    bool MimironPhase;
    bool Intro;
    bool Done;

    void Reset()
    {
    ProximityMinesTimer = 35000;
    ShockBlastTimer = 30000;
    RocketStrikeTimer = 24000;
    LaserBarrageTimer = 14000;
    PlasmaBallTimer = 3000;
    HandPulselTimer = 1500;
    HandPulserTimer = 1500;
    AggroTimer = 10000;
    AggroTargetGUID = 0;
    uiPhase = 0;
    uiTimer = 0;
    uiSteep = 0;
    MK_Phase = true;
    VX_Phase = false;
    UnitPhase = false;
    MimironPhase = false;
    Intro = false;
    Done = false;
    
    if (pBoss && pBoss->isAlive())
        pBoss->RemoveFromWorld();
    }
    
    void SetData(uint32 uiId, uint32 uiValue)
    {
    if (uiId == 1)
    {
        VX_Phase = true;
	NextStep(2000,false,3);
	}
	
    if (uiId == 2)
    {
        UnitPhase = true;
	NextStep(2000,false,6);
	}
	
    if (uiId == 3)
    {
        MimironPhase = true;
	NextStep(1000,false,8);
	}
    }
    void JustSummoned(Creature* pSummon)
    {
        pBoss = pSummon;
    }

    void JustDied(Unit *victim)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_MIMIRON, DONE);
	if (m_pInstance)
	    m_pInstance->SetData64(DATA_MIMI_DOOR,2);
	DoScriptText(SAY_DEATH,me);
    }

    void Aggro(Unit* pWho)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_MIMIRON, IN_PROGRESS);
    }
    
    void MoveInLineOfSight(Unit* pWho)
    {
    	if (!Intro && pWho->GetTypeId() == TYPEID_PLAYER && pWho->isTargetableForAttack() && me->IsHostileTo(pWho) && pWho->isInAccessiblePlaceFor(me))
        {
            if (me->IsWithinDistInMap(pWho, VISIBLE_RANGE) && me->IsWithinLOSInMap(pWho))
            {
		me->GetMotionMaster()->Clear(false);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                DoScriptText(SAY_INTRO, me);
                me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_TALK);
                AggroTargetGUID = pWho->GetGUID();
                Intro = true;
	    }
	if (Done)
            ScriptedAI::MoveInLineOfSight(pWho);
	}
    }
    
    void NextStep(uint32 uiTimerStep,bool bNextStep = true,uint8 uiPhaseStep = 0)
    {
        uiTimer = uiTimerStep;
        if (bNextStep)
            ++uiSteep;
        else
            uiSteep = uiPhaseStep;
    }

    void UpdateAI(const uint32 diff)
    {
	
	if (Intro && !Done)
        {
            if (AggroTimer <= diff)
            {
	    me->SetReactState(REACT_PASSIVE);
	    me->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE);
	    me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_NONE);
	    Done = true;
	    uiPhase = 1;
	    NextStep(1000,false,1);
	    if (AggroTargetGUID)
                {
		DoZoneInCombat();
		}
	    else
                {
                    EnterEvadeMode();
                    return;
                }
	    } else AggroTimer -= diff;
	}
	
	if (!UpdateVictim() || !Done)
            return;
	    
    if (uiTimer <= diff)
     {
     switch (uiSteep)
      {
        case 0:
	       break;
        case 1:
		if (m_pInstance)
		m_pInstance->SetData64(DATA_MIMI_DOOR,1);
		DoScriptText(SAY_AGGRO,me);
		NextStep(13000,true);
		break;
        case 2:
		me->SetVisibility(VISIBILITY_OFF);
		if (MK_Phase && uiPhase == 1)
		{
		if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
		{
		if (Creature* pBoss = me->SummonCreature(NPC_LIVIATHAN_MK_II,Posit[(1)],TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
		pBoss->AI()->AttackStart(pTarget);
		MK_Phase = false;
		uiPhase = 2;
		}
		}
		NextStep(0,false);
		break;
	
	if (VX_Phase && uiPhase == 2)
	  {
	  
	  case 3:
		me->SetVisibility(VISIBILITY_ON);
		DoScriptText(SAY_VX001_START ,me);
		NextStep(10000,true);
		break;
	  case 4:
		if (m_pInstance)
		    m_pInstance->SetData64(DATA_MIMI_FLOOR,1);
		   // me->GetMotionMaster()->MovePoint(0,2744.64,2569.45,364.39);
		    NextStep(8000,true);
		break;
	  case 5:
		if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
		 {
		  if (Creature* pBoss = me->SummonCreature(NPC_VX001,Posit[(0)],TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
		  {
	             DoScriptText(SAY_VX001_AGGRO, pBoss);
		     me->SetVisibility(VISIBILITY_OFF);
		     VX_Phase = false;
		     uiPhase = 3;
		  }
		  }
		if (m_pInstance)
		m_pInstance->SetData64(DATA_MIMI_FLOOR,2);
		NextStep(0,false);
		break;
	    }
	
	if (UnitPhase && uiPhase == 3)
	    {
	    
	case 6:
		me->SetVisibility(VISIBILITY_ON);
		DoScriptText(SAY_UNIT_START ,me);
		NextStep(10000,true);
		break;
	case 7:
		if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
		{
		if (Creature* pBoss = me->SummonCreature(NPC_AERIAL_UNIT,Posit[(2)],TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
		{
		DoScriptText(SAY_UNIT_AGGRO, pBoss);
		pBoss->AI()->AttackStart(pTarget);
		me->SetVisibility(VISIBILITY_OFF);
		UnitPhase = false;
		uiPhase = 4;
		}
		}
		NextStep(0,false);
		break;
	}
	  case 8:
	    me->SetVisibility(VISIBILITY_ON);
	    DoScriptText(SAY_VOLTRON, me);
	    NextStep(6000,true);
	    break;
	  case 9:
	    me->SetReactState(REACT_AGGRESSIVE);
	    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
	    me->RemoveFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE);
	    NextStep(0,false);
	  break;
      }
	  
	if (MimironPhase && uiPhase == 4)
	{
	   if (ProximityMinesTimer <= diff)
	    {
	     DoCastAOE(SPELL_PROXIMITY_MINES);
	     ProximityMinesTimer = 35000;
	    } else ProximityMinesTimer -= diff;
	
	   if (ShockBlastTimer <= diff)
	    {
	     DoCastAOE(SPELL_SHOCK_BLAST);
	     ShockBlastTimer = 30000;
	    } else ShockBlastTimer -= diff;
	    
	   if (LaserBarrageTimer <= diff)
	   {
	    DoCast(SPELL_LASER_BARRAGE);
	    LaserBarrageTimer = 21000;
	   } else LaserBarrageTimer -= diff;
	   
	   if (HandPulselTimer <= diff)
	   {
	   if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
	   {
	    DoCast(pTarget,SPELL_HAND_PULSEL);
	    HandPulselTimer = 15500;
	    }
	   } else HandPulselTimer -= diff;
	   
	   if (HandPulserTimer <= diff)
	   {
	   if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
	   {
	    DoCast(pTarget,SPELL_HAND_PULSER);
	    HandPulserTimer = 15500;
	    }
	   } else HandPulserTimer -= diff;
	   
	   if (PlasmaBallTimer <= diff)
	   {
	   if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
	   DoCast(pTarget,SPELL_PLASMA_BALL);
	   
	   PlasmaBallTimer = 9000;
	   } else PlasmaBallTimer -= diff;
	   
	}
	   
     } else uiTimer -= diff;
	
     DoMeleeAttackIfReady();
  }
};

struct npc_leviathan_mkAI : public ScriptedAI
{
    npc_leviathan_mkAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}
    
    uint32 ProximityMines_Timer;
    uint32 NapalmShellTimer;
    uint32 PlasmaBlastTimer;
    uint32 ShockBlast_Timer;
    uint32 uiResetTimer;   
    bool bDone;
    
    void Reset()
    {
    ProximityMines_Timer = 10000;
    NapalmShellTimer = urand(8000,10000);
    PlasmaBlastTimer = 20000;
    ShockBlast_Timer = 30000;
    uiResetTimer = 80000;
    bDone = false;
    }
    
    void MovementInform(uint32 MovementType, uint32 Data)
    {
        if (MovementType != POINT_MOTION_TYPE)
            return;

        me->DisappearAndDie();
    }

    
    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if (damage >= me->GetHealth())
        {
            damage = 0;
            EnterEvadeMode();
            me->setFaction(35);
            bDone = true;
	if (me->isSummon())
	{
	  if (Unit* pSummoner = CAST_SUM(me)->GetSummoner())
	  {	
	    if (pSummoner && pSummoner->isAlive())
	    CAST_CRE(pSummoner)->AI()->SetData(1,0);
	  }
	}
        }
    }
    void KilledUnit(Unit *victim)
    {
    DoScriptText(urand(SAY_KILL_MK_1,SAY_KILL_MK_2),me);
    }
    
    void UpdateAI(const uint32 diff)
    {
    
	if (bDone && uiResetTimer <= diff)
        {
            me->GetMotionMaster()->MovePoint(0,2796.86,25973.0,364.3);
            bDone = false;
        } else uiResetTimer -= diff;

        if (!UpdateVictim())
            return;
	
	if (PlasmaBlastTimer <= diff)
	{
	  if(Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
	   {
	    DoCast(pTarget,SPELL_PLASMA_BLAST);
	    PlasmaBlastTimer = 45000;
	   }
	} else PlasmaBlastTimer -= diff;
	
	if (NapalmShellTimer <= diff)
	{
	  if(Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
	   {
	     DoCast(pTarget,SPELL_NAPALM_SHELL);
	     NapalmShellTimer = urand(8000,10000);
	   }
	} else NapalmShellTimer -= diff;
	
	if (ShockBlast_Timer <= diff)
	{
	  if(Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
	   {
	     DoCast(pTarget,SPELL_SHOCK_BLAST);
	     ShockBlast_Timer = urand(50000, 55000);
	   }
	} else ShockBlast_Timer -= diff;
	
	DoMeleeAttackIfReady(); 
    }
};

struct npc_vx_001AI : public ScriptedAI
{
    npc_vx_001AI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}
    
    uint32 RepidBurstTimer_r;
    uint32 RepidBurstTimer_l;
    uint32 LaserBarrage_Timer;
    uint32 RocketStrike_Timer;
    uint32 HealWaveTimer;
    void Reset()
    {
    RepidBurstTimer_r = 1500;
    RepidBurstTimer_l = 2000;
    LaserBarrage_Timer = 4000;
    RocketStrike_Timer = urand(25000, 43000);
    HealWaveTimer = 16000;
    }
    
    void KilledUnit(Unit *victim)
    {
    DoScriptText(urand(SAY_KILL_VX_1,SAY_KILL_VX_2),me);
    }
    
    void UpdateAI(const uint32 diff)
    {
	
	if (!UpdateVictim())
            return;

	me->SetReactState(REACT_AGGRESSIVE);
	me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
	
	if (LaserBarrage_Timer <= diff)
	{
	 if(Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
	   {
	     DoCast(pTarget,SPELL_LASER_BARRAGE);
	     LaserBarrage_Timer = 21000;
	   }
	} else LaserBarrage_Timer -= diff;
	
	if (RepidBurstTimer_r <= diff)
	{
	 if(Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
	   {
	     DoCast(pTarget,SPELL_REPID_BURST_R);
	     RepidBurstTimer_r = 1500;
	   }
	} else RepidBurstTimer_r -= diff;
	
	if (RepidBurstTimer_l <= diff)
	{
	 if(Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
	   {
	     DoCast(pTarget,SPELL_REPID_BURST_L);
	     RepidBurstTimer_l = 2000;
	   }
	} else RepidBurstTimer_l -= diff;
	
	if (HealWaveTimer <= diff)
	{
	     DoCastAOE(SPELL_HEAL_WAVE);
	     HealWaveTimer = 33000;
	} else HealWaveTimer -= diff;
    }
    
    void JustDied(Unit* pKiller)
    {
        if (me->isSummon())
        {
            if (Unit* pSummoner = CAST_SUM(me)->GetSummoner())
            {
                if (pSummoner && pSummoner->isAlive())
                    CAST_CRE(pSummoner)->AI()->SetData(2,0);
            }
        }
    }
};

struct npc_aerial_command_unitAI : public ScriptedAI
{
    npc_aerial_command_unitAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}
    
    uint32 PlasmaBall_Timer;
    uint32 Assault_Bot_Summon;
    uint32 Bomb_Bot_Summon;
    uint32 Junk_Bot_Summon;
    uint32 FlyTimer;
    bool isFly;
    
    void Reset()
    {
    PlasmaBall_Timer = 3000;
    Assault_Bot_Summon = 35000;
    Bomb_Bot_Summon = 23000;
    Junk_Bot_Summon = 16000;
    FlyTimer = 1000;
    isFly = true;
    }
    
    void KilledUnit(Unit *victim)
    {
    DoScriptText(urand(SAY_KILL_UNIT_1,SAY_KILL_UNIT_2),me);
    }

    
    void UpdateAI(const uint32 diff)
    {
	
        if (!UpdateVictim())
            return;
	
	if (isFly && FlyTimer <= diff)
	{
	me->SendMovementFlagUpdate();
	me->SetReactState(REACT_PASSIVE);
	me->SetFlying(true);
	me->GetMotionMaster()->MovePoint(0,2744.64,2569.45,372.39);
	FlyTimer = 0;
	isFly = false;
	} else FlyTimer -= diff;
	
	if (PlasmaBall_Timer <= diff)
	{
	  if(Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
	   {
	     DoCast(pTarget,SPELL_PLASMA_BALL);
	     PlasmaBall_Timer = 6000;
	   }
	} else PlasmaBall_Timer -= diff;
	
	if (Assault_Bot_Summon <= diff)
	{
	  if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
	  {
	   if (Creature* pTrash = me->SummonCreature(NPC_ASSAULT_BOT,Posit[RAND(0,1)],TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
	   pTrash->AI()->AttackStart(pTarget);
	   Assault_Bot_Summon = urand(55000,75000);
	  }
	} else Assault_Bot_Summon -= diff;
	
	if (Bomb_Bot_Summon <= diff)
	{
	  if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
	  {
	   if (Creature* pTrash = me->SummonCreature(NPC_BOMB_BOT,Posit[RAND(0,1)],TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
	   pTrash->AI()->AttackStart(pTarget);
	   Bomb_Bot_Summon = urand(23000,44000);
	  }
	} else Bomb_Bot_Summon -= diff;
	
	if (Junk_Bot_Summon <= diff)
	{
	  if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
	  {
	   if (Creature* pTrash = me->SummonCreature(NPC_JANC_BOT,Posit[RAND(0,1)],TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
	   pTrash->AI()->AttackStart(pTarget);
	   Junk_Bot_Summon = urand(16000,22000);
	  }
	} else Junk_Bot_Summon -= diff;
    }
    
    void JustDied(Unit* pKiller)
    {
        if (me->isSummon())
        {
            if (Unit* pSummoner = CAST_SUM(me)->GetSummoner())
            {
                if (pSummoner && pSummoner->isAlive())
                    CAST_CRE(pSummoner)->AI()->SetData(3,0);
            }
        }
    }
};

CreatureAI* GetAI_npc_aerial_command_unit(Creature* pCreature)
{
    return new npc_aerial_command_unitAI(pCreature);
}

CreatureAI* GetAI_npc_vx_001(Creature* pCreature)
{
    return new npc_vx_001AI(pCreature);
}

CreatureAI* GetAI_npc_leviathan_mk(Creature* pCreature)
{
    return new npc_leviathan_mkAI(pCreature);
}

CreatureAI* GetAI_boss_mimiron(Creature* pCreature)
{
    return new boss_mimironAI(pCreature);
}

void AddSC_boss_mimiron_event()
{
    Script *newscript;
    
    newscript = new Script;
    newscript->Name = "boss_mimiron";
    newscript->GetAI = &GetAI_boss_mimiron;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_leviathan_mk";
    newscript->GetAI = &GetAI_npc_leviathan_mk;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_vx_001";
    newscript->GetAI = &GetAI_npc_vx_001;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_aerial_command_unit";
    newscript->GetAI = &GetAI_npc_aerial_command_unit;
    newscript->RegisterSelf();

}