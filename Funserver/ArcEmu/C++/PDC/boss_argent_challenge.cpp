/*
 * Copyright (C) 2009 Trinity <http://www.trinitycore.org/>
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
SDName: Argent Challenge Encounter.
SD%Complete: 50 %
SDComment: AI for Argent Soldiers are not implemented. AI from bosses need more improvements.
SDCategory: Trial of the Champion
EndScriptData */

#include "ScriptPCH.h"
#include "trial_of_the_champion.h"
#include "ScriptedEscortAI.h"

enum eSpells
{
    //Eadric
    SPELL_EADRIC_ACHIEVEMENT    = 68197,
    SPELL_HAMMER_JUSTICE        = 66863,
    SPELL_HAMMER_RIGHTEOUS      = 66867,
    SPELL_RADIANCE              = 66935,
    SPELL_VENGEANCE             = 66865,

    //Paletress
    SPELL_SMITE                 = 66536,
    SPELL_SMITE_H               = 67674,
    SPELL_HOLY_FIRE             = 66538,
    SPELL_HOLY_FIRE_H           = 67676,
    SPELL_RENEW                 = 66537,
    SPELL_RENEW_H               = 67675,
    SPELL_HOLY_NOVA             = 66546,
    SPELL_SHIELD                = 66515,
    SPELL_CONFESS               = 66680,
	
	//Npc_argent_soldier
	SPELL_STRIKE                = 67237,
	SPELL_CLEAVE                = 15284,
	SPELL_PUMMEL                = 67235,
	SPELL_PAIN                  = 34942,
	SPELL_MIND                  = 67229,
	SPELL_SSMITE                = 67289,
	SPELL_LIGHT                 = 67290,
	SPELL_FLURRY                = 67233,
	SPELL_FINAL                 = 67255,
	SPELL_DIVINE                = 67251,
	SPELL_FONT                  = 67194,

    //Memory
    SPELL_OLD_WOUNDS            = 66620,
    SPELL_OLD_WOUNDS_H          = 67679,
    SPELL_SHADOWS_PAST          = 66619,
    SPELL_SHADOWS_PAST_H        = 67678,
    SPELL_WAKING_NIGHTMARE      = 66552,
    SPELL_WAKING_NIGHTMARE_H    = 67677
};
enum Misc
{
    ACHIEV_CONF                 = 3802
};

enum eEnums
{
	SAY_START_10                            = -2999956,
	SAY_START_9                             = -2999955,
	SAY_START_8                             = -2999941,	
	SAY_START_7                             = -2999954,
	SAY_START_6                             = -2999951
};

struct boss_eadricAI : public ScriptedAI
{
    boss_eadricAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = pCreature->GetInstanceData();
        pCreature->SetReactState(REACT_PASSIVE);
        pCreature->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE);
		pCreature->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NOT_SELECTABLE);
    }

    ScriptedInstance* pInstance;
		
    uint32 uiVenganceTimer;
    uint32 uiRadianceTimer;
    uint32 uiHammerJusticeTimer;
    uint32 uiResetTimer;

    bool bDone;

    void Reset()
    {
        uiVenganceTimer = 10000;
        uiRadianceTimer = 16000;
        uiHammerJusticeTimer = 25000;
        uiResetTimer = 5000;
		me->GetMotionMaster()->MovePoint(1,746.71,661.02,411.69);
		me->SetOrientation(4.714);

        bDone = false;
    }
		
    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if (damage >= me->GetHealth())
        {		
            damage = 0;
            EnterEvadeMode();
			me->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE);
			me->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NOT_SELECTABLE);
			DoScriptText(SAY_START_8, me);
            me->setFaction(35);
            bDone = true;
            if (GameObject* pGO = GameObject::GetGameObject(*me, pInstance->GetData64(DATA_MAIN_GATE)))
                    pInstance->HandleGameObject(pGO->GetGUID(),true);	
            if (GameObject* pGO = GameObject::GetGameObject(*me, pInstance->GetData64(DATA_MAIN_GATE1)))
                    pInstance->HandleGameObject(pGO->GetGUID(),true);		
					if (pInstance)
            pInstance->SetData(BOSS_ARGENT_CHALLENGE_E, DONE);
		}
    }
	
    void MovementInform(uint32 MovementType, uint32 Data)
    {
        if (MovementType != POINT_MOTION_TYPE)
            return;
    }
	
    void UpdateAI(const uint32 uiDiff)
    {
        if (bDone && uiResetTimer <= uiDiff)
        {
            me->GetMotionMaster()->MovePoint(0,746.843, 695.68, 412.339);
            bDone = false;
			if (GameObject* pGO = GameObject::GetGameObject(*me, pInstance->GetData64(DATA_MAIN_GATE)))
                    pInstance->HandleGameObject(pGO->GetGUID(),true);
        } else uiResetTimer -= uiDiff;

        if (!UpdateVictim())
            return;

        if (uiHammerJusticeTimer <= uiDiff)
        {
            me->InterruptNonMeleeSpells(true);

            if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 250, true))
            {
                if (pTarget && pTarget->isAlive())
                {
                    DoCast(pTarget, SPELL_HAMMER_JUSTICE);
                    DoCast(pTarget, SPELL_HAMMER_RIGHTEOUS);
                }
            }
            uiHammerJusticeTimer = 25000;
        } else uiHammerJusticeTimer -= uiDiff;

        if (uiVenganceTimer <= uiDiff)
        {
            DoCast(me,SPELL_VENGEANCE);

            uiVenganceTimer = 10000;
        } else uiVenganceTimer -= uiDiff;

        if (uiRadianceTimer <= uiDiff)
        {
            DoCastAOE(SPELL_RADIANCE);

            uiRadianceTimer = 16000;
        } else uiRadianceTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_eadric(Creature* pCreature)
{
    return new boss_eadricAI(pCreature);
}

