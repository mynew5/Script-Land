/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
SDName: Hall Of Reflection
SD%Complete: 100% this is only Main Scenario!
SDComment: event script!
SDErrors: Some spell dont work or i'am cant find this spell! 
SDCategory: hall_of_reflection
SDAuthor: MaxXx2021 aka Mioka
EndScriptData */

#include "ScriptedPch.h"
#include "def_hall_of_reflection.h"
#include "ScriptedEscortAI.h"

enum
{
  /*INTRO - Pre Uther*/
  SAY_JAINA_INTRO_01                 = -1594433,
  SAY_SYLVANA_INTRO_01               = -1594434,
  SAY_JAINA_INTRO_02                 = -1594435,
  SAY_JAINA_INTRO_03                 = -1594436,
  SAY_SYLVANA_INTRO_03               = -1594437,
  SAY_JAINA_INTRO_04                 = -1594438,
  SAY_SYLVANA_INTRO_04               = -1594439,

  /*INTRO - Uther Dialog*/
  SAY_UTHER_A_01                     = -1594440, 
  SAY_UTHER_H_01                     = -1594441,
  SAY_JAINA_02                       = -1594442,
  SAY_SYLVANA_02                     = -1594443,
  SAY_UTHER_A_03                     = -1594444,
  SAY_UTHER_H_03                     = -1594445,
  SAY_JAINA_04                       = -1594446,
  SAY_SYLVANA_04                     = -1594447,
  SAY_UTHER_A_05                     = -1594448,
  SAY_UTHER_H_05                     = -1594449,
  SAY_JAINA_06                       = -1594450,
  SAY_SYLVANA_06                     = -1594451,
  SAY_UTHER_A_07                     = -1594452,
  SAY_UTHER_H_07                     = -1594453,
  SAY_JAINA_08                       = -1594454,
  SAY_SYLVANA_08                     = -1594455,
  SAY_UTHER_A_09                     = -1594456,
  SAY_UTHER_H_09                     = -1594457,
  SAY_JAINA_10                       = -1594458,
  SAY_UTHER_A_11                     = -1594459,
  SAY_UTHER_H_11                     = -1594460,
  SAY_JAINA_12                       = -1594461,
  SAY_SYLVANA_12                     = -1594462,
  SAY_UTHER_A_13                     = -1594463,
  SAY_UTHER_A_14                     = -1594464,
  SAY_JAINA_15                       = -1594465,

  /*INTRO - Lich King Arrive*/
  SAY_UTHER_A_16                     = -1594466,
  SAY_UTHER_H_16                     = -1594467,
  SAY_LICH_KING_17                   = -1594468,
  SAY_LICH_KING_18                   = -1594469,
  SAY_LICH_KING_19                   = -1594470,
  SAY_JAINA_20                       = -1594471,
  SAY_SYLVANA_20                     = -1594472,
  SAY_LICH_KING_A_21                 = -1594473,
  SAY_LICH_KING_H_21                 = -1594474,
  SAY_FALRIC_INTRO                   = -1594475,
  SAY_MARWYN_INTRO                   = -1594476,

  /*INTRO - Pre Escape*/
  SAY_LICH_KING_AGGRO_A              = -1594477,
  SAY_LICH_KING_AGGRO_H              = -1594478,
  SAY_JAINA_AGGRO                    = -1594479,
  SAY_SYLVANA_AGGRO                  = -1594480,

  /*ESCAPE*/
  SAY_JAINA_WALL_01                  = -1594487,
  SAY_SYLVANA_WALL_01                = -1594488,
  SAY_JAINA_WALL_02                  = -1594489,
  SAY_SYLVANA_WALL_02                = -1594490,
  SAY_LICH_KING_WALL_02              = -1594491,
  SAY_LICH_KING_WALL_03              = -1594492,
  SAY_LICH_KING_WALL_04              = -1594493,
  SAY_JAINA_WALL_03                  = -1594494,
  SAY_JAINA_WALL_04                  = -1594495,
  SAY_SYLVANA_WALL_03                = -1594496,
  SAY_SYLVANA_WALL_04                = -1594497,
  SAY_JAINA_ESCAPE_01                = -1594498,
  SAY_JAINA_ESCAPE_02                = -1594499,
  SAY_SYLVANA_ESCAPE_01              = -1594500,
  SAY_SYLVANA_ESCAPE_02              = -1594501,
  SAY_JAINA_TRAP                     = -1594502,
  SAY_SYLVANA_TRAP                   = -1594503,
  SAY_MATHEAS_JAINA                  = -1594505,
  SAY_LICH_KING_END_01               = -1594506,
  SAY_LICH_KING_END_02               = -1594507,
  SAY_LICH_KING_END_03               = -1594508,

  /*SPELLS AND VISUAL EFFECTS*/
  SPELL_TAKE_FROSTMOURNE             = 72729,
  SPELL_FROSTMOURNE_DESPAWN          = 72726,
  SPELL_FROSTMOURNE_SOUNDS           = 70667,
  SPELL_CAST_VISUAL                  = 65633,  //Jaina And Sylavana cast this when summon uther.
  SPELL_BOSS_SPAWN_AURA              = 72712,  //Falric and Marwyn
  SPELL_UTHER_DESPAWN                = 70693,
  SPELL_WINTER                       = 69780,
  SPELL_FURY_OF_FROSTMOURNE          = 70063,
  SPELL_SOUL_REAPER                  = 73797,
  SPELL_RAISE_DEAD                   = 69818,
  SPELL_ICE_PRISON                   = 69708,
  SPELL_DARK_ARROW                   = 70194,
  SPELL_ICE_BARRIER                  = 69787,
  SPELL_DESTROY_ICE_WALL_01          = 69784, //Jaina
  SPELL_DESTROY_ICE_WALL_02          = 70224, 
  SPELL_DESTROY_ICE_WALL_03          = 70225, //Sylvana
  SPELL_SUMMON_ICE_WALL              = 69784,
  SPELL_SYLVANA_JUMP                 = 68339,
  SPELL_SYLVANA_STEP                 = 69087,
  SPELL_MATHEAS_SHIELD               = 53658,
  SPELL_LIGHT                        = 66546,
  SPELL_SILENCE                      = 69413,
  SPELL_LICH_KING_CAST               = 57561,
  SPELL_PYRO_BLAST                   = 64698,

