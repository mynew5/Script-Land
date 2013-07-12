/*
 * ArcPro MMORPG Server
 * Copyright (C) 2011-2013 ArcPro Speculation <http://arcpro.sexyi.am/>
 * Copyright (C) 2007-2008 Moon++ Team <http://www.moonplusplus.info/>
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

class ErelasAmbersky_Gossip : public Arcpro::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* plr)
		{
			Arcpro::Gossip::Menu::SendQuickMenu(pObject->GetGUID(), 2153, plr, 1, Arcpro::Gossip::ICON_CHAT, "Tell me more about these hippogryphs.");
		}

		void GossipSelectOption(Object* pObject, Player* plr, uint32 Id, const char* Code)
		{
			Arcpro::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2154, plr);
		}

		void Destroy() { delete this; }
};

void SetupTeldrassilGossip(ScriptMgr* mgr)
{
	mgr->register_creature_gossip(7916, new ErelasAmbersky_Gossip); // Erelas Ambersky
}
