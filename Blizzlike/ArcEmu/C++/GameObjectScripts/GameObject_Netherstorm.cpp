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

class TyraliusPrison : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(TyraliusPrison)
		TyraliusPrison(GameObject *goinstance) : GameObjectAIScript(goinstance){}

		void OnActivate(Player *p )
		{
			// Spawning Captain Tyralius
			sEAS.SpawnCreature(p, 20787, p->GetPositionX(), p->GetPositionY(), p->GetPositionZ(), p->GetOrientation(), 2 * 60 * 1000);
		}
};

void SetupNetherstormGameobjects(ScriptMgr * mgr)
{
	mgr->register_gameobject_script(184588, &TyraliusPrison::Create);
}
