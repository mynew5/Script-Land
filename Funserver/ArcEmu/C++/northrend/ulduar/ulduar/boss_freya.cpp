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

#define SAY_AGGRO -1000000
#define SAY_SLAY -1000000
#define SAY_DEAD -1000000


#define SPELL_ATTUNED_NATURE	 62519
#define SPELL_GROUND_TREMOR	 RAID_MODE(62437,62859)
#define SPELL_SUMMON_NATURE	 62678
#define SPELL_SUMMON_GIFT	 62869
#define SPELL_SUNBEAM		 RAID_MODE(62623,62872)
#define SPELL_TOUCH_EONAR	 RAID_MODE(62528,62892)
#define SPELL_BERSERK		 47008
#define SPELL_DETONATOR		RAID_MODE(62598,62937)
#define SPELL_FLAME		62608
#define SPELL_DRAINED		62467
#define SPELL_STONED		62344
#define SPELL_GROUND		RAID_MODE(62325,62932)
#define SPELL_PETRIFIED		RAID_MODE(62337,62933)

enum eNpc
{
NPC_DREVO_1	= 32913,
NPC_DREVO_2	= 32914,
NPC_DREVO_3	= 32915,

NPC_ELEM	= 33202,

NPC_SPORA	= 33215,

NPC_LIFE_1	= 32918,
NPC_LIFE_2	= 32919,
NPC_LIFE_3	= 32916
};

const Position Pos [4] =
{
{2360.45,-34.46,424.52,4.9},
{2336.0,-47.27,424.88,6.1},
{2367.47,-68.64,424.34,1.7},
{2382.33,-61.98,424.47,2.5}
};

enum Ach
{
    // Con-speed-atory timed achievement. 
    // TODO Should be started when 1st trash is killed.
    ACHIEV_CON_SPEED_ATORY_START_EVENT            = 21597,
    SPELL_ACHIEVEMENT_CHECK                       = 65074,

    // Lumberjacked timed achievement.
    // TODO should be started when 1st elder is killed.
    // Spell should be casted when 3rd elder is killed.
    ACHIEV_LUMBERJACKED                           = 21686,
    SPELL_LUMBERJACKED_ACHIEVEMENT_CHECK          = 65296,
};

struct boss_freyaAI : public BossAI
{
    boss_freyaAI(Creature* pCreature) : BossAI(pCreature, TYPE_FREYA)
    {
        m_pInstance = pCreature->GetInstanceData();
	
        Reset();
    }

    ScriptedInstance* m_pInstance;
    
    uint32 AtunedNatureTimer;
    uint32 GroundTremorTimer;
    uint32 SummonNatureTimer;
    uint32 SummonGiftTimer;
    uint32 SunbeamTimer;
    uint32 TouchEonarTimer;
    uint32 BerserkTimer;
    uint32 SporaTimer;
    uint32 SummonTimer;
    uint64 uiElemental;
    uint64 uiDrevo;
    uint64 uiLesher1;
    uint64 uiLesher2;
    uint32 Phase;
    uint32 Phase2Timer;
    uint32 Phase1Timer;
    uint32 DrevoSummonTimer;

    void Reset()
    {
    if (m_pInstance)
    m_pInstance->SetData(TYPE_FREYA,NOT_STARTED);
    AtunedNatureTimer = 100;
    GroundTremorTimer =  24000 + rand()%8000;
    SunbeamTimer = 10000 + rand()%5000;
    TouchEonarTimer = 15000+ rand()%6000;
    SummonNatureTimer = 24000;
    SummonGiftTimer = 18000+ rand()%6000;
    DrevoSummonTimer = 90000;
    BerserkTimer = 600000;
    SporaTimer	= 4000;
    SummonTimer = 6000;
    Phase = 0;
    Phase2Timer = 360000;
    Phase1Timer = 1000;
    }

    void KilledUnit(Unit *victim)
    {
    DoScriptText(SAY_SLAY,me);
    }

