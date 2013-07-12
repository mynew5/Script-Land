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

class ExodarGuard : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* Plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Auction House"			, 1);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Bank"				, 2);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Hippogryph Master"		, 3);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Guild Master"			, 4);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Inn"				, 5);	
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mailbox"				, 6);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Stable Master"			, 7);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Weapon Master"			, 8);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Battlemasters"			, 9);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Class Trainer"			, 10);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Profession Trainer"	, 11);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Lexicon of Power"		, 34);
			menu.Send(Plr);
		}

		void OnSelectOption(Object* pObject, Player* Plr, uint32 Id, const char * Code)
		{
			switch(Id)
			{
				case 0: OnHello(pObject, Plr); break;
				case 1:		// Auction House
					{
						Plr->Gossip_SendPOI(-4013.82f, -11729.64f, 7, 99, 0, "Exodar, Auctioneer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9528, Plr);
					}break;
				case 2:		// The Bank
					{
						Plr->Gossip_SendPOI(-3923.89f, -11544.5f, 7, 99, 0, "Exodar, bank");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9529, Plr);
					}break;
				case 3:		// Hippogryph Master
					{
						Plr->Gossip_SendPOI(-4058.45f, -11789.7f, 7, 99, 0, "Exodar, Hippogryph Master");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9530, Plr);
					}break;
				case 4:		// Guild Master
					{
						Plr->Gossip_SendPOI(-4093.38f, -11630.39f, 7, 99, 0, "Exodar, Guild Master");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9539, Plr);
					}break;
				case 5:		// The Inn
					{
						Plr->Gossip_SendPOI(-3765.34f, -11695.8f, 7, 99, 0, "Exodar, Inn");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9545, Plr);
					}break;
				case 6:		// Mailbox
					{
						Plr->Gossip_SendPOI(-3913.75f, -11606.83f, 7, 99, 0, "Exodar, Mailbox");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10254, Plr);
					}break;
				case 7:		// Stable Master
					{
						Plr->Gossip_SendPOI(-3787.01f, -11702.7f, 7, 99, 0, "Exodar, Stable Master");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9558, Plr);
					}break;
				case 8:		// Weapon Master
					{
						Plr->Gossip_SendPOI(-4215.68f, -11628.9f, 7, 99, 0, "Exodar, Weapon Master");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9565, Plr);
					}break;
				case 9:		// Battlemasters
					{
						Plr->Gossip_SendPOI(-3999.82f, -11368.33f, 7, 99, 0, "Exodar, Battlemasters");
						Arcemu::Gossip::Menu::SendQuickMenu(pObject->GetGUID(), 9531, Plr, 12, Arcemu::Gossip::ICON_CHAT, "Arena Battlemaster");
					}break;
				case 10:	// Class Trainers
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 9533);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Druid"		, 13);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Hunter"	, 14);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mage"		, 15);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Paladin"	, 16);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Priest"	, 17);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Shaman"	, 18);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warrior"	, 19);
						menu.Send(Plr);
					}break;
				case 11:	// Profession Trainers
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 9555);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy"			, 20);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Blacksmithing"		, 21);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Enchanting"		, 22);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Engineering"		, 23);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "First Aid"			, 24);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Fishing"			, 25);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Herbalism"			, 26);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Inscription"		, 27);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Jewelcrafting"		, 28);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leatherworking"	, 29);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mining"			, 30);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Skinning"			, 31);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Tailoring"			, 32);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cooking"			, 33);
						menu.Send(Plr);
					}break;
				case 12:	// Arena Battlemaster Exodar
					{
						Plr->Gossip_SendPOI(-3725.25f, -11688.3f, 7, 99, 0, "Arena Battlemaster Exodar");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10223, Plr);
					}break;
				case 13:	// Druid
					{
						Plr->Gossip_SendPOI(-4274.81f, -11495.3f, 7, 99, 0, "Exodar, Druid Trainer"); 
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9534, Plr);
					}break;
				case 14:	// Hunter
					{
						Plr->Gossip_SendPOI(-4229.36f, -11563.36f, 7, 99, 0, "Exodar, Hunter Trainers");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9544, Plr);
					}break;
				case 15:	// Mage
					{
						Plr->Gossip_SendPOI(-4048.8f, -11559.02f, 7, 99, 0, "Exodar, Mage Trainers");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9550, Plr);
					}break;
				case 16:	// Paladin
					{
						Plr->Gossip_SendPOI(-4176.57f, -11476.46f, 7, 99, 0, "Exodar, Paladin Trainers");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9553, Plr);
					}break;
				case 17:	// Priest
					{
						Plr->Gossip_SendPOI(-3972.38f, -11483.2f, 7, 99, 0, "Exodar, Priest Trainers");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9554, Plr);
					}break;
				case 18:	// Shaman
					{
						Plr->Gossip_SendPOI(-3843.8f, -11390.75f, 7, 99, 0, "Exodar, Shaman Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9556, Plr);
					}break;
				case 19:	// Warrior
					{
						Plr->Gossip_SendPOI(-4191.11f, -11650.45f, 7, 99, 0, "Exodar, Warrior Trainers");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9562, Plr);
					}break;
				case 20:	// Alchemy
					{
						Plr->Gossip_SendPOI(-4042.37f, -11366.3f, 7, 99, 0, "Exodar, Alchemist Trainers");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9527, Plr);
					}break;
				case 21:	// Blacksmithing
					{
						Plr->Gossip_SendPOI(-4232.4f, -11705.23f, 7, 99, 0, "Exodar, Blacksmithing Trainers");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9532, Plr);
					}break;
				case 22:	// Enchanting
					{
						Plr->Gossip_SendPOI(-3889.3f, -11495, 7, 99, 0, "Exodar, Enchanters");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9535, Plr);
					}break;
				case 23:	// Engineering
					{
						Plr->Gossip_SendPOI(-4257.93f, -11636.53f, 7, 99, 0, "Exodar, Engineering");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9536, Plr);
					}break;
				case 24:	// First Aid
					{
						Plr->Gossip_SendPOI(-3766.05f, -11481.8f, 7, 99, 0, "Exodar, First Aid Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9537, Plr);
					}break;
				case 25:	// Fishing
					{
						Plr->Gossip_SendPOI(-3726.64f, -11384.43f, 7, 99, 0, "Exodar, Fishing Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9538, Plr);
					}break;
				case 26:	// Herbalism
					{
						Plr->Gossip_SendPOI(-4052.5f, -11356.6f, 7, 99, 0, "Exodar, Herbalism Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9543, Plr);
					}break;
				case 27:	// Inscription
					{
						Plr->Gossip_SendPOI(-3889.3f, -11495, 7, 99, 0, "Exodar, Inscription");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13887, Plr);
					}break;
				case 28:	// Jewelcrafting
					{
						Plr->Gossip_SendPOI(-3786.27f, -11541.33f, 7, 99, 0, "Exodar, Jewelcrafters");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9547, Plr);
					}break;
				case 29:	// Leatherworking
					{
						Plr->Gossip_SendPOI(-4134.42f, -11772.93f, 7, 99, 0, "Exodar, Leatherworking");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9549, Plr);
					}break;
				case 30:	// Mining
					{
						Plr->Gossip_SendPOI(-4220.31f, -11694.29f, 7, 99, 0, "Exodar, Mining Trainers");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9552, Plr);
					}break;
				case 31:	// Skinning
					{
						Plr->Gossip_SendPOI(-4134.97f, -11760.5f, 7, 99, 0, "Exodar, Skinning Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9557, Plr);
					}break;
				case 32:	// Tailoring
					{
						Plr->Gossip_SendPOI(-4095.78f, -11746.9f, 7, 99, 0, "Exodar, Tailors");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9350, Plr);
					}break;
				case 33:	// Cooking
					{
						Plr->Gossip_SendPOI(-3799.69f, -11650.51f, 7, 99, 0, "Exodar, Cook");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9559, Plr);
					}break;
				case 34:	// Lexicon of Power
					{
						Plr->Gossip_SendPOI(-3889.3f, -11495, 7, 99, 0, "Exodar, Inscription");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14174, Plr);
					}break;
			}
		}
};

