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
SDName: Dragonblight
SD%Complete: 100
SDComment: Quest support: 12321
SDCategory: Dragonblight
EndScriptData */

/* ContentData
npc_alexstrasza_wr_gate
EndContentData */

#include "ScriptedPch.h"
#include "ScriptedEscortAI.h"

enum eEnums
{
    QUEST_RETURN_TO_AG_A    = 12499,
    QUEST_RETURN_TO_AG_H    = 12500,
    MOVIE_ID_GATES          = 14
};

#define GOSSIP_ITEM_WHAT_HAPPENED   "Alexstrasza, can you show me what happened here?"

bool GossipHello_npc_alexstrasza_wr_gate(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestRewardStatus(QUEST_RETURN_TO_AG_A) || pPlayer->GetQuestRewardStatus(QUEST_RETURN_TO_AG_H))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_WHAT_HAPPENED, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_alexstrasza_wr_gate(Player* pPlayer, Creature* /*pCreature*/, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        pPlayer->SendMovieStart(MOVIE_ID_GATES);
    }

    return true;
}

enum eHallard
{    
    NPC_HALLARD                 = 27316,
    NPC_GODFREY                 = 27577,
    SPELL_HOLY_FIRE             = 39323,

    SAY_WP_0                    = -1710001,
    SAY_WP_1                    = -1710002,
    SAY_WP_2                    = -1710003,
    SAY_WP_3                    = -1710004,
    SAY_WP_4                    = -1710021,
    SAY_WP_5                    = -1710022,
    SAY_WP_6                    = -1710023,
    SAY_WP_7                    = -1710005,
    SAY_WP_8                    = -1710006,
    SAY_WP_9                    = -1710007,
    SAY_WP_10                   = -1710008,
    SAY_WP_11                   = -1710024,
    SAY_WP_12                   = -1710009,
    SAY_WP_13                   = -1710010,
    SAY_WP_14                   = -1710025,
    SAY_WP_15                   = -1710011,
    SAY_WP_16                   = -1710012,
    SAY_WP_17                   = -1710013,
    SAY_WP_18                   = -1710026,
    SAY_WP_19                   = -1710014,
    SAY_WP_20                   = -1710027,
    SAY_WP_21                   = -1710028,
    SAY_WP_22                   = -1710015,
    SAY_WP_23                   = -1710029,
    SAY_WP_24                   = -1710030,
    SAY_WP_25                   = -1710016,
    SAY_WP_26                   = -1710017,
    SAY_WP_27                   = -1710018
};

#define QUEST_A_RIGHTEOUS_SERMON     12321

#define TALK_TIMER 4000

struct npc_inquisitor_hallardAI : public npc_escortAI
{
    npc_inquisitor_hallardAI(Creature* pCreature) : npc_escortAI(pCreature) { }

    uint32 TalkPhase; //store which speech is next

    uint64 HallardGUID;
    uint64 GodfreyGUID;
    
    Creature* Hallard;
    Creature* Godfrey;

    bool Completed;
    bool DoUpdateAI;
    bool TWait;
    uint32 WaitTimer;
    void WaypointReached(uint32 uiPointId)
    {
        switch (uiPointId)
        {
            case 0:
                TalkPhase = 1;//start talking!
                DoUpdateAI = true;
                break;                      
        }
    }

    void Reset()
    {        
        WaitTimer = 0;//start talking imidetly at waypoint reached
        TalkPhase = 0;//talk starts at 1, 0 disables talk
        TWait = false;
        Completed = false;
        DoUpdateAI = true;
    }

    void Wait(uint32 time)
    {
        TWait = true;
        WaitTimer = time;
    }

