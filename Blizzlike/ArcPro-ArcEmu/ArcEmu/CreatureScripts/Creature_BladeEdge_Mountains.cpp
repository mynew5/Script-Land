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

//Nihil the Banished
class NihilTheBanished : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(NihilTheBanished)
		NihilTheBanished(Creature *pCreature) : MoonScriptCreatureAI(pCreature) {}

		void OnLoad()
		{
			RegisterAIUpdateEvent(5000);
			_unit->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_9);
			_unit->GetAIInterface()->SetAllowedToEnterCombat(false);
			_unit->GetAIInterface()->disable_melee = true;
			_unit->GetAIInterface()->m_canMove = false;

			Emote("Muahahahahaha! You fool! you've released me from my banishment in the interstices between space and time!", Text_Yell, 0, EMOTE_ONESHOT_NONE, 5000);
			Emote("All of Draenor shall quake beneath my feet! i Will destroy this world and reshape it in my immage!", Text_Yell, 0, EMOTE_ONESHOT_NONE, 10000);
			Emote("Where shall i Begin? i cannot bother myself with a worm such as yourself. Theres a World to be Conquered!", Text_Yell, 0, EMOTE_ONESHOT_NONE, 15000);
			Emote("No doubt the fools that banished me are long dead. i shall take the wing and survey my new demense, Pray to whatever gods you hold dear that we do not meet again.", Text_Yell, 0, EMOTE_ONESHOT_NONE, 20000);
		}
};

//Bloodmaul Brutebane Stout Trigger
class BrutebaneStoutTrigger : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(BrutebaneStoutTrigger)
		BrutebaneStoutTrigger(Creature *pCreature) : MoonScriptCreatureAI(pCreature)
		{
			_unit->Root();
			Plr = _unit->GetMapMgr()->GetInterface()->GetPlayerNearestCoords(_unit->GetPositionX(), _unit->GetPositionY(), _unit->GetPositionZ());

			uint32 BladespireOgres[] = {19995, 19998, 20756, 0};
			Ogre = _unit->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(_unit->GetPositionX(), _unit->GetPositionY(), _unit->GetPositionZ(), (uint32)BladespireOgres);
			if(Ogre)
				Ogre->GetAIInterface()->_CalcDestinationAndMove(_unit, 0.3f);

			RegisterAIUpdateEvent(1000);
		}

		void AIUpdate()
		{
			MoonScriptCreatureAI::AIUpdate();
			if(Ogre == NULL)
				return;

			if(_unit->CalcDistance(Ogre) <= 5)
			{
				Ogre->SetEquippedItem(MELEE, 28562);
				Ogre->SetEmoteState(EMOTE_ONESHOT_EAT_NOSHEATHE);
				Ogre->SetFaction(35);
				Ogre->SetStandState(STANDSTATE_SIT);
				Ogre->Despawn(60000, 3*60*1000);

				if(GameObject *Mug = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(_unit->GetPositionX(), _unit->GetPositionY(), _unit->GetPositionZ(), 184315))
					Mug->Despawn(0, 0);

				if(Plr != NULL)
				{
					QuestLogEntry* pQuest = Plr->GetQuestLogForEntry(10512);
					if(pQuest && pQuest->GetMobCount(0) < pQuest->GetQuest()->required_mobcount[0])
					{
						pQuest->SetMobCount(0, pQuest->GetMobCount(0) + 1);
						pQuest->SendUpdateAddKill(0);
						pQuest->UpdatePlayerFields();
					}
				}
				_unit->Despawn(0, 0);
			}
		}

	private:
		Player* Plr;
		Creature* Ogre;
};

void SetupBladeEdgeMountainsCreature(ScriptMgr * mgr)
{
	mgr->register_creature_script(21823, &NihilTheBanished::Create);
	mgr->register_creature_script(21241, &BrutebaneStoutTrigger::Create);
}
