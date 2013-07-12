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

class StormwindGuard : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* Plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Auction House"			, 1);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Bank of Stormwind"		, 2);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Stormwind Harbor"		, 3);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Deeprun Tram"			, 4);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Inn"				, 5);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Gryphon Master"		, 6);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Guild Master"			, 7);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mailbox"				, 8);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Locksmith"				, 38);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Stable Master"			, 9);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Weapons Trainer"		, 10);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Officers' Lounge"		, 11);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Battlemaster"			, 12);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Barber"				, 13);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Lexicon of Power"		, 39);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Class Trainer"			, 14);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Profession Trainer"	, 15);
			menu.Send(Plr);
		}

		void OnSelectOption(Object* pObject, Player* Plr, uint32 Id, const char* Code)
		{
			switch(Id)
			{
				case 0: OnHello(pObject, Plr); break;
				case 1:     // Auction House
					{
						Plr->Gossip_SendPOI(-8811.46f, 667.46f, 7, 99, 0, "Stormwind Auction House");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3834, Plr);
					}break;
				case 2:     // Bank of Stormwind
					{
						Plr->Gossip_SendPOI(-8916.87f, 622.87f, 7, 99, 0, "Stormwind Bank");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 764, Plr);
					}break;
				case 3:     // Stormwind Harbor
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13439, Plr);
						Plr->Gossip_SendPOI(-8634.77f, 949.64f, 7, 99, 0, "Stormwind Harbor");
					}break;
				case 4:     // Deeprun Tram
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3813, Plr);
						Plr->Gossip_SendPOI(-8378.88f, 554.23f, 7, 99, 0, "The Deeprun Tram");
					}break;
				case 5:     // The Inn
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3860, Plr);
						Plr->Gossip_SendPOI(-8869.0f, 675.4f, 7, 99, 0, "The Gilded Rose");
					}break;
				case 6:     // Gryphon Master
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 879, Plr);
						Plr->Gossip_SendPOI(-8837.0f, 493.5f, 7, 99, 0, "Stormwind Gryphon Master");
					}break;
				case 7:     // Guild Master
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 882, Plr);
						Plr->Gossip_SendPOI(-8894.0f, 611.2f, 7, 99, 0, "Stormwind Vistor`s Center");
					}break;
				case 8:     // Mailbox
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3861, Plr);
						Plr->Gossip_SendPOI(-8876.48f, 649.18f, 7, 99, 0, "Stormwind Mailbox");
					}break;
				case 9:     // Stable Master
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 5984, Plr);
						Plr->Gossip_SendPOI(-8433.0f, 554.7f, 7, 99, 0, "Jenova Stoneshield");
					}break;
				case 10:     // Weapons Master
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4516, Plr);
						Plr->Gossip_SendPOI(-8797.0f, 612.8f, 7, 99, 0, "Woo Ping");
					}break;
				case 11:    // Officers' Lounge
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 7047, Plr);
						Plr->Gossip_SendPOI(-8759.92f, 399.69f, 7, 99, 0, "Champions` Hall");
					}break;
				case 12:    // Battlemaster
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10218, Plr);
						Plr->Gossip_SendPOI(-8393.62f, 274.21f, 7, 99, 0, "Battlemasters Stormwind");
					}break;
				case 13:     // Barber
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13882, Plr);
						Plr->Gossip_SendPOI(-8743.15f, 660.36f, 7, 99, 0, "Stormwind Barber");
					}break;
				case 14:    // Class Trainers
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 898);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Druid"      , 16);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Hunter"     , 17);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mage"       , 18);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Paladin"    , 19);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Priest"     , 20);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Rogue"      , 21);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Shaman"     , 22);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warlock"    , 23);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warrior"    , 24);
						menu.Send(Plr);
					}break;
				case 15:    // Profession Trainers
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 918);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy"           , 25);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Blacksmithing"     , 26);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cooking"           , 27);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Enchanting"        , 28);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Engineering"       , 29);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "First Aid"         , 30);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Fishing"           , 31);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Herbalism"         , 32);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Inscription"		, 33);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leatherworking"    , 34);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mining"            , 35);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Skinning"          , 36);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Tailoring"         , 37);
						menu.Send(Plr);
					}break;
				case 16: //Druid
					{
						Plr->Gossip_SendPOI(-8751.0f, 1124.5f, 7, 99, 0, "The Park");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 902, Plr);
					}break;
				case 17: //Hunter
					{
						Plr->Gossip_SendPOI(-8413.0f, 541.5f, 7, 99, 0, "Hunter Lodge");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 905, Plr);
					}break;
				case 18: //Mage
					{
						Plr->Gossip_SendPOI(-9012.0f, 867.6f, 7, 99, 0, "Wizard`s Sanctum");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 899, Plr);
					}break;
				case 19: //Paladin
					{
						Plr->Gossip_SendPOI(-8577.0f, 881.7f, 7, 99, 0, "Cathedral Of Light");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 904, Plr);
					}break;
				case 20: //Priest
					{
						Plr->Gossip_SendPOI(-8512.0f, 862.4f, 7, 99, 0, "Cathedral Of Light");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 903, Plr);
					}break;
				case 21: //Rogue
					{
						Plr->Gossip_SendPOI(-8753.0f, 367.8f, 7, 99, 0, "Stormwind - Rogue House");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 900, Plr);
					}break;
				case 22: //Shaman
					{
						Plr->Gossip_SendPOI(-9031.54f, 549.87f, 7, 99, 0, "Farseer Umbrua");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10106, Plr);
					}break;
				case 23: //Warlock
					{
						Plr->Gossip_SendPOI(-8948.91f, 998.35f, 7, 99, 0, "The Slaughtered Lamb");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 906, Plr);
					}break;
				case 24: //Warrior
					{
						Plr->Gossip_SendPOI(-8714.14f, 334.96f, 7, 99, 0, "Stormwind Barracks");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 901, Plr);
					}break;
				case 25: //Alchemy
					{
						Plr->Gossip_SendPOI(-8988.0f, 759.60f, 7, 99, 0, "Alchemy Needs");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 919, Plr);
					}break;
				case 26: //Blacksmithing
					{
						Plr->Gossip_SendPOI(-8424.0f, 616.9f, 7, 99, 0, "Therum Deepforge");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 920, Plr);
					}break;
				case 27: //Cooking
					{
						Plr->Gossip_SendPOI(-8611.0f, 364.6f, 7, 99, 0, "Pig and Whistle Tavern");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 921, Plr);
					}break;
				case 28: //Enchanting
					{
						Plr->Gossip_SendPOI(-8858.0f, 803.7f, 7, 99, 0, "Lucan Cordell");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 941, Plr);
					}break;
				case 29: //Engineering
					{
						Plr->Gossip_SendPOI(-8347.0f, 644.1f, 7, 99, 0, "Lilliam Sparkspindle");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 922, Plr);
					}break;
				case 30: //First Aid
					{
						Plr->Gossip_SendPOI(-8513.0f, 801.8f, 7, 99, 0, "Shaina Fuller");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 923, Plr);
					}break;
				case 31: //Fishing
					{
						Plr->Gossip_SendPOI(-8803.0f, 767.5f, 7, 99, 0, "Arnold Leland");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 940, Plr);
					}break;
				case 32: //Herbalism
					{
						Plr->Gossip_SendPOI(-8967.0f, 779.5f, 7, 99, 0, "Alchemy Needs");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 924, Plr);
					}break;
				case 33: //Inscription
					{
						Plr->Gossip_SendPOI(-8853.33f, 857.66f, 7, 99, 0, "Stormwind Inscription");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13881, Plr);
					}break;
				case 34: //Leatherworking
					{
						Plr->Gossip_SendPOI(-8726.0f, 477.4f, 7, 99, 0, "The Protective Hide");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 925, Plr);
					}break;
				case 35: //Mining
					{
						Plr->Gossip_SendPOI(-8434.0f, 692.8f, 7, 99, 0, "Gelman Stonehand");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 927, Plr);
					}break;
				case 36: //Skinning
					{
						Plr->Gossip_SendPOI(-8716.0f, 469.4f, 7, 99, 0, "The Protective Hide");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 928, Plr);
					}break;
				case 37: //Tailoring
					{
						Plr->Gossip_SendPOI(-8938.0f, 800.7f, 7, 99, 0, "Duncan`s Textiles");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 929, Plr);
					}break;
				case 38:	// Locksmith
					{
						Plr->Gossip_SendPOI(-8425.0f, 627.621f, 7, 99, 0, "Stormwind Locksmith");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14249, Plr);
					}break;
				case 39:	// Lexicon of Power
					{
						Plr->Gossip_SendPOI(-8851.0f, 856.599f, 7, 99, 0, "Stormwind Inscription");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14174, Plr);
					}break;
			}
		}
};