    void UpdateAI(const uint32 diff)
    {        
        if(DoUpdateAI)
            npc_escortAI::UpdateAI(diff);
        
        Player* pPlayer = GetPlayerForEscort();

        if (!pPlayer)
            return;

        if(TWait)
        {
            if(WaitTimer < diff)
            {
                TWait = false;
            } WaitTimer -= diff;
            return;
        }

        switch(TalkPhase)
        {            
            case 1:
                Godfrey = me->FindNearestCreature(NPC_GODFREY, 50.0f);
                DoScriptText(SAY_WP_1, me);
                me->HandleEmoteCommand(5);
                me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                break;
            case 2:
               if (Godfrey)
	   Godfrey->HandleEmoteCommand(434);
                DoScriptText(SAY_WP_2, me);
                me->HandleEmoteCommand(15);
                break;
            case 3:                
                DoScriptText(SAY_WP_3, me);
                me->HandleEmoteCommand(1);
                break;
            case 4:
                if (Godfrey)
	DoScriptText(SAY_WP_4, Godfrey);
                break;
            case 5:
                if (Godfrey)
	DoScriptText(SAY_WP_5, Godfrey);
                 break;
            case 6:
                if (Godfrey)
	   DoScriptText(SAY_WP_6, Godfrey);
                 break;
            case 7:
                DoScriptText(SAY_WP_7, me);
                me->HandleEmoteCommand(1);
                break;
            case 8:
                DoScriptText(SAY_WP_8, me);
                me->HandleEmoteCommand(16);
                break;
            case 9:
                me->HandleEmoteCommand(5);
                DoScriptText(SAY_WP_9, me);
                break;
            case 10:
                DoScriptText(SAY_WP_10, me);
                DoCast(Godfrey, SPELL_HOLY_FIRE);
                break;
            case 11:
                if (Godfrey)
	Godfrey->HandleEmoteCommand(434);
                DoScriptText(SAY_WP_11, Godfrey);
                break;
            case 12:
                DoScriptText(SAY_WP_12, me);
                DoCast(Godfrey, SPELL_HOLY_FIRE);
                break;
            case 13:
                DoScriptText(SAY_WP_13, me);
                if (Godfrey)
	DoCast(Godfrey, SPELL_HOLY_FIRE);
                 break;
            case 14:
                if (Godfrey)
                Godfrey->HandleEmoteCommand(434);
                DoScriptText(SAY_WP_14, Godfrey);
                break;
            case 15:
                DoScriptText(SAY_WP_15, me);
                if (Godfrey)
                DoCast(Godfrey, SPELL_HOLY_FIRE);
                break;
            case 16:
                DoScriptText(SAY_WP_16, me);
                break;
            case 17:
                DoScriptText(SAY_WP_17, me);
                break;
            case 18:
                if (Godfrey)
                DoScriptText(SAY_WP_18, Godfrey);
                break;
            case 19:
                DoScriptText(SAY_WP_19, me);
                break;
            case 20:
                if (Godfrey)
                DoScriptText(SAY_WP_20, Godfrey);
                break;
            case 21:
                if (Godfrey)
                DoScriptText(SAY_WP_21, Godfrey);
                break;
            case 22:
                DoScriptText(SAY_WP_22, me);
                break;
            case 23:
                if (Godfrey)
                DoScriptText(SAY_WP_23, Godfrey);
                break;
            case 24:
                if (Godfrey)
                DoScriptText(SAY_WP_24, Godfrey);
                break;
            case 25:
                DoScriptText(SAY_WP_25, me);
                break;
            case 26:
                DoScriptText(SAY_WP_26, me);
                me->SetUInt64Value(UNIT_FIELD_TARGET, pPlayer->GetGUID());
                break;
            case 27:
                DoScriptText(SAY_WP_27, me);
                if (Godfrey)
                me->SetUInt64Value(UNIT_FIELD_TARGET, Godfrey->GetGUID());
                Completed = true;
                if (pPlayer)
                pPlayer->GroupEventHappens(QUEST_A_RIGHTEOUS_SERMON, me);
                break;        
        }        
        ++TalkPhase;
        Wait(TALK_TIMER);
    }
};

bool QuestAccept_npc_inquisitor_hallard(Player* pPlayer, Creature* pCreature, Quest const* quest)
{
    if (quest->GetQuestId() == QUEST_A_RIGHTEOUS_SERMON)
    {        
        DoScriptText(SAY_WP_0, pCreature, pPlayer);
        if (npc_escortAI* pEscortAI = CAST_AI(npc_inquisitor_hallardAI, pCreature->AI()))
            pEscortAI->Start(true, false, pPlayer->GetGUID());

    }
    return true;
}

CreatureAI* GetAI_npc_inquisitor_hallard(Creature* pCreature)
{
    return new npc_inquisitor_hallardAI(pCreature);
}