class AzureWatchGuard : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* Plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Bank"					, 1);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Hippogryph Master"		, 2);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Guild Master"			, 3);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Inn"					, 4);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Stable"				, 5);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Class Trainer"			, 6);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Profession Trainer"	, 7);
			menu.Send(Plr);
		}

		void OnSelectOption(Object* pObject, Player* Plr, uint32 Id, const char * Code)
		{
			switch(Id)
			{
				case 0: OnHello(pObject, Plr); break;
				case 1:		//Bank
					{
						Plr->Gossip_SendPOI(-3923.89f, -11544.5f, 7, 99, 0, "Exodar, bank");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10067, Plr);
					}break;
				case 2:		//Hippogryph Master
					{
						Plr->Gossip_SendPOI(-4058.45f, -11789.7f, 7, 99, 0, "Exodar, Hippogryph Master");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10071, Plr);
					}break;	
				case 3:		//Guild Master
					{
						Plr->Gossip_SendPOI(-4093.38f, -11630.39f, 7, 99, 0, "Exodar, Guild Master");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10073, Plr);
					}break;
				case 4:		//Inn
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10074, Plr);
						Plr->Gossip_SendPOI(-4127.81f, -12467.7f, 7, 99, 0, "Azure Watch, Innkeeper");
					}break;
				case 5:		//Stable Master
					{
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10075, Plr);
						Plr->Gossip_SendPOI(-4146.42f, -12492.7f, 7, 99, 0, "Azure Watch, Stable Master");
					}break;
				case 6:		//Class Trainer
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 10076);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Druid"	   , 8);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Hunter"	  , 9);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mage"		, 10);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Paladin"	 , 11);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Priest"	  , 12);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Shaman"	  , 13);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warrior"	 , 14);
						menu.Send(Plr);
					}break;
				case 7:		//Profession Trainer
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 10087);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy"		   , 15);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Blacksmithing"	 , 16);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cooking"		   , 17);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Enchanting"		, 18);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Engineering"	   , 19);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "First Aid"		 , 20);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Fishing"		   , 21);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Herbalism"		 , 22);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Inscription"	   , 23);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Jewelcrafting"	 , 24);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leatherworking"	, 25);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mining"			, 26);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Skinning"		  , 27);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Tailoring"		 , 28);
						menu.Send(Plr);
					}break;
				case 8:		//Druid
					{
						Plr->Gossip_SendPOI(-4274.81f, -11495.3f, 7, 99, 0, "Exodar, Druid Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10077, Plr);
					}break;
				case 9:		//Hunter
					{
						Plr->Gossip_SendPOI(-4203.65f, -12467.7f, 7, 99, 0, "Azure Watch, Hunter Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10078, Plr);
					}break;
				case 10:	//Mage
					{
						Plr->Gossip_SendPOI(-4149.62f, -12530.1f, 7, 99, 0, "Azure Watch, Mage Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10081, Plr);
					}break;
				case 11:	//Paladin
					{
						Plr->Gossip_SendPOI(-4138.98f, -12468.5f, 7, 99, 0, "Azure Watch, Paladin Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10083, Plr);
					}break;
				case 12:	//Priest
					{
						Plr->Gossip_SendPOI(-4131.66f, -12478.6f, 7, 99, 0, "Azure Watch, Priest Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10084, Plr);
					}break;
				case 13:	//Shaman
					{
						Plr->Gossip_SendPOI(-4162.33f, -12456.1f, 7, 99, 0, "Azure Watch, Shaman Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10085, Plr);
					}break;
				case 14:	//Warrior
					{
						Plr->Gossip_SendPOI(-4165.05f, -12536.4f, 7, 99, 0, "Azure Watch, Warrior Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10086, Plr);
					}break;
				case 15:	//Alchemy
					{
						Plr->Gossip_SendPOI(-4191.15f, -12470, 7, 99, 0, "Azure Watch, Alchemist");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10088, Plr);
					}break;
				case 16:	//Blacksmithing
					{
						Plr->Gossip_SendPOI(-4726.29f, -12387.0f, 7, 99, 0, "Odesyus' Landing, Blacksmith");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10089, Plr);
					}break;
				case 17:	//Cooking
					{
						Plr->Gossip_SendPOI(-4708.59f, -12400.3f, 7, 99, 0, "Odesyus' Landing, Cook");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10090, Plr);
					}break;
				case 18:	//Enchanting
					{
						Plr->Gossip_SendPOI(-3889.3f, -11495, 7, 99, 0, "Exodar, Enchanters");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10091, Plr);
					}break;		
				case 19:	//Engineering
					{
						Plr->Gossip_SendPOI(-4157.57f, -12470.2f, 7, 99, 0, "Azure Watch, Engineering Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10092, Plr);
					}break;
				case 20:	//First Aid
					{
						Plr->Gossip_SendPOI(-4199.1f, -12469.9f, 7, 99, 0, "Azure Watch, First Aid Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10093, Plr);
					}break;
				case 21:	//Fishing
					{
						Plr->Gossip_SendPOI(-4266.34f, -12985.4f, 7, 99, 0, "Ammen Ford, Fisherwoman");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10094, Plr);
					}break;
				case 22:	//Herbalism
					{
						Plr->Gossip_SendPOI(-4189.43f, -12459.4f, 7, 99, 0, "Azure Watch, Herbalist");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10095, Plr);
					}break;
				case 23:	//Inscription
					{
						Plr->Gossip_SendPOI(-3889.3f, -11495, 7, 99, 0, "Exodar, Inscription");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13887, Plr);
					}break;
				case 24:	//Jewelcrafting
					{
						Plr->Gossip_SendPOI(-3786.27f, -11541.33f, 7, 99, 0, "Exodar, Jewelcrafters");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10100, Plr);
					}break;
				case 25:	//Leatherworking
					{
						Plr->Gossip_SendPOI(-3442.68f, -12322.2f, 7, 99, 0, "Stillpine Hold, Leatherworker");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10096, Plr);
					}break;
				case 26:	//Mining
					{
						Plr->Gossip_SendPOI(-4179.89f, -12493.1f, 7, 99, 0, "Azure Watch, Mining Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10097, Plr);
					}break;
				case 27:	//Skinning
					{
						Plr->Gossip_SendPOI(-3431.17f, -12316.5f, 7, 99, 0, "Stillpine Hold, Skinner");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10098, Plr);
					}break;
				case 28:	//Tailoring
					{
						Plr->Gossip_SendPOI(-4711.54f, -12386.7f, 7, 99, 0, "Odesyus' Landing, Tailor");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10099, Plr);
					}break;
			}
		}
};

void SetupAzureMystIsleGossip(ScriptMgr * mgr)
{
	mgr->register_creature_gossip(16733, new ExodarGuard);	        // Exodar Peacekeeper
	mgr->register_creature_gossip(20674, new ExodarGuard);	        // Shield of Velen
	mgr->register_creature_gossip(18038, new AzureWatchGuard);		// Azuremyst Peacekeeper
}