  /*UNITS*/
  NPC_JAINA                = 37221,
  NPC_SYLVANA              = 37223,
  NPC_JAINA_OUTRO          = 36955,
  NPC_SYLVANA_OUTRO        = 37554,
  NPC_ALTAR_TARGET         = 37704,
  NPC_UTHER                = 37225,
  NPC_LICH_KING            = 36954,
  BOSS_LICK_KING           = 37226,
  NPC_ICE_WALL             = 37014,
  NPC_FALRIC               = 38112,
  NPC_MARWYN               = 38113,
  NPC_GHOSTLY_ROGUE        = 38177,
  NPC_GHOSTLY_PRIEST       = 38175,
  NPC_GHOSTLY_MAGE         = 38172,
  NPC_GHOSTLY_FOOTMAN      = 38173,
  NPC_GHOSTLY_RIFLEMAN     = 38176,
  NPC_GLUK                 = 38567,
  NPC_MATHEAS              = 32497, //non blizzlike
  NPC_ARTHAS               = 27455,

  /*GAME OBJECT*/
  GO_ICE_WALL              = 201385,
  GO_LIGHT_BEAM            = 191330
};

struct npc_jaina_and_sylvana_HRintroAI : public ScriptedAI
{
    npc_jaina_and_sylvana_HRintroAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
   }

ScriptedInstance* m_pInstance;