// Frostmoune cavern quest

uint32 frostcav_event = 0;
Unit* playerr;

struct frostcav_controlAI : public ScriptedAI
{
   frostcav_controlAI(Creature *c) : ScriptedAI(c) {Reset();}

   uint32 phase;
   uint32 phasetim;

   Creature* arthas;
   Creature* muradin;
   Creature* frostmourne;

   void Reset() 
   {
       phase = 1;
	   phasetim = 20000;
   };

   void Aggro(Unit* who) {};

   void UpdateAI(const uint32 diff)
   {
	   if(frostcav_event == 0) return;

	   switch(phase)
	   {
	   case 1:
           arthas = me->SummonCreature(27455,4817.506f,-582.1,163.37f,5.25f,TEMPSUMMON_TIMED_DESPAWN,84000);
		   muradin = me->SummonCreature(27480,4815.1,-589.45f,162.85f,0,TEMPSUMMON_TIMED_DESPAWN,84000);
		   frostmourne = me->SummonCreature(27880,4821.35,-586.58f,163.76f,0,TEMPSUMMON_TIMED_DESPAWN,84000);
		   ++phase;
		   phasetim = 2000;
		   break;
	   case 3:
		   arthas->SetOrientation(5.25f);
		   arthas->MonsterSay("Behold, Muradin, our salvation, Frostmourne.",LANG_UNIVERSAL,NULL);
		   ++phase;
		   phasetim = 4000;
		   break;
	   case 5:
		   muradin->GetMotionMaster()->MovePoint(0, 4818.86f, -587.33, 163.24f);
		   ++phase;
		   phasetim = 4000;
		   break;
	   case 7:
		   muradin->SetStandState(UNIT_STAND_STATE_KNEEL);
		   muradin->MonsterSay("Hold, lad. There\'s an inscription on the dais. It\'s a warning. It says, \"Whomsoever takes up this blade shall wield power eternal. Just as the blade rends flesh, so must power scar the spirit.\" Oh, I should\'ve known. The blade is cursed! Let\'s get the hell out of here!",LANG_UNIVERSAL,NULL);
		   ++phase;
		   phasetim = 16000;
		   break;
	   case 9:
           muradin->SetStandState(UNIT_STAND_STATE_STAND);
		   ++phase;
		   phasetim = 2000;
		   break;
	   case 11:
		   //muradin->GetMotionMaster()->MovePoint(0, 4819.44f, -586.73f, 163.25f);
		   //Muradin's orientation
		   arthas->MonsterSay("I would gladly bear any curse to save my homeland.",LANG_UNIVERSAL,NULL);
		   ++phase;
		   phasetim = 1000;
		   break;
	   case 13:
		   muradin->GetMotionMaster()->MovePoint(0, 4811.28f, -588.28f, 162.099f);
		   ++phase;
		   phasetim = 4000;
		   break;
	   case 15:
           //muradin->GetMotionMaster()->MovePoint(0, 4811.84f, -588.229f, 162.24f);
		   //Set right orientation (SetOrientation doesn't work?)
		   ++phase;
		   phasetim = 2000;
		   break;
	   case 17:
		   muradin->MonsterSay("Leave it be, Arthas. Forget this business and lead your men home.",LANG_UNIVERSAL,NULL);
		   ++phase;
		   phasetim = 5000;
		   break;
	   case 19:
		   arthas->MonsterSay("Damn the men! Nothing shall prevent me from having my revenge, old friend. Not even you.",LANG_UNIVERSAL,NULL);
		   ++phase;
		   phasetim = 5000;
		   break;
	   case 21:
           arthas->GetMotionMaster()->MovePoint(0, 4819.099f, -584.67f, 163.44f);
		   ++phase;
		   phasetim = 3000;
		   break;
	   case 23:
		   arthas->MonsterSay("Now, I call out to the spirits of this place. I will give anything or pay any price, if only you will help me save my people.",LANG_UNIVERSAL,NULL);
		   arthas->CastSpell(me,49824,false);
		   ++phase;
		   phasetim = 10000;
		   break;
	   case 25:
		   muradin->SetStandState(UNIT_STAND_STATE_DEAD);
		   arthas->LoadEquipment(88001);
		   frostmourne->LoadEquipment(1613);
		   ++phase;
		   phasetim = 2000;
		   break;
	   case 27:
		   arthas->SetSpeed(MOVE_RUN,2.0f);
		   arthas->SetSpeed(MOVE_WALK,2.0f);
		   arthas->GetMotionMaster()->MovePoint(0, 4796.64f, -586.94f, 159.55f);
		   ++phase;
		   phasetim = 5000;
		   break;
	   case 29:
           arthas->CastSpell(arthas,53048,false);
		   ++phase;
		   phasetim = 2000;
		   break;
	   case 31:
		   arthas->GetMotionMaster()->MovePoint(0, 4729.22f, -560.39f, 165.96f);
		   ++phase;
		   phasetim = 2000;
		   break;
	   case 33:
		   muradin->SetStandState(UNIT_STAND_STATE_STAND);
		   muradin->CastSpell(muradin,43328,false);
		   ++phase;
		   phasetim = 3000;
		   break;
	   case 35:
		   muradin->MonsterSay("O\' my head... Wh... Where am I?",LANG_UNIVERSAL,NULL);
		   ++phase;
		   phasetim = 4000;
		   break;
	   case 37:
		   muradin->MonsterSay("Who... Who am I?",0,0);
		   ++phase;
		   phasetim = 4000;
		   break;
	   case 39:
		   muradin->SetSpeed(MOVE_WALK,2.0f);
		   muradin->SetSpeed(MOVE_RUN,2.0f);
		   muradin->GetMotionMaster()->MovePoint(0, 4796.64f, -586.94f, 159.55f);
		   //muradin->GetMotionMaster()->MovePoint(0, 4729.22f, -560.39f, 165.96f);
		   //Get out of the cavern
           ++phase;
		   phasetim = 4000;
		   break;
	   case 41:
		   muradin->SetVisibility(VISIBILITY_OFF);
		   arthas->SetVisibility(VISIBILITY_OFF);
		   frostmourne->SetVisibility(VISIBILITY_OFF);
		   //TODO: Remove muradin, arthas and frostmourne from world
		   frostcav_event = 0;
		   phase = 1;
		   ((Player*)playerr)->GroupEventHappens(12478, me);
		   break;
	   }

	   if (phasetim <= diff)
	   {
		   ++phase;
		   phasetim = 20000000;
	   } phasetim -= diff;
   }
};

