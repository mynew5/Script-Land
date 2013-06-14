/*
 * ArcScripts2 Scripts for Arcemu MMORPG Server
 * Copyright (C) 2011-2012 ArcScripts2 team
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "Setup.h"

// Quest 1719 The Affray

#define QUEST_THEAFFRAY 1719
#define NPC_TWIGGYFLATHEAD 6248
#define NPC_AFFRAYCHALLENGER 6240
#define NPC_BIGWILL 6238
#define SPAWNPOINT_TWIGGYFLATHEAD -1686.14f, -4323.04f, 4.28091f
#define SPAWNPOINT_AFFRAYCHALLENGER -1679.3000488281f, -4328.9599609375f, 2.5859100818634f, 0.0f
#define SPAWNPOINT_BIGWILL -1705.0f, -4344.0f, 4.8f, 1.2f

class TwiggyFlatheadAI : public CreatureAIScript
{
	bool active;
	uint8 phase; // 0-4 --> killing challengers, 5 --> killing Big Will

public:
	ADD_CREATURE_FACTORY_FUNCTION(TwiggyFlatheadAI);
	TwiggyFlatheadAI(Creature* pCreature) : CreatureAIScript(pCreature)
	{
		active = false;
		phase = 0;
	}

	// public interface for the affray quest
	void OnPlayerEnteredCircle(Player *pPlayer)
	{
		QuestLogEntry *qle = pPlayer->GetQuestLogForEntry(QUEST_THEAFFRAY);
		if(qle->CanBeFinished() || qle->HasFailed())
			return;

		// try to start the affray
		if(Start())
		{
			qle->SetTrigger(0);
			qle->UpdatePlayerFields();
		}
	}

	void OnChallengerDied()
	{
		GetUnit()->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Challenger is down!");

		phase++;
		if(phase <= 5) // this means we have to fight another challenger.
			RegisterAIUpdateEvent(20000); // next in 20 seconds
		else	// we are ready to fight big will
			RegisterAIUpdateEvent(1000); // in 1 second.
	}

	void OnChallengerSurvived()
	{
		GetUnit()->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Challenger Survived!");

		End();
	}

	void OnBigWillDied()
	{
		GetUnit()->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "The Affray is over!");

		End();
	}

	void OnBigWillSurvived()
	{
		GetUnit()->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Big Will Survived!");

		End();
	}

	// private stuff
	bool Start()
	{
		if(active) return false;

		// all is fine, lets start the affray
		active = true;
		phase = 0;

		GetUnit()->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "The Affray has begun. Choperation. get ready to fight!");

		// after 5 seconds, start
		RegisterAIUpdateEvent(5000);

		return true;
	}

	void End()
	{
		RemoveAIUpdateEvent();
		active = false;
	}

	void AIUpdate()
	{
		RemoveAIUpdateEvent();

		// as long as we killed less than 5, spawn a new challenger
		if(phase < 5)
		{
			SpawnChallenger();
		}
		else if(phase == 5)
		{
			SpawnBigWill();
		}
	}

	void SpawnChallenger()
	{
		GetUnit()->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "You! Enter the fray!");

		Creature *challenger = GetUnit()->GetMapMgr()->GetInterface()->SpawnCreature(NPC_AFFRAYCHALLENGER, SPAWNPOINT_AFFRAYCHALLENGER, true, false, 0, 0);
		if(!challenger)
		{
			// when we get here something bad has happened.
			End();
			return;
		}
	}

	void SpawnBigWill()
	{
		GetUnit()->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "The first stage is over. Big Will... come on down!");

		Creature *will = GetUnit()->GetMapMgr()->GetInterface()->SpawnCreature(NPC_BIGWILL, SPAWNPOINT_BIGWILL, true, false, 0, 0);
		if(!will)
		{
			// when we get here something bad has happened.
			End(); 
			return;  
		}
	}
};

class AffrayChallengerAI : public CreatureAIScript
{
public:
	ADD_CREATURE_FACTORY_FUNCTION(AffrayChallengerAI);
	AffrayChallengerAI(Creature* pCreature) : CreatureAIScript(pCreature) {}

	void OnLoad()
	{
		// Get Twiggy Flathead and store him as linked creature to have nice and easy access to him
		Creature *twiggy = GetUnit()->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(SPAWNPOINT_TWIGGYFLATHEAD, NPC_TWIGGYFLATHEAD);
		if(twiggy)
			SetLinkedCreature(twiggy->GetScript());

		// after 3 minutes we will despawn unless something happens
		RegisterAIUpdateEvent(3*60*1000);
	}

	void AIUpdate()
	{
		RemoveAIUpdateEvent();

		if(GetUnit()->CombatStatus.IsInCombat()) return;

		TwiggyFlatheadAI *twiggy = (TwiggyFlatheadAI *)GetLinkedCreature();
		if(twiggy)
			twiggy->OnChallengerSurvived();

		GetUnit()->Despawn(1,0);
	}

	void OnDied(Unit* mKiller)
	{
		RemoveAIUpdateEvent();

		// good! We were killed so notify Twiggy
		TwiggyFlatheadAI *twiggy = (TwiggyFlatheadAI *)GetLinkedCreature();
		if(twiggy)
			twiggy->OnChallengerDied();
	}

	void OnCombatStop()
	{
		RemoveAIUpdateEvent();

		// well, we are alive and our opponent ran away or died.
		// notify twiggy and despawn
		TwiggyFlatheadAI *twiggy = (TwiggyFlatheadAI *)GetLinkedCreature();
		if(twiggy)
			twiggy->OnChallengerSurvived();

		GetUnit()->Despawn(1,0);
	}
};

class BigWillAI : public CreatureAIScript
{
public:
	ADD_CREATURE_FACTORY_FUNCTION(BigWillAI);
	BigWillAI(Creature* pCreature) : CreatureAIScript(pCreature) {}

	void OnLoad()
	{
		// we are friendly on spawn until we reach the battle place
		GetUnit()->SetFaction(35);

		// Get Twiggy Flathead and store him as linked creature to have nice and easy access to him
		Creature *twiggy = GetUnit()->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(SPAWNPOINT_TWIGGYFLATHEAD, NPC_TWIGGYFLATHEAD);
		if(twiggy)
			SetLinkedCreature(twiggy->GetScript());

		// set path to walk along to the affray
		sEAS.CreateCustomWaypointMap(GetUnit());
		sEAS.WaypointCreate(GetUnit(), -1698, -4344.0f, 4.6f, 0.2f, 0, RUN, 0);
		sEAS.WaypointCreate(GetUnit(), -1684, -4335.0f, 2.9f, 0.7f, 0, RUN, 0);
		sEAS.WaypointCreate(GetUnit(), -1683, -4329.0f, 2.8f, 0.0f, 0, RUN, 0);
		sEAS.EnableWaypoints(GetUnit());

		// after 3 minutes we will despawn unless something happens
		RegisterAIUpdateEvent(3*60*1000);
	}

	void OnReachWP(uint32 i, bool fwd)
	{
		if(i == 3)
		{
			sEAS.DeleteWaypoints(GetUnit());
			GetUnit()->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Ready when you are, warrior.");
			GetUnit()->SetFaction(GetUnit()->GetProto()->Faction);
		}
	}

	void AIUpdate()
	{
		RemoveAIUpdateEvent();

		if(GetUnit()->CombatStatus.IsInCombat()) return;

		TwiggyFlatheadAI *twiggy = (TwiggyFlatheadAI *)GetLinkedCreature();
		if(twiggy)
			twiggy->OnBigWillSurvived();

		GetUnit()->Despawn(1,0);
	}

	void OnDied(Unit* mKiller)
	{
		RemoveAIUpdateEvent();

		// good! We were killed so notify Twiggy
		TwiggyFlatheadAI *twiggy = (TwiggyFlatheadAI *)GetLinkedCreature();
		if(twiggy)
			twiggy->OnBigWillDied();
	}

	void OnCombatStop()
	{
		RemoveAIUpdateEvent();

		// well, we are alive and our opponent ran away or died.
		// notify twiggy and despawn
		TwiggyFlatheadAI *twiggy = (TwiggyFlatheadAI *)GetLinkedCreature();
		if(twiggy)
			twiggy->OnBigWillSurvived();

		GetUnit()->Despawn(1,0);
	}
};

void AreaTriggerHook(Player *pPlayer, uint32 Id)
{
	if(Id == 522 && pPlayer->HasQuest(QUEST_THEAFFRAY))
	{
		Creature *twiggy = pPlayer->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(-1686.14f, -4323.04f, 4.28091f, NPC_TWIGGYFLATHEAD);
		if(twiggy)
			((TwiggyFlatheadAI *)twiggy->GetScript())->OnPlayerEnteredCircle(pPlayer);
	}
}

class TheSummoning : public QuestScript
{
	public:
		void OnQuestStart(Player* pPlayer, QuestLogEntry* qLogEntry)
		{
			Creature *windwatcher = pPlayer->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(), 6176);
			if(!windwatcher) return;

			// questgiver will walk to the place where Cyclonian is spawned
			// only walk when we are at home
			if(windwatcher->CalcDistance(250.839996f, -1470.579956f, 55.4491f) > 1) return;
			{
				windwatcher->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Follow me");
				sEAS.CreateCustomWaypointMap(windwatcher);
				sEAS.WaypointCreate(windwatcher, 269.29f, -1433.32f, 50.31f, 0.19f, 0, 0, 0);
				sEAS.WaypointCreate(windwatcher, 328.52f, -1442.03f, 40.5f, 5.65f, 0, 0, 0);
				sEAS.WaypointCreate(windwatcher, 333.31f, -1453.69f, 42.01f, 4.68f, 0, 0, 0);
				sEAS.EnableWaypoints(windwatcher);
				windwatcher->GetAIInterface()->setMoveType(11);
			}
			windwatcher->Despawn(15*60*1000, 0);

			// spawn cyclonian if not spawned already
			Creature *cyclonian = pPlayer->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(323.947f, -1483.68f, 43.1363f, 6239);
			if(pPlayer->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(323.947f, -1483.68f, 43.1363f, 6239) == NULL)
				cyclonian = sEAS.SpawnCreature(pPlayer, 6239, 323.947f, -1483.68f, 43.1363f, 0.682991f);
			cyclonian->Despawn(15*60*1000, 0);
		}
};

class Bartleby : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(Bartleby);
		Bartleby(Creature* pCreature) : CreatureAIScript(pCreature) {}

		void OnLoad()
		{
			_unit->SetFaction(11);
			_unit->setEmoteState(7);
		}

		void OnDamageTaken(Unit* mAttacker, uint32 fAmount)
		{
			if(_unit->GetUInt32Value(UNIT_FIELD_HEALTH) - fAmount <= _unit->GetUInt32Value(UNIT_FIELD_MAXHEALTH) * 0.37f)
			{
				if(mAttacker->IsPlayer())
				{
					_unit->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					RegisterAIUpdateEvent(1000);
					QuestLogEntry* qle = (TO_PLAYER(mAttacker))->GetQuestLogForEntry(1640);
					if(!qle)
						return;
					qle->SendQuestComplete();
				}
			}
		}

		void AIUpdate()
		{
			_unit->RemoveNegativeAuras();
			_unit->SetFaction(11);
			_unit->SetHealthPct(100);
			_unit->GetAIInterface()->WipeTargetList();
			_unit->GetAIInterface()->WipeHateList();
			_unit->GetAIInterface()->HandleEvent(EVENT_LEAVECOMBAT, _unit, 0);
			_unit->GetAIInterface()->disable_melee = true;
			_unit->GetAIInterface()->SetAllowedToEnterCombat(false);
			_unit->SetUInt32Value(UNIT_FIELD_FLAGS, 0);
		}

		void OnDied(Unit* mKiller)
		{
			RemoveAIUpdateEvent();
		}
};

class BeatBartleby : public QuestScript
{
	public:

		void OnQuestStart(Player* mTarget, QuestLogEntry* qLogEntry)
		{
			float SSX = mTarget->GetPositionX();
			float SSY = mTarget->GetPositionY();
			float SSZ = mTarget->GetPositionZ();

			Creature* Bartleby = mTarget->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(SSX, SSY, SSZ, 6090);

			if(Bartleby == NULL)
				return;

			Bartleby->SetFaction(168);
			Bartleby->GetAIInterface()->disable_melee = false;
			Bartleby->GetAIInterface()->SetAllowedToEnterCombat(true);
		}
};

void SetupWarrior(ScriptMgr* mgr)
{
	// Quest - The Affray
	mgr->register_creature_script(NPC_TWIGGYFLATHEAD, &TwiggyFlatheadAI::Create);
	mgr->register_creature_script(NPC_AFFRAYCHALLENGER, &AffrayChallengerAI::Create);
	mgr->register_creature_script(NPC_BIGWILL, &BigWillAI::Create);
	mgr->register_hook(SERVER_HOOK_EVENT_ON_AREATRIGGER, (void*)&AreaTriggerHook);

	mgr->register_quest_script(6176, new TheSummoning);
	mgr->register_creature_script(6090, &Bartleby::Create);
	mgr->register_quest_script(1640, new BeatBartleby());
}
