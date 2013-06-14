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

class UndercityGuard : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* Plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The bank", 1);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The bat handler", 2);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The guild master", 3);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The inn", 4);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The mailbox", 5);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The auction house", 6);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The zeppelin master", 7);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The weapon master", 8);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The stable master", 9);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The battlemaster", 10);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Barber", 31);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "A class trainer", 11);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "A profession trainer", 12);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Locksmith", 32);
			menu.Send(Plr);
		}

		void OnSelectOption(Object* pObject, Player* Plr, uint32 Id, const char * Code)
		{
			switch(Id)
			{
			case 0:	OnHello(pObject, Plr); break;
			case 1:     // The bank
				{
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3514, Plr);
					Plr->Gossip_SendPOI(1595.64f, 232.45f, 7, 99, 0, "Undercity Bank");
				}break;
			case 2:     // The bat handler
				{
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3515, Plr);
					Plr->Gossip_SendPOI(1565.9f, 271.43f, 7, 99, 0, "Undercity Bat Handler");
				}break;
			case 3:     // The guild master
				{
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3516, Plr);
					Plr->Gossip_SendPOI(1594.17f, 205.57f, 7, 99, 0, "Undercity Guild Master");
				}break;
			case 4:     // The inn
				{
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3517, Plr);
					Plr->Gossip_SendPOI(1639.43f, 220.99f, 7, 99, 0, "Undercity Inn");
				}break;
			case 5:     // The mailbox
				{
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3518, Plr);
					Plr->Gossip_SendPOI(1632.68f, 219.4f, 7, 99, 0, "Undercity Mailbox");
				}break;
			case 6:     // The auction house
				{
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3520, Plr);
					Plr->Gossip_SendPOI(1647.9f, 258.49f, 7, 99, 0, "Undercity Auction House");
				}break;
			case 7:     // The zeppelin master
				{
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3519, Plr);
					Plr->Gossip_SendPOI(2059.0f, 274.86f, 7, 99, 0, "Undercity Zeppelin");
				}break;
			case 8:     // The weapon master
				{
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4521, Plr);
					Plr->Gossip_SendPOI(1670.31f, 324.66f, 7, 99, 0, "Archibald");
				}break;
			case 9:     // The stable master
				{
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 5979, Plr);
					Plr->Gossip_SendPOI(1634.18f, 226.76f, 7, 99, 0, "Anya Maulray");
				}break;
			case 10:    // The battlemaster
				{
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 7527, Plr);
					Plr->Gossip_SendPOI(1300.33f, 350.92f, 7, 99, 0, "Battlemasters Undercity");
				}break;
			case 11:    // A class trainer
				{
					Arcemu::Gossip::Menu menu(pObject->GetGUID(), 3542);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mage"         , 13);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Paladin"      , 14);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Priest"       , 15);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Rogue"        , 16);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warlock"      , 17);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warrior"      , 18);
					menu.Send(Plr);
				}break;
			case 12:    // A profession trainer
				{
					Arcemu::Gossip::Menu menu(pObject->GetGUID(), 3541);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy"           , 19);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Blacksmithing"     , 20);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cooking"           , 21);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Enchanting"        , 22);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Engineering"       , 23);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "First Aid"         , 24);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Fishing"           , 25);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Herbalism"         , 26);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leatherworking"    , 27);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mining"            , 28);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Skinning"          , 29);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Tailoring"         , 30);
					menu.Send(Plr);
				}break;
			case 13: //Mage
				{
					Plr->Gossip_SendPOI(1781.0f, 53.0f, 7, 99, 0, "Undercity Mage Trainers");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3513, Plr);
				}break;
			case 14: //Paladin
				{
					Plr->Gossip_SendPOI(1298.98f, 316.51f, 7, 99, 0, "Champion Cyssa Downrose");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3521, Plr);
				}break;
			case 15: //Priest
				{
					Plr->Gossip_SendPOI(1758.33f, 401.5f, 7, 99, 0, "Undercity Priest Trainers");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3521, Plr);
				}break;
			case 16: //Rogue
				{
					Plr->Gossip_SendPOI(1418.56f, 65.0f, 7, 99, 0, "Undercity Rogue Trainers");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3526, Plr);
				}break;
			case 17: //Warlock
				{
					Plr->Gossip_SendPOI(1780.92f, 53.16f, 7, 99, 0, "Undercity Warlock Trainers");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3526, Plr);
				}break;
			case 18: //Warrior
				{
					Plr->Gossip_SendPOI(1775.59f, 418.19f, 7, 99, 0, "Undercity Warrior Trainers");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3527, Plr);
				}break;
			case 19: //Alchemy
				{
					Plr->Gossip_SendPOI(1419.82f, 417.19f, 7, 99, 0, "The Apothecarium");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3528, Plr);
				}break;
			case 20: //Blacksmithing
				{
					Plr->Gossip_SendPOI(1696.0f, 285.0f, 7, 99, 0, "Undercity Blacksmithing Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3529, Plr);
				}break;
			case 21: //Cooking
				{
					Plr->Gossip_SendPOI(1596.34f, 274.68f, 7, 99, 0, "Undercity Cooking Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3530, Plr);
				}break;
			case 22: //Enchanting
				{
					Plr->Gossip_SendPOI(1488.54f, 280.19f, 7, 99, 0, "Undercity Enchanting Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3531, Plr);
				}break;
			case 23: //Engineering
				{
					Plr->Gossip_SendPOI(1408.58f, 143.43f, 7, 99, 0, "Undercity Engineering Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3532, Plr);
				}break;
			case 24: //First Aid
				{
					Plr->Gossip_SendPOI(1519.65f, 167.19f, 7, 99, 0, "Undercity First Aid Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3533, Plr);
				}break;
			case 25: //Fishing
				{
					Plr->Gossip_SendPOI(1679.9f, 89.0f, 7, 99, 0, "Undercity Fishing Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3534, Plr);
				}break;
			case 26: //Herbalism
				{
					Plr->Gossip_SendPOI(1558.0f, 349.36f, 7, 99, 0, "Undercity Herbalism Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3535, Plr);
				}break;
			case 27: //Leatherworking
				{
					Plr->Gossip_SendPOI(1498.76f, 196.43f, 7, 99, 0, "Undercity Leatherworking Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3536, Plr);
				}break;
			case 28: //Mining
				{
					Plr->Gossip_SendPOI(1642.88f, 335.58f, 7, 99, 0, "Undercity Mining Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3537, Plr);
				}break;
			case 29: //Skinning
				{
					Plr->Gossip_SendPOI(1498.6f, 196.46f, 7, 99, 0, "Undercity Skinning Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3538, Plr);
				}break;
			case 30: //Tailoring
				{
					Plr->Gossip_SendPOI(1689.55f, 193.0f, 7, 99, 0, "Undercity Tailoring Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3539, Plr);
				}break;
			case 31:     // Barber
				{
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14902, Plr);
					Plr->Gossip_SendPOI(1632.68f, 219.4f, 7, 99, 0, "Undercity Barber");
				}break;
			case 32:     // Locksmith
				{
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14916, Plr);
					Plr->Gossip_SendPOI(1632.68f, 219.4f, 7, 99, 0, "Undercity Locksmith");
				}break;
			}
		}
};

class UndercityGuardOverseer : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* Plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The auction house", 1);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The bank", 2);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Barber", 3);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The bat handler", 4);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The battlemaster", 5);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The guild master", 6);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The inn", 7);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Locksmith", 8);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The mailbox", 9);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The stable master", 10);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The weapon master", 11);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The zeppelin master", 12);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "A class trainer", 13);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "A profession trainer", 14);
			menu.Send(Plr);
		}

		void OnSelectOption(Object* pObject, Player* Plr, uint32 Id, const char * Code)
		{
			switch(Id)
			{
			case 0:	OnHello(pObject, Plr);	break;
			case 1:     // The auction house
				{
					Plr->Gossip_SendPOI(1647.9f, 258.49f, 7, 99, 0, "Undercity Auction House");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14900, Plr);
				}break;
			case 2:     // The bank
				{
					Plr->Gossip_SendPOI(1595.64f, 232.45f, 7, 99, 0, "Undercity Bank");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14901, Plr);
				}break;
			case 3:     // Barber
				{
					Plr->Gossip_SendPOI(1576.20f, 193.14f, 7, 99, 0, "Undercity Barber");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14902, Plr);
				}break;
			case 4:     // The bat handler
				{
					Plr->Gossip_SendPOI(1565.9f, 271.43f, 7, 99, 0, "Undercity Bat Handler");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14903, Plr);
				}break;
			case 5:    // The battlemaster
				{
					Plr->Gossip_SendPOI(1300.33f, 350.92f, 7, 99, 0, "Battlemasters Undercity");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14904, Plr);
				}break;
			case 6:     // The guild master
				{
					Plr->Gossip_SendPOI(1594.17f, 205.57f, 7, 99, 0, "Undercity Guild Master");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14911, Plr);
				}break;
			case 7:     // The inn
				{
					Plr->Gossip_SendPOI(1639.43f, 220.99f, 7, 99, 0, "Undercity Inn");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14913, Plr);
				}break;
			case 8:     // Locksmith
				{
					Plr->Gossip_SendPOI(1499.68f, 53.28f, 7, 99, 0, "Undercity Locksmith");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14916, Plr);
				}break;
			case 9:     // The mailbox
				{
					Plr->Gossip_SendPOI(1632.68f, 219.4f, 7, 99, 0, "Undercity Mailbox");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14918, Plr);
				}break;
			case 10:     // The stable master
				{
					Plr->Gossip_SendPOI(1634.18f, 226.76f, 7, 99, 0, "Anya Maulray");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14924, Plr);
				}break;
			case 11:     // The weapon master
				{
					Plr->Gossip_SendPOI(1670.31f, 324.66f, 7, 99, 0, "Archibald");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14928, Plr);
				}break;
			case 12:     // The zeppelin master
				{
					Plr->Gossip_SendPOI(2059.0f, 274.86f, 7, 99, 0, "Undercity Zeppelin");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14929, Plr);
				}break;
			case 13:    // A class trainer
				{
					Arcemu::Gossip::Menu menu(pObject->GetGUID(), 3542);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mage"         , 15);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Paladin"      , 16);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Priest"       , 17);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Rogue"        , 18);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warlock"      , 19);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warrior"      , 20);
					menu.Send(Plr);
				}break;
			case 14:    // A profession trainer
				{
					Arcemu::Gossip::Menu menu(pObject->GetGUID(), 3541);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy"           , 21);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Blacksmithing"     , 22);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cooking"           , 23);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Enchanting"        , 24);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Engineering"       , 25);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "First Aid"         , 26);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Fishing"           , 27);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Herbalism"         , 28);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Inscription"       , 29);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leatherworking"    , 30);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mining"            , 31);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Skinning"          , 32);
					menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Tailoring"         , 33);
					menu.Send(Plr);
				}break;
			case 15: //Mage
				{
					Plr->Gossip_SendPOI(1781.0f, 53.0f, 7, 99, 0, "Undercity Mage Trainers");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3513, Plr);
				}break;
			case 16: //Paladin
				{
					Plr->Gossip_SendPOI(1298.98f, 316.51f, 7, 99, 0, "Champion Cyssa Downrose");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3521, Plr);
				}break;
			case 17: //Priest
				{
					Plr->Gossip_SendPOI(1758.33f, 401.5f, 7, 99, 0, "Undercity Priest Trainers");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3521, Plr);
				}break;
			case 18: //Rogue
				{
					Plr->Gossip_SendPOI(1418.56f, 65.0f, 7, 99, 0, "Undercity Rogue Trainers");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3526, Plr);
				}break;
			case 19: //Warlock
				{
					Plr->Gossip_SendPOI(1780.92f, 53.16f, 7, 99, 0, "Undercity Warlock Trainers");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3526, Plr);
				}break;
			case 20: //Warrior
				{
					Plr->Gossip_SendPOI(1775.59f, 418.19f, 7, 99, 0, "Undercity Warrior Trainers");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3527, Plr);
				}break;
			case 21: //Alchemy
				{
					Plr->Gossip_SendPOI(1419.82f, 417.19f, 7, 99, 0, "The Apothecarium");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3528, Plr);
				}break;
			case 22: //Blacksmithing
				{
					Plr->Gossip_SendPOI(1696.0f, 285.0f, 7, 99, 0, "Undercity Blacksmithing Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3529, Plr);
				}break;
			case 23: //Cooking
				{
					Plr->Gossip_SendPOI(1596.34f, 274.68f, 7, 99, 0, "Undercity Cooking Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3530, Plr);
				}break;
			case 24: //Enchanting
				{
					Plr->Gossip_SendPOI(1488.54f, 280.19f, 7, 99, 0, "Undercity Enchanting Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3531, Plr);
				}break;
			case 25: //Engineering
				{
					Plr->Gossip_SendPOI(1408.58f, 143.43f, 7, 99, 0, "Undercity Engineering Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3532, Plr);
				}break;
			case 26: //First Aid
				{
					Plr->Gossip_SendPOI(1519.65f, 167.19f, 7, 99, 0, "Undercity First Aid Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3533, Plr);
				}break;
			case 27: //Fishing
				{
					Plr->Gossip_SendPOI(1679.9f, 89.0f, 7, 99, 0, "Undercity Fishing Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3534, Plr);
				}break;
			case 28: //Herbalism
				{
					Plr->Gossip_SendPOI(1558.0f, 349.36f, 7, 99, 0, "Undercity Herbalism Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3535, Plr);
				}break;
			case 29: //Inscription
				{
					Plr->Gossip_SendPOI(1558.0f, 349.36f, 7, 99, 0, "Undercity Inscription");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 14914, Plr);
				}break;
			case 30: //Leatherworking
				{
					Plr->Gossip_SendPOI(1498.76f, 196.43f, 7, 99, 0, "Undercity Leatherworking Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3536, Plr);
				}break;
			case 31: //Mining
				{
					Plr->Gossip_SendPOI(1642.88f, 335.58f, 7, 99, 0, "Undercity Mining Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3537, Plr);
				}break;
			case 32: //Skinning
				{
					Plr->Gossip_SendPOI(1498.6f, 196.46f, 7, 99, 0, "Undercity Skinning Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3538, Plr);
				}break;
			case 33: //Tailoring
				{
					Plr->Gossip_SendPOI(1689.55f, 193.0f, 7, 99, 0, "Undercity Tailoring Trainer");
					Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 3539, Plr);
				}break;
			}
		}
};

class BrillGuard : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* Plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr->GetSession()->language);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The bank"			, 1);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The bat handler"	, 2);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The inn"			, 3);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "The stable master"	, 4);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "A class trainer"	, 5);
			menu.AddItem(Arcemu::Gossip::ICON_CHAT, "A profession trainer", 6);
			menu.Send(Plr);
		}

		void GossipSelectOption(Object* pObject, Player* Plr, uint32 Id, const char * Code)
		{
			switch(Id)
			{
				case 0: OnHello(pObject, Plr);break;
				case 1:		// The bank
					{
						Plr->Gossip_SendPOI(1595.64f, 232.45f, 7, 99, 0, "Undercity Bank");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4074, Plr);
					}break;
				case 2:		// The bat handler
					{
					Plr->Gossip_SendPOI(1565.9f, 271.43f, 7, 99, 0, "Undercity Bat Handler");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4075, Plr);
					}break;
				case 3:		// The inn
					{
						Plr->Gossip_SendPOI(2246.68f, 241.89f, 7, 99, 0, "Gallows` End Tavern"); 
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4076, Plr);
					}break;
				case 4:		// The stable master
					{
						Plr->Gossip_SendPOI(2267.66f, 319.32f, 7, 99, 0, "Morganus");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 5978, Plr);
					}break;
				case 5:		// A class trainer
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 4292);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mage"			, 7);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Paladin"		, 8);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Priest"		, 9);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Rogue"			, 10);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warlock"		, 11);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Warrior"		, 12);
						menu.Send(Plr);
					}break;
				case 6:		// A profession trainer
					{
						Arcemu::Gossip::Menu menu(pObject->GetGUID(), 4300);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Alchemy"			, 13);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Blacksmithing"		, 14);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Cooking"			, 15);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Enchanting"		, 16);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Engineering"		, 17);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "First Aid"			, 18);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Fishing"			, 19);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Herbalism"			, 20);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Leatherworking"	, 21);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Mining"			, 22);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Skinning"			, 23);
						menu.AddItem(Arcemu::Gossip::ICON_CHAT, "Tailoring"			, 24);
						menu.Send(Plr);
					}break;
				case 7: //Mage
					{
						Plr->Gossip_SendPOI(2259.18f, 240.93f, 7, 99, 0, "Cain Firesong");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4077, Plr);
					}break;		
				case 8: //Paladin
					{
						Plr->Gossip_SendPOI(1298.98f, 316.51f, 7, 99, 0, "Champion Cyssa Downrose");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 10108, Plr);
					}break;
				case 9: //Priest
					{
						Plr->Gossip_SendPOI(2259.18f, 240.93f, 7, 99, 0, "Dark Cleric Beryl");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4078, Plr);
					}break;
				case 10: //Rogue
					{
						Plr->Gossip_SendPOI(2259.18f, 240.93f, 7, 99, 0, "Marion Call");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4079, Plr);
					}break;
				case 11: //Warlock
					{
						Plr->Gossip_SendPOI(2259.18f, 240.93f, 7, 99, 0, "Rupert Boch");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4080, Plr);
					}break;
				case 12: //Warrior
					{
						Plr->Gossip_SendPOI(2256.48f, 240.32f, 7, 99, 0, "Austil de Mon");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4081, Plr);
					}break;
				case 13: //Alchemy
					{
						Plr->Gossip_SendPOI(2263.25f, 344.23f, 7, 99, 0, "Carolai Anise");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4082, Plr);
					}break;
				case 14: //Blacksmithing
					{
						Plr->Gossip_SendPOI(1696.0f, 285.0f, 7, 99, 0, "Undercity Blacksmithing Trainer");	
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4083, Plr);
					}break;
				case 15: //Cooking
					{
						Plr->Gossip_SendPOI(1596.34f, 274.68f, 7, 99, 0, "Undercity Cooking Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4084, Plr);
					}break;
				case 16: //Enchanting
					{
						Plr->Gossip_SendPOI(2250.35f, 249.12f, 7, 99, 0, "Vance Undergloom");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4085, Plr);
					}break;
				case 17: //Engineering
					{
						Plr->Gossip_SendPOI(1408.58f, 143.43f, 7, 99, 0, "Undercity Engineering Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4086, Plr);
					}break;
				case 18: //First Aid
					{
						Plr->Gossip_SendPOI(2246.68f, 241.89f, 7, 99, 0, "Nurse Neela");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4087, Plr);
					}break;
				case 19: //Fishing
					{
						Plr->Gossip_SendPOI(2292.37f, -10.72f, 7, 99, 0, "Clyde Kellen");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4088, Plr);
					}break;
				case 20: //Herbalism
					{
						Plr->Gossip_SendPOI(2268.21f, 331.69f, 7, 99, 0, "Faruza");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4089, Plr);
					}break;
				case 21: //Leatherworking
					{
						Plr->Gossip_SendPOI(2027.0f, 78.72f, 7, 99, 0, "Shelene Rhobart");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4090, Plr);
					}break;
				case 22: //Mining
					{
						Plr->Gossip_SendPOI(1642.88f, 335.58f, 7, 99, 0, "Undercity Mining Trainer");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4091, Plr);
					}break;
				case 23: //Skinning
					{
						Plr->Gossip_SendPOI(2027, 78.72f, 7, 99, 0, "Rand Rhobart");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4092, Plr); 
					}break;
				case 24: //Tailoring
					{
						Plr->Gossip_SendPOI(2160.45f, 659.93f, 7, 99, 0, "Bowen Brisboise");
						Arcemu::Gossip::Menu::SendSimpleMenu(pObject->GetGUID(), 4093, Plr);
					}break;
			}
		}
};


void SetupTirisfalGladesGossip(ScriptMgr* mgr)
{
	mgr->register_creature_gossip(5624,  new UndercityGuard);           // Undercity Guardian
	mgr->register_creature_gossip(36213, new UndercityGuardOverseer);	// Kor'kron Overseer
	Arcemu::Gossip::Script* brill = new BrillGuard;
	mgr->register_creature_gossip(5725, brill);			// Deathguard Lundmark
	mgr->register_creature_gossip(1738, brill);			// Deathguard Terrence
	mgr->register_creature_gossip(1652, brill);			// Deathguard Burgess
	mgr->register_creature_gossip(1746, brill);			// Deathguard Cyrus
	mgr->register_creature_gossip(1745, brill);			// Deathguard Morris
	mgr->register_creature_gossip(1743, brill);			// Deathguard Lawrence
	mgr->register_creature_gossip(1744, brill);			// Deathguard Mort
	mgr->register_creature_gossip(1496, brill);			// Deathguard Dillinger
	mgr->register_creature_gossip(1742, brill);			// Deathguard Bartholomew
}
 