CreatureAI* GetAI_frostcav_control(Creature *_Creature)
{
    frostcav_controlAI* frostcavAI = new frostcav_controlAI(_Creature);
    return (CreatureAI*)frostcavAI;
};

bool GossipHello_frostcav_control(Player *player, Creature *_Creature)
{
	if(frostcav_event == 0)
      player->ADD_GOSSIP_ITEM(0, "I\'m ready to see Zelig\'s Vision", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);

    player->PlayerTalkClass->SendGossipMenu(907,_Creature->GetGUID());
    return true;
}

bool GossipSelect_frostcav_control(Player *player, Creature *_Creature, uint32 sender, uint32 action )
{
    if(action == GOSSIP_ACTION_INFO_DEF+2)
    {
        frostcav_event = 1;
		playerr = player;
		
        player->CLOSE_GOSSIP_MENU();
    }
    return true;
}
/* 
################
quest = 12459 ##
################
*/
enum
{
WEAKENED_REANIMATED_FROST_WYRM = 27821,
WEAKENED_TURGID_THE_VILE = 27809,
WEAKENED_OVERSEER_DEATHGAZE = 27807,
REANIMATED_FROST_WYRM = 26841,
TURGID_THE_VILE = 27808,
OVERSEER_DEATHGAZE = 27122,
QUEST_THAT_WHICH_CREATES_CAN_ALSO_DESTROY = 12459,
SPELL_SEEDS_OF_NATURES_WRATH = 49587,
ITEM_SEEDS_OF_NATURES_WRATH = 37887
};

