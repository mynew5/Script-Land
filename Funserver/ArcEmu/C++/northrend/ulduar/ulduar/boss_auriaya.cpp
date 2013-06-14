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

//boss_auriaya
enum
{
SPELL_TERRIFYING_SCREECH         = 64386,
SPELL_SETINEL_BLAST              = 64679,
SPELL_SONIC_SCREECH              = 64422,
SPELL_SUMMON_SWARMING_GUARDIAN   = 64397,
SPELL_BERSERK			 = 47008,
//Feral Defender
SPELL_FERAL_ESSENCE		= 64455,
SPELL_STREGTH_OF_THE_PACK	= 64381
};
//wrong text ids. correct are beetwen -1000000 AND -1999999
//beetwen -2000000 and -2999999 are custom texts so wtf?
#define SAY_AGGRO                   -2615016
#define SAY_SLAY_1                  -2615017
#define SAY_SUMMON		    -1000000
#define SPELL_FERAL_RUSH		RAID_MODE(64496,64674)
#define SPELL_FERAL_POUNCE		RAID_MODE(64478,64669)
#define SPELL_SEEPING_FERAL_ESSENCE	RAID_MODE(64459,64675)
// Sanctum sentry
#define SPELL_SAVAGE_POUNCE		RAID_MODE(64666,64374)

struct boss_auriaya_AI : public BossAI
{
    boss_auriaya_AI(Creature *pCreature) : BossAI(pCreature, TYPE_AURIAYA)
    {
        m_pInstance = pCreature->GetInstanceData();
	Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 TERRIFYING_SCREECH_Timer;
    uint32 SONIC_SCREECH_Timer;
    uint32 SentilBlastTimer;
    uint32 BerserkTimer;
    uint32 uiSummonTimer;
    uint32 uiPhaseTimer;
    uint16 uiPhase;
    uint32 uiHealth;

    void Reset()
    {
        TERRIFYING_SCREECH_Timer = 35000;
        SONIC_SCREECH_Timer = 40000;
	SentilBlastTimer = 20000;
	BerserkTimer = 600000;
	uiSummonTimer = 12000;
	uiPhaseTimer = 48000;
	uiPhase = 0;
    }

    void EnterCombat(Unit* who)
    {
        DoScriptText(SAY_AGGRO,me);
    }
    void KilledUnit(Unit* victim)
    {
        DoScriptText(SAY_SLAY_1, me);
    }

    void JustDied(Unit *victim)
    {
        DoScriptText(SAY_SLAY_1, me);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_AURIAYA, DONE);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
	    
	    if ((me->GetHealth()*100 / me->GetMaxHealth()) < 99)
	    {
	    uiPhase = 1;
	    }
	    if ((me->GetHealth()*100 / me->GetMaxHealth()) < 70)
	    {
	    uiPhase = 2;
	    }
	
	if (uiPhase == 1)
	{   
	  if (uiSummonTimer <= diff)
	  {
	    DoScriptText(SAY_SUMMON,me);
	    DoCast(SPELL_SUMMON_SWARMING_GUARDIAN);
	    me->SetReactState(REACT_PASSIVE);
	    uiSummonTimer = 12000;
	  } else uiSummonTimer -= diff;
	}
	  
	if (uiPhase == 2)
	{
	  me->SetReactState(REACT_AGGRESSIVE);
	  
	  if (SentilBlastTimer <= diff)
	  {
	  if(Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
	  me->CastSpell(pTarget, SPELL_SETINEL_BLAST, true);
	  SentilBlastTimer = 20000;
	  } else SentilBlastTimer -= diff;

	  if (SONIC_SCREECH_Timer <= diff)
	  {
            DoCastVictim(SPELL_SONIC_SCREECH);
            SONIC_SCREECH_Timer = 40000;
	  } else SONIC_SCREECH_Timer -= diff;
	}
	
	if (TERRIFYING_SCREECH_Timer <= diff)
	  {
            DoCast(SPELL_TERRIFYING_SCREECH);
            DoScriptText(SAY_SLAY_1, me);
            TERRIFYING_SCREECH_Timer = 35000;
	  } else TERRIFYING_SCREECH_Timer -= diff;
	  
	if (BerserkTimer <= diff)
	{
	me->CastSpell(me, SPELL_BERSERK,true);
	BerserkTimer = 600000;
	} else BerserkTimer -= diff;

        DoMeleeAttackIfReady();
    }
};

struct boss_feral_defenderAI : public ScriptedAI
{
    boss_feral_defenderAI(Creature* c) : ScriptedAI(c) {Reset();}
    
