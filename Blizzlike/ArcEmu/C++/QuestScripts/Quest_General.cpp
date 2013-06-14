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

class Quest_Grimoire_Business : public QuestScript
{
	public:
		void OnQuestStart(Player* mTarget, QuestLogEntry* qLogEntry)
		{
			sEAS.SpawnCreature(mTarget, 22911, 3279.67f, 4640.77f, 216.526f, 1.3516f, 2 * 60 * 1000);
		}

};

class Quest_Maggocs_Treasure_Chest : public QuestScript
{
	public:
		void OnQuestStart(Player* mTarget, QuestLogEntry* qLogEntry)
		{
			mTarget->GetMapMgr()->GetInterface()->SpawnCreature(20600, 2001.76f, 5164.77f, 265.19f, 5.5148f, true, false, 0, 0);
		}

};

class Quest_Grulloc_Has_Two_Skulls : public QuestScript
{
	public:
		void OnQuestStart(Player* mTarget, QuestLogEntry* qLogEntry)
		{
			sEAS.SpawnCreature(mTarget, 20216, 2687.46f, 5541.14f, -1.93669f, 3.52847f, 2 * 60 * 1000);
		}

};

class Quest_Zuluhed_the_Whacked : public QuestScript
{
	public:
		void OnQuestStart(Player* mTarget, QuestLogEntry* qLogEntry)
		{
			sEAS.SpawnCreature(mTarget, 11980, -4177.39f, 376.289f, 117.78f, 2.7381f, 2 * 60 * 1000);
		}

};

void SetupGeneralQuests(ScriptMgr* mgr)
{
	mgr->register_quest_script(10998, new Quest_Grimoire_Business());
	mgr->register_quest_script(10996, new Quest_Maggocs_Treasure_Chest());
	mgr->register_quest_script(10995, new Quest_Grulloc_Has_Two_Skulls());
	mgr->register_quest_script(10866, new Quest_Zuluhed_the_Whacked());
}
