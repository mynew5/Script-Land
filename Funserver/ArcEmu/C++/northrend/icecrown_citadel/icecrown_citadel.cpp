/*for Private_core_332 by Devil*/

#include "ScriptedPch.h"

#define SAY_INTRO	-1000000
//SetStandState(UNIT_STAND_STATE_SIT);
//me->HandleEmoteCommand(EMOTE_ONESHOT_EXCLAMATION);
enum
{
QUEST_24545			= 24545,
NPC_LIGHT			= 37857,
NPC_VEGARD			= 37976,
NPC_VEGARD2			= 37893,
SPELL_VEGARD1			= 70603,
SPELL_VEGARD2			= 70894,
SPELL_VEGARD3			= 70967, // LOOT
NPC_VENGAENCE			= 37826,
SPELL_VENGAENCE		= 70606,
SPELL_KILL_ALL			= 70595,
SPELL_SUMMON_DEATH		= 70617,
SPELL_SHADOW_BLAST		= 70866,
SPELL_VEGARD_THIRST		= 70886,
SPELL_VEGARD_TOUCH		= 71003,
SPELL_VEGARD_VENGEANCE	= 70864
};

const Position Pos [1] = {4814.13, -586.595, 162.923, 2.83109};

struct npc_light_king_questAI : public ScriptedAI
{
    npc_light_king_questAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
    }
    
    uint32 SummonfirstTimer;
    uint32 AggroTimer;
    uint64 AggroTargetGUID;
    uint8 Phase;
    bool Intro;
    bool Done;
    bool sDone;
    
void Reset()
    {
    SummonfirstTimer = 10000;
    AggroTimer = 10000;
    AggroTargetGUID = 0;
    Phase = 0;
    Intro = false;
    Done = false;
    sDone = false;
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
void SetData(uint32 uiId, uint32 uiValue)
    {
    if (uiId == 1)
    {
    Phase = 1;
    }
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
	    sDone = true;
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
	    
	if (sDone && SummonfirstTimer <= diff)
	{
	      DoCast(SPELL_SUMMON_DEATH);
	  if (Creature* pTemp = me->SummonCreature(NPC_VEGARD, Pos[0],TEMPSUMMON_CORPSE_DESPAWN,30000))
	   {
	     if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
		pTemp->AI()->AttackStart(pTarget);
		me->CastSpell(me,SPELL_VEGARD1,true);
		//m_creature->SummonGameObject(GO_VEGARD1,11.11,11.11,11.11,11.11,0, 0, 0, 0,90000000);
		sDone = false;
	     }
		SummonfirstTimer = 10000;
	   } else SummonfirstTimer -= diff;
    }
};

struct npc_vegard_firstAI : public ScriptedAI
{
    npc_vegard_firstAI(Creature* pCreature) : ScriptedAI(pCreature)
    {

    }
    
    uint32 SpellSummonTimer;
    
  void Reset()
  {
    SpellSummonTimer = 7000;
  }
  
  void UpdateAI(const uint32 diff)
  {
      if (!UpdateVictim())
            return;
    
    if (SpellSummonTimer <= diff)
     {
      DoCast(SPELL_SUMMON_DEATH);
      SpellSummonTimer = 7000;
    } else SpellSummonTimer -= diff;
    
   /* if (!uiPhase && SpellSheildTimer <= diff)
    {
    DoCast(SPELL_SHEILD_VERGARD);
    SpellSheildTimer = 7000;
    } else SpellSheildTimer -= diff;*/
   }
   
};

struct npc_vegard_twoAI : public ScriptedAI
{
    npc_vegard_twoAI(Creature* pCreature) : ScriptedAI(pCreature)
    {

    }
    
    uint32 ShadowBlastTimer;
    uint32 VegardThirstTimer;
    uint32 VegardTouchTimer;
    uint32 vegardVengeanceTimer;
    

    
  void Reset()
  {
    ShadowBlastTimer = 12000;
    VegardThirstTimer = 20000;
    VegardTouchTimer = 3000;
    vegardVengeanceTimer = 24000;
  }
  
