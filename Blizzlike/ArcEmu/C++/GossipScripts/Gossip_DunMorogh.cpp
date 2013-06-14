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

class IronforgeGuard : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Auction House"			, 1);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Bank of Ironforge"		, 2);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Deeprun Tram"				, 3);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Gryphon Master"			, 4);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Guild Master"				, 5);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Inn"					, 6);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mailbox"					, 7);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Stable Master"			, 8);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Weapons Trainer"			, 9);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Battlemaster"				, 10);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Barber"					, 11);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Class Trainer"			, 12);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Profession Trainer"		, 13);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Lexicon of Power"			, 35);
			menu.Send(plr);
		}

		void OnSelectOption(Object* pObject, Player* Plr, uint32 Id, const char* Code)
		{
			switch(Id)
			{
				case 0:	OnHello(pObject, Plr);	break;
				case 1:     // Auction House
					{
						Plr->Gossip_SendPOI(-4957.39f, -911.6f, 7, 99, 0, "Ironforge Auction House");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3014, Plr);
					}break;
				case 2:     // Bank of Ironforge
					{
						Plr->Gossip_SendPOI(-4891.91f, -991.47f, 7, 99, 0, "The Vault");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2761, Plr);
					}break;
				case 3:     // Deeprun Tram
					{
						Plr->Gossip_SendPOI(-4835.27f, -1294.69f, 7, 99, 0, "Deeprun Tram");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3814, Plr);
					}break;
				case 4:     // Gryphon Master
					{
						Plr->Gossip_SendPOI(-4821.52f, -1152.3f, 7, 99, 0, "Ironforge Gryphon Master");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2762, Plr);
					}break;
				case 5:     // Guild Master
					{
						Plr->Gossip_SendPOI(-5021.0f, -996.45f, 7, 99, 0, "Ironforge Visitor's Center");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2764, Plr);
					}break;
				case 6:     // The Inn
					{
						Plr->Gossip_SendPOI(-4850.47f, -872.57f, 7, 99, 0, "Stonefire Tavern");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2768, Plr);
					}break;
				case 7:     // Mailbox
					{
						Plr->Gossip_SendPOI(-4845.7f, -880.55f, 7, 99, 0, "Ironforge Mailbox");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2769, Plr);
					}break;
				case 8:     // Stable Master
					{
						Plr->Gossip_SendPOI(-5010.2f, -1262, 7, 99, 0, "Ulbrek Firehand");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 5986, Plr);
					}break;
				case 9:    // Weapon Trainer
					{
						Plr->Gossip_SendPOI(-5040.0f, -1201.88f, 7, 99, 0, "Bixi and Buliwyf");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4518, Plr);
					}break;
				case 10:    // Battlemaster
					{
						Plr->Gossip_SendPOI(-5038.54f, -1266.44f, 7, 99, 0, "Battlemasters Ironforge");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10216, Plr);
					}break;
				case 11:    // Barber
					{
						Plr->Gossip_SendPOI(-4838.49f, -919.18f, 7, 99, 0, "Ironforge Barber");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13885, Plr);
					}break;
				case 12:    // A class trainer
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 2766);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Hunter"      , 14);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mage"        , 15);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Paladin"     , 16);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Priest"      , 17);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Rogue"       , 18);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warlock"     , 19);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warrior"     , 20);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Shaman"      , 21);
						menu.Send(Plr);
					}break;
				case 13:    // A profession trainer
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 2793);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy"           , 22);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Blacksmithing"     , 23);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cooking"           , 24);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Enchanting"        , 25);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Engineering"       , 26);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "First Aid"         , 27);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Fishing"           , 28);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Herbalism"         , 29);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Inscription"		, 30);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leatherworking"    , 31);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mining"            , 32);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Skinning"          , 33);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Tailoring"         , 34);
						menu.Send(Plr);
					}break;
				case 14: //Hunter
					{
						Plr->Gossip_SendPOI(-5023.0f, -1253.68f, 7, 99, 0, "Hall of Arms");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2770, Plr);
					}break;
				case 15: //Mage
					{
						Plr->Gossip_SendPOI(-4627.0f, -926.45f, 7, 99, 0, "Hall of Mysteries");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2771, Plr);
					}break;
				case 16: //Paladin
					{
						Plr->Gossip_SendPOI(-4627.02f, -926.45f, 7, 99, 0, "Hall of Mysteries");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2773, Plr);
					}break;
				case 17: //Priest
					{
						Plr->Gossip_SendPOI(-4627.0f, -926.45f, 7, 99, 0, "Hall of Mysteries");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2772, Plr);
					}break;
				case 18: //Rogue
					{
						Plr->Gossip_SendPOI(-4647.83f, -1124, 7, 99, 0, "Ironforge Rogue Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2774, Plr);
					}break;
				case 19: //Warlock
					{
						Plr->Gossip_SendPOI(-4605.0f, -1110.45f, 7, 99, 0, "Ironforge Warlock Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2775, Plr);
					}break;
				case 20: //Warrior
					{
						Plr->Gossip_SendPOI(-5023.08f, -1253.68f, 7, 99, 0, "Hall of Arms");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2776, Plr);
					}break;
				case 21: //Shaman
					{
						Plr->Gossip_SendPOI(-4722.02f, -1150.66f, 7, 99, 0, "Ironforge Shaman Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10842, Plr);
					}break;
				case 22: //Alchemy
					{
						Plr->Gossip_SendPOI(-4858.5f, -1241.83f, 7, 99, 0, "Berryfizz's Potions and Mixed Drinks");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2794, Plr);
					}break;
				case 23: //Blacksmithing
					{
						Plr->Gossip_SendPOI(-4796.97f, -1110.17f, 7, 99, 0, "The Great Forge");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2795, Plr);
					}break;
				case 24: //Cooking
					{
						Plr->Gossip_SendPOI(-4767.83f, -1184.59f, 7, 99, 0, "The Bronze Kettle");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2796, Plr);
					}break;
				case 25: //Enchanting
					{
						Plr->Gossip_SendPOI(-4803.72f, -1196.53f, 7, 99, 0, "Thistlefuzz Arcanery");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2797, Plr);
					}break;
				case 26: //Engineering
					{
						Plr->Gossip_SendPOI(-4799.56f, -1250.23f, 7, 99, 0, "Springspindle's Gadgets");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2798, Plr);
					}break;
				case 27: //First Aid
					{
						Plr->Gossip_SendPOI(-4881.6f, -1153.13f, 7, 99, 0, "Ironforge Physician");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2799, Plr);
					}break;
				case 28: //Fishing
					{
						Plr->Gossip_SendPOI(-4597.91f, -1091.93f, 7, 99, 0, "Traveling Fisherman");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2800, Plr);
					}break;
				case 29: //Herbalism
					{
						Plr->Gossip_SendPOI(-4876.9f, -1151.92f, 7, 99, 0, "Ironforge Physician");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2801, Plr);
					}break;
				case 30: //Inscription
					{
						Plr->Gossip_SendPOI(-4801.72f, -1189.41f, 7, 99, 0, "Ironforge Inscription");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13884, Plr);
					}break;
				case 31: //Leatherworking
					{
						Plr->Gossip_SendPOI(-4745.0f, -1027.57f, 7, 99, 0, "Finespindle's Leather Goods");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2802, Plr);
					}break;
				case 32: //Mining
					{
						Plr->Gossip_SendPOI(-4705.06f, -1116.43f, 7, 99, 0, "Deepmountain Mining Guild");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2804, Plr);
					}break;
				case 33: //Skinning
					{
						Plr->Gossip_SendPOI(-4745.0f, -1027.57f, 7, 99, 0, "Finespindle's Leather Goods");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2805, Plr);
					}break;
				case 34: //Tailoring
					{
						Plr->Gossip_SendPOI(-4719.60f, -1056.96f, 7, 99, 0, "Stonebrow's Clothier");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2807, Plr);
					}break;
				case 35: //Lexicon of Power
					{
						Plr->Gossip_SendPOI(-4801.72f, -1189.41f, 7, 99, 0, "Ironforge Inscription");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14174, Plr);
					}break;
			}
		}
};