uint32 Faction;
uint32 StepTimer;
uint32 Step;
uint64 m_uiFrostmourneGUID;
uint64 m_uiMainGateGUID;
uint64 m_uiFalricGUID;
uint64 m_uiMarwynGUID;
bool StartEvent;
bool Small;
Creature* pUther;
Creature* pLichKing;
uint64 m_uiIceWallGUID;

    void Reset()
    {
         Small = false;
         Step = 0;
         StepTimer = 500;
         me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
         me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
    }

   void UpdateAI(const uint32 diff)
    {
      if(!m_pInstance)
          return;

         if(StartEvent != true) return;
         
         if(StepTimer < diff)
           {
             switch(Step)
               {
                case 0:
                    m_pInstance->SetData(DATA_LIDER, me->GetGUID());
                    me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                    me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                    StepTimer = 2000;
                    ++Step;
                    break;
                case 1:
                    if(me->GetEntry() == NPC_JAINA)
                    {
                       DoScriptText(SAY_JAINA_INTRO_01, me);
                       StepTimer = 5000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA)
                    {
                       DoScriptText(SAY_SYLVANA_INTRO_01, me);
                       StepTimer = 10000;
                    }
                    ++Step;
                    break;
                case 2: 
                    if(me->GetEntry() == NPC_JAINA)
                    {
                       DoScriptText(SAY_JAINA_INTRO_02, me);
                       StepTimer = 5000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA)
                       StepTimer = 500;
                    ++Step;
                    break;
                case 3:
                    me->RemoveFlag(UNIT_FIELD_FLAGS, MOVEMENTFLAG_WALK_MODE);
                    me->GetMotionMaster()->MovePoint(0, 5307.031f, 1997.920f, 709.341f);
                    StepTimer = 10000;
                    ++Step;
                    break;
                case 4:
                    if(Creature* pTarget = me->SummonCreature(NPC_ALTAR_TARGET,5309.374f,2006.788f,711.615f,1.37f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000))
                      me->SetUInt64Value(UNIT_FIELD_TARGET, pTarget->GetGUID());
                    StepTimer = 1000;
                    ++Step;
                    break;
                case 5:
                    if(me->GetEntry() == NPC_JAINA)
                    {
                       DoScriptText(SAY_JAINA_INTRO_03, me);
                       StepTimer = 5000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA)
                    {
                       DoScriptText(SAY_SYLVANA_INTRO_03, me);
                       StepTimer = 6000;
                    }
                    ++Step;
                    break;
                case 6:
                    DoCast(me, SPELL_CAST_VISUAL);
                    if(me->GetEntry() == NPC_JAINA)
                       DoScriptText(SAY_JAINA_INTRO_04, me);
                    if(me->GetEntry() == NPC_SYLVANA)
                       DoScriptText(SAY_SYLVANA_INTRO_04, me);
                    StepTimer = 3000;
                    ++Step;
                    break;
                case 7:
                    DoCast(me, SPELL_FROSTMOURNE_SOUNDS);
                    m_uiFrostmourneGUID = m_pInstance->GetData64(DATA_GO_FROSTMOURNE);
                    if(GameObject* pFrostmourne = m_pInstance->instance->GetGameObject(m_uiFrostmourneGUID))
                       pFrostmourne->SetGoState(GO_STATE_ACTIVE);
                    if(me->GetEntry() == NPC_JAINA)
                       StepTimer = 12000;
                    if(me->GetEntry() == NPC_SYLVANA)
                       StepTimer = 8000;
                    ++Step;
                    break;
                case 8:
                    pUther = me->SummonCreature(NPC_UTHER,5308.228f,2003.641f,709.341f,4.17f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                    pUther->SetUInt64Value(UNIT_FIELD_TARGET, me->GetGUID());
                    me->SetUInt64Value(UNIT_FIELD_TARGET, pUther->GetGUID());
                    if(me->GetEntry() == NPC_JAINA && pUther)
                    {
                       DoScriptText(SAY_UTHER_A_01, pUther);
                       StepTimer = 3000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA && pUther)
                    {
                       DoScriptText(SAY_UTHER_H_01, pUther);
                       StepTimer = 10000;
                    }
                    ++Step;
                    break;
                case 9:
                    if(me->GetEntry() == NPC_JAINA)
                    {
                       DoScriptText(SAY_JAINA_02, me);
                       StepTimer = 5000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA)
                    {
                       DoScriptText(SAY_SYLVANA_02, me);
                       StepTimer = 3000;
                    }
                    ++Step;
                    break;
                case 10:
                    if(me->GetEntry() == NPC_JAINA && pUther)
                    {
                       DoScriptText(SAY_UTHER_A_03, pUther);
                       StepTimer = 7000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA && pUther)
                    {
                       DoScriptText(SAY_UTHER_H_03, pUther);
                       StepTimer = 6000;
                    }
                    ++Step;
                    if(Small == true)
                       Step = 23;
                    break;
                case 11:
                    if(me->GetEntry() == NPC_JAINA)
                    {
                       DoScriptText(SAY_JAINA_04, me);
                       StepTimer = 2000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA)
                    {
                       DoScriptText(SAY_SYLVANA_04, me);
                       StepTimer = 5000;
                    }
                    ++Step;
                    break;
                case 12:
                    if(me->GetEntry() == NPC_JAINA && pUther)
                    {
                       DoScriptText(SAY_UTHER_A_05, pUther);
                       StepTimer = 10000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA && pUther)
                    {
                       DoScriptText(SAY_UTHER_H_05, pUther); 
                       StepTimer = 19000;
                    }
                    ++Step;
                    break;
                case 13:
                    if(me->GetEntry() == NPC_JAINA)
                    {
                       DoScriptText(SAY_JAINA_06, me);
                       StepTimer = 6000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA)
                    {
                       DoScriptText(SAY_SYLVANA_06, me); 
                       StepTimer = 2000;
                    }
                    ++Step;
                    break;
                case 14:
                    if(me->GetEntry() == NPC_JAINA && pUther)
                    {
                       DoScriptText(SAY_UTHER_A_07, pUther); 
                       StepTimer = 12000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA && pUther)
                    {
                       DoScriptText(SAY_UTHER_H_07, pUther);
                       StepTimer = 20000;
                    }
                    ++Step;
                    break;
                case 15:
                    if(me->GetEntry() == NPC_JAINA)
                    {
                       DoScriptText(SAY_JAINA_08, me); 
                       StepTimer = 6000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA)
                    {
                       DoScriptText(SAY_SYLVANA_08, me);
                       StepTimer = 3000;
                    }
                    ++Step;
                    break;
                case 16:
                    if(me->GetEntry() == NPC_JAINA && pUther)
                    {
                       DoScriptText(SAY_UTHER_A_09, pUther);
                       StepTimer = 12000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA && pUther)
                    {
                       DoScriptText(SAY_UTHER_H_09, pUther);
                       StepTimer = 11000;
                    }
                    ++Step;
                    break;
                case 17:
                    if(me->GetEntry() == NPC_JAINA)
                    {
                       DoScriptText(SAY_JAINA_10, me);
                       StepTimer = 11000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA)
                    {
                       StepTimer = 100;
                    }
                    ++Step;
                    break;
                case 18:
                    if(me->GetEntry() == NPC_JAINA && pUther)
                    {
                       DoScriptText(SAY_UTHER_A_11, pUther);
                       StepTimer = 24000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA && pUther)
                    {
                       DoScriptText(SAY_UTHER_H_11, pUther);
                       StepTimer = 9000;
                    }
                    ++Step;
                    break;
                case 19:
                    if(me->GetEntry() == NPC_JAINA)
                    {
                       DoScriptText(SAY_JAINA_12, me);
                       StepTimer = 2000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA)
                    {
                       DoScriptText(SAY_SYLVANA_12, me);
                       StepTimer = 2100;
                    }
                    ++Step;
                    break;
                case 20:
                    if(me->GetEntry() == NPC_JAINA && pUther)
                    {
                       DoScriptText(SAY_UTHER_A_13, pUther); 
                       StepTimer = 5000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA)
                    {
                       StepTimer = 100;
                    }
                    ++Step;
                    break;
                case 21:
                    if(me->GetEntry() == NPC_JAINA && pUther)
                    {
                       DoScriptText(SAY_UTHER_A_14, pUther); 
                       StepTimer = 12000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA)
                    {
                       StepTimer = 100;
                    }
                    ++Step;
                    break;
                case 22:
                    if(me->GetEntry() == NPC_JAINA)
                    {
                       DoScriptText(SAY_JAINA_15, me);
                       StepTimer = 2000;
                    }
                    if(me->GetEntry() == NPC_SYLVANA)
                    {
                       StepTimer = 100;
                    }
                    ++Step;
                    break;
                case 23:
                    if(me->GetEntry() == NPC_JAINA && pUther)
                       DoScriptText(SAY_UTHER_A_16, pUther);
                    if(me->GetEntry() == NPC_SYLVANA && pUther)
                       DoScriptText(SAY_UTHER_H_16, pUther);
                    pLichKing = me->SummonCreature(NPC_LICH_KING,5362.469f,2062.342f,707.695f,3.97f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                    m_uiMainGateGUID = m_pInstance->GetData64(DATA_GO_MAIN_GATE);
                    if(GameObject* pGate = m_pInstance->instance->GetGameObject(m_uiMainGateGUID))
                       pGate->SetGoState(GO_STATE_ACTIVE);
                    StepTimer = 1000;
                    ++Step;
                    break;
                case 24:
                    if(pUther)
                       pUther->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_COWER);
                    if(pLichKing)
                    {
                       pLichKing->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                       pLichKing->GetMotionMaster()->MovePoint(0, 5314.881f, 2012.496f, 709.341f);
                    }
                    StepTimer = 3000;
                    ++Step;
                    break;
                case 25:
                    if(GameObject* pGate = m_pInstance->instance->GetGameObject(m_uiMainGateGUID))
                       pGate->SetGoState(GO_STATE_READY);
                    StepTimer = 7000;
                    ++Step;
                    break;
                case 26:
                    if(pUther)
                       pUther->CastSpell(pUther, SPELL_UTHER_DESPAWN, false);
                    StepTimer = 500;
                    ++Step;
                    break;
                case 27:
                    DoScriptText(SAY_LICH_KING_17, pLichKing);
                    StepTimer = 10000;
                    ++Step;
                    break;
                case 28:
                    DoScriptText(SAY_LICH_KING_18, pLichKing);
                    StepTimer = 5000;
                    ++Step;
                    break;
                case 29:
                    pLichKing->CastSpell(pLichKing, SPELL_TAKE_FROSTMOURNE, false);
                    if(GameObject* pFrostmourne = m_pInstance->instance->GetGameObject(m_uiFrostmourneGUID))
                       pFrostmourne->SetGoState(GO_STATE_READY);
                    StepTimer = 1000;
                    ++Step;
                    break;
                case 30:
                    if(GameObject* pFrostmourne = m_pInstance->instance->GetGameObject(m_uiFrostmourneGUID))
                       pFrostmourne->SetPhaseMask(0, true);
                    if(pLichKing)
                       pLichKing->SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID + 0, uint32(36942));
                    me->RemoveAurasDueToSpell(SPELL_FROSTMOURNE_SOUNDS);
                    StepTimer = 5000;
                    ++Step;
                    break;
                case 31:
                    DoScriptText(SAY_LICH_KING_19, pLichKing);
                    StepTimer = 9000;
                    ++Step;
                    break;
                case 32:
                    m_uiFalricGUID = m_pInstance->GetData64(DATA_FALRIC);
                    m_uiMarwynGUID = m_pInstance->GetData64(DATA_MARWYN);
                    if(Creature* Falric = ((Creature*)Unit::GetUnit((*me), m_uiFalricGUID)))
                    { 
                       Falric->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                       Falric->SetVisibility(VISIBILITY_ON);
                       Falric->CastSpell(Falric, SPELL_BOSS_SPAWN_AURA, false);
                       Falric->GetMotionMaster()->MovePoint(0, 5283.309f, 2031.173f, 709.319f);
                    }
                    if(Creature* Marwyn = ((Creature*)Unit::GetUnit((*me), m_uiMarwynGUID)))
                    {
                       Marwyn->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                       Marwyn->SetVisibility(VISIBILITY_ON);
                       Marwyn->CastSpell(Marwyn, SPELL_BOSS_SPAWN_AURA, false);
                       Marwyn->GetMotionMaster()->MovePoint(0, 5335.585f, 1981.439f, 709.319f);
                    }
                    if(pLichKing)
                       pLichKing->GetMotionMaster()->MovePoint(0, 5402.286f, 2104.496f, 707.695f);
                    StepTimer = 100;
                    ++Step;
                    break;
                case 33:
                    if(Creature* Falric = ((Creature*)Unit::GetUnit((*me), m_uiFalricGUID)))
                       DoScriptText(SAY_FALRIC_INTRO, Falric);
                    if(Creature* Marwyn = ((Creature*)Unit::GetUnit((*me), m_uiMarwynGUID)))
                       DoScriptText(SAY_MARWYN_INTRO, Marwyn);
                    StepTimer = 3000;
                    ++Step;
                    break;
                case 34:
                    if(GameObject* pGate = m_pInstance->instance->GetGameObject(m_uiMainGateGUID))
                       pGate->SetGoState(GO_STATE_ACTIVE);
                    if(me->GetEntry() == NPC_JAINA)
                       DoScriptText(SAY_JAINA_20, me);
                    if(me->GetEntry() == NPC_SYLVANA)
                       DoScriptText(SAY_SYLVANA_20, me);
                    StepTimer = 4000;
                    ++Step;
                    break;
                case 35:
                    me->GetMotionMaster()->MovePoint(0, 5443.880f, 2147.095f, 707.695f);
                    StepTimer = 3000;
                    ++Step;
                    break;
                case 36:
                    if(pLichKing)
                    {
                       pLichKing->GetMotionMaster()->MovementExpired(false);
                       pLichKing->RemoveFlag(UNIT_FIELD_FLAGS, MOVEMENTFLAG_WALK_MODE);
                       pLichKing->GetMotionMaster()->MovePoint(0, 5443.880f, 2147.095f, 707.695f);
                    }
                    if(me->GetEntry() == NPC_JAINA && pLichKing)
                       DoScriptText(SAY_LICH_KING_A_21, pLichKing);
                    if(me->GetEntry() == NPC_SYLVANA && pLichKing)
                       DoScriptText(SAY_LICH_KING_H_21, pLichKing);
                    StepTimer = 8000;
                    ++Step;
                    break;
                case 37:
                    if(GameObject* pGate = m_pInstance->instance->GetGameObject(m_uiMainGateGUID))
                       pGate->SetGoState(GO_STATE_READY); 
                    m_pInstance->SetData(TYPE_INTRO, DONE); 
                    m_pInstance->SetData(TYPE_FALRIC, SPECIAL); 
                    StepTimer = 5000;
                    ++Step;
                    break;
                case 38:
                    me->SetVisibility(VISIBILITY_OFF);
                    if(pLichKing)
                       pLichKing->SetVisibility(VISIBILITY_OFF);  
                    StepTimer = 2000;
                    ++Step;
                    break;

               }
           } else StepTimer -= diff;
     }
};