    void JustDied(Unit *victim)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_FREYA,DONE);
	DoScriptText(SAY_DEAD,me);
    }

    void Aggro(Unit* pWho)
    {
       DoScriptText(SAY_AGGRO, me);
        me->SetInCombatWithZone();

        if (m_pInstance)
            m_pInstance->SetData(TYPE_FREYA,IN_PROGRESS);
	    DoScriptText(SAY_AGGRO,me);
    }
    
    void AggroAllPlayers(Creature* pTemp)
    {
        Map::PlayerList const &PlList = me->GetMap()->GetPlayers();

        if(PlList.isEmpty())
            return;

        for (Map::PlayerList::const_iterator i = PlList.begin(); i != PlList.end(); ++i)
        {
            if(Player* pPlayer = i->getSource())
            {
                if(pPlayer->isGameMaster())
                    continue;

                if(pPlayer->isAlive())
                {
                    pTemp->SetHomePosition(me->GetPositionX(),me->GetPositionY(),me->GetPositionZ(),me->GetOrientation());
                    pTemp->RemoveFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE);
                    pTemp->SetReactState(REACT_AGGRESSIVE);
                    pTemp->SetInCombatWith(pPlayer);
                    pPlayer->SetInCombatWith(pTemp);
                    pTemp->AddThreat(pPlayer, 0.0f);
                }
            }
        }
    }

    void UpdateAI(const uint32 diff)
    {
	ScriptedAI::UpdateAI(diff);
	
	if (!UpdateVictim())
            return;
	
    if (Phase1Timer <= diff)
    {
    Phase = 1;
    Phase1Timer = 600000;
    } else Phase1Timer -= diff;
    
    if (Phase2Timer <= diff)
    {
    Phase = 2;
    Phase2Timer = 360000;
    } else Phase2Timer -= diff;
	
    if (Phase == 1)
     {
	if (DrevoSummonTimer <= diff)
	{
	uiDrevo = RAND(32913,32914,32915);
	Creature *pBoss = me->SummonCreature(uiDrevo,2367.47,-68.64,424.34,1.7,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT);
	AggroAllPlayers(pBoss);
	DrevoSummonTimer = 130000;
	} else DrevoSummonTimer -= diff;
	
	if (SummonTimer <= diff)
	{
	 if (Creature* pBoss = me->SummonCreature(NPC_ELEM,2336.0,-47.27,424.88,6.1,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT))
	 {
	 AggroAllPlayers(pBoss);
	   for (uint8 i=0; i<1; ++i)
	     {
	     uiLesher1 = RAND(32916,32918,32919);
	     uiLesher2 = RAND(32916,32918,32919);
	     
		if (Creature* pTrash =me->SummonCreature(uiLesher1,2367.47,-68.64,424.34,1.7,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT))
		pTrash->AI()->SetData(i,0);
		if (uiLesher1 != uiLesher2)
		{
		if (Creature* pTrash = me->SummonCreature(uiLesher2,2360.45,-34.46,424.52,4.9,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT))
		pTrash->AI()->SetData(i,0);
		}
	     }
	   }
	     
	   SummonTimer = 60000;
	} else SummonTimer -= diff;
	
	if (AtunedNatureTimer <= diff)
	{
	   DoCast(me, SPELL_ATTUNED_NATURE);
	   AtunedNatureTimer = 1000;
	} 
	else AtunedNatureTimer -= diff;
	
	if (SporaTimer <= diff)
	{
	Creature *pBoss = me->SummonCreature(NPC_SPORA,Pos[RAND(0,3,1)],TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT,20000);
	SporaTimer = 21000;
	} else SporaTimer -= diff;
	
	if (SunbeamTimer <= diff)
	{
	if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1))
	  DoCast(pTarget, SPELL_SUNBEAM);
	  SunbeamTimer = 20000 + rand()%5000;
	} 
	else SunbeamTimer -= diff;
	
	if (SummonNatureTimer <= diff)
	{
	if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1))
	   DoCast(pTarget, SPELL_SUMMON_NATURE);
	   SummonNatureTimer = 24000 + rand()%6000;
	} 
	else SummonNatureTimer -= diff;
	
	if (SummonGiftTimer <= diff)
	{
	if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1))
	DoCastAOE(SPELL_SUMMON_GIFT);
	SummonGiftTimer = 25000 + rand()%8000;
	} 
	else SummonGiftTimer -= diff;
	
	if (TouchEonarTimer <= diff)
      {
	DoCast(me,SPELL_TOUCH_EONAR);
	TouchEonarTimer = 25000 + rand()%8000;
      } else TouchEonarTimer -= diff;
     }
     
     if (Phase == 2)
      {
	me->RemoveAurasDueToSpell(SPELL_ATTUNED_NATURE);
	if (SummonGiftTimer <= diff)
	{
	if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1))
	DoCastAOE(SPELL_SUMMON_GIFT);
	SummonGiftTimer = 25000 + rand()%8000;
	} else SummonGiftTimer -= diff;
	
	if (SporaTimer <= diff)
	{
	Creature *pBoss = me->SummonCreature(NPC_SPORA,Pos[RAND(0,3,1)],TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT,20000);
	SporaTimer = 25000 + rand()%12000;
	} else SporaTimer -= diff;
	
	if (SunbeamTimer <= diff)
	{
	if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1))
	  DoCast(pTarget,SPELL_SUNBEAM);
	  SunbeamTimer = 20000 + rand()%4000;
	} else SunbeamTimer -= diff;
	
      }
      
      if (TouchEonarTimer <= diff)
      {
	DoCast(me,SPELL_TOUCH_EONAR);
	TouchEonarTimer = 25000 + rand()%12000;
      }	 else TouchEonarTimer -= diff;
      
      if (BerserkTimer <= diff)
      {
      DoCast(me,SPELL_BERSERK);
      BerserkTimer = 600000;
      } else BerserkTimer -= diff;
	  
        DoMeleeAttackIfReady();

        //EnterEvadeIfOutOfCombatArea(diff);
    }
};