struct boss_paletressAI : public ScriptedAI
{
    boss_paletressAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = pCreature->GetInstanceData();

        MemoryGUID = 0;
        pCreature->SetReactState(REACT_PASSIVE);
        pCreature->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE);
		pCreature->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NOT_SELECTABLE);
        pCreature->RestoreFaction();
    }

    ScriptedInstance* pInstance;

    Creature* pMemory;
    uint64 MemoryGUID;

    bool bHealth;
    bool bDone;

    uint32 uiHolyFireTimer;
    uint32 uiHolySmiteTimer;
    uint32 uiRenewTimer;
    uint32 uiResetTimer;

    void Reset()
    {
        me->RemoveAllAuras();

        uiHolyFireTimer     = urand(9000,12000);
        uiHolySmiteTimer    = urand(5000,7000);
        uiRenewTimer        = urand(2000,5000);

        uiResetTimer        = 7000;
		
		me->GetMotionMaster()->MovePoint(1,746.71,661.02,411.69);
		me->SetOrientation(4.714);

        bHealth = false;
        bDone = false;

        if (Creature *pMemory = Unit::GetCreature(*me, MemoryGUID))
            if (pMemory->isAlive())
                pMemory->RemoveFromWorld();
    }

    void SetData(uint32 uiId, uint32 uiValue)
    {
        if (uiId == 1)
            me->RemoveAura(SPELL_SHIELD);
    }

    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if (damage >= me->GetHealth())
        {
            damage = 0;
            EnterEvadeMode();
			me->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE);
			me->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NOT_SELECTABLE);
			DoScriptText(SAY_START_7, me);
            me->setFaction(35);
            bDone = true;
            if (GameObject* pGO = GameObject::GetGameObject(*me, pInstance->GetData64(DATA_MAIN_GATE)))
                    pInstance->HandleGameObject(pGO->GetGUID(),true);	
            if (GameObject* pGO = GameObject::GetGameObject(*me, pInstance->GetData64(DATA_MAIN_GATE1)))
                    pInstance->HandleGameObject(pGO->GetGUID(),true);		
            pInstance->SetData(BOSS_ARGENT_CHALLENGE_P, DONE);
            if (IsHeroic())
                pInstance->DoCompleteAchievement(ACHIEV_CONF);
		}
    }

    void MovementInform(uint32 MovementType, uint32 Data)
    {
        if (MovementType != POINT_MOTION_TYPE)
            return;	
    }
	
    void UpdateAI(const uint32 uiDiff)
    {
        if (bDone && uiResetTimer <= uiDiff)
        {
            me->GetMotionMaster()->MovePoint(0,746.843, 695.68, 412.339);
            bDone = false;
			if (GameObject* pGO = GameObject::GetGameObject(*me, pInstance->GetData64(DATA_MAIN_GATE)))
                    pInstance->HandleGameObject(pGO->GetGUID(),true);	
        } else uiResetTimer -= uiDiff;

        if (!UpdateVictim())
            return;

        if (uiHolyFireTimer <= uiDiff)
        {
            if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 250, true))
            {
                if (pTarget && pTarget->isAlive())
                    DoCast(pTarget,SPELL_HOLY_FIRE);
            }
             if (me->HasAura(SPELL_SHIELD))
                uiHolyFireTimer = 13000;
            else
                uiHolyFireTimer = urand(9000,12000);
        } else uiHolyFireTimer -= uiDiff;

        if (uiHolySmiteTimer <= uiDiff)
        {
            if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 250, true))
            {
                if (pTarget && pTarget->isAlive())
                    DoCast(pTarget,SPELL_SMITE);
            }
            if (me->HasAura(SPELL_SHIELD))
                uiHolySmiteTimer = 9000;
            else
                uiHolySmiteTimer = urand(5000,7000);
        } else uiHolySmiteTimer -= uiDiff;

        if (me->HasAura(SPELL_SHIELD))
            if (uiRenewTimer <= uiDiff)
            {
                me->InterruptNonMeleeSpells(true);
                uint8 uiTarget = urand(0,1);
                switch(uiTarget)
                {
                    case 0:
                        DoCast(me,SPELL_RENEW);
                        break;
                    case 1:
                        if (Creature *pMemory = Unit::GetCreature(*me, MemoryGUID))
                            if (pMemory->isAlive())		
                                DoCast(pMemory, SPELL_RENEW);
                        break;
                }
                uiRenewTimer = urand(15000,17000);
            } else uiRenewTimer -= uiDiff;


        if (!bHealth && me->GetHealth()*100 / me->GetMaxHealth() <= 35)
        {
		DoScriptText(SAY_START_6, me);
        me->InterruptNonMeleeSpells(true);
        DoCastAOE(SPELL_HOLY_NOVA,false);
        DoCast(me, SPELL_SHIELD);
        DoCastAOE(SPELL_CONFESS,false);

            bHealth = true;
			switch(urand(0, 24))
            {
	case 0: me->SummonCreature(MEMORY_ALGALON, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
		break;
	case 1: me->SummonCreature(MEMORY_CHROMAGGUS, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 2: me->SummonCreature(MEMORY_CYANIGOSA, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 3: me->SummonCreature(MEMORY_DELRISSA, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 4: me->SummonCreature(MEMORY_ECK, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 5: me->SummonCreature(MEMORY_ENTROPIUS, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 6: me->SummonCreature(MEMORY_GRUUL, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 7: me->SummonCreature(MEMORY_HAKKAR, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 8: me->SummonCreature(MEMORY_HEIGAN, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 9: me->SummonCreature(MEMORY_HEROD, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 10: me->SummonCreature(MEMORY_HOGGER, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 11: me->SummonCreature(MEMORY_IGNIS, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 12: me->SummonCreature(MEMORY_ILLIDAN, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 13: me->SummonCreature(MEMORY_INGVAR, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 14: me->SummonCreature(MEMORY_KALITHRESH, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 15: me->SummonCreature(MEMORY_LUCIFRON, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 16: me->SummonCreature(MEMORY_MALCHEZAAR, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 17: me->SummonCreature(MEMORY_MUTANUS, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 18: me->SummonCreature(MEMORY_ONYXIA, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 19: me->SummonCreature(MEMORY_THUNDERAAN, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 20: me->SummonCreature(MEMORY_VANCLEEF, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 21: me->SummonCreature(MEMORY_VASHJ, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 22: me->SummonCreature(MEMORY_VEKNILASH, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 23: me->SummonCreature(MEMORY_VEZAX, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
	case 24: me->SummonCreature(MEMORY_ARCHIMONDE, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                break;
 
	        }
        }

        DoMeleeAttackIfReady();
    }

    void JustSummoned(Creature* pSummon)
    {
        MemoryGUID = pSummon->GetGUID();
    }
};

CreatureAI* GetAI_boss_paletress(Creature* pCreature)
{
    return new boss_paletressAI(pCreature);
}

struct npc_memoryAI : public ScriptedAI
{
    npc_memoryAI(Creature* pCreature) : ScriptedAI(pCreature) {}

    uint32 uiOldWoundsTimer;
    uint32 uiShadowsPastTimer;
    uint32 uiWakingNightmare;

    void Reset()
    {
        uiOldWoundsTimer = 12000;
        uiShadowsPastTimer = 15000;
        uiWakingNightmare = 7000;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

        if (uiOldWoundsTimer <= uiDiff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
            {
                if (pTarget && pTarget->isAlive())
                    DoCast(pTarget, SPELL_OLD_WOUNDS);
            }
            uiOldWoundsTimer = 23000;
        }else uiOldWoundsTimer -= uiDiff;

        if (uiWakingNightmare <= uiDiff)
        {
            DoCast(me, SPELL_WAKING_NIGHTMARE);
            uiWakingNightmare = 15000;
        }else uiWakingNightmare -= uiDiff;

        if (uiShadowsPastTimer <= uiDiff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,1))
            {
                if (pTarget && pTarget->isAlive())
                    DoCast(pTarget,SPELL_SHADOWS_PAST);
            }
            uiShadowsPastTimer = 20000;
        }else uiShadowsPastTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }

    void JustDied(Unit* pKiller)
    {
        if (me->isSummon())
        {
            if (Unit* pSummoner = CAST_SUM(me)->GetSummoner())
            {
                if (pSummoner && pSummoner->isAlive())
                    CAST_CRE(pSummoner)->AI()->SetData(1,0);
            }
        }
    }
};

CreatureAI* GetAI_npc_memory(Creature* pCreature)
{
    return new npc_memoryAI(pCreature);
}

// THIS AI NEEDS MORE IMPROVEMENTS
struct npc_argent_soldierAI : public npc_escortAI
{
    npc_argent_soldierAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        pInstance = pCreature->GetInstanceData();
        me->SetReactState(REACT_DEFENSIVE);
        me->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE);
        me->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NOT_SELECTABLE);
		if (GameObject* pGO = GameObject::GetGameObject(*me, pInstance->GetData64(DATA_MAIN_GATE)))
                    pInstance->HandleGameObject(pGO->GetGUID(),true);
					
        SetDespawnAtEnd(false);
        uiWaypoint = 0;
    }
		
    ScriptedInstance* pInstance;

    uint8 uiWaypoint;
	
	uint32 uiStrikeTimer;
	uint32 uiCleaveTimer;
    uint32 uiPummelTimer;
	uint32 uiPainTimer;
    uint32 uiMindTimer;
	uint32 uiSsmiteTimer;
    uint32 uiFontTimer;
    uint32 uiLightTimer;
	uint32 uiFlurryTimer;
    uint32 uiFinalTimer;
    uint32 uiDivineTimer;
	uint32 uiResetTimer;
	
    void Reset()
    {
      	uiStrikeTimer = 4000;	
      	uiCleaveTimer = 5000;
        uiPummelTimer = 8000;
      	uiPainTimer = 6000;
        uiMindTimer = 7000;
      	uiSsmiteTimer = 9000;
	
		uiResetTimer = 3000;
        uiLightTimer = 2000;
		uiFontTimer = 30000;
   	    uiFlurryTimer = 14000;
        uiFinalTimer = 21000;
        uiDivineTimer = 20000;	
    }
	
    void WaypointReached(uint32 uiPoint)
    {
        if (uiPoint == 0)
        {
            switch(uiWaypoint)
            {
                case 1:
                    me->SetOrientation(4.60);
			        me->SetReactState(REACT_AGGRESSIVE);					
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE|UNIT_FLAG_NOT_SELECTABLE);
                    break;				
                    break;
            }
		}	
		if (uiPoint == 1)
        {
            switch(uiWaypoint)
            {
                case 0:
                    me->SetOrientation(5.81);
			        me->SetReactState(REACT_AGGRESSIVE);
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE|UNIT_FLAG_NOT_SELECTABLE);
                    break;
                case 2:
                    me->SetOrientation(3.39);
			        me->SetReactState(REACT_AGGRESSIVE);					
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE|UNIT_FLAG_NOT_SELECTABLE);
                if (GameObject* pGO = GameObject::GetGameObject(*me, pInstance->GetData64(DATA_MAIN_GATE)))
                    pInstance->HandleGameObject(pGO->GetGUID(),false);					
                    break;
			
            }
            me->SendMovementFlagUpdate();
        
        }  
    }

    void SetData(uint32 uiType, uint32 uiData)
    {
        switch(me->GetEntry())
        {
            case NPC_ARGENT_LIGHWIELDER:
                switch(uiType)
                {
                    case 0:
					    AddWaypoint(0,737.14,655.42,412.88);
                        AddWaypoint(1,712.14,628.42,411.88);
                        break;
                    case 1:
                        AddWaypoint(0,742.44,650.29,411.79);
                        break;
                    case 2:
					    AddWaypoint(0,756.14,655.42,411.88);
                        AddWaypoint(1,781.626, 629.383, 411.892);
                        break;
                }
                break;
            case NPC_ARGENT_MONK:
                switch(uiType)
                {
                    case 0:
					    AddWaypoint(0,737.14,655.42,412.88);
                        AddWaypoint(1,713.12,632.97,411.90);
                        break;
                    case 1:
                        AddWaypoint(0,746.73,650.24,411.56);
                        break;
                    case 2:
					    AddWaypoint(0,756.14,655.42,411.88);
                        AddWaypoint(1,781.351, 633.146, 411.907);
                        break;
                }
                break;
            case NPC_PRIESTESS:
                switch(uiType)
                {
                    case 0:
					    AddWaypoint(0,737.14,655.42,412.88);
                        AddWaypoint(1,715.06,637.07,411.91);
                        break;
                    case 1:
                        AddWaypoint(0,750.72,650.20,411.77);
                        break;
                    case 2:
					    AddWaypoint(0,756.14,655.42,411.88);
                        AddWaypoint(1,780.439, 636.681, 411.918);
                        break;
                }
                break;
        }

        Start(false,true,0);
        uiWaypoint = uiType;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        npc_escortAI::UpdateAI(uiDiff);

        if (!UpdateVictim())
            return;
	
    switch(me->GetEntry())
	{
        case NPC_ARGENT_LIGHWIELDER:
		{
            if (uiCleaveTimer <= uiDiff)
            {
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(pTarget,SPELL_STRIKE);				
                    uiCleaveTimer = 20000;
            } else uiCleaveTimer -= uiDiff;	
    		
            if (uiStrikeTimer <= uiDiff)
            {
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(pTarget,SPELL_CLEAVE);				
                    uiStrikeTimer = 25000;
            } else uiStrikeTimer -= uiDiff;	
			
			if (uiLightTimer <= uiDiff)
            {
                    DoCast(me,SPELL_LIGHT);
                    uiLightTimer = urand (15000, 17000);
            } else uiLightTimer -= uiDiff;
			break;
	    }
		case NPC_ARGENT_MONK:
	    {		
		    if (uiDivineTimer <= uiDiff)
            {
                    DoCast(me,SPELL_DIVINE);
                    uiDivineTimer = 85000;
            } else uiDivineTimer -= uiDiff;
			
            if (uiFinalTimer <= uiDiff)
            {
                    DoCast(me,SPELL_FINAL);
                    uiFinalTimer = 70000;
            } else uiFinalTimer -= uiDiff;
			
            if (uiPummelTimer <= uiDiff)
            {
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(pTarget,SPELL_PUMMEL);				
                    uiPummelTimer = 35000;
            } else uiPummelTimer -= uiDiff;	
			
			if (uiFlurryTimer <= uiDiff)
            {
                    DoCast(me,SPELL_FLURRY);
                    uiFlurryTimer = 22000;
            } else uiFlurryTimer -= uiDiff;	
			break;
		}
		case NPC_PRIESTESS:
		{
            if (uiFontTimer <= uiDiff)
            {
                    DoCast(me,SPELL_FONT);
                    uiFontTimer = urand (15000, 17000);
            } else uiFontTimer -= uiDiff;
			
            if (uiPainTimer <= uiDiff)
            {
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(pTarget,SPELL_PAIN);				
                    uiPainTimer = 30000;
            } else uiPainTimer -= uiDiff;	
		
            if (uiMindTimer <= uiDiff)
            {
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(pTarget,SPELL_MIND);				
                    uiMindTimer = 90000;
            } else uiMindTimer -= uiDiff;
	    	
            if (uiSsmiteTimer <= uiDiff)
            {
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(pTarget,SPELL_SSMITE);				
                    uiSsmiteTimer = 25000;
            } else uiSsmiteTimer -= uiDiff;					
			break;
		}		
	}			
			
        DoMeleeAttackIfReady();
    }

    void JustDied(Unit* pKiller)
    {
            if (pInstance)
            pInstance->SetData(DATA_ARGENT_SOLDIER_DEFEATED,pInstance->GetData(DATA_ARGENT_SOLDIER_DEFEATED) + 1);
		
    }
};

CreatureAI* GetAI_npc_argent_soldier(Creature* pCreature)
{
    return new npc_argent_soldierAI(pCreature);
}

void AddSC_boss_argent_challenge()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "boss_eadric";
    NewScript->GetAI = &GetAI_boss_eadric;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_paletress";
    NewScript->GetAI = &GetAI_boss_paletress;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "npc_memory";
    NewScript->GetAI = &GetAI_npc_memory;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "npc_argent_soldier";
    NewScript->GetAI = &GetAI_npc_argent_soldier;
    NewScript->RegisterSelf();
}