bool GossipHello_npc_jaina_and_sylvana_HRintro(Player* pPlayer, Creature* pCreature)
{
           if (pCreature->isQuestGiver())
             pPlayer->PrepareQuestMenu( pCreature->GetGUID());
            switch(pCreature->GetEntry())
              {
                case NPC_JAINA:
                  if(((npc_jaina_and_sylvana_HRintroAI*)pCreature->AI())->StartEvent != true)
                  {
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Lady Jaina, we are ready for next mission!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Lady Jaina, Let's go!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
                  }
                  break;
                case NPC_SYLVANA: 
                  if(((npc_jaina_and_sylvana_HRintroAI*)pCreature->AI())->StartEvent != true) 
                  {
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Lady Sylvanas, we are ready for next mission!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Lady Sylvanas, Let's go!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
                  }
                  break;
               }

   pPlayer->PlayerTalkClass->SendGossipMenu(907,pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_jaina_and_sylvana_HRintro(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
               pPlayer->CLOSE_GOSSIP_MENU();
              ((npc_jaina_and_sylvana_HRintroAI*)pCreature->AI())->StartEvent = true;
              ((npc_jaina_and_sylvana_HRintroAI*)pCreature->AI())->Faction = pPlayer->getFaction();
        case GOSSIP_ACTION_INFO_DEF+2:
               pPlayer->CLOSE_GOSSIP_MENU();
              ((npc_jaina_and_sylvana_HRintroAI*)pCreature->AI())->StartEvent = true;
              ((npc_jaina_and_sylvana_HRintroAI*)pCreature->AI())->Small = true;
              ((npc_jaina_and_sylvana_HRintroAI*)pCreature->AI())->Faction = pPlayer->getFaction();
    }

    return true;
}

struct npc_jaina_and_sylvana_HRextroAI : public npc_escortAI
{
    npc_jaina_and_sylvana_HRextroAI(Creature *pCreature) : npc_escortAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
   }

ScriptedInstance* m_pInstance;

uint32 CastTimer;
uint32 Faction;
uint32 StepTimer;
uint32 Step;
uint32 HoldTimer;
bool StartEvent;
bool Intro;
bool Fight;
Creature* pLichKing;
uint64 m_uiLichKingGUID;
uint64 m_uiLiderGUID;
bool PreFight;
bool WallCast;
Creature* pWallTarget;
uint64 m_uiIceWallGUID;
uint32 Count;
Creature* pMatheas;
GameObject* pLight;

    void Reset()
    {  
         if(!m_pInstance) return;
        
         if(m_pInstance->GetData(TYPE_LICH_KING) == IN_PROGRESS) return;

         Step = 0;
         StepTimer = 500;
         Fight = true;
         me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
         me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
         
       if(Intro != true)
       {
         StartEvent = false;
         if(me->GetEntry() == NPC_JAINA_OUTRO)
         {
            me->CastSpell(me, SPELL_ICE_BARRIER, false);
            me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_READY2HL);
         }
       }
         if(m_pInstance->GetData(TYPE_LICH_KING) == DONE)
            me->SetVisibility(VISIBILITY_OFF);
            
    }

    void AttackStart(Unit* who)
    {

     if (!who)
         return;

     if(me->GetEntry() != NPC_SYLVANA_OUTRO) return;

     if(m_pInstance->GetData(TYPE_LICH_KING) == IN_PROGRESS) return;

     if(Fight == false) return;

     ScriptedAI::AttackStart(who);

    }

    void WaypointReached(uint32 i)
    {
        switch(i)
        {
            case 3:
                m_pInstance->SetData(TYPE_ICE_WALL_01, IN_PROGRESS);
                m_uiIceWallGUID = m_pInstance->GetData64(DATA_GO_ICE_WALL_01);
                break;
            case 4:
                if(me->GetEntry() == NPC_JAINA_OUTRO)
                   DoScriptText(SAY_JAINA_WALL_01, me);
                if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                   DoScriptText(SAY_SYLVANA_WALL_01, me);
                CastTimer = 1000;
                HoldTimer = 30000;
                SetEscortPaused(true);
                pWallTarget = me->SummonCreature(NPC_ICE_WALL,me->GetPositionX(),me->GetPositionY(),me->GetPositionZ(),me->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                Step = 0;
                if(me->GetEntry() == NPC_JAINA_OUTRO)
                   me->CastSpell(pWallTarget, SPELL_DESTROY_ICE_WALL_01, false);
                WallCast = true;
                break;
            case 6:
                m_pInstance->SetData(TYPE_ICE_WALL_02, IN_PROGRESS);
                break;
            case 8:
                if(me->GetEntry() == NPC_JAINA_OUTRO)
                   DoScriptText(SAY_JAINA_WALL_02, me);
                if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                   DoScriptText(SAY_SYLVANA_WALL_02, me);
                CastTimer = 1000;
                HoldTimer = 30000;
                SetEscortPaused(true);
                pWallTarget = me->SummonCreature(NPC_ICE_WALL,me->GetPositionX(),me->GetPositionY(),me->GetPositionZ(),me->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                Step = 0;
                if(me->GetEntry() == NPC_JAINA_OUTRO)
                   me->CastSpell(pWallTarget, SPELL_DESTROY_ICE_WALL_01, false);
                WallCast = true;
                break;
            case 9:
                if(me->GetEntry() == NPC_JAINA_OUTRO)
                   DoScriptText(SAY_JAINA_ESCAPE_01, me);
                if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                   DoScriptText(SAY_SYLVANA_ESCAPE_01, me);
                break;
            case 11:
                m_pInstance->SetData(TYPE_ICE_WALL_03, IN_PROGRESS);
                break;
            case 12:
                if(me->GetEntry() == NPC_JAINA_OUTRO)
                   DoScriptText(SAY_JAINA_WALL_03, me);
                if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                   DoScriptText(SAY_SYLVANA_WALL_03, me);
                CastTimer = 1000;
                HoldTimer = 30000;
                SetEscortPaused(true);
                pWallTarget = me->SummonCreature(NPC_ICE_WALL,me->GetPositionX(),me->GetPositionY(),me->GetPositionZ(),me->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                Step = 0;
                if(me->GetEntry() == NPC_JAINA_OUTRO)
                   me->CastSpell(pWallTarget, SPELL_DESTROY_ICE_WALL_01, false);
                WallCast = true;
                break;
            case 13:
                if(me->GetEntry() == NPC_JAINA_OUTRO)
                   DoScriptText(SAY_JAINA_ESCAPE_02, me);
                if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                   DoScriptText(SAY_SYLVANA_ESCAPE_02, me);
                break;
            case 15:
                m_pInstance->SetData(TYPE_ICE_WALL_04, IN_PROGRESS);
                break;
            case 16:
                if(me->GetEntry() == NPC_JAINA_OUTRO)
                   DoScriptText(SAY_JAINA_WALL_04, me);
                if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                   DoScriptText(SAY_SYLVANA_WALL_04, me);
                CastTimer = 1000;
                HoldTimer = 30000;
                SetEscortPaused(true);
                pWallTarget = me->SummonCreature(NPC_ICE_WALL,me->GetPositionX(),me->GetPositionY(),me->GetPositionZ(),me->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                Step = 0;
                if(me->GetEntry() == NPC_JAINA_OUTRO)
                   me->CastSpell(pWallTarget, SPELL_DESTROY_ICE_WALL_01, false);
                WallCast = true;
                break;
            case 19:
                if(me->GetEntry() == NPC_JAINA_OUTRO)
                   DoScriptText(SAY_JAINA_TRAP, me);
                if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                   DoScriptText(SAY_SYLVANA_TRAP, me);
                break;              
            case 20:
                SetEscortPaused(true);
                if(me->GetEntry() == NPC_JAINA_OUTRO)
                   me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_READY2HL);
                if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                   me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_READY1H);
                break;
        }
    }

   void MoveInLineOfSight(Unit* who)
   {
     if (!who)
         return;

     if(!m_pInstance) return;

          if (who->GetTypeId() == TYPEID_PLAYER && me->GetDistance2d(who) <= 50 && m_pInstance->GetData(TYPE_MARWYN) == DONE && Intro != true)
          {
            me->setFaction(who->getFaction());
            Intro = true;
          }
   }

   void DamageTaken(Unit* pDoneBy, uint32 &uiDamage)
   {
        if(!m_pInstance) return;
   
        if(m_pInstance->GetData(TYPE_LICH_KING) != IN_PROGRESS)
        {
          uiDamage = 0;
          return;
        }

        if(m_pInstance->GetData(TYPE_LICH_KING) == IN_PROGRESS && WallCast == true)
        {
          HoldTimer = HoldTimer + 1000;
          return;
        }
   }

   void UpdateEscortAI(const uint32 diff)
   {
      if(!m_pInstance)
          return;

      DoMeleeAttackIfReady();

         if(Intro != true) return;
         
       if(m_pInstance->GetData(TYPE_LICH_KING) != IN_PROGRESS && m_pInstance->GetData(TYPE_LICH_KING) != DONE)
       {
         if(StepTimer < diff)
           {
             switch(Step)
               {
                case 0:
                   me->RemoveFlag(UNIT_FIELD_FLAGS, MOVEMENTFLAG_WALK_MODE);
                   m_uiLiderGUID = m_pInstance->GetData64(DATA_LIDER);
                   if(Creature* iLider = ((Creature*)Unit::GetUnit((*me), m_uiLiderGUID)))
                     if(iLider->GetEntry() == NPC_JAINA)
                       if(me->GetEntry() != NPC_JAINA_OUTRO)
                         Step = 100;
                   if(Creature* iLider = ((Creature*)Unit::GetUnit((*me), m_uiLiderGUID)))
                     if(iLider->GetEntry() == NPC_SYLVANA)
                       if(me->GetEntry() != NPC_SYLVANA_OUTRO)
                         Step = 100;
                    m_uiLichKingGUID = m_pInstance->GetData64(DATA_LICH_KING);
                    pLichKing = ((Creature*)Unit::GetUnit((*me), m_uiLichKingGUID));
                    StepTimer = 100;
                    ++Step;
                    break;
                case 1:
                    if(pLichKing)
                    {
                       if(me->GetEntry() == NPC_JAINA_OUTRO)
                       {
                          pLichKing->SetPhaseMask(128, true);
                          DoScriptText(SAY_LICH_KING_AGGRO_A, pLichKing);
                       }
                       if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                       {  
                          pLichKing->SetPhaseMask(64, true);
                          DoScriptText(SAY_LICH_KING_AGGRO_H, pLichKing);
                       }
                       pLichKing->AI()->AttackStart(me);
                       me->AI()->AttackStart(pLichKing);
                    }
                    StepTimer = 3000;
                    ++Step;
                    break; 
                case 2:
                    if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                    {
                       Fight = false;
                       if(pLichKing)
                          me->GetMotionMaster()->MovePoint(0, (me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ());
                       StepTimer = 3000;
                    } else StepTimer = 100;
                    ++Step;
                    break;
                case 3:
                    if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                       Fight = true;
                    StepTimer = 100;
                    ++Step;
                    break;
                case 4:
                    if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                    {
                       if(pLichKing)
                          me->CastSpell(pLichKing, SPELL_SYLVANA_STEP, false);
                       StepTimer = 3000;
                    } else StepTimer = 100;
                    ++Step;
                    break;
                case 5:
                    if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                    {
                       Fight = false;
                       if(pLichKing)
                          me->GetMotionMaster()->MovePoint(0, (me->GetPositionX()-5)+rand()%10, (me->GetPositionY()-5)+rand()%10, me->GetPositionZ());
                       StepTimer = 3000;
                    } else StepTimer = 12000;
                    ++Step;
                    break;
                case 6:
                    Fight = true;
                    if(me->GetEntry() == NPC_JAINA_OUTRO)
                    {
                       if(pLichKing)
                          me->CastSpell(pLichKing,SPELL_ICE_PRISON,true);
                    }
                    if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                    {
                       if(pLichKing)
                          me->CastSpell(pLichKing,SPELL_DARK_ARROW,true);
                    }
                    StepTimer = 2500;
                    ++Step;
                    break; 
                case 7:
                    if(me->GetEntry() == NPC_JAINA_OUTRO)
                    {
                       if(pLichKing && !pLichKing->HasAura(SPELL_ICE_PRISON))
                          pLichKing->CastSpell(pLichKing,SPELL_ICE_PRISON,true);
                    }
                    if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                    {
                       if(pLichKing && !pLichKing->HasAura(SPELL_DARK_ARROW))
                          pLichKing->CastSpell(pLichKing,SPELL_DARK_ARROW,true);
                    }
                    me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_STAND);
                    me->AttackStop();
                    if(me->GetEntry() == NPC_JAINA_OUTRO)
                    {
                       me->RemoveAurasDueToSpell(SPELL_ICE_BARRIER);
                       DoScriptText(SAY_JAINA_AGGRO, me);
                    }
                    if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                       DoScriptText(SAY_SYLVANA_AGGRO, me);
                    StepTimer = 3000;
                    ++Step;
                    break; 
                case 8:
                    me->GetMotionMaster()->MovePoint(0, 5577.187f, 2236.003f, 733.012f);
                    if(pLichKing)
                       me->SetUInt64Value(UNIT_FIELD_TARGET, pLichKing->GetGUID());
                    StepTimer = 10000;
                    ++Step;
                    break; 
                case 9:
                    me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                    me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                    Count = 1;
                    StepTimer = 100;
                    PreFight = true;
                    ++Step;
                    break; 
               }
           } else StepTimer -= diff;
         }

         if(WallCast == true)
         {
           if(CastTimer < diff)
           {
              if(pWallTarget)
              {
                if(me->GetEntry() == NPC_SYLVANA_OUTRO)
                   me->CastSpell(pWallTarget, SPELL_DESTROY_ICE_WALL_03, false);
                CastTimer = 1000;
              }
           } else CastTimer -= diff;

           if(HoldTimer < diff)
           {
              WallCast = false;
              me->InterruptNonMeleeSpells(false);
              SetEscortPaused(false);
              if(GameObject* pGate = m_pInstance->instance->GetGameObject(m_uiIceWallGUID))
                 pGate->SetGoState(GO_STATE_ACTIVE); 
              ++Count;
              if(Count == 2)
              {
                if(GameObject* pGate = me->SummonGameObject(GO_ICE_WALL, 5494.3f, 1978.27f, 736.689f, 1.0885f, 0, 0, 0, 0, 0))
                {
                   if(pLichKing && pLichKing->isAlive())
                      DoScriptText(SAY_LICH_KING_WALL_02, pLichKing);
                   m_uiIceWallGUID = pGate->GetGUID();
                   pGate->SetGoState(GO_STATE_READY);
                }
              }
              if(Count == 3)
              {
                if(GameObject* pGate = me->SummonGameObject(GO_ICE_WALL, 5434.27f, 1881.12f, 751.303f, 0.923328f, 0, 0, 0, 0, 0))
                {
                   if(pLichKing && pLichKing->isAlive())
                      DoScriptText(SAY_LICH_KING_WALL_03, pLichKing);
                   m_uiIceWallGUID = pGate->GetGUID();
                   pGate->SetGoState(GO_STATE_READY);
                }
              }
              if(Count == 4)
              {
                if(GameObject* pGate = me->SummonGameObject(GO_ICE_WALL, 5323.61f, 1755.85f, 770.305f, 0.784186f, 0, 0, 0, 0, 0))
                {
                   if(pLichKing && pLichKing->isAlive())
                      DoScriptText(SAY_LICH_KING_WALL_04, pLichKing);
                   m_uiIceWallGUID = pGate->GetGUID();
                   pGate->SetGoState(GO_STATE_READY);
                }
              }
              if(Count == 5)
              {
                if(pLichKing && pLichKing->isAlive())
                {
                  pLichKing->RemoveAurasDueToSpell(SPELL_WINTER);
                  pLichKing->SetSpeed(MOVE_WALK, 2.5f, true);
                  Step = 0;
                }
              }
           } else HoldTimer -= diff;
         }

    if(m_pInstance->GetData(TYPE_LICH_KING) == DONE)
    {
         if(StepTimer < diff)
           {
             switch(Step)
               {
                case 0:
                   StepTimer = 4000;
                   ++Step;
                   break;
                case 1:
                   pMatheas = me->SummonCreature(NPC_MATHEAS,5252.717f,1686.239f,784.302f,0.23f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,360000);
                   pMatheas->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                   pMatheas->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                   StepTimer = 2000;
                   ++Step;
                   break;
                case 2:
                   if(pMatheas && pLichKing)
                      pMatheas->SetUInt64Value(UNIT_FIELD_TARGET, me->GetGUID());
                   StepTimer = 2000;
                   ++Step;
                   break;
                case 3:
                   if(pMatheas)
                      pMatheas->SetUInt64Value(UNIT_FIELD_TARGET, pLichKing->GetGUID());
                   StepTimer = 1000;
                   ++Step;
                   break;
                case 4:
                   if(pMatheas)
                      pMatheas->UpdateEntry(NPC_ARTHAS);
                   StepTimer = 1000;
                   ++Step;
                   break;
                case 5:
                   if(pMatheas && me->GetEntry() == NPC_JAINA_OUTRO)
                      DoScriptText(SAY_MATHEAS_JAINA, pMatheas);
                   StepTimer = 1000;
                   ++Step;
                   break;
                case 6:
                   me->RemoveAurasDueToSpell(SPELL_SILENCE);
                   me->CastSpell(me, SPELL_MATHEAS_SHIELD, false);
                   if(pLichKing)
                      DoScriptText(SAY_LICH_KING_END_02, pLichKing);
                   StepTimer = 2000;
                   ++Step;
                   break;
                case 7:
                   if(pMatheas)
                      pMatheas->GetMotionMaster()->MovePoint(0, 5268.420f, 1689.844f, 785.559f);
                   StepTimer = 7000;
                   ++Step;
                   break;
                case 8:
                   if(pMatheas)
                      pMatheas->CastSpell(pMatheas, SPELL_LIGHT, false);
                   StepTimer = 1000;
                   ++Step;
                   break;
                case 9:
                   if(pLichKing)
                   {
                      pLichKing->RemoveAurasDueToSpell(SPELL_LICH_KING_CAST);
                      pLichKing->HandleEmoteCommand(402);
                   }
                   StepTimer = 1000;
                   ++Step;
                   break;
                case 10:
                   if(pLichKing)
                      DoScriptText(SAY_LICH_KING_END_01, pLichKing);
                   StepTimer = 2000;
                   ++Step;
                   break;
                case 11:
                   if(pLichKing)
                   {
                      pLight = me->SummonGameObject(GO_LIGHT_BEAM, pLichKing->GetPositionX(), pLichKing->GetPositionY(), pLichKing->GetPositionZ(), 1.0885f, 0, 0, 0, 0, 0);
                      pLichKing->CastSpell(pLichKing, SPELL_SILENCE, false);
                   }
                   StepTimer = 2000;
                   ++Step;
                   break;
                case 12:
                   if(pLichKing)
                      DoScriptText(SAY_LICH_KING_END_03, pLichKing);
                   StepTimer = 1000;
                   ++Step;
                   break;
                case 13:
                   me->SendMonsterMove(5262.439f, 1680.410f, 784.294f/*, SPLINETYPE_NORMAL, me->GetSplineFlags()*/, 3000); 
                   if(pMatheas)
                      pMatheas->GetMotionMaster()->MovePoint(0, 5264.814f, 1682.502f, 784.311f);
                   StepTimer = 3000;
                   ++Step;
                   break;
                case 14:
                   if(pMatheas)
                      pMatheas->SetStandState(UNIT_STAND_STATE_KNEEL);
                   StepTimer = 2000;
                   ++Step;
                   break;
                case 15:
                   if(pMatheas)
                      pMatheas->ForcedDespawn();
                   me->RemoveAurasDueToSpell(SPELL_MATHEAS_SHIELD);
                   StepTimer = 1000;
                   ++Step;
                   break;
               }
           } else StepTimer -= diff;
         }

   return;
    }
};

bool GossipHello_npc_jaina_and_sylvana_HRextro(Player* pPlayer, Creature* pCreature)
{
           if (pCreature->isQuestGiver())
             pPlayer->PrepareQuestMenu( pCreature->GetGUID());
             pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Let's go!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_jaina_and_sylvana_HRextro(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
           pPlayer->CLOSE_GOSSIP_MENU();
           ((npc_jaina_and_sylvana_HRextroAI*)pCreature->AI())->StartEvent = true;
           ((npc_jaina_and_sylvana_HRextroAI*)pCreature->AI())->Start(false, true, pPlayer->GetGUID());
           pCreature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
           pCreature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
           pCreature->SetUInt64Value(UNIT_FIELD_TARGET, 0);

           ScriptedInstance* m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
           if(m_pInstance)
           {
              m_pInstance->SetData(TYPE_LICH_KING, IN_PROGRESS);
              m_pInstance->SetData64(DATA_ESCAPE_LIDER, pCreature->GetGUID());
           }
           break;
    }
    return true;
}

