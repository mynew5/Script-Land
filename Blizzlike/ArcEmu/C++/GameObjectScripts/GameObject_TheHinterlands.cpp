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

class VilebranchKidnapper : public GameObjectAIScript
{
public:
	ADD_GAMEOBJECT_FACTORY_FUNCTION(VilebranchKidnapper)
	VilebranchKidnapper(GameObject *goinstance) : GameObjectAIScript(goinstance) {}

	void OnActivate(Player *pPlayer)
	{
		LocationVector vect(pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(), pPlayer->GetOrientation());
		for(uint8 i = 0; i < 2; ++i)
		{
			vect.x += RandomFloat(2.0f);
			vect.y += RandomFloat(2.0f);
			sEAS.SpawnCreature(pPlayer, 14748, vect.x, vect.y, vect.z, vect.o, DEFAULT_DESPAWN_TIMER);
		}
	}
};

void SetupTheHinterlandsGameobjects(ScriptMgr * mgr)
{
	mgr->register_gameobject_script(179910, &VilebranchKidnapper::Create);	// Lard's Picnic Basket
}
