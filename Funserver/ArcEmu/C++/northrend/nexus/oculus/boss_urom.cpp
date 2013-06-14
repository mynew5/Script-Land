/* Copyright (C) 2008 - 2010 TrinityCore <http://www.trinitycore.org>
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

#include "ScriptedPch.h"
#include "oculus.h"

enum Spells
{
    SPELL_ARCANE_SHIELD                           = 53813, //Dummy --> Channeled, shields the caster from damage.
    SPELL_EMPOWERED_ARCANE_EXPLOSION              = 51110,
    SPELL_EMPOWERED_ARCANE_EXPLOSION_2            = 59377,
    SPELL_FROSTBOMB                               = 51103, //Urom throws a bomb, hitting its target with the highest aggro which inflict directly 650 frost damage and drops a frost zone on the ground. This zone deals 650 frost damage per second and reduce the movement speed by 35%. Lasts 1 minute.
    SPELL_SUMMON_MENAGERIE                        = 50476, //Summons an assortment of creatures and teleports the caster to safety.
    SPELL_SUMMON_MENAGERIE_2                      = 50495,
    SPELL_SUMMON_MENAGERIE_3                      = 50496,
    SPELL_TELEPORT                                = 51112, //Teleports to the center of Oculus
    SPELL_TIME_BOMB                               = 51121, //Deals arcane damage to a random player, and after 6 seconds, deals zone damage to nearby equal to the health missing of the target afflicted by the debuff.
    SPELL_TIME_BOMB_2                             = 59376,
    //NPCs
    NPC_PHANTASMAL_MAMMOTH                 = 27642,
    NPC_PHANTASMAL_WOLF                    = 27644,
    NPC_PHANTASMAL_CLOUDSCRAPER            = 27645,
    NPC_PHANTASMAL_OGRE                    = 27647,
    NPC_PHANTASMAL_NAGA                    = 27648,
    NPC_PHANTASMAL_MURLOC                  = 27649,
    NPC_PHANTASMAL_AIR                     = 27650,
    NPC_PHANTASMAL_FIRE                    = 27651,
    NPC_PHANTASMAL_WATER                   = 27653
};
//not in db
enum Yells
{
    SAY_AGGRO                                     = -1578012,
    SAY_KILL_1                                    = -1578013,
    SAY_KILL_2                                    = -1578014,
    SAY_KILL_3                                    = -1578015,
    SAY_DEATH                                     = -1578016,
    SAY_EXPLOSION_1                               = -1578017,
    SAY_EXPLOSION_2                               = -1578018,
    SAY_SUMMON_1                                  = -1578019,
    SAY_SUMMON_2                                  = -1578020,
    SAY_SUMMON_3                                  = -1578021
};

struct boss_uromAI : public ScriptedAI
{
    boss_uromAI(Creature *c) : ScriptedAI(c)
    {
        pInstance = c->GetInstanceData();
    }

    ScriptedInstance* pInstance;
    
    bool   m_bIsInCenter;
    bool   m_bCastExplosion;
    uint16 m_uiPhase;
    uint32 m_uiTeleportTimer;
    uint32 m_uiPhaseTimer;
    uint32 m_uiEmpoweredExplosionTimer;
    uint32 m_uiFrostbombTimer;
    uint32 m_uiTimeBombTimer;
    Position pos;

     void Reset()
     {
        if (pInstance)
            pInstance->SetData(DATA_UROM_EVENT, NOT_STARTED);
        m_uiPhase = 0;
        m_bIsInCenter = false;
        m_bCastExplosion = true;
        m_uiTeleportTimer = 30000;
        m_uiFrostbombTimer = urand(6000,10000);
        m_uiTimeBombTimer = 15000;
        m_uiPhaseTimer = RAID_MODE(6500,8500);
     }
    
    void SpellHit(Unit* pCaster, const SpellEntry* pSpell)
    {
        DoScriptText(SAY_AGGRO, me);

        if (pInstance)
            pInstance->SetData(DATA_UROM_EVENT, IN_PROGRESS);
        if(pSpell->Id == SPELL_SUMMON_MENAGERIE || pSpell->Id == SPELL_SUMMON_MENAGERIE_2 || pSpell->Id == SPELL_SUMMON_MENAGERIE_3)
        {
            // hacky crap
            me->CombatStop(true);
            me->getThreatManager().clearReferences();
            std::list<HostileReference*> hl = me->getThreatManager().getThreatList();
            me->SetReactState(REACT_AGGRESSIVE);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            m_uiPhase++;
        }
    }
	
  void EnterCombat(Unit* pWho)
   {
       if(pWho->GetTypeId() != TYPEID_PLAYER)
           return;

       // some better way?
       switch(m_uiPhase)
       {
       case 0:
           DoScriptText(SAY_SUMMON_1, me);
           DoSummon(NPC_PHANTASMAL_FIRE, me);
           DoSummon(NPC_PHANTASMAL_AIR, me);
           DoSummon(NPC_PHANTASMAL_WATER, me);
           DoSummon(NPC_PHANTASMAL_WATER, me);
           me->GetMap()->LoadGrid(968.75,1042.4);
           me->SetReactState(REACT_PASSIVE);
           me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
           DoCast(me,SPELL_SUMMON_MENAGERIE);
           break;
       case 1:
           DoScriptText(SAY_SUMMON_2, me);
           DoSummon(NPC_PHANTASMAL_MAMMOTH, me);
           DoSummon(NPC_PHANTASMAL_MAMMOTH, me);
           DoSummon(NPC_PHANTASMAL_CLOUDSCRAPER, me);
           DoSummon(NPC_PHANTASMAL_CLOUDSCRAPER, me);
           DoSummon(NPC_PHANTASMAL_WOLF, me);
           me->GetMap()->LoadGrid(1163.63,1171.13);
           me->SetReactState(REACT_PASSIVE);
           me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
           DoCast(SPELL_SUMMON_MENAGERIE_2);
           break;
       case 2:
           DoScriptText(SAY_SUMMON_3, me);
           DoSummon(NPC_PHANTASMAL_OGRE, me);
           DoSummon(NPC_PHANTASMAL_NAGA, me);
           DoSummon(NPC_PHANTASMAL_NAGA, me);
           DoSummon(NPC_PHANTASMAL_MURLOC, me);
           DoSummon(NPC_PHANTASMAL_MURLOC, me);
           me->GetMap()->LoadGrid(1119.8,1081.86);
           me->SetReactState(REACT_PASSIVE);
           me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
           DoCast(SPELL_SUMMON_MENAGERIE_3);
           break;
       case 3:
           DoScriptText(SAY_AGGRO, me);
           break;
       }
        
    }

    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!UpdateVictim())
            return;
	if(!m_bIsInCenter) // Phase 1
        {
            if(m_uiTeleportTimer < diff) // Teleport
            {
                me->GetPosition(&pos);
                me->InterruptNonMeleeSpells(false);
                me->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                DoCast(me,SPELL_TELEPORT,true);
                m_bIsInCenter = true;
            }
            else
                m_uiTeleportTimer -= diff;

            if(m_uiFrostbombTimer < diff) // Frost Bomb
            {
                DoCast(me->getVictim(),SPELL_FROSTBOMB);
                m_uiFrostbombTimer = urand(6000,10000);
            }
            else
                m_uiFrostbombTimer -= diff;

            if(m_uiTimeBombTimer < diff) // Time Bomb
            {
                if(Unit* unit = SelectTarget(SELECT_TARGET_RANDOM,0))
                {
                    DoCast(unit, RAID_MODE(SPELL_TIME_BOMB,SPELL_TIME_BOMB_2));
                }
                m_uiTimeBombTimer = UINT_MAX;
            }
            else
                m_uiTimeBombTimer -= diff;

            DoMeleeAttackIfReady();
        }
        else //Phase 2
        {
            if(m_bCastExplosion)
            {
                DoScriptText(rand()%2 ? SAY_EXPLOSION_1 : SAY_EXPLOSION_2, me);
                DoCast(RAID_MODE(SPELL_EMPOWERED_ARCANE_EXPLOSION,SPELL_EMPOWERED_ARCANE_EXPLOSION_2));
                m_bCastExplosion = false;
            }

            if(m_uiPhaseTimer < diff)
            {
                me->Relocate(pos);
                m_bIsInCenter = false;
                m_bCastExplosion = true;
                m_uiTeleportTimer = 30000;
                m_uiTimeBombTimer = 15000;
                m_uiPhaseTimer = RAID_MODE(6500,8500);
                me->RemoveFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
            }
            else
                m_uiPhaseTimer -= diff;
        }
	

        DoMeleeAttackIfReady();
    }
    void JustDied(Unit* killer)
    {
        DoScriptText(SAY_DEATH, me);

        if (pInstance)
            pInstance->SetData(DATA_UROM_EVENT, DONE);
    }
    void KilledUnit(Unit *victim)
    {
        if (victim == me)
            return;
        DoScriptText(RAND(SAY_KILL_1,SAY_KILL_2,SAY_KILL_3), me);
    }
};

CreatureAI* GetAI_boss_urom(Creature* pCreature)
{
    return new boss_uromAI (pCreature);
}

void AddSC_boss_urom()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_urom";
    newscript->GetAI = &GetAI_boss_urom;
    newscript->RegisterSelf();
}
