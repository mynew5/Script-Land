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

class APlagueUponThee : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(APlagueUponThee)
		APlagueUponThee(GameObject *goinstance) : GameObjectAIScript(goinstance) {}

		void OnActivate(Player *pPlayer)
		{
			if(pPlayer->GetQuestLogForEntry(5902) || pPlayer->GetQuestLogForEntry(5904))
			{
				if(sEAS.GetNearestGameObject(pPlayer, 177491))
					sEAS.SpawnGameobject(pPlayer, 177491, 2449.51f, -1662.32f, 104.38f, pPlayer->GetOrientation(),  1.0f, 0, 0, 0.695946f, -0.718095f);
			}
		}
};

class AndorhalTower1 : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(AndorhalTower1)
		AndorhalTower1(GameObject *goinstance) : GameObjectAIScript( goinstance ) {}

		void OnActivate(Player *p )
		{
			QuestLogEntry *qle = p->GetQuestLogForEntry(5097);
			if(qle == NULL)
			{
				qle = p->GetQuestLogForEntry(5098);
				if(qle == NULL)
					return;
			}
			
			if(qle->GetMobCount(0) < qle->GetQuest()->required_mobcount[0])
			{
				qle->SetMobCount(0, qle->GetMobCount(0)+1);
				qle->SendUpdateAddKill(0);
				qle->UpdatePlayerFields();
			}
		}
};

class AndorhalTower2 : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(AndorhalTower2)
		AndorhalTower2( GameObject *goinstance ) : GameObjectAIScript( goinstance ) {}

		void OnActivate(Player *p)
		{
			QuestLogEntry *qle = p->GetQuestLogForEntry(5097);
			if(qle == NULL)
			{
				qle = p->GetQuestLogForEntry(5098);
				if(qle == NULL)
					return;
			}
			
			if(qle->GetMobCount(1) < qle->GetQuest()->required_mobcount[1])
			{
				qle->SetMobCount(1, qle->GetMobCount(1)+1);
				qle->SendUpdateAddKill(1);
				qle->UpdatePlayerFields();
			}
		}
};

class AndorhalTower3 : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(AndorhalTower3)
		AndorhalTower3(GameObject *goinstance) : GameObjectAIScript( goinstance ){}

		void OnActivate(Player *p)
		{
			QuestLogEntry *qle = p->GetQuestLogForEntry(5097);
			if(qle == NULL)
			{
				qle = p->GetQuestLogForEntry(5098);
				if(qle == NULL)
					return;
			}
			
			if(qle->GetMobCount(2) < qle->GetQuest()->required_mobcount[2])
			{
				qle->SetMobCount(2, qle->GetMobCount(2)+1);
				qle->SendUpdateAddKill(2);
				qle->UpdatePlayerFields();
			}
		}
};

class AndorhalTower4 : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(AndorhalTower4)
		AndorhalTower4( GameObject *goinstance ) : GameObjectAIScript( goinstance ){}

		void OnActivate(Player *p)
		{
			QuestLogEntry *qle = p->GetQuestLogForEntry(5097);
			if(qle == NULL)
			{
				qle = p->GetQuestLogForEntry(5098);
				if(qle == NULL)
					return;
			}
			
			if(qle->GetMobCount(3) < qle->GetQuest()->required_mobcount[3])
			{
				qle->SetMobCount(3, qle->GetMobCount(3)+1);
				qle->SendUpdateAddKill(3);
				qle->UpdatePlayerFields();
			}
		}
};

void SetupWesternPlaguelandsQuests(ScriptMgr * mgr)
{
	mgr->register_gameobject_script(177490, &APlagueUponThee::Create);	// Northridge Lumber Mill Crate

	mgr->register_gameobject_script(310030, &AndorhalTower1::Create);
	mgr->register_gameobject_script(310031, &AndorhalTower2::Create);
	mgr->register_gameobject_script(310032, &AndorhalTower3::Create);
	mgr->register_gameobject_script(310033, &AndorhalTower4::Create);
}
