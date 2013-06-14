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
SDName: Icecrown
SD%Complete: 100
SDComment: Quest support: 12807
SDCategory: Icecrown
EndScriptData */

/* ContentData
npc_arete
EndContentData */

#include "ScriptedPch.h"

/*######
## npc_arete
######*/

#define GOSSIP_ARETE_ITEM1 "Lord-Commander, I would hear your tale."
#define GOSSIP_ARETE_ITEM2 "<You nod slightly but do not complete the motion as the Lord-Commander narrows his eyes before he continues.>"
#define GOSSIP_ARETE_ITEM3 "I thought that they now called themselves the Scarlet Onslaught?"
#define GOSSIP_ARETE_ITEM4 "Where did the grand admiral go?"
#define GOSSIP_ARETE_ITEM5 "That's fine. When do I start?"
#define GOSSIP_ARETE_ITEM6 "Let's finish this!"
#define GOSSIP_ARETE_ITEM7 "That's quite a tale, Lord-Commander."

enum eArete
{
    GOSSIP_TEXTID_ARETE1        = 13525,
    GOSSIP_TEXTID_ARETE2        = 13526,
    GOSSIP_TEXTID_ARETE3        = 13527,
    GOSSIP_TEXTID_ARETE4        = 13528,
    GOSSIP_TEXTID_ARETE5        = 13529,
    GOSSIP_TEXTID_ARETE6        = 13530,
    GOSSIP_TEXTID_ARETE7        = 13531,

    QUEST_THE_STORY_THUS_FAR    = 12807
};

bool GossipHello_npc_arete(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(QUEST_THE_STORY_THUS_FAR) == QUEST_STATUS_INCOMPLETE)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE1, pCreature->GetGUID());
        return true;
    }

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_arete(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    switch(uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE2, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE3, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+3:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE4, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+4:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE5, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+5:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM6, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE6, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+6:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM7, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE7, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+7:
            pPlayer->CLOSE_GOSSIP_MENU();
            pPlayer->AreaExploredOrEventHappens(QUEST_THE_STORY_THUS_FAR);
            break;
    }

    return true;
}

/*######
## npc_dame_evniki_kapsalis
######*/

enum eDameEnvikiKapsalis
{
    TITLE_CRUSADER    = 123
};

bool GossipHello_npc_dame_evniki_kapsalis(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->HasTitle(TITLE_CRUSADER))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_dame_evniki_kapsalis(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_TRADE)
        pPlayer->SEND_VENDORLIST(pCreature->GetGUID());
    return true;
}

/*######
## npc_squire_Danny
######*/

#define GOSSIP_START_VALIANTS_COMBAT "I want to fight the Champion of money!"

struct QUEST_VALIANTS_CHALLENGE
{ 
  uint32 quest_id; 
};

QUEST_VALIANTS_CHALLENGE m_quest[] = {13727, 13728, 13729, 13731, 13726, 13725, 13713, 13723, 13724, 13699};

bool GossipHello_npc_squire_danny(Player* pPlayer, Creature* pCreature)
{
  for (int i = 0; i < 10; i++)
  {
      if (pPlayer->GetQuestStatus(m_quest[i].quest_id) == QUEST_STATUS_INCOMPLETE)
        {
          pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_START_VALIANTS_COMBAT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        }
  }
  
  pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
  return true;
}

