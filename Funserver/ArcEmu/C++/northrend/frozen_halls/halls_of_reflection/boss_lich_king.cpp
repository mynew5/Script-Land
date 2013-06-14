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
SDName: boss_lich_king
SD%Complete: 100%
SDComment:
SDCategory: Halls of Reflection
EndScriptData */

#include "ScriptedPch.h"
#include "def_hall_of_reflection.h"
#include "ScriptedEscortAI.h"

enum
{
  SPELL_WINTER                       = 69780,
  SPELL_FURY_OF_FROSTMOURNE          = 70063,
  SPELL_SOUL_REAPER                  = 73797,
  SPELL_RAISE_DEAD                   = 69818,
  SPELL_ICE_PRISON                   = 69708,
  SPELL_DARK_ARROW                   = 70194,
  SPELL_EMERGE_VISUAL                = 50142,
  SPELL_DESTROY_ICE_WALL_02          = 70224, 
  SPELL_SILENCE                      = 69413,
  SPELL_LICH_KING_CAST               = 57561,
  SPELL_GNOUL_JUMP                   = 70150,
  SPELL_ABON_STRIKE                  = 40505,

  /*SPELLS - Witch Doctor*/
  SPELL_COURSE_OF_DOOM               = 70144,
  SPELL_SHADOW_BOLT_VALLEY           = 70145,
  SPELL_SHADOW_BOLT_N                = 70080,
  SPELL_SHADOW_BOLT_H                = 70182,

  SAY_LICH_KING_WALL_01              = -1594486,
  SAY_LICH_KING_WALL_02              = -1594491,
  SAY_LICH_KING_GNOUL                = -1594482,
  SAY_LICH_KING_ABON                 = -1594483,
  SAY_LICH_KING_WINTER               = -1594481,
  SAY_LICH_KING_END_DUN              = -1594504, 

  NPC_RAGING_GNOUL                   = 36940,
  NPC_RISEN_WITCH_DOCTOR             = 36941,
  NPC_ABON                           = 37069
};

struct boss_lich_king_hrAI : public npc_escortAI
{
    boss_lich_king_hrAI(Creature *pCreature) : npc_escortAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
   }

