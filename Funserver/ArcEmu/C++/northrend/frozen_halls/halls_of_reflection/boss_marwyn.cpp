/* Copyright (C) 2006 - 2010 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
SDName: boss_marwyn
SD%Complete: 0%
SDComment:
SDCategory: Halls of Reflection
EndScriptData */

#include "ScriptedPch.h"
#include "def_hall_of_reflection.h"

enum
{
        //common
        SPELL_BERSERK                           = 47008,
        //yells
        //summons
        //Abilities
        SPELL_OBLITERATE_N                      = 72360,
        SPELL_SHARED_SUFFERING_N                = 72368,
        SPELL_WELL_OF_CORRUPTION                = 72362,
        SPELL_CORRUPTED_FLESH_N                 = 72363,

        SPELL_OBLITERATE_H                      = 72434,
        SPELL_SHARED_SUFFERING_H                = 72369,
        SPELL_CORRUPTED_FLESH_H                 = 72436,

};

struct boss_marwynAI : public ScriptedAI
{
    boss_marwynAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Regular = pCreature->GetMap()->IsHeroic();
        Reset();
   }

ScriptedInstance* m_pInstance;
bool Regular;
uint32 m_uiBerserk_Timer;
uint32 m_uiSharedSuffering_Timer;
uint32 m_uiWell_Timer;
uint32 m_uiTouch_Timer;
uint32 m_uiFlesh_Timer;
uint32 m_uiObliterate_Timer;
uint32 m_uiSummon_Timer;

uint8 health;
uint8 stage;
uint8 SummonCount;

uint64 npctype1;
uint64 npctype2;
uint64 npctype3;

    void Reset()
    {
      m_uiBerserk_Timer = 180000;
      m_uiSharedSuffering_Timer = 4000;
      m_uiWell_Timer = 5000;
      m_uiTouch_Timer = 8000;
      m_uiFlesh_Timer = 10000;
      m_uiObliterate_Timer = 1000;
      SummonCount = 0;
      stage = 0;
      m_uiSummon_Timer = 0;
      me->SetVisibility(VISIBILITY_OFF);
      if (m_pInstance)
          m_pInstance->SetData(TYPE_MARWYN, NOT_STARTED);
    }

    bool CallGuards(TempSummonType type, uint32 _summontime )
    {
        switch(urand(0,3))
        {
            case 0: {
                     npctype1 = NPC_DARK_1;
                     npctype2 = NPC_DARK_3;
                     npctype3 = NPC_DARK_6;
                    break;}
            case 1: {
                     npctype1 = NPC_DARK_2;
                     npctype2 = NPC_DARK_3;
                     npctype3 = NPC_DARK_4;
                    break;}
            case 2: {
                     npctype1 = NPC_DARK_2;
                     npctype2 = NPC_DARK_5;
                     npctype3 = NPC_DARK_6;
                    break;}
            case 3: {
                     npctype1 = NPC_DARK_1;
                     npctype2 = NPC_DARK_5;
                     npctype3 = NPC_DARK_4;
                    break;}
        }

        if (Creature* pSummon1 = me->SummonCreature(npctype1, SpawnLoc[0].x, SpawnLoc[0].y, SpawnLoc[0].z, 0, type, _summontime))
                      pSummon1->SetInCombatWithZone();
        if (Creature* pSummon2 = me->SummonCreature(npctype2, SpawnLoc[1].x, SpawnLoc[1].y, SpawnLoc[1].z, 0, type, _summontime))
                      pSummon2->SetInCombatWithZone();
        if (Creature* pSummon3 = me->SummonCreature(npctype3, SpawnLoc[2].x, SpawnLoc[2].y, SpawnLoc[2].z, 0, type, _summontime))
                      pSummon3->SetInCombatWithZone();

        return true;
    }

    void JustDied(Unit* pKiller)
    {
      if(m_pInstance)
         m_pInstance->SetData(TYPE_MARWYN, DONE);
    }

    void AttackStart(Unit* who) 
    { 
         if (m_pInstance) 
           if (m_pInstance->GetData(TYPE_MARWYN) != IN_PROGRESS)
             return; 

         ScriptedAI::AttackStart(who);
    }

   void UpdateAI(const uint32 diff)
    {
            if (m_pInstance->GetData(TYPE_MARWYN) == SPECIAL ) {
            if (m_uiSummon_Timer < diff) {
                    ++SummonCount;
                    if (SummonCount > MOB_WAVES_NUM_1) {
                             m_pInstance->SetData(TYPE_MARWYN, IN_PROGRESS);
                             me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                             me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                             me->SetVisibility(VISIBILITY_ON);
                             me->SetInCombatWithZone();
                             }
                    else CallGuards(TEMPSUMMON_CORPSE_TIMED_DESPAWN, 60000);
                    m_uiSummon_Timer = MOB_WAVES_DELAY_1;
                    } else m_uiSummon_Timer -= diff;
        }

        if (UpdateVictim())
            return;

        switch(stage)
        {
            case 0: {
                    break;}
            case 1: {
                    if (m_uiSharedSuffering_Timer < diff) {
                    if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, Regular ? SPELL_SHARED_SUFFERING_N : SPELL_SHARED_SUFFERING_H);
                    m_uiSharedSuffering_Timer= 20000;
                    } else m_uiSharedSuffering_Timer -= diff;

                    if (m_uiWell_Timer < diff) {
                    if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_WELL_OF_CORRUPTION);
                    m_uiWell_Timer= 30000;
                    } else m_uiWell_Timer -= diff;

/*                    if (m_uiTouch_Timer < diff) {
                    if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, Regular ? SPELL_WELL_OF_CORRUPTION_N : SPELL_WELL_OF_CORRUPTION_H);
                    m_uiTouch_Timer= 30000;
                    } else m_uiTouch_Timer -= diff;
*/
                    if (m_uiFlesh_Timer < diff) {
                    if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, Regular ? SPELL_CORRUPTED_FLESH_N : SPELL_CORRUPTED_FLESH_H);
                    m_uiWell_Timer= 10000;
                    } else m_uiWell_Timer -= diff;

                    if (m_uiObliterate_Timer < diff)
                    {DoCast(me->getVictim(), Regular ? SPELL_OBLITERATE_N : SPELL_OBLITERATE_H);
                    m_uiObliterate_Timer=urand(8000,12000);
                    } else m_uiObliterate_Timer -= diff;
                    }
        }



        if (m_uiBerserk_Timer < diff)
        {
            DoCast(me, SPELL_BERSERK);
            m_uiBerserk_Timer = 180000;
        } else  m_uiBerserk_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_marwyn(Creature* pCreature)
{
    return new boss_marwynAI(pCreature);
}

void AddSC_boss_marwyn()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_marwyn";
    newscript->GetAI = &GetAI_boss_marwyn;
    newscript->RegisterSelf();
}