bool GossipSelect_npc_squire_danny(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{

    if (uiAction == (GOSSIP_ACTION_INFO_DEF + 1))
    {
      pCreature->SummonCreature(33707, 8556.95, 1119.98, 556.78, 1.9, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 300000);
    }

    pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

/*######
## npc_squire_david
######*/

enum eSquireDavid
{
    QUEST_THE_ASPIRANT_S_CHALLENGE_H                    = 13680,
    QUEST_THE_ASPIRANT_S_CHALLENGE_A                    = 13679,

    NPC_ARGENT_VALIANT                                  = 33448,

    GOSSIP_TEXTID_SQUIRE                                = 14407
};

#define GOSSIP_SQUIRE_ITEM_1 "I am ready to fight!"
#define GOSSIP_SQUIRE_ITEM_2 "How do the Argent Crusader raiders fight?"

bool GossipHello_npc_squire_david(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(QUEST_THE_ASPIRANT_S_CHALLENGE_H) == QUEST_STATUS_INCOMPLETE ||
        pPlayer->GetQuestStatus(QUEST_THE_ASPIRANT_S_CHALLENGE_A) == QUEST_STATUS_INCOMPLETE)//We need more info about it.
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SQUIRE_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SQUIRE_ITEM_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
    }

    pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_SQUIRE, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_squire_david(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        pCreature->SummonCreature(NPC_ARGENT_VALIANT,8575.451,952.472,547.554,0.38);
    }
    //else
        //pPlayer->SEND_GOSSIP_MENU(???, pCreature->GetGUID()); Missing text
    return true;
}

/*######
## npc_argent_valiant
######*/

enum eArgentValiant
{
    SPELL_CHARGE                = 63010,
    SPELL_SHIELD_BREAKER        = 65147,

    NPC_ARGENT_VALIANT_CREDIT   = 24108
};

