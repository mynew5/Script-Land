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

class StrongholdCache : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(StrongholdCache)
		StrongholdCache(GameObject * goinstance) : GameObjectAIScript(goinstance) {}

		void OnActivate(Player * pPlayer)
		{
			uint32 spellid = 0;
			switch( RandomUInt(3) )
			{
				case 0: spellid = 52647; break;// spell: "Hex of Agony".
				case 1: spellid = 52645; break;// spell: "Hex of Weakness".
				case 2: spellid = 52652; break;// spell: "Hex of Tongues".
				// case 3 do nothing, not all times you got debuffed
			}

			if(spellid == 0)
				return;

			Spell * spell = new Spell(_gameobject, dbcSpell.LookupEntryForced(spellid), true, NULL);
			SpellCastTargets targets(pPlayer->GetGUID());
			spell->prepare(&targets);
		}
};

void SetupZulDrakGameobjects(ScriptMgr * mgr)
{
	mgr->register_gameobject_script(190836, &StrongholdCache::Create);	// Zol'Maz Stronghold Cache
}
