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

//quest #9397
class KaliriNest : public GameObjectAIScript
{
	public:
		KaliriNest(GameObject* goinstance) : GameObjectAIScript(goinstance) {}
		static GameObjectAIScript *Create(GameObject * GO) { return new KaliriNest(GO); }

		void OnActivate(Player * plr)
		{
			// mostly they are males
			if(Rand(20))
				sEAS.SpawnCreature(plr, 17034, plr->GetPositionX(), plr->GetPositionY(), plr->GetPositionZ(), 2*60*1000);
			else
				sEAS.SpawnCreature(plr, 17039, plr->GetPositionX(), plr->GetPositionY(), plr->GetPositionZ(), 2*60*1000);
		}
};

void SetupHellfirePeninsulaGameobjects(ScriptMgr * mgr)
{
	mgr->register_gameobject_script(181582, &KaliriNest::Create);
}