struct npc_argent_valiantAI : public ScriptedAI
{
    npc_argent_valiantAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pCreature->GetMotionMaster()->MovePoint(0,8599.258,963.951,547.553);
        pCreature->setFaction(35); //wrong faction in db?
    }

    uint32 uiChargeTimer;
    uint32 uiShieldBreakerTimer;

    void Reset()
    {
        uiChargeTimer = 7000;
        uiShieldBreakerTimer = 10000;
    }

    void MovementInform(uint32 uiType, uint32 /*uiId*/)
    {
        if (uiType != POINT_MOTION_TYPE)
            return;

        me->setFaction(14);
    }

    void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
    {
        if (uiDamage > me->GetHealth() && pDoneBy->GetTypeId() == TYPEID_PLAYER)
        {
            uiDamage = 0;
            CAST_PLR(pDoneBy)->KilledMonsterCredit(NPC_ARGENT_VALIANT_CREDIT,0);
            me->setFaction(35);
            me->ForcedDespawn(5000);
            me->SetHomePosition(me->GetPositionX(),me->GetPositionY(),me->GetPositionZ(),me->GetOrientation());
            EnterEvadeMode();
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

        if (uiChargeTimer <= uiDiff)
        {
            DoCastVictim(SPELL_CHARGE);
            uiChargeTimer = 7000;
        } else uiChargeTimer -= uiDiff;

        if (uiShieldBreakerTimer <= uiDiff)
        {
            DoCastVictim(SPELL_SHIELD_BREAKER);
            uiShieldBreakerTimer = 10000;
        } else uiShieldBreakerTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_argent_valiant(Creature* pCreature)
{
    return new npc_argent_valiantAI (pCreature);
}

/*######
## npc_argent_tournament_post
######*/

enum eArgentTournamentPost
{
    SPELL_ROPE_BEAM                 = 63413,
    NPC_GORMOK_THE_IMPALER          = 35469,
    NPC_ICEHOWL                     = 35470
};

struct npc_argent_tournament_postAI : public ScriptedAI
{
    npc_argent_tournament_postAI(Creature* pCreature) : ScriptedAI(pCreature) {}

    void UpdateAI(const uint32 /*uiDiff*/)
    {
        if (me->IsNonMeleeSpellCasted(false))
            return;

        if (Creature* pTarget = me->FindNearestCreature(NPC_GORMOK_THE_IMPALER, 6.0f))
            DoCast(pTarget, SPELL_ROPE_BEAM);

        if (Creature* pTarget2 = me->FindNearestCreature(NPC_ICEHOWL, 6.0f))
            DoCast(pTarget2, SPELL_ROPE_BEAM);

        if (!UpdateVictim())
            return;
    }
};

CreatureAI* GetAI_npc_argent_tournament_post(Creature* pCreature)
{
    return new npc_argent_tournament_postAI (pCreature);
}

/*######
## npc_alorah_and_grimmin
######*/

enum ealorah_and_grimmin
{
    SPELL_CHAIN                     = 68341,
    NPC_FJOLA_LIGHTBANE             = 36065,
    NPC_EYDIS_DARKBANE              = 36066,
    NPC_PRIESTESS_ALORAH            = 36101,
    NPC_PRIEST_GRIMMIN              = 36102
};

struct npc_alorah_and_grimminAI : public ScriptedAI
{
    npc_alorah_and_grimminAI(Creature* pCreature) : ScriptedAI(pCreature) {}

    bool uiCast;

    void Reset()
    {
        uiCast = false;
    }

    void UpdateAI(const uint32 /*uiDiff*/)
    {
        if (uiCast)
            return;
        uiCast = true;
        Creature* pTarget = NULL;

        switch(me->GetEntry())
        {
            case NPC_PRIESTESS_ALORAH:
                pTarget = me->FindNearestCreature(NPC_EYDIS_DARKBANE, 10.0f);
                break;
            case NPC_PRIEST_GRIMMIN:
                pTarget = me->FindNearestCreature(NPC_FJOLA_LIGHTBANE, 10.0f);
                break;
        }
        if (pTarget)
            DoCast(pTarget, SPELL_CHAIN);

        if (!UpdateVictim())
            return;
    }
};

CreatureAI* GetAI_npc_alorah_and_grimmin(Creature* pCreature)
{
    return new npc_alorah_and_grimminAI (pCreature);
}

#define GOSSIP_ITEM  "Go to arena"
#define SAY_AGGRO	"I kill you"
enum Quset
{
SPELL_CHARGES = 63010,
SPELL_SHEILD = 65147
};

struct THE_GRAND_MELEE_QUEST
{ 
  uint32 quest_id; 
};

THE_GRAND_MELEE_QUEST new_quests[] = {13745, 13750, 13756, 13761, 13767, 13772, 13777, 13782, 13787};

struct THE_GRAND_CHAMPIONS_QUEST
{ 
  uint32 quest_id; 
};

THE_GRAND_CHAMPIONS_QUEST new_questes[] = {13790, 13811,13793,13814};

struct npc_champion_arenaAI : public ScriptedAI
{
    npc_champion_arenaAI(Creature* c) : ScriptedAI(c){}
    
    
    uint32 uiResetTimer;
    uint32 uiChargeTimer;
    uint32 uiSheildTimer;
    bool bDone;

    void Reset()
   {
    uiResetTimer = 7000;
    uiChargeTimer = 12000;
    uiSheildTimer = 8000;
    bDone = false;
   me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
   }
    
   void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if (damage >= me->GetHealth())
        {
            damage = 0;
            EnterEvadeMode();
            me->setFaction(35);
	    bDone = true;
	    if (Unit* uOwner = me->GetOwner(true))
		{
	          Player* pOwner = uOwner->ToPlayer();
		  for (int i = 0; i < 9; i++)
		   {
		      if (pOwner && pOwner->GetQuestStatus(new_quests[i].quest_id) == QUEST_STATUS_INCOMPLETE)
		          pOwner->CastSpell(pOwner,62770, true);
		   }
		   
		  for (int i = 0; i < 4; i++)
		   {
		      if (pOwner && pOwner->GetQuestStatus(new_questes[i].quest_id) == QUEST_STATUS_INCOMPLETE)
		          pOwner->CastSpell(pOwner,63596, true);
		   }
		}
	}
    }
    
    void UpdateAI(const uint32 uiDiff)
    {
    
    if (bDone && uiResetTimer <= uiDiff)
        {
	me->GetMotionMaster()->MoveTargetedHome();
	bDone = false;
        } else uiResetTimer -= uiDiff;
    
    if(uiChargeTimer <= uiDiff)
    {
    DoCast(SPELL_CHARGES);
    uiChargeTimer = 12000;
    } else uiChargeTimer -= uiDiff;
    
    if (uiSheildTimer <= uiDiff)
    {
    DoCast(SPELL_SHEILD);
    uiSheildTimer = 8000;
    } else uiSheildTimer -= uiDiff;
	
     DoMeleeAttackIfReady();
   }
};

CreatureAI* GetAI_npc_champion_arena(Creature* pCreature)
{
    return new npc_champion_arenaAI(pCreature);
}

bool GossipHello_npc_champion_arena(Player* pPlayer, Creature* pCreature)
{

	pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());    
    return true;
}

