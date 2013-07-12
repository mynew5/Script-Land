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

class ShattrathGuard : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "World's End Tavern", 1);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Bank", 2);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Inn", 3);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Flight Master", 4);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mailbox", 5);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Stable Master", 6);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Battlemaster", 7);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Profession Trainer", 8);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mana Loom", 9);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy Lab", 10);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Gem Merchant", 11);
			menu.Send(plr);
		}

		void GossipSelectOption(Object* pObject, Player* Plr, uint32 Id, const char* Code)
		{
			switch(Id)
			{
				case 0:	OnHello(pObject, Plr);	break;
				case 1:     // World's End Tavern
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10394, Plr);
						Plr->Gossip_SendPOI(-1760.4f, 5166.9f, 7, 6, 0, "World's End Tavern");
					}break;
				case 2:     // Shattrath Banks
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 10395);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Aldor Bank"          , 12);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Scryers Bank"         , 13);
						menu.Send(Plr);
					}break;
				case 3:     // Inn's
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 10398);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Aldor inn"          , 14);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Scryers inn"         , 15);
						menu.Send(Plr);
					}break;
				case 4:     // Gryphon Master
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10402, Plr);
						Plr->Gossip_SendPOI(-1831.9f, 5298.2f, 7, 6, 0, "Gryphon Master");
					}break;
				case 5:     // Mailboxes
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 10403);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Aldor inn"          , 16);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Scryers inn"         , 17);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Aldor Bank"          , 18);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Scryers Bank"         , 19);
						menu.Send(Plr);
					}break;
				case 6:     // Stable Masters
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 10404);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Aldor Stable"          , 20);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Scryers Stable"         , 21);
						menu.Send(Plr);
					}break;
				case 7:     // Battlemasters
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 10405);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alliance Battlemasters"          , 22);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Horde & Arena Battlemasters"         , 23);
						menu.Send(Plr);
					}break;
				case 8:     // Proffesion Trainers
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 10391);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy"          , 24);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Blacksmithing"         , 25);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cooking"          , 26);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Enchanting"         , 27);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "First Aid"          , 28);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Jewelcrafting"         , 29);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leatherworking"          , 30);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Skinning"         , 31);
						menu.Send(Plr);
					}break;
				case 9:     // Mana Loom
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10408, Plr);
						Plr->Gossip_SendPOI(-2073.9f, 5265.7f, 7, 6, 0, "Mana Loom");
					}break;
				case 10:    // Alchemy Lab
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10409, Plr);
						Plr->Gossip_SendPOI(-1648.1f, 5537.3f, 7, 6, 0, "Alchemy Lab");
					}break;
				case 11:    // Gem Merchants
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 10410);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Aldor Gem Merchant"          , 32);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Scryer Gem Merchant"         , 33);
						menu.Send(Plr);
					}break;
				case 12: //Aldor Bank
					{
						Plr->Gossip_SendPOI(-1730.8f, 5496.2f, 7, 6, 0, "Aldor Bank");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10396, Plr);
					}break;
				case 13: //Scryers Bank
					{
						Plr->Gossip_SendPOI(-1999.6f, 5362.0f, 7, 6, 0, "Scryers Bank");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10397, Plr);
					}break;
				case 14: //Aldor Inn
					{
						Plr->Gossip_SendPOI(-1897.5f, 5767.6f, 7, 6, 0, "Aldor inn");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10399, Plr);
					}break;
				case 15: //Scryers Inn
					{
						Plr->Gossip_SendPOI(-2180.6f, 5403.9f, 7, 6, 0, "Scryers inn");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10401, Plr);
					}break;
				case 16: //Aldor Inn
					{
						Plr->Gossip_SendPOI(-1886.9f, 5761.5f, 7, 6, 0, "Aldor Inn");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10399, Plr);
					}break;
				case 17: //Scryers Bank
					{
						Plr->Gossip_SendPOI(-2175.0f, 5411.7f, 7, 6, 0, "Scryers Bank");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10397, Plr);
					}break;
				case 18: //Aldor Bank
					{
						Plr->Gossip_SendPOI(-1695.5f, 5521.8f, 7, 6, 0, "Aldor Bank");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10396, Plr);
					}break;
				case 19: //Scryers Inn
					{
						Plr->Gossip_SendPOI(-2033.0f, 5336.1f, 7, 6, 0, "Scryers Inn");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10401, Plr);
					}break;
				case 20: //Aldor Stable Master
					{
						Plr->Gossip_SendPOI(-1889.6f, 5761.5f, 7, 6, 0, "Aldor Stable");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10399, Plr);
					}break;
				case 21: //Scryers Stable Master
					{
						Plr->Gossip_SendPOI(-2170.0f, 5404.6f, 7, 6, 0, "Scryers Stable");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10401, Plr);
					}break;
				case 22: //Alliance Battlemaster
					{
						Plr->Gossip_SendPOI(-1831.9f, 5298.2f, 7, 6, 0, "Alliance Battlemasters");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10406, Plr);
					}break;
				case 23: //Horde Battle Master and Arena Battle Master
					{
						Plr->Gossip_SendPOI(-1968.7f, 5262.2f, 7, 6, 0, "Horde & Arena Battlemasters");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10407, Plr);
					}break;
				case 24: //Alchemy
					{
						Plr->Gossip_SendPOI(-1661.0f, 5538, 7, 6, 0, "Alchemy Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10413, Plr);
					}break;
				case 25: //Blacksmithing
					{
						Plr->Gossip_SendPOI(-1847.7f, 5230.3f, 7, 6, 0, "Blacksmithing Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10400, Plr);
					}break;
				case 26: //Cooking
					{
						Plr->Gossip_SendPOI(-2067.4f, 5316.5f, 7, 6, 0, "Cooking Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10414, Plr);
					}break;
				case 27: //Enchanting
					{
						Plr->Gossip_SendPOI(-2278.5f, 5567.7f, 7, 6, 0, "Enchanting Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10415, Plr);
					}break;
				case 28: //First Aid
					{
						Plr->Gossip_SendPOI(-1592.0f, 5263.7f, 7, 6, 0, "First Aid Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10416, Plr);
					}break;
				case 29: //Jewelcrafting
					{
						Plr->Gossip_SendPOI(-1653.3f, 5665.1f, 7, 6, 0, "Jewelcrafting Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10417, Plr);
					}break;
				case 30: //Leatherworking
					{
						Plr->Gossip_SendPOI(-2060.9f, 5256.6f, 7, 6, 0, "Leatherworking Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10418, Plr);
					}break;
				case 31: //Skinning
					{
						Plr->Gossip_SendPOI(-2047.9f, 5299.6f, 7, 6, 0, "Skinning Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10419, Plr);
					}break;
				case 32: //Aldor gem merchant
					{
						Plr->Gossip_SendPOI(-1649.3f, 5668.6f, 7, 6, 0, "Aldor gem merchant");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10411, Plr);
					}break;
				case 33: //Scryers gem merchant
					{
						Plr->Gossip_SendPOI(-2193.9f, 5422.1f, 7, 6, 0, "Scryers gem merchant");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10412, Plr);
					}break;
			}
		}
};


// Exarch Nasuun
#define GOSSIP_EXARCH_NASUUN_1    "Nasuun, do you know how long until we have an alchemy lab at the Sun's Reach Harbor?"
#define GOSSIP_EXARCH_NASUUN_2    "What do you know about the magical gates at the Sunwell Plateau being brought down?"
#define GOSSIP_EXARCH_NASUUN_3    "I have something else to ask you about."

//#define USE_THE_STATUS	// Decoment this is for the status

class ExarchNasuun_Gossip : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), plr->GetSession()->language);
#ifdef USE_THE_STATUS
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, GOSSIP_EXARCH_NASUUN_1, 1);   // this is the status
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, GOSSIP_EXARCH_NASUUN_2, 2);
#else
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, GOSSIP_EXARCH_NASUUN_2, 3);
#endif
			menu.Send(plr);
		}

		void OnSelectOption(Object* pObject, Player* plr, uint32 Id, const char* Code)
		{
			switch(Id)
			{
				case 0:	OnHello(pObject, plr);	break;
				case 1:	Arcemu::Gossip::Menu::SendQuickMenu(pObject->GetGUID(), 12303, plr, 0, Arcemu::Gossip::ICON_CHAT, GOSSIP_EXARCH_NASUUN_3);	break;
				case 2:	Arcemu::Gossip::Menu::SendQuickMenu(pObject->GetGUID(), 12305, plr, 0, Arcemu::Gossip::ICON_CHAT, GOSSIP_EXARCH_NASUUN_3);	break;
				case 3:	Arcemu::Gossip::Menu::SendQuickMenu(pObject->GetGUID(), 12623, plr, 0, Arcemu::Gossip::ICON_CHAT, GOSSIP_EXARCH_NASUUN_3);	break;
			}
		}
};