class GoldshireGuard : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* Plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Bank"                 , 1);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Gryphon Master"       , 2);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Guild Master"         , 3);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Inn"                  , 4);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Stable Master"        , 5);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Class Trainer"        , 6);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Profession Trainer"   , 7);
			menu.Send(Plr);
		}

		void OnSelectOption(Object* pObject, Player* Plr, uint32 Id, const char * Code)
		{
			switch(Id)
			{
			case 0:	OnHello(pObject, Plr);	break;
			case 1:     //Bank
				{
					Plr->Gossip_SendPOI(-8916.87f, 622.87f, 7, 99, 0, "Stormwind Bank");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4260, Plr);
				}break;
			case 2:     //Gryphon Master
				{
					Plr->Gossip_SendPOI(-8837.0f, 493.5f, 7, 99, 0, "Stormwind Gryphon Master");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4261, Plr);
				}break;
			case 3:     //Guild Master
				{
					Plr->Gossip_SendPOI(-8894.0f, 611.2f, 7, 99, 0, "Stormwind Vistor`s Center");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4262, Plr);
				}break;
			case 4:     //Inn
				{
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4263, Plr);
					Plr->Gossip_SendPOI(-9459.34f, 42.08f, 99, 6, 0, "Lion's Pride Inn");
				}break;
			case 5:     //Stable Master
				{
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 5983, Plr);
					Plr->Gossip_SendPOI(-9466.62f, 45.87f, 99, 6, 0, "Erma");
				}break;
			case 6:     //Class Trainer
				{
					Arcemu::Gossip::Menu menu(pObject->GetGUID(), 4264);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Druid",                8);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Hunter",               9);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mage",                 10);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Paladin",              11);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Priest",               12);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Rogue",                13);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Shaman",               14);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warlock",              15);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warrior",              16);
					menu.Send(Plr);
				}break;
			case 7:        //Profession Trainer
				{
					Arcemu::Gossip::Menu menu(pObject->GetGUID(), 4273);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy"              ,17);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Blacksmithing"        ,18);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cooking"              ,19);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Enchanting"           ,20);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Engineering"          ,21);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "First Aid"            ,22);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Fishing"              ,23);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Herbalism"            ,24);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Inscription"          ,25);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leatherworking"       ,26);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mining"               ,27);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Skinning"             ,28);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Tailoring"            ,29);
					menu.Send(Plr);
				}break;
			case 8: //Druid
				{
					Plr->Gossip_SendPOI(-8751.0f, 1124.5f, 7, 99, 0, "The Park");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4265, Plr);
				}break;
			case 9: //Hunter
				{
					Plr->Gossip_SendPOI(-8413.0f, 541.5f, 7, 99, 0, "Hunter Lodge");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4266, Plr);
				}break;
			case 10: //Mage
				{
					Plr->Gossip_SendPOI(-9471.12f, 33.44f, 7, 99, 0, "Zaldimar Wefhellt");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4268, Plr);
				}break;
			case 11: //Paladin
				{
					Plr->Gossip_SendPOI(-9469.0f, 108.05f, 7, 99, 0, "Brother Wilhelm");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4269, Plr);
				}break;
			case 12: //Priest
				{
					Plr->Gossip_SendPOI(-9461.07f, 32.6f, 7, 99, 0, "Priestess Josetta");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4267, Plr);
				}break;
			case 13: //Rogue
				{
					Plr->Gossip_SendPOI(-9465.13f, 13.29f, 7, 99, 0, "Keryn Sylvius");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4270, Plr);
				}break;
			case 14: //Shaman
				{
					Plr->Gossip_SendPOI(-9031.54f, 549.87f, 7, 99, 0, "Farseer Umbrua");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10101, Plr);
				}break;
			case 15: //Warlock
				{
					Plr->Gossip_SendPOI(-9473.21f, -4.08f, 7, 99, 0, "Maximillian Crowe");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4272, Plr);
				}break;
			case 16: //Warrior
				{
					Plr->Gossip_SendPOI(-9461.82f, 109.50f, 7, 99, 0, "Lyria Du Lac");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4271, Plr);
				}break;
			case 17: //Alchemy
				{
					Plr->Gossip_SendPOI(-9057.04f, 153.63f, 7, 99, 0, "Alchemist Mallory");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4274, Plr);
				}break;
			case 18: //Blacksmithing
				{
					Plr->Gossip_SendPOI(-9456.58f, 87.90f, 7, 99, 0, "Smith Argus");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4275, Plr);
				}break;
			case 19: //Cooking
				{
					Plr->Gossip_SendPOI(-9467.54f, -3.16f, 7, 99, 0, "Tomas");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4276, Plr);
				}break;
			case 20: //Enchanting
				{
					Plr->Gossip_SendPOI(-8858.0f, 803.7f, 7, 99, 0, "Lucan Cordell");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4277, Plr);
				}break;
			case 21: //Engineering
				{
					Plr->Gossip_SendPOI(-8347.0f, 644.1f, 7, 99, 0, "Lilliam Sparkspindle");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4278, Plr);
				}break;
			case 22: //First Aid
				{
					Plr->Gossip_SendPOI(-9456.82f, 30.49f, 7, 99, 0, "Michelle Belle");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4279, Plr);
				}break;
			case 23: //Fishing
				{
					Plr->Gossip_SendPOI(-9386.54f, -118.73f, 7, 99, 0, "Lee Brown");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4280, Plr);
				}break;
			case 24: //Herbalism
				{
					Plr->Gossip_SendPOI(-9060.7f, 149.23f, 7, 99, 0, "Herbalist Pomeroy");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4281, Plr);       
				}break;
			case 25: //Inscription
				{
					Plr->Gossip_SendPOI(-8853.33f, 857.66f, 7, 99, 0, "Stormwind Inscription");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13881, Plr);
				}break;
			case 26: //Leatherworking
				{
					Plr->Gossip_SendPOI(-9376.12f, -75.23f, 7, 99, 0, "Adele Fielder");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4282, Plr);
				}break;
			case 27: //Mining
				{
					Plr->Gossip_SendPOI(-8434.0f, 692.8f, 7, 99, 0, "Gelman Stonehand");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4283, Plr);
				}break;
			case 28: //Skinning
				{
					Plr->Gossip_SendPOI(-9536.91f, -1212.76f, 7, 99, 0, "Helene Peltskinner");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4284, Plr);
				}break;
			case 29: //Tailoring
				{
					Plr->Gossip_SendPOI(-9376.12f, -75.23f, 7, 99, 0, "Eldrin");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4285, Plr);
				}break;
			}
		}
};