class KharanosGuard : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* Plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Bank"				, 1);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Gryphon Master"	, 2);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Guild Master"		, 3);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Inn"			, 4);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Stable Master"		, 5);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Class Trainer"		, 6);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Profession Trainer", 7);
			menu.Send(Plr);
		}

		void GossipSelectOption(Object* pObject, Player* Plr, uint32 Id, const char * Code)
		{
			switch(Id)
			{
				case 0: OnHello(pObject, Plr); break;
				case 1:		//Bank
					{
						Plr->Gossip_SendPOI(-4891.91f, -991.47f, 7, 99, 0, "The Vault");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4288, Plr);
					}break;
				case 2:		//Gryphon Master
					{
						Plr->Gossip_SendPOI(-4821.52f, -1152.3f, 7, 99, 0, "Ironforge Gryphon Master");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4289, Plr);
					}break;
				case 3:		//Guild Master
					{
						Plr->Gossip_SendPOI(-5021.0f, -996.45f, 7, 99, 0, "Ironforge Visitor's Center");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4290, Plr);
					}break;	
				case 4:		//The Inn
					{
						Plr->Gossip_SendPOI(-5582.66f, -525.89f, 7, 99, 0, "Thunderbrew Distillery");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4291, Plr);
					}break;
				case 5:		//Stable Master
					{
						Plr->Gossip_SendPOI(-5604.0f, -509.58f, 7, 99, 0, "Shelby Stoneflint");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 5985, Plr);
					}break;
				case 6:		//Class Trainer
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 4292);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Hunter"	, 8);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mage"		, 9);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Paladin"	, 10);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Priest"	, 11);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Rogue"		, 12);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warlock"	, 13);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warrior"	, 14);
						menu.Send(Plr);
					}break;
				case 7:		// Profession Trainer
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 4300);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy"		, 15);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Blacksmithing"	, 16);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cooking"		, 17);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Enchanting"	, 18);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Engineering"	, 19);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "First Aid"		, 20);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Fishing"		, 21);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Herbalism"		, 22);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Inscription"	, 23);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leatherworking", 24);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mining"		, 25);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Skinning"		, 26);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Tailoring"		, 27);
						menu.Send(Plr);
					}break;
				case 8:		//Hunter
					{
						Plr->Gossip_SendPOI(-5618.29f, -454.25f, 7, 99, 0, "Grif Wildheart");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4293, Plr);
					}break;
				case 9:		//Mage
					{
						Plr->Gossip_SendPOI(-5585.6f, -539.99f, 7, 99, 0, "Magis Sparkmantle");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4294, Plr);
					}break;
				case 10:	//Paladin
					{
						Plr->Gossip_SendPOI(-5585.6f, -539.99f, 7, 99, 0, "Azar Stronghammer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4295, Plr);
					}break;
				case 11:	//Priest
					{
						Plr->Gossip_SendPOI(-5591.74f, -525.61f, 7, 99, 0, "Maxan Anvol");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4296, Plr);
					}break;
				case 12:	//Rogue
					{
						Plr->Gossip_SendPOI(-5602.75f, -542.4f, 7, 99, 0, "Hogral Bakkan");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4297, Plr);
					}break;
				case 13:	//Warlock
					{
						Plr->Gossip_SendPOI(-5641.97f, -523.76f, 7, 99, 0, "Gimrizz Shadowcog");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4298, Plr);
					}break;
				case 14:	//Warrior
					{
						Plr->Gossip_SendPOI(-5604.79f, -529.38f, 7, 99, 0, "Granis Swiftaxe");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4299, Plr);
					}break;
				case 15:	//Alchemy
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4301, Plr);
					}break;
				case 16:	//Blacksmithing
					{
						Plr->Gossip_SendPOI(-5584.72f, -428.41f, 7, 99, 0, "Tognus Flintfire");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4302, Plr);
					}break;
				case 17:	//Cooking
					{
						Plr->Gossip_SendPOI(-5596.85f, -541.43f, 7, 99, 0, "Gremlock Pilsnor");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4303, Plr);
					}break;
				case 18:	//Enchanting
					{
						Plr->Gossip_SendPOI(-4803.72f, -1196.53f, 7, 99, 0, "Thistlefuzz Arcanery");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4304, Plr);
					}break;	
				case 19:	//Engineering
					{
						Plr->Gossip_SendPOI(-4799.56f, -1250.23f, 7, 99, 0, "Springspindle's Gadgets");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4305, Plr);
					}break;
				case 20:	//First Aid
					{
						Plr->Gossip_SendPOI(-5603.67f, -523.57f, 7, 99, 0, "Thamner Pol");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4306, Plr);
					}break;
				case 21:	//Fishing
					{
						Plr->Gossip_SendPOI(-5202.39f, -51.36f, 7, 99, 0, "Paxton Ganter");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4307, Plr);
					}break;
				case 22:	//Herbalism
					{
						Plr->Gossip_SendPOI(-4876.9f, -1151.92f, 7, 99, 0, "Ironforge Physician");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4308, Plr);
					}break;
				case 23:	//Inscription
					{
						Plr->Gossip_SendPOI(-4801.72f, -1189.41f, 7, 99, 0, "Ironforge Inscription");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13884, Plr);
					}break;
				case 24:	//Leatherworking
					{
						Plr->Gossip_SendPOI(-4745.0f, -1027.57f, 7, 99, 0, "Finespindle's Leather Goods");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4310, Plr);
					}break;
				case 25:	//Mining
					{
						Plr->Gossip_SendPOI(-5531.0f, -666.53f, 7, 99, 0, "Yarr Hamerstone");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4311, Plr);
					}break;
				case 26:	//Skinning
					{
						Plr->Gossip_SendPOI(-4745.0f, -1027.57f, 7, 99, 0, "Finespindle's Leather Goods");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4312, Plr);
					}break;
				case 27:	//Tailoring
					{
						Plr->Gossip_SendPOI(-4719.60f, -1056.96f, 7, 99, 0, "Stonebrow's Clothier");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4313, Plr);
					}break;
			}
		}
};

void SetupDunMoroghGossip(ScriptMgr* mgr)
{
	mgr->register_creature_gossip(5595, new IronforgeGuard);		// Ironforge Guard
	mgr->register_creature_gossip(727,  new KharanosGuard);			// Ironforge Mountaineer
}
