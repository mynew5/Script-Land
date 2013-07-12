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

class DalaranGuard : public Arcemu::Gossip::Script
{
public:
	void OnHello(Object *pObject, Player *Plr)
	{
		Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr->GetSession()->language);
		menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Arena"				,1);
		menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Auction House"		,2);
		menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Bank"				,3);
		menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Barber"			,4);
		menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Battlemasters"		,5);
		menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Capital Portals"	,6);
		menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Flight Master"		,7);
		menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Guild Master"		,8);
		menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Inn"				,9);
		menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Locksmith"			,77);
		menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mailbox"			,10);
		menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Points of Interest", 11);
		menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Stable Master"		,12);
		menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Trainers"			,13);
		menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Vendors"			,14);
		menu.Send(Plr);
	}

	void OnSelectOption(Object *pObject, Player *Plr, uint32 Id, const char * Code)
	{
		switch(Id)
		{
		case 0: OnHello(pObject, Plr); break;
		case 1:		// Arena
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 13976);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Eastern Sewer Entrance", 15);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Western Sewer Entrance", 16);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Well Entrance"			, 17);
				menu.Send(Plr);
			}break;
		case 2:		// Auction House
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 14010);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Alliance Quarter"	, 18);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Horde Quarter"		, 19);
				menu.Send(Plr);
			}break;
		case 3:		// Bank
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 14007);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Northern Bank"	, 20);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Southern Bank"	, 21);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Sewers"		, 22); // Sewers 1
				menu.Send(Plr);
			}break;
		case 4:		// Barber
			{
				Plr->Gossip_SendPOI(5889.67f, 621.21f, 7, 99, 0, "Barber");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14003, Plr);
			}break;
		case 5:		// Battlemasters
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 13977);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Alliance Quarter"	, 18);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Horde Quarter"		, 19);
				menu.Send(Plr);
			}break;
		case 6:		// Capital Portals
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 13977);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Alliance Quarter"	, 18);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Horde Quarter"		, 19);
				menu.Send(Plr);
			}break;
		case 7:		// Flight Master
			{
				Plr->Gossip_SendPOI(5815.91f, 453.64f, 7, 99, 0, "Flight Master");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10086, Plr);
			}break;
		case 8:		// Guild Master
			{
				Plr->Gossip_SendPOI(5762.21f, 622.84f, 7, 99, 0, "Guild Master");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10095, Plr);
			}break;
		case 9:		// Inn
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 14002);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alliance Inn"	, 24);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Horde Inn"		, 25);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Sewers"		, 26); // Sewers 2
				menu.Send(Plr);
			}break;
		case 10:	// Mailbox
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 10090);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Inn"				, 9);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Bank"				, 3);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Krasus' Landing"	, 74);
				menu.Send(Plr);
			}break;
		case 11:	// Points of Interest
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 10056);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Alliance Quarter"	, 18);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Horde Quarter"		, 19);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Violet Citadel"	, 27);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Violet Hold"		, 28);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Sewers"				, 22); // Sewers 1
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Trade District"		, 29);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Krasus'Landing"		, 74);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Antonidas Memorial"	, 30);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Runeweaver Square"		, 31);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Eventide"			, 32);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cemetary"				, 33);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Lexicon of Power"		, 34);
				menu.Send(Plr);
			}break;
		case 12:	// Stable Master
			{
				Plr->Gossip_SendPOI(5859.68f, 557.57f, 7, 99, 0, "Stable Master");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10083, Plr);
			}break;
		case 13:	// Trainers
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 10082);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Class Trainer"			, 35);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cold Weather Flying Trainer", 76);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Portal Trainer"		, 36);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Profession Trainer"	, 37);
				menu.Send(Plr);
			}break;
		case 14:	// Vendors
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 10173);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Armor"					, 38);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Clothing"				, 39);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Emblem Gear"			, 40);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Flowers"				, 41);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Fruit"					, 42);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "General Goods"			, 43);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Jewelry"				, 44);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Pet Supplies & Exotic Mounts", 45);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Pie, Pastry & Cakes"	, 46);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Reagents & Magical Goods", 47);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Toys"					, 48);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Trade Supplies"		, 43);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Trinkets. Relics & Off-hand items", 49);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Weapons"				, 50);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Wine & Cheese"			, 51);
				menu.Send(Plr);
			}break;
		case 15:	// Eastern Sewer Entrance
			{
				Plr->Gossip_SendPOI(5801.77f, 551.07f, 7, 99, 0, "Eastern Sewer Entrance");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13961, Plr);
			}break;
		case 16:	// Western Sewer Entrance
			{
				Plr->Gossip_SendPOI(5815.21f, 762.65f, 7, 99, 0, "Western Sewer Entrance");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13960, Plr);
			}break;
		case 17:	// Well Entrance
			{
				Plr->Gossip_SendPOI(5791.60f, 561.82f, 7, 99, 0, "Well Entrance");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13969, Plr);
			}break;
		case 18:	// The Alliance Quarter
			{
				Plr->Gossip_SendPOI(5763.20f, 711.77f, 7, 99, 0, "The Alliance Quarter");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13973, Plr);
			}break;
		case 19:	// The Horde Quarter
			{
				Plr->Gossip_SendPOI(5860.35f, 592.97f, 7, 99, 0, "The Horde Quarter");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13972, Plr);
			}break;
		case 20:	// Northern Bank
			{
				Plr->Gossip_SendPOI(5979.58f, 608.16f, 7, 99, 0, "Northern Bank");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14005, Plr);
			}break;
		case 21:	// Southern Bank
			{
				Plr->Gossip_SendPOI(5631.20f, 694.15f, 7, 99, 0, "Southern Bank");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14006, Plr);
			}break;
		case 22:	// Sewers 1
			{
				Plr->Gossip_SendPOI(5766.31f, 731.66f, 7, 99, 0, "Sewers");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13974, Plr);
			}break;
		case 24:	// Alliance Inn
			{
				Plr->Gossip_SendPOI(5718.01f, 689.28f, 7, 99, 0, "Alliance Inn");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13992, Plr);
			}break;
		case 25:	// Horde Inn
			{
				Plr->Gossip_SendPOI(5890.22f, 500.58f, 7, 99, 0, "Horde Inn");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13993, Plr);
			}break;	
		case 26:	// Sewers 2
			{
				Plr->Gossip_SendPOI(5761.06f, 714.45f, 7, 99, 0, "Sewers");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13974, Plr);
			}break;	
		case 27:	// The Violet Citadel
			{
				Plr->Gossip_SendPOI(5795.11f, 769.15f, 7, 99, 0, "The Violet Citadel");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13971, Plr);
			}break;
		case 28:	// The Violet Hold
			{
				Plr->Gossip_SendPOI(5720.40f, 537.46f, 7, 99, 0, "The Violet Hold");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13970, Plr);
			}break;
		case 29:	// Trade District
			{
				Plr->Gossip_SendPOI(5900.88f, 726.65f, 7, 99, 0, "Trade District");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13980, Plr);
			}break;
		case 30:	// Antonidas Memorial
			{
				Plr->Gossip_SendPOI(5951.74f, 683.53f, 7, 99, 0, "Antonidas Memorial");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13968, Plr);
			}break;
		case 31:	// Runeweaver Square
			{
				Plr->Gossip_SendPOI(5810.96f, 632.72f, 7, 99, 0, "Runeweaver Square");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13967, Plr);
			}break;
		case 32:	// The Eventide
			{
				Plr->Gossip_SendPOI(5694.66f, 650.82f, 7, 99, 0, "The Eventide");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13966, Plr);
			}break;
		case 33:	// Cemetary
			{
				Plr->Gossip_SendPOI(5853.35f, 769.06f, 7, 99, 0, "Cemetary");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13965, Plr);
			}break;	
		case 34:	// Lexicon of Power
			{
				Plr->Gossip_SendPOI(5860.99f, 707.23f, 7, 99, 0, "Lexicon of Power");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14174, Plr);
			}break;	
		case 35:	// Class Trainers
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 14018);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Alliance Quarter"	, 18);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Horde Quarter"		, 19);
				menu.Send(Plr);
			}break;
		case 36:	// Portal Trainer
			{
				Plr->Gossip_SendPOI(5810.07f, 581.0f, 7, 99, 0, "Portal Trainer");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13999, Plr);
			}break;
		case 37:	// Profession Trainer
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 13996);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy"		, 52);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Blacksmithing"	, 53);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cooking"		, 54);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Enchanting"	, 55);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "engineering"	, 56);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "First Aid"		, 57);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Fishing"		, 58);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Herbalism"		, 59);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Inscription"	, 60);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Jewelcrafting"	, 61);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leatherworking", 62);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mining"		, 63);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Skinning"		, 64);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Tailoring"		, 65);
				menu.Send(Plr);
			}break;
		case 38:	// Armor
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 14117);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cloth Armor"          , 66);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leather Armor"          , 67);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mail Armor"          , 68);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Plate Armor"          , 69);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Shields"          , 70);
				menu.Send(Plr);
			}break;
		case 39:	// Clothing
			{
				Plr->Gossip_SendPOI(5793.11f, 686.44f, 7, 99, 0, "Clothing");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14112, Plr);
			}break;
		case 40:	// Emblem Gear
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 14108);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Alliance Quarter"          , 18);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The Horde Quarter"          , 19);
				menu.Send(Plr);
			}break;
		case 41:	// Flowers
			{
				Plr->Gossip_SendPOI(5772.27f, 576.61f, 7, 99, 0, "Flowers");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10159, Plr);
			}break;
		case 42:	// Fruit
			{
				Plr->Gossip_SendPOI(5754.02f, 694.18f, 7, 99, 0, "Fruit");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14106, Plr);
			}break;
		case 43:	// General Goods
			{
				Plr->Gossip_SendPOI(5681.22f, 616.57f, 7, 99, 0, "General Goods");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14105, Plr);
			}break;
		case 44:	// Jewelry
			{
				Plr->Gossip_SendPOI(5874.27f, 719.18f, 7, 99, 0, "Portal Trainer");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13984, Plr);
			}break;
		case 45:	// Pet Supplies & Exotic Mounts
			{
				Plr->Gossip_SendPOI(5833.13f, 572.72f, 7, 99, 0, "Pet Supplies & Exotic Mounts");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14103, Plr);
			}break;
		case 46:	// Pie, Pastry & Cakes
			{
				Plr->Gossip_SendPOI(5905.86f, 629.29f, 7, 99, 0, "Pie, Pastry & Cakes");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14102, Plr);
			}break;
		case 47:	// Reagents & Magical Goods
			{
				Plr->Gossip_SendPOI(5758.7f, 737.24f, 7, 99, 0, "Reagents & Magical Goods");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14104, Plr);
			}break;
		case 48:	// Toys
			{
				Plr->Gossip_SendPOI(5813.48f, 688.49f, 7, 99, 0, "Toys");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14100, Plr);
			}break;
		case 49:	// Trinkets. Relics & Off-hand items
			{
				Plr->Gossip_SendPOI(5755.53f, 642.03f, 7, 99, 0, "Trinkets. Relics & Off-hand items");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14110, Plr);
			}break;
		case 50:	// Weapons
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 14113);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Melee Weapons"          , 71);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Ranged & Thrown Weapons"          , 72);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Staves & Wands"          , 73);
				menu.Send(Plr);
			}break;
		case 51:	// Wine & Cheese
			{
				Plr->Gossip_SendPOI(5885.66f, 606.89f, 7, 99, 0, "Wine & Cheese");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14095, Plr);
			}break;
		case 52:	// Alchemy
			{
				Plr->Gossip_SendPOI(5888.05f, 702.44f, 7, 99, 0, "Alchemy");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13995, Plr);
			}break;
		case 53:	// Blacksmithing
			{
				Plr->Gossip_SendPOI(5904.86f, 680.12f, 7, 99, 0, "Blacksmithing");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13994, Plr);
			}break;
		case 54:	// Cooking
			{
				Arcemu::Gossip::Menu menu(pObject->GetGUID(), 13991);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alliance Inn"          , 24);
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Horde Inn"          , 25);
				menu.Send(Plr);
			}break;
		case 55:	// Enchanting
			{
				Plr->Gossip_SendPOI(5840.01f, 726.53f, 7, 99, 0, "Enchanting");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13990, Plr);
			}break;
		case 56:	// Engineering
			{
				Plr->Gossip_SendPOI(5922.55f, 727.05f, 7, 99, 0, "Engineering");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13989, Plr);
			}break;
		case 57:	// First Aid
			{
				Plr->Gossip_SendPOI(5862.76f, 743.71f, 7, 99, 0, "First Aid");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13988, Plr);
			}break;
		case 58:	// Fishing
			{
				Plr->Gossip_SendPOI(5707.45f, 614.57f, 7, 99, 0, "Fishing");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13987, Plr);
			}break;
		case 59:	// Herbalism
			{
				Plr->Gossip_SendPOI(5873.99f, 689.44f, 7, 99, 0, "Herbalism");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13986, Plr);
			}break;
		case 60:	// Inscription
			{
				Plr->Gossip_SendPOI(5861.8f, 704.3f, 7, 99, 0, "Inscription");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13985, Plr);
			}break;
		case 61:	// Jewelcrafting
			{
				Plr->Gossip_SendPOI(5874.27f, 719.18f, 7, 99, 0, "Jewelcrafting");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13984, Plr);
			}break;
		case 62:	// Leatherworking
			{
				Plr->Gossip_SendPOI(5903.9f, 751.97f, 7, 99, 0, "Leatherworking");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13982, Plr);
			}break;
		case 63:	// Mining
			{
				Plr->Gossip_SendPOI(5923.27f, 709.86f, 7, 99, 0, "Mining");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13983, Plr);
			}break;
		case 64:	// Skinning
			{
				Plr->Gossip_SendPOI(5903.9f, 751.97f, 7, 99, 0, "Skinning");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13982, Plr);
			}break;
		case 65:	// Tailoring
			{
				Plr->Gossip_SendPOI(5881.78f, 746.64f, 7, 99, 0, "Tailoring");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 13981, Plr);
			}break;
		case 66:	// Cloth Armor
			{
				Plr->Gossip_SendPOI(5793.11f, 686.44f, 7, 99, 0, "Cloth Armor");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14112, Plr);
			}break;
		case 67:	// Leather Armor
			{
				Plr->Gossip_SendPOI(5667.76f, 627.16f, 7, 99, 0, "Leather Armor");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14111, Plr);
			}break;
		case 68:	// Mail Armor
			{
				Plr->Gossip_SendPOI(5667.76f, 627.16f, 7, 99, 0, "Mail Armor");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14111, Plr);
			}break;
		case 69:	// Plate Armor
			{
				Plr->Gossip_SendPOI(5914.85f, 667.22f, 7, 99, 0, "Plate Armor");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14109, Plr);
			}break;
		case 70:	// Shields
			{
				Plr->Gossip_SendPOI(5914.85f, 667.22f, 7, 99, 0, "Shields");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14109, Plr);
			}break;
		case 71:	// Melee Weapons
			{
				Plr->Gossip_SendPOI(5725.11f, 602.57f, 7, 99, 0, "Melee Weapons");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14098, Plr);
			}break;
		case 72:	// Ranged & Thrown Weapons
			{
				Plr->Gossip_SendPOI(5778.50f, 556.18f, 7, 99, 0, "Ranged & Thrown Weapons");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14097, Plr);
			}break;
		case 73:	// Staves & Wands
			{
				Plr->Gossip_SendPOI(5665.40f, 644.91f, 7, 99, 0, "Staves & Wands");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14096, Plr);
			}break;
		case 74:	// Krasu's Landing
			{
				Plr->Gossip_SendPOI(5815.91f, 453.64f, 7, 99, 0, "Krasus' Landing");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14009, Plr);
			}break;
		case 75:	// Trinkets, Relics & Off-hand Items
			{
				Plr->Gossip_SendPOI(5752.0f, 645.427f, 7, 99, 0, "Dalaran Trinkets");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14110, Plr);
			}break;
		case 76:	// Cold weather flying trainer
			{
				Plr->Gossip_SendPOI(5815.91f, 453.64f, 7, 99, 0, "Flight Master");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 60059, Plr);
			}break;
		case 77:	// Locksmith
			{
				Plr->Gossip_SendPOI(5934.0f, 575.626f, 7, 99, 0, "Dalaran Locksmith");
				Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14004, Plr);
			}break;
		}
	}
};

