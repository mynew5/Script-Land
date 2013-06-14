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

class OrgrimmarGuard : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The bank", 1);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The wind rider master", 2);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The guild master", 3);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The inn", 4);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The mailbox", 5);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The auction house", 6);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The zeppelin master", 7);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The weapon master", 8);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The stable master", 9);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The officers' lounge", 10);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The battlemaster", 11);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "A class trainer", 12);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "A profession trainer", 13);
			menu.Send(plr);
		}

		void OnSelectOption(Object* pObject, Player* Plr, uint32 Id, const char* Code)
		{
			switch(Id)
			{
				case 0: OnHello(pObject, Plr); break;    // Return to start
				case 1:     // The bank
					{
						Plr->Gossip_SendPOI(1631.51f, -4375.33f, 7, 99, 0, "Bank of Orgrimmar");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2554, Plr);
					}break;
				case 2:     // The wind rider master
					{
						Plr->Gossip_SendPOI(1676.6f, -4332.72f, 7, 99, 0, "The Sky Tower");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2555, Plr);
					}break;
				case 3:     // The guild master
					{
						Plr->Gossip_SendPOI(1576.93f, -4294.75f, 7, 99, 0, "Horde Embassy");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2556, Plr);
					}break;
				case 4:     // The inn
					{
						Plr->Gossip_SendPOI(1644.51f, -4447.27f, 7, 99, 0, "Orgrimmar Inn");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2557, Plr);
					}break;
				case 5:     // The mailbox
					{
						Plr->Gossip_SendPOI(1622.53f, -4388.79f, 7, 99, 0, "Orgrimmar Mailbox");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2558, Plr);
					}break;
				case 6:     // The auction house
					{
						Plr->Gossip_SendPOI(1679.21f, -4450.1f, 7, 99, 0, "Orgrimmar Auction House");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3075, Plr);
					}break;
				case 7:     // The zeppelin master
					{
						Plr->Gossip_SendPOI(1337.36f, -4632.7f, 7, 99, 0, "Orgrimmar Zeppelin Tower");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3173, Plr);
					}break;
				case 8:     // The weapon master
					{
						Plr->Gossip_SendPOI(2092.56f, -4823.95f, 7, 99, 0, "Sayoc & Hanashi");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4519, Plr);
					}break;
				case 9:     // The stable master
					{
						Plr->Gossip_SendPOI(2133.12f, -4663.93f, 7, 99, 0, "Xon'cha");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 5974, Plr);
					}break;
				case 10:    // The officers' lounge
					{
						Plr->Gossip_SendPOI(1633.56f, -4249.37f, 7, 99, 0, "Hall of Legends");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 7046, Plr);
					}break;
				case 11:    // The battlemaster
					{
						Plr->Gossip_SendPOI(1990.41f, -4794.15f, 7, 99, 0, "Battlemasters Orgrimmar");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 7521, Plr);
					}break;
				case 12:    // A class trainer
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 2599);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Hunter"       , 14);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mage"         , 15);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Priest"       , 16);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Shaman"       , 17);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Rogue"        , 18);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warlock"      , 19);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warrior"      , 20);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Paladin"      , 21);
						menu.Send(Plr);
					}break;
				case 13:    // A profession trainer
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 2594);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy"           , 22);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Blacksmithing"     , 23);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cooking"           , 24);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Enchanting"        , 25);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Engineering"       , 26);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "First Aid"         , 27);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Fishing"           , 28);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Herbalism"         , 29);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leatherworking"    , 30);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mining"            , 31);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Skinning"          , 32);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Tailoring"         , 33);
						menu.Send(Plr);
					}break;
				case 14: //Hunter
					{
						Plr->Gossip_SendPOI(2114.84f, -4625.31f, 7, 99, 0, "Orgrimmar Hunter's Hall");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2559, Plr);
					}break;
				case 15: //Mage
					{
						Plr->Gossip_SendPOI(1451.26f, -4223.33f, 7, 99, 0, "Darkbriar Lodge");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2560, Plr);
					}break;
				case 16: //Priest
					{
						Plr->Gossip_SendPOI(1442.21f, -4183.24f, 7, 99, 0, "Spirit Lodge");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2561, Plr);
					}break;
				case 17: //Shaman
					{
						Plr->Gossip_SendPOI(1925.34f, -4181.89f, 7, 99, 0, "Thrall's Fortress");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2562, Plr);
					}break;
				case 18: //Rogue
					{
						Plr->Gossip_SendPOI(1773.39f, -4278.97f, 7, 99, 0, "Shadowswift Brotherhood");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2563, Plr);
					}break;
				case 19: //Warlock
					{
						Plr->Gossip_SendPOI(1849.57f, -4359.68f, 7, 99, 0, "Darkfire Enclave");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2564, Plr);
					}break;
				case 20: //Warrior
					{
						Plr->Gossip_SendPOI(1983.92f, -4794.2f, 7, 99, 0, "Hall of the Brave");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2565, Plr);
					}break;
				case 21: //Paladin
					{
						Plr->Gossip_SendPOI(1937.53f, -4141.0f, 7, 99, 0, "Thrall's Fortress");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2566, Plr);
					}break;
				case 22: //Alchemy
					{
						Plr->Gossip_SendPOI(1955.17f, -4475.79f, 7, 99, 0, "Yelmak's Alchemy and Potions");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2497, Plr);
					}break;
				case 23: //Blacksmithing
					{
						Plr->Gossip_SendPOI(2054.34f, -4831.85f, 7, 99, 0, "The Burning Anvil");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2499, Plr);
					}break;
				case 24: //Cooking
					{
						Plr->Gossip_SendPOI(1780.96f, -4481.31f, 7, 99, 0, "Borstan's Firepit");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2500, Plr);
					}break;
				case 25: //Enchanting
					{
						Plr->Gossip_SendPOI(1917.5f, -4434.95f, 7, 99, 0, "Godan's Runeworks");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2501, Plr);
					}break;
				case 26: //Engineering
					{
						Plr->Gossip_SendPOI(2038.45f, -4744.75f, 7, 99, 0, "Nogg's Machine Shop");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2653, Plr);
					}break;
				case 27: //First Aid
					{
						Plr->Gossip_SendPOI(1485.21f, -4160.91f, 7, 99, 0, "Survival of the Fittest");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2502, Plr);
					}break;
				case 28: //Fishing
					{
						Plr->Gossip_SendPOI(1994.15f, -4655.7f, 7, 99, 0, "Lumak's Fishing");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2503, Plr);
					}break;
				case 29: //Herbalism
					{
						Plr->Gossip_SendPOI(1898.61f, -4454.93f, 7, 99, 0, "Jandi's Arboretum");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2504, Plr);
					}break;
				case 30: //Leatherworking
					{
						Plr->Gossip_SendPOI(1852.82f, -4562.31f, 7, 99, 0, "Kodohide Leatherworkers");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2513, Plr);
					}break;
				case 31: //Mining
					{
						Plr->Gossip_SendPOI(2029.79f, -4704, 7, 99, 0, "Red Canyon Mining");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2515, Plr);
					}break;
				case 32: //Skinning
					{
						Plr->Gossip_SendPOI(1852.82f, -4562.31f, 7, 99, 0, "Kodohide Leatherworkers");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2516, Plr);
					}break;
				case 33: //Tailoring
					{
						Plr->Gossip_SendPOI(1802.66f, -4560.66f, 7, 99, 0, "Magar's Cloth Goods");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2518, Plr);
					}break;
			}
		}
};

