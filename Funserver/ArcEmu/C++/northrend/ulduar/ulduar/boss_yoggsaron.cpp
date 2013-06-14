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

#define SPELL_PSICHOSIS		RAID_MODE(65301,63795) // Phase 2 sara enemy
#define SPELL_EMPROWETING_SHADOWS  RAID_MODE(64468,64486) // Phase 3
enum
{
//Freya image
SPELL_RESILIENCE_NATURE		= 62670,
SPELL_SANITY_WELL		= 64170,
// Hodir image
SPELL_FORTITUDE_FROST		= 62650,
SPELL_PROTECTIVE_GAZE		= 64174,
// Mimirin image
SPELL_DESTABILIZATION		= 65210,
SPELL_SPEED_INVENTION		= 62671,
// Thorim image
SPELL_FURY_STORM		= 62702,
SPELL_TITANIC_STORM		= 64171,
// Phase 1 Sara the Ally
SPELL_SARA_FERVOR		= 63238,
SPELL_SARA_BLESSING		= 63134,
SPELL_SARA_ANGEL		= 63147,
// Phase 2 Sara the Enemy
SPELL_SANITY			= 63050,
SPELL_MALADY_MIND		= 63830,
SPELL_BRAIN_LINK		= 63802,
SPELL_DEATH_RAY			= 63891,  // SUMON 4 - 33882
SPELL_LUNATIC_GAZE		= 64167,  // And Phase 3
SPELL_SHATTERED_ILLUSION	= 64173,  // MOMENTALI STUNED
// Phase 2_2 Tentacles
SPELL_ERUPT			= 64144,  // And corruptor
SPELL_DIMINISH_POWER		= 64145,
SPELL_FOKUSED_ANGER		= 57689,
// Phase 2_2 Constrictor Tentacle
SPELL_SQUEEZE			= 64125,
// Phase 2_2 Coruptor tentace
SPELL_APATHY			= 64156,
SPELL_BLACK_PLAGUE		= 64153,
SPELL_CURSE_DOOM		= 64157,
SPELL_DRAINING_POISON		= 64152,
// Phase 3 An Old God
SPELL_SHADOW_BEACON		= 64465,
SPELL_DEAFENING_ROAR		= 64189,
SPELL_SHADOW_BARER		= 63894,

ACHIEV_TIMED_START_EVENT                      = 21001
};

enum
{
NPC_FREYA_IMAGE			= 33410,
NPC_HODIR_IMAGE			= 33411,
NPC_MIMIRON_IMAGE		= 33412,
NPC_THORIM_IMAGE		= 33413,
NPC_SARA			= 33134,
NPC_GUARDIAN_OF_SARON		= 33136,
NPC_DERSENT_MADNESS		= 34072,
NPC_CRUSHER_TENTACLE		= 33966,
NPC_CONSTRICTOR_TENTASLE	= 33983,
NPC_CORRUPTOR_TENTACLE		= 33985,
NPC_IMMORTAL_GUARDIAN		= 33988
};


struct boss_yoggsaronAI : public ScriptedAI
{
    boss_yoggsaronAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }
 
    ScriptedInstance* m_pInstance;
 
    void Reset()
    {
    }
 
    void KilledUnit(Unit *victim)
    {
    }
 
    void JustDied(Unit *victim)
    {
    }
 
    void Aggro(Unit* pWho)
    {
// DoScriptText(SAY_AGGRO, me);
        me->SetInCombatWithZone();
 
        if (m_pInstance)
            m_pInstance->SetData(TYPE_YOGGSARON, IN_PROGRESS);
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!me->getVictim())
            return;
//SPELLS TODO:
 
//
        DoMeleeAttackIfReady();
 
        EnterEvadeIfOutOfCombatArea(diff);
 
    }
 
};
 
CreatureAI* GetAI_boss_yoggsaron(Creature* pCreature)
{
    return new boss_yoggsaronAI(pCreature);
}
 
void AddSC_boss_yoggsaron()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_yoggsaron";
    newscript->GetAI = &GetAI_boss_yoggsaron;
    newscript->RegisterSelf();
 
}