class ArchmageMalin_Gossip : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* Plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr->GetSession()->language);

			if(Plr->GetQuestLogForEntry(11223))
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Can you send me to Theramore? I have an urgent message for Lady Jaina from Highlord Bolvar.", 1);

			menu.Send(Plr);
		}

		void OnSelectOption(Object* pObject, Player* Plr, uint32 Id, const char* Code)
		{
			TO_CREATURE(pObject)->CastSpell(Plr, dbcSpell.LookupEntry(42711), true);
			Arcemu::Gossip::Menu::Complete(Plr);
		}
};

/*********************************************
// Stormwind Harbor View Taxi Begin
**********************************************/

//This is when you talk to Thargold Ironwing...He will fly you through Stormwind Harbor to check it out.
class SWHarborFlyAround : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* Plr)
		{

			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Yes, please.", 1);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "No, thank you.", 2);
			menu.Send(Plr);
		}

		void OnSelectOption(Object* pObject, Player* Plr, uint32 Id, const char* Code)
		{
			Arcemu::Gossip::Menu::Complete(Plr);
			if(Id == 1)
				Plr->TaxiStart(sTaxiMgr.GetTaxiPath(1041), 25679, 0);
		}
};

class IanDrake : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object * pObject, Player* Plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "I would like to whisper my secret code to you to receive Tyrael's Hilt.", 1, 0, "", true);
			menu.Send(Plr);
		}

		void OnSelectOption(Object * pObject, Player* Plr, uint32 Id, const char * Code)
		{
			Arcemu::Gossip::Menu::Complete(Plr);

			//player will not allowed to get it too easy :P
			int nCode = rand()%10+1;
			if (Code == (char*)nCode)
			{
				Plr->GetItemInterface()->CalculateFreeSlots(ItemPrototypeStorage.LookupEntry(39656));
				Plr->GetItemInterface()->AddItemToFreeSlot(objmgr.CreateItem(39656, Plr));              // Tyrael's Hilt
			}
		}
};
 
void SetupElwynForestGossip(ScriptMgr* mgr)
{
	mgr->register_creature_gossip(68,		new StormwindGuard);			// Stormwind City Guard
	mgr->register_creature_gossip(1976,		new StormwindGuard);			// Stormwind City Patroller
	mgr->register_creature_gossip(29712,	new StormwindGuard);			// Stormwind Harbor Guard
	mgr->register_creature_gossip(1423,		new GoldshireGuard);			// Stormwind Guard 
	mgr->register_creature_gossip(2708,		new ArchmageMalin_Gossip); 		// Archmage Malin
	mgr->register_creature_gossip(29154,	new SWHarborFlyAround);
	mgr->register_creature_gossip(29093,	new IanDrake);
}
