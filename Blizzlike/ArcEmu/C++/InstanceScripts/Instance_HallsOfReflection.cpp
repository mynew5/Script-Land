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

class HallsOfReflectionScript : public MoonInstanceScript
{
	public:
		ADD_INSTANCE_FACTORY_FUNCTION(HallsOfReflectionScript)
		HallsOfReflectionScript(MapMgr* pMapMgr) : MoonInstanceScript(pMapMgr){}

		void OnPlayerEnter(Player* pPlayer)
		{
			pPlayer->CastSpell(pPlayer, pPlayer->GetTeam() == TEAM_ALLIANCE ? 55774 : 55773, true);
		}
};
 
void SetupHallsOfReflection(ScriptMgr * mgr)
{
	mgr->register_instance_script(668, &HallsOfReflectionScript::Create);
}
 