bool ItemUse_item_seeds_of_natures_wrath(Player* pPlayer, Item* pItem, const SpellCastTargets &pTargets)
{
    Creature* pCreature;

    if ((pPlayer->GetQuestStatus(QUEST_THAT_WHICH_CREATES_CAN_ALSO_DESTROY) == QUEST_STATUS_INCOMPLETE)/* && pPlayer->HasAura(SPELL_AURA_RIGHTEOUS_VISION)*/)
    {
        if (pCreature = pPlayer->FindNearestCreature(REANIMATED_FROST_WYRM, 15.0))
        {
            pPlayer->CastSpell(pCreature,SPELL_SEEDS_OF_NATURES_WRATH,true);
           if (Creature* pWeakene = pCreature->SummonCreature(WEAKENED_REANIMATED_FROST_WYRM,pCreature->GetPositionX(),pCreature->GetPositionY(),pCreature->GetPositionY(),0,TEMPSUMMON_CORPSE_DESPAWN,30000))
	       pWeakene->AI()->AttackStart(pPlayer);
	       pCreature->ForcedDespawn();
        }
        else if (pCreature = pPlayer->FindNearestCreature(TURGID_THE_VILE, 15.0))
        {
             pPlayer->CastSpell(pCreature,SPELL_SEEDS_OF_NATURES_WRATH,true);
           if (Creature* pWeakene = pCreature->SummonCreature(WEAKENED_TURGID_THE_VILE,pCreature->GetPositionX(),pCreature->GetPositionY(),pCreature->GetPositionY(),0,TEMPSUMMON_CORPSE_DESPAWN,30000))
	       pWeakene->AI()->AttackStart(pPlayer);
	       pCreature->ForcedDespawn();
        }
        else if (pCreature = pPlayer->FindNearestCreature(OVERSEER_DEATHGAZE, 15.0))
        {
             pPlayer->CastSpell(pCreature,SPELL_SEEDS_OF_NATURES_WRATH,true);
            if (Creature* pWeakene = pCreature->SummonCreature(WEAKENED_OVERSEER_DEATHGAZE,pCreature->GetPositionX(),pCreature->GetPositionY(),pCreature->GetPositionY(),0,TEMPSUMMON_CORPSE_DESPAWN,30000))
	       pWeakene->AI()->AttackStart(pPlayer);
	       pCreature->ForcedDespawn();
        }
        return false;
    }
    
    return true;
}

//q12702

enum
{
ITEM_CAPTURED_CHICKEN = 38483,
QUEST_CHICKEN_PARTY = 12702,
SPELL_CHICKEN_NET   = 51959,
SPELL_CAPTURE_CHICKEN_ESCAPEE = 51037,
NPC_CHICKEN	= 28161
};

bool ItemUse_item_capture_chicken(Player* pPlayer, Item* pItem, const SpellCastTargets &pTargets)
{
    Creature* pCreature;

    if (pPlayer->GetQuestStatus(QUEST_CHICKEN_PARTY) == QUEST_STATUS_INCOMPLETE)
    {
        if (pCreature = pPlayer->FindNearestCreature(NPC_CHICKEN, 10.0))
        {
	 pCreature->CastSpell(pCreature, SPELL_CHICKEN_NET, true);
	 pPlayer->CastSpell(pPlayer,SPELL_CAPTURE_CHICKEN_ESCAPEE,true);
	}
    }
	return true;
}

// q12261

enum
{
NPC_TOTEM_DEFENSIVE	= 27430,
NPC_SUMMON_DRAKES	= 10000, //TODO need entry npc
QUEST_NO_PLACE_TO_RUN	= 12261,
NPC_KREDIT_DRAKES	= 28820
};

struct npc_totem_defensiveAI : public ScriptedAI
{
    npc_totem_defensiveAI(Creature* c) : ScriptedAI(c){}

    uint32 uiPhaseTimer;
    uint8  Phase;
    
    void Reset()
    {
    Phase = 1;
    uiPhaseTimer = 20000;
    }
    