class ZephyrGossipScript : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* Plr)
		{
			Arcemu::Gossip::Menu::SendQuickMenu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr, 1, Arcemu::Gossip::ICON_CHAT, "Bring me to Caverns of Time!");
		}

		void OnSelectOption(Object* pObject, Player* plr, uint32 Id, const char* EnteredCode)
		{
			if(plr->GetStanding(989) >= 21000)
				//plr->SafeTeleport( 1, 0, -8170.441406f, -4751.321777f, 33.457771f, 5.136f);
				TO_CREATURE(pObject)->CastSpell(plr, dbcSpell.LookupEntry(37778), true);
			else
				plr->BroadcastMessage("You need to be Revered with the faction Keepers of Time!"); // Dunno what the correct text is ^^
			Arcemu::Gossip::Menu::Complete(plr);
		}
};

class AldorScryerFlaskVendor_Gossip : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* plr)
		{
			if(pObject->GetEntry() == 23484)
			{
				if((plr->GetStandingRank(932) == STANDING_EXALTED) 
				&& (plr->GetStandingRank(935) == STANDING_EXALTED)
				&& (plr->GetStandingRank(942) == STANDING_EXALTED))
					Arcemu::Gossip::Menu::SendQuickMenu(pObject->GetGUID(), 11085, plr, 1, Arcemu::Gossip::VENDOR, plr->GetSession()->LocalizedWorldSrv(Arcemu::Gossip::VENDOR));
				else
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 11083, plr);
			}
			else
			{
				if((plr->GetStandingRank(934) == STANDING_EXALTED) 
				&& (plr->GetStandingRank(935) == STANDING_EXALTED)
				&& (plr->GetStandingRank(942) == STANDING_EXALTED))
					Arcemu::Gossip::Menu::SendQuickMenu(pObject->GetGUID(), 11085, plr, 1, Arcemu::Gossip::VENDOR, plr->GetSession()->LocalizedWorldSrv(Arcemu::Gossip::VENDOR));
				else
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 11084, plr);
			}
		}

		void OnSelectOption(Object* pObject, Player* plr, uint32 Id, const char* Code)
		{
			if(Id == 1)
				plr->GetSession()->SendInventoryList(TO_CREATURE(pObject));
		}
};

void SetupTerrokarForestGossip(ScriptMgr* mgr)
{
	mgr->register_creature_gossip(19687, new ShattrathGuard);		// Shattrath City Guard
	mgr->register_creature_gossip(18568, new ShattrathGuard);		// Shattrath City Guard
	mgr->register_creature_gossip(18549, new ShattrathGuard);		// Shattrath City Guard
	mgr->register_creature_gossip(25967, new ZephyrGossipScript);	// Zephyr
	mgr->register_creature_gossip(24932, new ExarchNasuun_Gossip);	// Exarch Nasuun
	mgr->register_creature_gossip(23484, new AldorScryerFlaskVendor_Gossip);	// Exarch Nasuun
	mgr->register_creature_gossip(23483, new AldorScryerFlaskVendor_Gossip);	// Exarch Nasuun
}
