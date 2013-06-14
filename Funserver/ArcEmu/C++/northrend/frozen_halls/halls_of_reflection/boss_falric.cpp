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
SDName: boss_falric
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
        SPELL_HOPELESSNESS                      = 72395,
        SPELL_IMPENDING_DESPAIR                 = 72426,
        SPELL_DEFILING_HORROR_N                 = 72435,
        SPELL_QUIVERING_STRIKE_N                = 72422,

        SPELL_DEFILING_HORROR_H                 = 72452,
        SPELL_QUIVERING_STRIKE_H                = 72453,

};

struct boss_falricAI : public ScriptedAI
{
    boss_falricAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Regular = pCreature->GetMap()->IsHeroic();
        Reset();
   }

ScriptedInstance* m_pInstance;
bool Regular;
uint32 m_uiBerserk_Timer;
uint32 m_uiDespair_Timer;
uint32 m_uiHorror_Timer;
uint32 m_uiStrike_Timer;
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
      stage = 0;
      SummonCount = 0;
      m_uiDespair_Timer = Regular ? 40000 : 30000;
      m_uiHorror_Timer = urand(25000,35000);
      m_uiStrike_Timer = urand(10000,15000);
      m_uiSummon_Timer = 0;
      me->SetVisibility(VISIBILITY_OFF);
      if(m_pInstance)
         m_pInstance->SetData(TYPE_FALRIC, NOT_STARTED);
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
         m_pInstance->SetData(TYPE_MARWYN, SPECIAL);
    }

    void AttackStart(Unit* who) 
    { 
         if (m_pInstance) 
           if (m_pInstance->GetData(TYPE_FALRIC) != IN_PROGRESS)
             return; 

         ScriptedAI::AttackStart(who);
    }

   void UpdateAI(const uint32 diff)
    {
        if (m_pInstance->GetData(TYPE_FALRIC) == SPECIAL ) {
            if (m_uiSummon_Timer < diff) {
                    ++SummonCount;
                    if (SummonCount > MOB_WAVES_NUM_1) {
                             m_pInstance->SetData(TYPE_FALRIC, IN_PROGRESS);
                             me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
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
                    if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_HOPELESSNESS);
                    stage = 2;
                    break;}
            case 2: {
                    break;}
            case 3: {
                    if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_HOPELESSNESS);
                    stage = 4;
                    break;}
            case 4: {
                    break;}
            case 5: {
                    if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_HOPELESSNESS);
                    stage = 6;
                    break;}
            case 6: {
                    break;}
        }
                    if (m_uiDespair_Timer < diff) {
                    if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_IMPENDING_DESPAIR);
                    m_uiDespair_Timer= Regular ? 40000 : 30000;
                    } else m_uiDespair_Timer -= diff;

                    if (m_uiStrike_Timer < diff)
                    {DoCast(me->getVictim(), Regular ? SPELL_QUIVERING_STRIKE_N : SPELL_QUIVERING_STRIKE_H);
                    m_uiStrike_Timer=urand(10000,15000);
                    } else m_uiStrike_Timer -= diff;

                    if (m_uiHorror_Timer < diff) {
                    if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, Regular ? SPELL_DEFILING_HORROR_N : SPELL_DEFILING_HORROR_H);
                    m_uiHorror_Timer=urand(25000,35000);
                    } else m_uiHorror_Timer -= diff;

        health = me->GetHealth()*100 / me->GetMaxHealth();
        if (health <= 66 && stage == 0) stage = 1;
        if (health <= 33 && stage == 2) stage = 3;
        if (health <= 10 && stage == 4) stage = 5;

        if (m_uiBerserk_Timer < diff)
        {
            DoCast(me, SPELL_BERSERK);
            m_uiBerserk_Timer = 180000;
        } else  m_uiBerserk_Timer -= diff;

        DoMeleeAttackIfReady();      
    }
};

CreatureAI* GetAI_boss_falric(Creature* pCreature)
{
    return new boss_falricAI(pCreature);
}

void AddSC_boss_falric()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_falric";
    newscript->GetAI = &GetAI_boss_falric;
    newscript->RegisterSelf();
}