     void UpdateAI(const uint32 diff)
    {
    if (uiPhaseTimer <= diff)
    {
	float nx = me->GetPositionX() + irand(5,15);
	float ny = me->GetPositionY() + irand(5,15);
	float nz = me->GetPositionZ();
	
	switch(Phase)
	{
	  case 1:
	    if (Creature* pTemp = me->SummonCreature(NPC_SUMMON_DRAKES,nx,ny,nz,0,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 40000))
	       pTemp->AI()->AttackStart(me);
	    Phase++;
	    uiPhaseTimer = 20000;
	    break;
	  case 2:
	     if (Creature* pTemp = me->SummonCreature(NPC_SUMMON_DRAKES,nx,ny,nz,0,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 40000))
	        pTemp->AI()->AttackStart(me);
	    Phase++;
	    uiPhaseTimer = 20000;
	    break;
	  case 3:
	    if (Creature* pTemp = me->SummonCreature(NPC_SUMMON_DRAKES,nx,ny,nz,0,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 40000))
	         pTemp->AI()->AttackStart(me);
	     Phase++;
	     uiPhaseTimer = 20000;
	    break;
	  case 4:
	    if (Creature* pTemp = me->SummonCreature(NPC_SUMMON_DRAKES,nx,ny,nz,0,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 40000))
		pTemp->AI()->AttackStart(me);
	    Phase++;
	    uiPhaseTimer = 20000;
	    break;
	  case 5:
	     if (Creature* pTemp = me->SummonCreature(NPC_SUMMON_DRAKES,nx,ny,nz,0,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 40000))
		pTemp->AI()->AttackStart(me);
	    Phase++;
	    uiPhaseTimer = 20000;
	    break;
	  case 6:
	   if (me->isSummon())
                if (Unit* pTemp = CAST_SUM(me)->GetSummoner())
                    if (pTemp->GetTypeId() == TYPEID_PLAYER)
	    CAST_PLR(pTemp)->KilledMonsterCredit(NPC_KREDIT_DRAKES, 0);
	    me->ForcedDespawn();
	    break;
	  }
	} else uiPhaseTimer -= diff;
    }
};

CreatureAI* GetAI_npc_totem_defensive(Creature* pCreature)
{
    return new npc_totem_defensiveAI(pCreature);
}

/*######
quest = 
######*/
enum
{
NPC_SNOWFALL_GLADE_PUP = 26200,
SPELL_PLANNING_FOR_THE_FUTURE = 46773,
QUEST_PLANNING_FOR_THE_FUTURE = 11960
};

struct npc_snowfall_glade_pupAI : public ScriptedAI
{
    npc_snowfall_glade_pupAI(Creature *c) : ScriptedAI(c) {}

 void MoveInLineOfSight(Unit *who)
    {
        ScriptedAI::MoveInLineOfSight(who);

        if (who->GetTypeId() != TYPEID_PLAYER)
            return;
	if (Unit* uOwner = me->GetOwner(true))
	{
	  Player* pOwner = uOwner->ToPlayer();
	   if (pOwner && pOwner->GetQuestStatus(QUEST_PLANNING_FOR_THE_FUTURE) == QUEST_STATUS_INCOMPLETE && me->IsWithinDistInMap(pOwner, 2.0f))
	   {
	        pOwner->CastSpell(who, SPELL_PLANNING_FOR_THE_FUTURE, false);
	        me->ForcedDespawn();
	   }
        }
    }
};

CreatureAI* GetAI_npc_snowfall_glade_pup(Creature* pCreature)
{
    return new npc_snowfall_glade_pupAI(pCreature);
}

void AddSC_dragonblight()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_alexstrasza_wr_gate";
    newscript->pGossipHello = &GossipHello_npc_alexstrasza_wr_gate;
    newscript->pGossipSelect = &GossipSelect_npc_alexstrasza_wr_gate;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_inquisitor_hallard";
    newscript->GetAI = &GetAI_npc_inquisitor_hallard;
    newscript->pQuestAccept = &QuestAccept_npc_inquisitor_hallard;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "frostcav_control";
    newscript->GetAI = &GetAI_frostcav_control;
    newscript->pGossipHello = &GossipHello_frostcav_control;
    newscript->pGossipSelect = &GossipSelect_frostcav_control;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "item_seeds_of_natures_wrath";
    newscript->pItemUse = &ItemUse_item_seeds_of_natures_wrath;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "item_capture_chicken";
    newscript->pItemUse = &ItemUse_item_capture_chicken;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_totem_defensive";
    newscript->GetAI = &GetAI_npc_totem_defensive;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_snowfall_glade_pup";
    newscript->GetAI = &GetAI_npc_snowfall_glade_pup;
    newscript->RegisterSelf();
}