CreatureAI* GetAI_boss_freya(Creature* pCreature)
{
    return new boss_freyaAI(pCreature);
}

struct mob_detonatorAI : public ScriptedAI
{
    mob_detonatorAI(Creature *c) : ScriptedAI(c) {}

    uint32 FlameTimer;
    
    void Reset()
    {
    FlameTimer = 25000 +rand()%4000;
    }
   
    void Aggro(Unit* pWho)
    {
        me->SetInCombatWithZone();
    }
    
    void JustDied(Unit *victim)
    {
        DoCastAOE(SPELL_DETONATOR);
    }
    
    void UpdateAI(const uint32 diff)
    {
	ScriptedAI::UpdateAI(diff);
	    
	if (FlameTimer <= diff)
	{
	DoCastAOE(SPELL_FLAME);
	FlameTimer = 15000;
	} else FlameTimer -= diff;
	
	if (!UpdateVictim())
            return;
	
	DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_detonator(Creature* pCreature)
{
    return new mob_detonatorAI(pCreature);
}

struct mob_elder_stonebarAI : public ScriptedAI
{
    mob_elder_stonebarAI(Creature *c) : ScriptedAI(c) {}

    uint32 GroundTimer;
    uint32 PetrifiedTimer;
    uint32 StoneTimer;
    uint32 DranedTimer;
    
    void Reset()
    {
    GroundTimer = 32000 + rand()%8000;
    PetrifiedTimer = 18000 + rand()%6000;
    StoneTimer = 45000 + rand()%6000;
    DranedTimer = 48000 + rand()%6000;
    }
    
    void UpdateAI(const uint32 diff)
    {
	ScriptedAI::UpdateAI(diff);
	
	if (GroundTimer <= diff)
	{
	DoCastAOE(SPELL_GROUND);
	GroundTimer = 32000 + rand()%8000;
	} else GroundTimer -= diff;
	
	if (PetrifiedTimer <= diff)
	{
	DoCast(SPELL_PETRIFIED);
	PetrifiedTimer = 18000 + rand()%6000;
	} else PetrifiedTimer -= diff;
	
	if (StoneTimer <= diff)
	{
	DoCastAOE(SPELL_STONED);
	StoneTimer = 45000 + rand()%6000;
	} else StoneTimer -= diff;
	
	if (DranedTimer <= diff)
	{
	DoCastAOE(SPELL_DRAINED);
	DranedTimer = 48000 + rand()%6000;
	} else DranedTimer -= diff;
	
	if (!UpdateVictim())
            return;
	DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_elder_stonebar(Creature* pCreature)
{
    return new mob_elder_stonebarAI(pCreature);
}

void AddSC_boss_freya()
{
    Script *newscript;
    
    newscript = new Script;
    newscript->Name = "boss_freya";
    newscript->GetAI = &GetAI_boss_freya;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "mob_detonator";
    newscript->GetAI = &GetAI_mob_detonator;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "mob_elder_stonebar";
    newscript->GetAI = &GetAI_mob_detonator;
    newscript->RegisterSelf();
} 