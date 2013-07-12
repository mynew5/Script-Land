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

#define GOSSIP_AK_ITEM_1 "Grant me your mark, wise ancient."
#define GOSSIP_AK_ITEM_2 "Grant me your mark, mighty ancient."

class AshyenAndKeleth_Gossip : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), plr->GetSession()->language);
			if(plr->GetStandingRank(942) > STANDING_NEUTRAL)
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, pObject->GetEntry() == 17900 ? GOSSIP_AK_ITEM_1 : GOSSIP_AK_ITEM_2, 1);
			menu.Send(plr);
		}

		void OnSelectOption(Object* pObject, Player* plr, uint32 Id, const char* Code)
		{
			if(Id == 1)
			{
				if(pObject->GetEntry() == 17900)
				{
					switch(plr->GetStandingRank(942))
					{
						case STANDING_FRIENDLY: TO_CREATURE(pObject)->CastSpell(plr, 31808, true); break;
						case STANDING_HONORED: TO_CREATURE(pObject)->CastSpell(plr, 31810, true); break;
						case STANDING_REVERED: TO_CREATURE(pObject)->CastSpell(plr, 31811, true); break;
						case STANDING_EXALTED: TO_CREATURE(pObject)->CastSpell(plr, 31815, true); break;
					}
				}
				else
				{
					switch(plr->GetStandingRank(942))
					{
						case STANDING_FRIENDLY: TO_CREATURE(pObject)->CastSpell(plr, 31807, true); break;
						case STANDING_HONORED: TO_CREATURE(pObject)->CastSpell(plr, 31812, true); break;
						case STANDING_REVERED: TO_CREATURE(pObject)->CastSpell(plr, 31813, true); break;
						case STANDING_EXALTED: TO_CREATURE(pObject)->CastSpell(plr, 31814, true); break;
					}
				}
			}
		}
};

void SetupZangarmarshGossip(ScriptMgr * mgr)
{
	mgr->register_creature_gossip(17900, new AshyenAndKeleth_Gossip);
	mgr->register_creature_gossip(17901, new AshyenAndKeleth_Gossip);
}
