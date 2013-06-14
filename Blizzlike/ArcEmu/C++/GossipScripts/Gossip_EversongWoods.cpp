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

class SilvermoonGuard : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Auction House"		, 1);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Bank"			, 2);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Dragonhawk Master"	, 3);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Guild Master"		, 4);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Inn"			, 5);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mailbox"			, 6);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Stable Master"		, 7);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Weapon Master"		, 8);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Battlemaster"		, 9);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Class Trainer"		, 10);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Profession Trainer", 11);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mana Loom"			, 12);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Lexicon of Power"	, 40);
			menu.Send(plr);
		}

		void OnSelectOption(Object* pObject, Player* Plr, uint32 Id, const char* Code)
		{
			switch(Id)
			{
				case 0: OnHello(pObject, Plr); break;// Return to start
				case 1:     // Auction House
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 9317);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "To the west.", 13);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "To the east.", 14);
						menu.Send(Plr);
					}break;
				case 2:     // The Bank
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 9320);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The west."  , 15);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The east."    , 16);
						menu.Send(Plr);
					}break;
				case 3:     // Dragonhawk Master
					{
						Plr->Gossip_SendPOI(9378.45f, -7163.94f, 7, 99, 0, "Silvermoon City, Flight Master");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9323, Plr);
					}break;
				case 4:     // Guild Master
					{
						Plr->Gossip_SendPOI(9480.75f, -7345.587f, 7, 99, 0, "Silvermoon City, Guild Master");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9324, Plr);
					}break;
				case 5:     // The Inn
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 9325);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Silvermoon City Inn."  , 17);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Wayfarer's Rest tavern."    , 18);
						menu.Send(Plr);
					}break;
				case 6:     // Mailbox
					{
						Plr->Gossip_SendPOI(9743.078f, -7466.4f, 7, 99, 0, "Silvermoon City, Mailbox");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9326, Plr);
					}break;
				case 7:     // Stable Master
					{
						Plr->Gossip_SendPOI(9904.95f, -7404.31f, 7, 99, 0, "Silvermoon City, Stable Master");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9327, Plr);
					}break;
				case 8:     // Weapon Master
					{
						Plr->Gossip_SendPOI(9841.17f, -7505.13f, 7, 99, 0, "Silvermoon City, Weapon Master");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9328, Plr);
					}break;
				case 9:     // Battlemasters
					{
						Plr->Gossip_SendPOI(9850.74f, -7563.84f, 7, 99, 0, "Silvermoon City, Battlemasters");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9329, Plr);
					}break;
				case 10:    // Class Trainers
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 9331);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Druid"       , 19);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Hunter"      , 20);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mage"        , 21);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Paladin"     , 22);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Priest"      , 23);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Rogue"       , 24);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warlock"     , 25);
						menu.Send(Plr);
					}break;
				case 11:    // Profession Trainers
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 9338);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy"           , 26);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Blacksmithing"     , 27);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cooking"           , 28);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Enchanting"        , 29);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Engineering"       , 30);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "First Aid"         , 31);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Fishing"           , 32);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Herbalism"         , 33);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Inscription"       , 34);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Jewelcrafting"     , 35);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leatherworking"    , 36);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mining"            , 37);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Skinning"          , 38);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Tailoring"         , 39);
						menu.Send(Plr);
					}break;
				case 12: //Mana Loom
					{
						Plr->Gossip_SendPOI(9751.013f, -7074.85f, 7, 99, 0, "Silvermoon City, Mana Loom");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10502, Plr);
					}break;
				case 13: //To the west - Auction House no. 1
					{
						Plr->Gossip_SendPOI(9649.429f, -7134.027f, 7, 99, 0, "Silvermoon City, Auction House");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9318, Plr);
					}break;
				case 14: //To the east - Auction House no. 2
					{
						Plr->Gossip_SendPOI(9682.864f, -7515.786f, 7, 99, 0, "Silvermoon City, Auction House");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9319, Plr);
					}break;
				case 15:     // The bank - The west.
					{
						Plr->Gossip_SendPOI(9522.104f, -7208.878f, 7, 99, 0, "Silvermoon City, Bank");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9321, Plr);
					}break;
				case 16:     // The bank - The east.
					{
						Plr->Gossip_SendPOI(9791.07f, -7488.041f, 7, 99, 0, "Silvermoon City, Bank");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9322, Plr);
					}break;
				case 17: //The Silvermoon City Inn
					{
						Plr->Gossip_SendPOI(9677.113f, -7367.575f, 7, 99, 0, "Silvermoon City, Inn");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9325, Plr);
					}break;
				case 18: //The Wayfarer's Rest tavern
					{
						Plr->Gossip_SendPOI(9562.813f, -7218.63f, 7, 99, 0, "Silvermoon City, Inn");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9603, Plr);
					}break;
				case 19: //Druid
					{
						Plr->Gossip_SendPOI(9700.55f, -7262.57f, 7, 99, 0, "Silvermoon City, Druid Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9330, Plr);
					}break;
				case 20: //Hunter
					{
						Plr->Gossip_SendPOI(9930.568f, -7412.115f, 7, 99, 0, "Silvermoon City, Hunter Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9332, Plr);
					}break;
				case 21: //Mage
					{
						Plr->Gossip_SendPOI(9996.914f, -7104.803f, 7, 99, 0, "Silvermoon City, Mage Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9333, Plr);
					}break;
				case 22: //Paladin
					{
						Plr->Gossip_SendPOI(9850.22f, -7516.93f, 7, 99, 0, "Silvermoon City, Paladin Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9334, Plr);
					}break;
				case 23: //Priest
					{
						Plr->Gossip_SendPOI(9935.37f, -7131.14f, 7, 99, 0, "Silvermoon City, Priest Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9335, Plr);
					}break;
				case 24: //Rogue
					{
						Plr->Gossip_SendPOI(9739.88f, -7374.33f, 7, 99, 0, "Silvermoon City, Rogue Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9336, Plr);
					}break;
				case 25: //Warlock
					{
						Plr->Gossip_SendPOI(9803.052f, -7316.967f, 7, 99, 0, "Silvermoon City, Warlock Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9337, Plr);
					}break;
				case 26: //Alchemy
					{
						Plr->Gossip_SendPOI(10000.9f, -7216.63f, 7, 99, 0, "Silvermoon City, Alchemy");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9339, Plr);
					}break;
				case 27: //Blacksmithing
					{
						Plr->Gossip_SendPOI(9841.43f, -7361.53f, 7, 99, 0, "Silvermoon City, Blacksmithing");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9340, Plr);
					}break;
				case 28: //Cooking
					{
						Plr->Gossip_SendPOI(9577.26f, -7243.6f, 7, 99, 0, "Silvermoon City, Cooking");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9624, Plr);
					}break;
				case 29: //Enchanting
					{
						Plr->Gossip_SendPOI(9962.57f, -7246.18f, 7, 99, 0, "Silvermoon City, Enchanting");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9341, Plr);
					}break;
				case 30: //Engineering
					{
						Plr->Gossip_SendPOI(9808.85f, -7287.31f, 7, 99, 0, "Silvermoon City, Engineering");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9342, Plr);
					}break;
				case 31: //First Aid
					{
						Plr->Gossip_SendPOI(9588.61f, -7337.526f, 7, 99, 0, "Silvermoon City, First Aid");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9343, Plr);
					}break;
				case 32: //Fishing
					{
						Plr->Gossip_SendPOI(9601.97f, -7332.34f, 7, 99, 0, "Silvermoon City, Fishing");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9344, Plr);
					}break;
				case 33: //Herbalism
					{
						Plr->Gossip_SendPOI(9996.96f, -7208.39f, 7, 99, 0, "Silvermoon City, Herbalism");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9345, Plr);
					}break;
				case 34: //Inscription
					{
						Plr->Gossip_SendPOI(9957.12f, -7242.85f, 7, 99, 0, "Silvermoon City, Inscription");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13893, Plr);
					}break;
				case 35: //Jewelcrafting
					{
						Plr->Gossip_SendPOI(9552.8f, -7502.12f, 7, 99, 0, "Silvermoon City, Jewelcrafting");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9346, Plr);
					}break;
				case 36: //Leatherworking
					{
						Plr->Gossip_SendPOI(9502.486f, -7425.51f, 7, 99, 0, "Silvermoon City, Leatherworking");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9347, Plr);
					}break;
				case 37: //Mining
					{
						Plr->Gossip_SendPOI(9813.73f, -7360.19f, 7, 99, 0, "Silvermoon City, Mining");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9348, Plr);
					}break;
				case 38: //Skinning
					{
						Plr->Gossip_SendPOI(9513.37f, -7429.4f, 7, 99, 0, "Silvermoon City, Skinning");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9349, Plr);
					}break;
				case 39: //Tailoring
					{
						Plr->Gossip_SendPOI(9727.56f, -7086.65f, 7, 99, 0, "Silvermoon City, Tailoring");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 9350, Plr);
					}break;
				case 40: //Lexicon of Power
					{
						Plr->Gossip_SendPOI(9957.12f, -7242.85f, 7, 99, 0, "Silvermoon City, Inscription");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14174, Plr);
					}break;
			}
		}
};