  void UpdateAI(const uint32 diff)
  {
      if (!UpdateVictim())
            return;
    
    if (ShadowBlastTimer <= diff)
     {
      if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
         DoCast(pTarget,SPELL_SHADOW_BLAST);
         ShadowBlastTimer = 12000;
    } else ShadowBlastTimer -= diff;
    
    if (VegardThirstTimer <= diff)
     {
      if (Unit* pTarget = SelectTarget(SELECT_TARGET_TOPAGGRO,0))
         DoCast(pTarget,SPELL_VEGARD_THIRST);
         VegardThirstTimer = 20000;
    } else VegardThirstTimer -= diff;
    
    if (VegardTouchTimer <= diff)
     {
      if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
         DoCast(pTarget,SPELL_VEGARD_TOUCH);
	 VegardTouchTimer = 6000;
     } else VegardTouchTimer -= diff;
    
    DoMeleeAttackIfReady();
   }
};

CreatureAI* GetAI_npc_vegard_first(Creature* pCreature)
{
    return new npc_vegard_firstAI(pCreature);
}

CreatureAI* GetAI_npc_vegard_two(Creature* pCreature)
{
    return new npc_vegard_twoAI(pCreature);
}

struct npc_vengaenceAI : public ScriptedAI
{
    npc_vengaenceAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
    }
    
void MoveInLineOfSight(Unit *who)
    {
        ScriptedAI::MoveInLineOfSight(who);

        if (who->GetTypeId() != TYPEID_UNIT)
            return;

        if (who->GetEntry() == 37976 || who->GetEntry() == 37881 && me->IsWithinDistInMap(who, 5.0f))
        {
	DoCast(who,SPELL_KILL_ALL);
	CAST_CRE(who)->DisappearAndDie();
	}
    }
void UpdateAI(const uint32 diff)
  {
  me->SetSpeed(MOVE_WALK, 0.7f, true);
  me->SetSpeed(MOVE_RUN, 0.7f, true);
  me->SetSpeed(MOVE_FLIGHT, 0.7f, true);
  me->GetMotionMaster()->MovePoint(0,4814.13, -586.595, 162.923);
  }

};


bool GOHello_go_vegard1(Player *pPlayer, GameObject *pGO)
{
    if (pPlayer->GetQuestStatus(QUEST_24545) == QUEST_STATUS_INCOMPLETE)
     {
      if (Creature* pTemp = pPlayer->SummonCreature(NPC_VENGAENCE, Pos[1],TEMPSUMMON_TIMED_DESPAWN,60000))
      pPlayer->CastSpell(pPlayer,SPELL_VENGAENCE,true);
	pPlayer->CastSpell(pPlayer,SPELL_VEGARD2,true);
	//pPlayer->SummonGameObject(GO_VEGARD2, 4814.13, -586.595, 162.923, 2.83109,0, 0, 0, 0,90000000);
     }
    return true;
}

bool GOHello_go_vegard2(Player *pPlayer, GameObject *pGO)
{
    if (pPlayer->GetQuestStatus(QUEST_24545) == QUEST_STATUS_INCOMPLETE)
     {
      if (Creature* pTemp = pPlayer->SummonCreature(NPC_VEGARD2, Pos[0],TEMPSUMMON_CORPSE_DESPAWN,60000))
	pPlayer->CastSpell(pPlayer,SPELL_VEGARD3,true);
	//pPlayer->SummonGameObject(GO_VEGARD3, 4814.13, -586.595, 162.923, 2.83109,0, 0, 0, 0,90000000);
     }
    return true;
}

CreatureAI* GetAI_npc_light_king_quest(Creature* pCreature)
{
    return new npc_light_king_questAI(pCreature);
}

CreatureAI* GetAI_npc_vengaence(Creature* pCreature)
{
    return new npc_vengaenceAI(pCreature);
}
void AddSC_npc_light_king_quest()
{
    Script *newscript;
    
    newscript = new Script;
    newscript->Name = "npc_light_king_quest";
    newscript->GetAI = &GetAI_npc_light_king_quest;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_vegard_first";
    newscript->GetAI = &GetAI_npc_vegard_first;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_vegard_two";
    newscript->GetAI = &GetAI_npc_vegard_two;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_vengaence";
    newscript->GetAI = &GetAI_npc_vengaence;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_vegard1";
    newscript->pGOHello =           &GOHello_go_vegard1;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "go_vegard2";
    newscript->pGOHello =           &GOHello_go_vegard2;
    newscript->RegisterSelf();	
}