struct npc_lich_king_hrAI : public ScriptedAI
{
    npc_lich_king_hrAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
   }

ScriptedInstance* m_pInstance;

    void Reset()
    {
    }

    void JustDied(Unit* pKiller)
    {
    }

    void AttackStart(Unit* who) 
    { 
         return;
    }

   void UpdateAI(const uint32 diff)
    {
    }
};

CreatureAI* GetAI_npc_jaina_and_sylvana_HRintro(Creature* pCreature)
{
    return new npc_jaina_and_sylvana_HRintroAI(pCreature);
}

CreatureAI* GetAI_npc_jaina_and_sylvana_HRextro(Creature* pCreature)
{
    return new npc_jaina_and_sylvana_HRextroAI(pCreature);
}

CreatureAI* GetAI_npc_lich_king_hr(Creature* pCreature)
{
    return new npc_lich_king_hrAI(pCreature);
}

void AddSC_hall_of_reflection()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_jaina_and_sylvana_HRintro";
    newscript->GetAI = &GetAI_npc_jaina_and_sylvana_HRintro;
    newscript->pGossipHello = &GossipHello_npc_jaina_and_sylvana_HRintro;
    newscript->pGossipSelect = &GossipSelect_npc_jaina_and_sylvana_HRintro;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_jaina_and_sylvana_HRextro";
    newscript->GetAI = &GetAI_npc_jaina_and_sylvana_HRextro;
    newscript->pGossipHello = &GossipHello_npc_jaina_and_sylvana_HRextro;
    newscript->pGossipSelect = &GossipSelect_npc_jaina_and_sylvana_HRextro;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_lich_king_hr";
    newscript->GetAI = &GetAI_npc_lich_king_hr;
    newscript->RegisterSelf();
}