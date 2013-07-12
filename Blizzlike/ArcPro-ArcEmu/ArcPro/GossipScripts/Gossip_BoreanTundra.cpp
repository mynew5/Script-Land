/*
 * ArcPro MMORPG Server
 * Copyright (C) 2011-2013 ArcPro Speculation <http://arcpro.sexyi.am/>
 * Copyright (C) 2008-2013 ArcEmu Team <http://www.arcemu.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 */
 
#include "Setup.h"

class TiareGossipScript : public Arcpro::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* Plr)
		{
			Arcpro::Gossip::Menu::SendQuickMenu(pObject->GetGUID(), 1, Plr, 1, 0, "Teleport me to Amber Ledge!");
		}

		void OnSelectOption(Object* pObject, Player* plr, uint32 Id, const char* EnteredCode)
		{
			Arcpro::Gossip::Menu::Complete(plr);
			TO_CREATURE(pObject)->CastSpell(plr, dbcSpell.LookupEntry(50135), true);
		}
		void Destroy() { delete this; }

};

void SetupBoreanTundraGossip(ScriptMgr* mgr)
{
	mgr->register_creature_gossip(30051, new TiareGossipScript);		// Tiare
}