    uint32 uiFeralEssebce;
    uint32 uiFeralRush;
    uint32 uiFeralPounce;
    uint32 uiSeepingFeralEssence;
    
    void Reset()
    {
    uiFeralEssebce = 25000;
    uiFeralRush = 18000;
    uiFeralPounce = 32000;
    uiSeepingFeralEssence = 38000;
    }
    
    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
	
	if (uiFeralEssebce <= diff)
	{
	DoCast(SPELL_FERAL_ESSENCE);
	uiFeralEssebce = 25000;
	} else uiFeralEssebce -= diff;
	
	if (uiFeralRush <= diff)
	{
	if (Unit* pTarget = SelectTarget(SELECT_TARGET_TOPAGGRO, 0))
	DoCast(pTarget,SPELL_FERAL_RUSH);
	uiFeralRush = 18000;
	} else uiFeralRush -= diff;
	
	if (uiFeralPounce <= diff)
	{
	if (Unit* pTarget = SelectTarget(SELECT_TARGET_TOPAGGRO, 0))
	DoCast(pTarget,SPELL_FERAL_POUNCE);
	uiFeralPounce = 32000;
	} else uiFeralPounce -= diff;
	
	if (uiSeepingFeralEssence <= diff)
	{
	  if(Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
	  DoCast(pTarget,SPELL_SEEPING_FERAL_ESSENCE);
	  uiSeepingFeralEssence = 38000;
	} else uiSeepingFeralEssence -= diff;
	
	DoMeleeAttackIfReady();
    }
};

struct boss_sanctum_sentryAI : public ScriptedAI
{
    boss_sanctum_sentryAI(Creature* c) : ScriptedAI(c) {Reset();}
    
    uint32 uiSavagePounceeTimer;
    uint32 uiStrengthPackTimer;
    
    void Reset()
    {
    uiSavagePounceeTimer = 12000;
    uiStrengthPackTimer = 44000;
    }
    
    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
	
	if (uiSavagePounceeTimer <= diff)
	{
	if (Unit* pTarget = SelectTarget(SELECT_TARGET_TOPAGGRO, 0))
	DoCast(pTarget,SPELL_SAVAGE_POUNCE);
	uiSavagePounceeTimer = 12000;
	} else uiSavagePounceeTimer -= diff;
	
	if (uiStrengthPackTimer <= diff)
	{
	DoCast(SPELL_STREGTH_OF_THE_PACK);
	uiStrengthPackTimer = 44000;
	} else uiStrengthPackTimer -= diff;
	
	DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_auriaya(Creature* pCreature)
{
    return new boss_auriaya_AI (pCreature);
}

CreatureAI* GetAI_boss_feral_defender(Creature* pCreature)
{
    return new boss_feral_defenderAI (pCreature);
}

CreatureAI* GetAI_boss_sanctum_sentry(Creature* pCreature)
{
    return new boss_sanctum_sentryAI (pCreature);
}
void AddSC_boss_auriaya_event()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_auriaya";
    newscript->GetAI = &GetAI_boss_auriaya;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "boss_feral_defender";
    newscript->GetAI = &GetAI_boss_feral_defender;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "boss_sanctum_sentry";
    newscript->GetAI = &GetAI_boss_sanctum_sentry;
    newscript->RegisterSelf();
}