bool GossipSelect_npc_champion_arena(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        pCreature->setFaction(16);
	pCreature->RemoveFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE);
	pCreature->SetReactState(REACT_AGGRESSIVE);
        pCreature->AI()->AttackStart(pPlayer);
    }
    return true;
}

/*######
## npc_Keritose
######*/

#define GOSSIP_KERITOSE_I  "I am prepared to join the assault, keritose do you have a skeletal gryphon ready for me!"

enum eKeritose
{
    QUEST_SEEDS_OF_CHAOS	            	  = 13172,
    SPELL_TAXI_KERITOSE	       		          = 58698, 
    GOSSIP_TEXTID_KERITOSE            		  = 12193 
};

bool GossipHello_npc_keritose(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
         pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if(pPlayer->GetQuestStatus(QUEST_SEEDS_OF_CHAOS) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_KERITOSE_I, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_keritose(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch(uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
	pPlayer->CastSpell(pPlayer, SPELL_TAXI_KERITOSE, true);
	pPlayer->CLOSE_GOSSIP_MENU();
	break;
    }
    return true;
}

/*######
## lake_frog
######*/

#define MAIDEN 33220
#define WARTS_SPELL 62581
#define LIP_BALM_SPELL 62574
#define SUMMON_ASHOOD_BRAND_SPELL 62554
#define MAIDEN_SAY "thank to you, here is you Ashwood Brand !"

struct A_BLADE_FIT_FOR_A_CHAMPION_QUEST
{ 
  uint32 quest_id; 
};

A_BLADE_FIT_FOR_A_CHAMPION_QUEST new_quest[] = {13603, 13666, 13673, 13741, 13746, 13752, 13757, 13762, 13768, 13773, 13778, 13783};

struct npc_lake_frogAI : public ScriptedAI
{
    npc_lake_frogAI(Creature *c) : ScriptedAI(c) {}

    void ReceiveEmote(Player* pPlayer, uint32 emote)
    {
      switch (emote)
      {
        case TEXTEMOTE_KISS:
            for (int i = 0; i < 12; i++)
            {
              if (pPlayer->GetQuestStatus(new_quest[i].quest_id) == QUEST_STATUS_INCOMPLETE && pPlayer->HasAura(LIP_BALM_SPELL) && rand()%10 == 1)
              {
                  Unit* summon = me->SummonCreature(MAIDEN, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 120000);
                  me->ForcedDespawn();
                  if (summon)
                  {
                    summon->CastSpell(pPlayer, SUMMON_ASHOOD_BRAND_SPELL, true, 0, 0, 0);
                    summon->MonsterSay(MAIDEN_SAY, LANG_UNIVERSAL, NULL);
                  }
              }
              else if (!pPlayer->HasAura(LIP_BALM_SPELL) && ((rand()%100) > 40)) 
                me->CastSpell(pPlayer, WARTS_SPELL, true, 0, 0, 0);
            }
            break;
      }
    }
};

CreatureAI* GetAI_npc_lake_frog(Creature* pCreature)
{
    return new npc_lake_frogAI(pCreature);
}

/*#######
# npc_crusader_olakin_sainrith
#######*/

#define SAY_HEAL					-1000334

#define QUEST_PUTTING_OLAKIN_BACK_TOGETHER_AGAIN        13220
#define SPELL_REANIMATE_CRUSADER_OLAKIN			58856
#define SPELL_REVIVE_SELF				32343

struct npc_crusader_olakin_sainrithAI : public ScriptedAI
{
    npc_crusader_olakin_sainrithAI(Creature *c) : ScriptedAI(c) {spellHit = false;}

    uint32 lifeTimer;
    bool spellHit;

    void Reset()
    {
        lifeTimer = 120000;
        me->Kill(me);   
        me->SetStandState(UNIT_STAND_STATE_DEAD);
        me->SetUInt32Value(UNIT_FIELD_BYTES_1,7);   // lay down
        spellHit = false;
    }

    void EnterCombat(Unit *who)
    {
    }

    void MoveInLineOfSight(Unit *who)
    {
        return;
    }

    void UpdateAI(const uint32 diff)
    {
        if (me->IsStandState())
        {
            if (lifeTimer <= diff)
                me->AI()->EnterEvadeMode();
            else
                lifeTimer -= diff;
        }
    }

    void SpellHit(Unit *Hitter, const SpellEntry *Spellkind)
    {
        if ((Spellkind->Id == SPELL_REANIMATE_CRUSADER_OLAKIN) && !spellHit &&
            (Hitter->GetTypeId() == TYPEID_PLAYER) && (CAST_PLR(Hitter)->IsActiveQuest(QUEST_PUTTING_OLAKIN_BACK_TOGETHER_AGAIN)))
        {
            CAST_PLR(Hitter)->AreaExploredOrEventHappens(QUEST_PUTTING_OLAKIN_BACK_TOGETHER_AGAIN);
            DoCast(me, SPELL_REVIVE_SELF);
            me->SetStandState(UNIT_STAND_STATE_STAND);
            me->SetUInt32Value(UNIT_DYNAMIC_FLAGS, 0);
            //me->RemoveAllAuras();
            DoScriptText(SAY_HEAL, me);
            spellHit = true;
        }
    }
};

CreatureAI* GetAI_npc_crusader_olakin_sainrith(Creature* pCreature)
{
    return new npc_crusader_olakin_sainrithAI (pCreature);
}

/*
################
Quest = 13219 ##
################
*/
enum
{
SPELL_EMBER_SHOWER	= 61145,
SPELL_ENGULFING_STRIKE	= 61162,
SPELL_FIRE_NOVE		= 61163,
SPELL_FIRE_SHEILDIS	= 61144,
SAY_FIRESHEILD		= -1999900,
SAY_DEATH_PRINCE	= -1999901,
SAY_AGGRO_PRINCE	= -1999902,
NPC_PRINCE_SANDOVAL	= 14688,
NPC_DJEIRVIF		= 31135,
QUEST_BATTLE_AT_VALHALS_FINAL_CHALLENGE = 13219
};

struct npc_prince_sandovalAI : public ScriptedAI
{
    npc_prince_sandovalAI(Creature* pCreature) : ScriptedAI(pCreature)  { Reset(); }
    
    uint32 EmberShowerTimer;
    uint32 EngulfingStrikeTimer;
    uint32 FireNovaTimer;
    uint32 FireSheildTimer;
    bool shDone;
    
    void Reset()
    {
    EmberShowerTimer = 8000;
    EngulfingStrikeTimer = 13000;
    FireNovaTimer = 2000;
    }
    
    void Aggro(Unit* pWho)
    {
    DoScriptText(SAY_AGGRO_PRINCE,me);
    me->AI()->AttackStart(me->getVictim());
    }
    void KilledUnit(Unit *victim)
    {}
    
    void UpdateAI(const uint32 diff)
    {
	
        if (!UpdateVictim())
            return;
	
	if ((me->GetHealth()*100 / me->GetMaxHealth()) < 50)
	{
	DoScriptText(SAY_FIRESHEILD,me);
	me->CastSpell(me,SPELL_FIRE_SHEILDIS,true);
	}
	
	if (EmberShowerTimer <= diff)
	{
	  DoCastAOE(SPELL_EMBER_SHOWER);
	  EmberShowerTimer = 12000;
	} else EmberShowerTimer -= diff;
	
	if (EngulfingStrikeTimer <= diff)
	{
	  if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
	     DoCast(pTarget,SPELL_ENGULFING_STRIKE);
	     EngulfingStrikeTimer = 18000;
	} else EngulfingStrikeTimer -= diff;
	
	if (FireNovaTimer <= diff)
	{
	  if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
	     me->CastSpell(pTarget,SPELL_FIRE_NOVE,true);
	     FireNovaTimer = 22000;
	} else FireNovaTimer -= diff;
    
    DoMeleeAttackIfReady();
    
    }
    
    void JustDied(Unit* pKiller)
    {
    DoScriptText(SAY_DEATH_PRINCE,me);
    }
};

CreatureAI* GetAI_npc_prince_sandoval(Creature* pCreature)
{
    return new npc_prince_sandovalAI(pCreature);
}

struct npc_djeirvifAI : public ScriptedAI
{
    npc_djeirvifAI(Creature* pCreature) : ScriptedAI(pCreature)  { Reset(); }
    
    
void Reset()
    {
    }
void UpdateAI(const uint32 diff)
    { 
	if (Unit* uOwner = me->GetOwner(true))
	{
	  Player* pOwner = uOwner->ToPlayer();
	   if (pOwner && pOwner->GetQuestStatus(QUEST_BATTLE_AT_VALHALS_FINAL_CHALLENGE) == QUEST_STATUS_INCOMPLETE)
	     {
	       if(Creature* pSandoval = me->SummonCreature(NPC_PRINCE_SANDOVAL, 8225.64, 3492.45, 626.398, 3.11879, TEMPSUMMON_CORPSE_DESPAWN,40000))
	           pSandoval->AI()->AttackStart(pOwner);
	     }
	}
    }
};
			
CreatureAI* GetAI_npc_djeirvif(Creature* pCreature)
{
    return new npc_djeirvifAI(pCreature);
}

void AddSC_icecrown()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_arete";
    newscript->pGossipHello = &GossipHello_npc_arete;
    newscript->pGossipSelect = &GossipSelect_npc_arete;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_dame_evniki_kapsalis";
    newscript->pGossipHello = &GossipHello_npc_dame_evniki_kapsalis;
    newscript->pGossipSelect = &GossipSelect_npc_dame_evniki_kapsalis;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_squire_danny";
    newscript->pGossipHello = &GossipHello_npc_squire_danny;
    newscript->pGossipSelect = &GossipSelect_npc_squire_danny;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_squire_david";
    newscript->pGossipHello = &GossipHello_npc_squire_david;
    newscript->pGossipSelect = &GossipSelect_npc_squire_david;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_keritose";
    newscript->pGossipHello = &GossipHello_npc_keritose;
    newscript->pGossipSelect = &GossipSelect_npc_keritose;
    newscript->RegisterSelf();
    newscript = new Script;
    
    newscript->Name = "npc_champion_arena";
    newscript->GetAI = &GetAI_npc_champion_arena;
    newscript->pGossipHello = &GossipHello_npc_champion_arena;
    newscript->pGossipSelect = &GossipSelect_npc_champion_arena;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_lake_frog";
    newscript->GetAI = &GetAI_npc_lake_frog;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_argent_valiant";
    newscript->GetAI = &GetAI_npc_argent_valiant;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_argent_tournament_post";
    newscript->GetAI = &GetAI_npc_argent_tournament_post;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_alorah_and_grimmin";
    newscript->GetAI = &GetAI_npc_alorah_and_grimmin;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_crusader_olakin_sainrith";
    newscript->GetAI = &GetAI_npc_crusader_olakin_sainrith;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_prince_sandoval";
    newscript->GetAI = &GetAI_npc_prince_sandoval;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_djeirvif";
    newscript->GetAI = &GetAI_npc_djeirvif;
    newscript->RegisterSelf();
}