class FalconwingGuard : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* Plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Bat Handler"		, 1);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Guild Master"		, 2);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Inn"			, 3);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Stable Master"		, 4);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Class Trainer"		, 5);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Profession Trainer", 6);
			menu.Send(Plr);
		}

		void GossipSelectOption(Object* pObject, Player* Plr, uint32 Id, const char * Code)
		{
			switch(Id)
			{
				case 0: OnHello(pObject, Plr); break;
				case 1:		//Bat Handler
					{
						Plr->Gossip_SendPOI(9376.4f, -7164.92f, 7, 99, 0, "Silvermoon City, Flight Master");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 2:		//Guild Master
					{
						Plr->Gossip_SendPOI(9480.75f, -7345.587f, 7, 99, 0, "Silvermoon City, Guild Master");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 3:		//The Inn
					{
						Plr->Gossip_SendPOI(9476.916f, -6859.2f, 7, 99, 0, "Falconwing Square, Innkeeper");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 4:		//Stable Master
					{
						Plr->Gossip_SendPOI(9487.6f, -6830.59f, 7, 99, 0, "Falconwing Square, Stable Master");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 5:		//Class Trainer
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 4292);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Druid"		, 7);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Hunter"	, 8);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mage"		, 9);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Paladin"	, 10);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Priest"	, 11);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Rogue"		, 12);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warlock"	, 13);
						menu.Send(Plr);
					}break;
				case 6:		// Profession Trainer
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 2593);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy"		, 14);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Blacksmithing"	, 15);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cooking"		, 16);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Enchanting"	, 17);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Engineering"	, 18);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "First Aid"		, 19);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Fishing"		, 20);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Herbalism"		, 21);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Jewelcrafting"	, 22);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leatherworking", 23);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mining"		, 24);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Skinning"		, 25);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Tailoring"		, 26);
						menu.Send(Plr);
					}break;
				case 7:		//Druid
					{
						Plr->Gossip_SendPOI(9700.55f, -7262.57f, 7, 99, 0, "Silvermoon City, Druid Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 8:		//Hunter
					{
						Plr->Gossip_SendPOI(9529.2f, -6864.58f, 7, 99, 0, "Falconwing Square, Hunter Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 9:		//Mage
					{
						Plr->Gossip_SendPOI(9462.24f, -6853.45f, 7, 99, 0, "Falconwing Square, Mage Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 10:	//Paladin <-- Needs to change flag to other sign (don't know how to describe it)
					{
						Plr->Gossip_SendPOI(9516.05f, -6870.96f, 7, 99, 0, "Falconwing Square, Paladin Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 11:	//Priest
					{
						Plr->Gossip_SendPOI(9466.62f, -6844.23f, 7, 99, 0, "Falconwing Square, Priest Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 12:	//Rogue
					{
						Plr->Gossip_SendPOI(9534.15f, -6876.0f, 7, 99, 0, "Falconwing Square, Rogue Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 13:	//Warlock
					{
						Plr->Gossip_SendPOI(9467.63f, -6862.82f, 7, 99, 0, "Falconwing Square, Warlock Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 14:	//Alchemy
					{
						Plr->Gossip_SendPOI(8661.36f, -6367.0f, 7, 99, 0, "Saltheril's Haven, Alchemist");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 15:	//Blacksmithing
					{
						Plr->Gossip_SendPOI(8986.43f, -7419.07f, 7, 99, 0, "Farstrider Retreat, Blacksmith");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 16:	//Cooking
					{
						Plr->Gossip_SendPOI(9494.86f, -6879.45f, 7, 99, 0, "Falconwing Square, Cook");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 17:	//Enchanting
					{
						Plr->Gossip_SendPOI(8657.6f, -6366.7f, 7, 99, 0, "Saltheril's Haven, Enchanter");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 18:	//Engineering
					{
						Plr->Gossip_SendPOI(9808.85f, -7287.31f, 7, 99, 0, "Silvermoon City, Engineering");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 19:	//First Aid
					{
						Plr->Gossip_SendPOI(9479.53f, -6880.07f, 7, 99, 0, "Falconwing Square, First Aid");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 20:	//Fishing
					{
						Plr->Gossip_SendPOI(9601.97f, -7332.34f, 7, 99, 0, "Silvermoon City, Fishing");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 21:	//Herbalism
					{
						Plr->Gossip_SendPOI(8678.92f, -6329.09f, 7, 99, 0, "Saltheril's Haven, Herbalist");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 22:	//Jewelcrafting
					{
						Plr->Gossip_SendPOI(9484.79f, -6876.58f, 7, 99, 0, "Falconwing Square, Jewelcrafter");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 23:	//Leatherworking
					{
						Plr->Gossip_SendPOI(9363.75f, -7130.75f, 7, 99, 0, "Eversong Woods, Leatherworker");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 24:	//Mining
					{
						Plr->Gossip_SendPOI(9813.73f, -7360.19f, 7, 99, 0, "Silvermoon City, Mining");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 25:	//Skinning
					{
						Plr->Gossip_SendPOI(9362.89f, -7134.58f, 7, 99, 0, "Eversong Woods, Skinner");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
				case 26:	//Tailoring
					{
						Plr->Gossip_SendPOI(8680.36f, -6327.51f, 7, 99, 0, "Saltheril's Haven, Tailor");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 2593, Plr);
					}break;
			}
		}
};

void SetupEversongWoodsGossip(ScriptMgr * mgr)
{
	mgr->register_creature_gossip(16222, new SilvermoonGuard);			// Silvermoon City Guardian
	mgr->register_creature_gossip(16221, new FalconwingGuard);			// Silvermoon Guardian
}