class RazorHillGuard : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* Plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The bank"				, 1);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The wind rider master"	, 2);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The inn"				, 3);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The stable master"		, 4);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "A class trainer"		, 5);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "A profession trainer"	, 6);
			menu.Send(Plr);
		}

		void OnSelectOption(Object* pObject, Player* Plr, uint32 Id, const char * Code)
		{
			switch(Id)
			{
				case 0: OnHello(pObject, Plr); break;
				case 1:		// The bank
					{
						Plr->Gossip_SendPOI(1631.51f, -4375.33f, 7, 99, 0, "Bank of Orgrimmar");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4032, Plr);
					}break;
				case 2:		// The wind rider master
					{
						Plr->Gossip_SendPOI(1676.6f, -4332.72f, 7, 99, 0, "The Sky Tower");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4033, Plr);
					}break;
				case 3:		// The inn
					{
						Plr->Gossip_SendPOI(338.7f, -4688.87f, 7, 99, 0, "Razor Hill Inn");	  
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4034, Plr);
					}break;
				case 4:		// The stable master
					{
						Plr->Gossip_SendPOI(330.31f, -4710.66f, 7, 99, 0, "Shoja'my");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 5973, Plr);
					}break;
				case 5:		// A class trainer
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 4035);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Hunter"	, 7);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mage"		, 8);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Priest"	, 9);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Rogue"		, 10);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Shaman"	, 11);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warlock"	, 12);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warrior"	, 13);
						menu.Send(Plr);
					}break;
				case 6:		// A profession trainer
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 3541);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy"		, 14);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Blacksmithing"	, 15);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cooking"		, 16);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Enchanting"	, 17);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Engineering"	, 18);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "First Aid"		, 19);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Fishing"		, 20);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Herbalism"		, 21);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leatherworking", 22);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mining"		, 23);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Skinning"		, 24);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Tailoring"		, 25);
						menu.Send(Plr);
					}break;
				case 7:		//Hunter
					{
						Plr->Gossip_SendPOI(276.0f, -4706.72f, 7, 99, 0, "Thotar");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4013, Plr);
					}break;
				case 8:		//Mage
					{
						Plr->Gossip_SendPOI(-839.33f, -4935.6f, 7, 99, 0, "Un'Thuwa");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4014, Plr);
					}break;
				case 9:		//Priest
					{
						Plr->Gossip_SendPOI(296.22f, -4828.1f, 7, 99, 0, "Tai'jin");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4015, Plr);
					}break;
				case 10:	//Rogue
					{
						Plr->Gossip_SendPOI(265.76f, -4709, 7, 99, 0, "Kaplak");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4016, Plr);
					}break;
				case 11:	//Shaman
					{
						Plr->Gossip_SendPOI(307.79f, -4836.97f, 7, 99, 0, "Swart");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4017, Plr);
					}break;
				case 12:	//Warlock
					{
						Plr->Gossip_SendPOI(355.88f, -4836.45f, 7, 99, 0, "Dhugru Gorelust");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4018, Plr);
					}break;
				case 13:	//Warrior
					{
						Plr->Gossip_SendPOI(312.3f, -4824.66f, 7, 99, 0, "Tarshaw Jaggedscar");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4019, Plr);
					}break;
				case 14:	//Alchemy
					{
						Plr->Gossip_SendPOI(-800.25f, -4894.33f, 7, 99, 0, "Miao'zan");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4020, Plr);
					}break;
				case 15:	//Blacksmithing
					{
						Plr->Gossip_SendPOI(373.24f, -4716.45f, 7, 99, 0, "Dwukk");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4021, Plr);
					}break;
				case 16:	//Cooking
					{
						Plr->Gossip_SendPOI(1780.96f, -4481.31f, 7, 99, 0, "Borstan's Firepit");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4022, Plr);
					}break;
				case 17:	//Enchanting
					{
						Plr->Gossip_SendPOI(1917.5f, -4434.95f, 7, 99, 0, "Godan's Runeworks");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4023, Plr);
					}break;
				case 18:	//Engineering
					{
						Plr->Gossip_SendPOI(368.95f, -4723.95f, 7, 99, 0, "Mukdrak");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4024, Plr);
					}break;
				case 19:	//First Aid
					{
						Plr->Gossip_SendPOI(327.17f, -4825.62f, 7, 99, 0, "Rawrk");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4025, Plr);
					}break;
				case 20:	//Fishing
					{
						Plr->Gossip_SendPOI(-1065.48f, -4777.43f, 7, 99, 0, "Lau'Tiki");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4026, Plr);
					}break;
				case 21:	//Herbalism
					{
						Plr->Gossip_SendPOI(-836.25f, -4896.89f, 7, 99, 0, "Mishiki");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4027, Plr);
					}break;
				case 22:	//Leatherworking
					{
						Plr->Gossip_SendPOI(1852.82f, -4562.31f, 7, 99, 0, "Kodohide Leatherworkers");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4028, Plr);
					}break;
				case 23:	//Mining
					{
						Plr->Gossip_SendPOI(366.94f, -4705, 7, 99, 0, "Krunn");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4029, Plr);
					}break;
				case 24:	//Skinning
					{
						Plr->Gossip_SendPOI(-2252.94f, -291.32f, 7, 99, 0, "Yonn Deepcut");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4030, Plr);
					}break;
				case 25:	//Tailoring
					{
						Plr->Gossip_SendPOI(1802.66f, -4560.66f, 7, 99, 0, "Magar's Cloth Goods");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4031, Plr);
					}break;
			}
		}
};

void SetupDuratorGossip(ScriptMgr* mgr)
{
	mgr->register_creature_gossip(3296, new OrgrimmarGuard);	        // Orgrimmar Grunt
	mgr->register_creature_gossip(5953, new RazorHillGuard);			// Razor Hill Grunt
}