class DedicationOfHonorAI : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(DedicationOfHonorAI)
		DedicationOfHonorAI(GameObject* go) : GameObjectAIScript(go){}
		~DedicationOfHonorAI() {}

		void OnActivate(Player* player)
		{
			Arcemu::Gossip::Menu::SendQuickMenu(_gameobject->GetGUID(), 15921, player, 1, Arcemu::Gossip::ICON_CHAT, "See the fall of the Lich King.");
		}
};

class DedicationOfHonorGossip : public GossipScript
{
	public:
		DedicationOfHonorGossip() : GossipScript(){}

		void OnSelectOption(Object* object, Player* player, uint32 Id, const char* enteredcode)
		{
			uint32 id = 16;
			player->GetSession()->OutPacket(SMSG_TRIGGER_MOVIE, sizeof(uint32), &id);

			Arcemu::Gossip::Menu::Complete(player);
		}
};

void SetupCrystalsongForestGossip(ScriptMgr * mgr)
{
	Arcemu::Gossip::Script * DalaranGossip = new DalaranGuard;
	mgr->register_creature_gossip(32675, DalaranGossip);
	mgr->register_creature_gossip(32676, DalaranGossip);
	mgr->register_creature_gossip(32677, DalaranGossip);
	mgr->register_creature_gossip(32678, DalaranGossip);
	mgr->register_creature_gossip(32679, DalaranGossip);
	mgr->register_creature_gossip(32680, DalaranGossip);
	mgr->register_creature_gossip(32681, DalaranGossip);
	mgr->register_creature_gossip(32683, DalaranGossip);
	mgr->register_creature_gossip(32684, DalaranGossip);
	mgr->register_creature_gossip(32685, DalaranGossip);
	mgr->register_creature_gossip(32686, DalaranGossip);
	mgr->register_creature_gossip(32687, DalaranGossip);
	mgr->register_creature_gossip(32688, DalaranGossip);
	mgr->register_creature_gossip(32689, DalaranGossip);
	mgr->register_creature_gossip(32690, DalaranGossip);
	mgr->register_creature_gossip(32691, DalaranGossip);
	mgr->register_creature_gossip(32692, DalaranGossip);
	mgr->register_creature_gossip(32693, DalaranGossip);

	mgr->register_gameobject_script(202443, &DedicationOfHonorAI::Create);
	mgr->register_go_gossip_script(202443, new DedicationOfHonorGossip);
}