ScriptedInstance* m_pInstance;
uint32 Step;
uint32 StepTimer;
bool StartEscort;
bool IceWall01;
bool NonFight;
bool Finish;

    void Reset()
    { 
      NonFight = false;
      me->SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID + 0, uint32(36942));
    }

    void JustDied(Unit* pKiller)
    {
    }

    void WaypointReached(uint32 i)
    {
        switch(i)
        {
            case 20:
                SetEscortPaused(true);
                Finish = true;
                DoCast(me, SPELL_LICH_KING_CAST);
                m_pInstance->SetData(TYPE_LICH_KING, DONE);
                DoScriptText(SAY_LICH_KING_END_DUN, me);
                if(Creature* pLider = ((Creature*)Unit::GetUnit((*me), m_pInstance->GetData64(DATA_ESCAPE_LIDER))))
                { 
                  pLider->CastSpell(pLider, SPELL_SILENCE, false);
				  pLider->SetFlag(UNIT_FIELD_FLAGS, MOVEMENTFLAG_FLY_MODE);
                  pLider->SendMonsterMove(pLider->GetPositionX(), pLider->GetPositionY(), pLider->GetPositionZ() + 4/*, SPLINETYPE_NORMAL , pLider->GetSplineFlags()*/, 3000); 
                }
                break;
        }
    }

    void AttackStart(Unit* who) 
    { 
     if (!who)
         return;

     if(NonFight == true) return;

     if(who->GetTypeId() == TYPEID_PLAYER) return;

     if(m_pInstance->GetData(TYPE_LICH_KING) == IN_PROGRESS) return;

     ScriptedAI::AttackStart(who);
    }

   void UpdateEscortAI(const uint32 diff)
    {
      if(!m_pInstance) return;
 
      if(m_pInstance->GetData(TYPE_LICH_KING) != IN_PROGRESS)
      {
         if (UpdateVictim())
              return;

         DoMeleeAttackIfReady();
      }

      if(m_pInstance->GetData(TYPE_LICH_KING) == IN_PROGRESS && StartEscort != true)
      {
         StartEscort = true;
         if(me->HasAura(SPELL_ICE_PRISON))
            me->RemoveAurasDueToSpell(SPELL_ICE_PRISON);
         if(me->HasAura(SPELL_DARK_ARROW))
            me->RemoveAurasDueToSpell(SPELL_DARK_ARROW);
         
         NonFight = true;
         me->AttackStop();
         me->SetFlag(UNIT_FIELD_FLAGS, MOVEMENTFLAG_WALK_MODE);
         me->SetSpeed(MOVE_WALK, 2.5f, true);
         if (boss_lich_king_hrAI* pEscortAI = dynamic_cast<boss_lich_king_hrAI*>(me->AI()))
             pEscortAI->Start(false, false);  //pPlayer->GetGUID());
         Step = 0;
         StepTimer = 100;
      }

      if(m_pInstance->GetData(TYPE_ICE_WALL_01) == IN_PROGRESS)
      {
         if(StepTimer < diff)
           {
             switch(Step)
               {
                case 0:
                  SetEscortPaused(true);
                  DoScriptText(SAY_LICH_KING_WALL_01, me);
                  DoCast(me, SPELL_DESTROY_ICE_WALL_02);
                  StepTimer = 2000;
                  ++Step;
                  break;
                case 1:               
                  if(GameObject* pGate = m_pInstance->instance->GetGameObject(m_pInstance->GetData64(DATA_GO_ICE_WALL_01)))
                    pGate->SetGoState(GO_STATE_READY);
                  StepTimer = 2000;
                  ++Step;
                  break;
                case 2:
                  DoCast(me, SPELL_RAISE_DEAD);
                  DoScriptText(SAY_LICH_KING_GNOUL, me);
                  StepTimer = 7000;
                  ++Step;
                  break;
                case 3:
                  DoCast(me, SPELL_WINTER);
                  DoScriptText(SAY_LICH_KING_WINTER, me);
                  me->SetSpeed(MOVE_WALK, 1.0f, true);
                  StepTimer = 1000;
                  ++Step;
                  break;
                case 4:
                  SetEscortPaused(false);
                  StepTimer = 2000;
                  ++Step;
                  break;
                case 5:
                  me->SummonCreature(NPC_RISEN_WITCH_DOCTOR,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  m_pInstance->SetData(TYPE_ICE_WALL_01, DONE);
                  StepTimer = 100;
                  Step = 0;
                  break;

               }
           } else StepTimer -= diff;
         }

      if(m_pInstance->GetData(TYPE_ICE_WALL_02) == IN_PROGRESS)
      {
         if(StepTimer < diff)
           {
             switch(Step)
               {
                case 0:
                  SetEscortPaused(true);
                  DoCast(me, SPELL_RAISE_DEAD);
                  DoScriptText(SAY_LICH_KING_GNOUL, me);
                  StepTimer = 10000;
                  ++Step;
                  break;
                case 1:
                  SetEscortPaused(false);
                  me->SummonCreature(NPC_RISEN_WITCH_DOCTOR,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  me->SummonCreature(NPC_RISEN_WITCH_DOCTOR,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  me->SummonCreature(NPC_ABON,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  m_pInstance->SetData(TYPE_ICE_WALL_02, DONE);
                  StepTimer = 100;
                  Step = 0;
                  break;

               }
           } else StepTimer -= diff;
         }

      if(m_pInstance->GetData(TYPE_ICE_WALL_03) == IN_PROGRESS)
      {
         if(StepTimer < diff)
           {
             switch(Step)
               {
                case 0:
                  SetEscortPaused(true);
                  DoCast(me, SPELL_RAISE_DEAD);
                  DoScriptText(SAY_LICH_KING_GNOUL, me);
                  StepTimer = 10000;
                  ++Step;
                  break;
                case 1:
                  SetEscortPaused(false);
                  DoScriptText(SAY_LICH_KING_ABON, me);
                  me->SummonCreature(NPC_RISEN_WITCH_DOCTOR,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  me->SummonCreature(NPC_RISEN_WITCH_DOCTOR,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  me->SummonCreature(NPC_RISEN_WITCH_DOCTOR,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  me->SummonCreature(NPC_ABON,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  me->SummonCreature(NPC_ABON,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  m_pInstance->SetData(TYPE_ICE_WALL_03, DONE);
                  StepTimer = 100;
                  Step = 0;
                  break;
               }
           } else StepTimer -= diff;
         }

      if(m_pInstance->GetData(TYPE_ICE_WALL_04) == IN_PROGRESS)
      {
         if(StepTimer < diff)
           {
             switch(Step)
               {
                case 0:
                  SetEscortPaused(true);
                  DoCast(me, SPELL_RAISE_DEAD);
                  DoScriptText(SAY_LICH_KING_GNOUL, me);
                  StepTimer = 10000;
                  ++Step;
                  break;
                case 1:
                  SetEscortPaused(false);
                  me->SummonCreature(NPC_RISEN_WITCH_DOCTOR,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  me->SummonCreature(NPC_RISEN_WITCH_DOCTOR,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  me->SummonCreature(NPC_RISEN_WITCH_DOCTOR,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  me->SummonCreature(NPC_ABON,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  me->SummonCreature(NPC_ABON,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  StepTimer = 15000;
                  ++Step;
                  break;
                case 2:
                  DoScriptText(SAY_LICH_KING_ABON, me);
                  me->SummonCreature(NPC_ABON,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  me->SummonCreature(NPC_ABON,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  me->SummonCreature(NPC_ABON,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  me->SummonCreature(NPC_RISEN_WITCH_DOCTOR,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  me->SummonCreature(NPC_RISEN_WITCH_DOCTOR,(me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ(),4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                  m_pInstance->SetData(TYPE_ICE_WALL_04, DONE);
                  ++Step;
                  break;            
               }
           } else StepTimer -= diff;
         }


return;
    }
};

struct npc_raging_gnoulAI : public ScriptedAI
{
    npc_raging_gnoulAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
   }

ScriptedInstance* m_pInstance;
uint32 EmergeTimer;
bool Emerge;
uint64 m_uiLiderGUID;

    void Reset()
    { 
      DoCast(me, SPELL_EMERGE_VISUAL);
      EmergeTimer = 4000;
      Emerge = false;
    }

    void JustDied(Unit* pKiller)
    {
    }

    void AttackStart(Unit* who) 
    { 
     if (!who)
         return;

     if(Emerge == false) return;

     ScriptedAI::AttackStart(who);
    }

   void UpdateAI(const uint32 diff)
    {
      if(!m_pInstance) return;

      if(m_pInstance->GetData(TYPE_LICH_KING) == IN_PROGRESS)
      {
        if(Emerge != true)
        {
           if(EmergeTimer < diff)
           {
              me->RemoveFlag(UNIT_FIELD_FLAGS, MOVEMENTFLAG_WALK_MODE);
              Emerge = true;
              m_uiLiderGUID = m_pInstance->GetData64(DATA_ESCAPE_LIDER);
              if(Creature* pLider = ((Creature*)Unit::GetUnit((*me), m_uiLiderGUID)))
              {
                DoResetThreat();
                me->AI()->AttackStart(pLider);
                me->GetMotionMaster()->Clear();
                me->GetMotionMaster()->MoveChase(pLider);
                me->AddThreat(pLider, 1.0f);
              }

           } else EmergeTimer -= diff;
        }
      }

     DoMeleeAttackIfReady();

    }
};

struct npc_risen_witch_doctorAI : public ScriptedAI
{
    npc_risen_witch_doctorAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
   }

ScriptedInstance* m_pInstance;
uint32 EmergeTimer;
bool Emerge;
uint64 m_uiLiderGUID;

    void Reset()
    { 
      DoCast(me, SPELL_EMERGE_VISUAL);
      EmergeTimer = 5000;
      Emerge = false;
    }

    void JustDied(Unit* pKiller)
    {
    }

    void AttackStart(Unit* who) 
    { 
     if (!who)
         return;

     if(Emerge == false) return;

     ScriptedAI::AttackStart(who);
    }

   void UpdateAI(const uint32 diff)
    {
      if(!m_pInstance) return;

      if(m_pInstance->GetData(TYPE_LICH_KING) == IN_PROGRESS)
      {
        if(Emerge != true)
        {
           if(EmergeTimer < diff)
           {
              me->RemoveFlag(UNIT_FIELD_FLAGS, MOVEMENTFLAG_WALK_MODE);
              Emerge = true;
              m_uiLiderGUID = m_pInstance->GetData64(DATA_ESCAPE_LIDER);
              if(Creature* pLider = ((Creature*)Unit::GetUnit((*me), m_uiLiderGUID)))
              {
                DoResetThreat();
                me->AI()->AttackStart(pLider);
                me->GetMotionMaster()->Clear();
                me->GetMotionMaster()->MoveChase(pLider);
                me->AddThreat(pLider, 1.0f);
              }

           } else EmergeTimer -= diff;
        }
      }

     DoMeleeAttackIfReady();

    }
};

struct npc_abonAI : public ScriptedAI
{
    npc_abonAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
   }

ScriptedInstance* m_pInstance;
uint64 m_uiLiderGUID;
bool Walk;

    void Reset()
    { 
      Walk = false;
    }

   void UpdateAI(const uint32 diff)
    {
      if(!m_pInstance) return;

      if(m_pInstance->GetData(TYPE_LICH_KING) == IN_PROGRESS)
      {
        if(Walk != true)
        {
              me->RemoveFlag(UNIT_FIELD_FLAGS, MOVEMENTFLAG_WALK_MODE);
              Walk = true;
              m_uiLiderGUID = m_pInstance->GetData64(DATA_ESCAPE_LIDER);
              if(Creature* pLider = ((Creature*)Unit::GetUnit((*me), m_uiLiderGUID)))
              {
                DoResetThreat();
                me->AI()->AttackStart(pLider);
                me->GetMotionMaster()->Clear();
                me->GetMotionMaster()->MoveChase(pLider);
                me->AddThreat(pLider, 1.0f);
              }
        }
      }

     DoMeleeAttackIfReady();

    }
};

CreatureAI* GetAI_boss_lich_king_hr(Creature* pCreature)
{
    return new boss_lich_king_hrAI(pCreature);
}

CreatureAI* GetAI_npc_raging_gnoul(Creature* pCreature)
{
    return new npc_raging_gnoulAI(pCreature);
}

CreatureAI* GetAI_npc_risen_witch_doctor(Creature* pCreature)
{
    return new npc_risen_witch_doctorAI(pCreature);
}

CreatureAI* GetAI_npc_abon(Creature* pCreature)
{
    return new npc_abonAI(pCreature);
}

void AddSC_boss_lich_king_hr()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_lich_king_hr";
    newscript->GetAI = &GetAI_boss_lich_king_hr;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_raging_gnoul";
    newscript->GetAI = &GetAI_npc_raging_gnoul;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_risen_witch_doctor";
    newscript->GetAI = &GetAI_npc_risen_witch_doctor;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_abon";
    newscript->GetAI = &GetAI_npc_abon;
    newscript->RegisterSelf();
}