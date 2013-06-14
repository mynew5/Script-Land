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

// XpEleminatorGossip
//  GossipScript subclass for turning on/off Player experience gain
#define	GOSSIP_DISABLE_XP_GAIN	"I no longer wish to gain experience."
#define	GOSSIP_ENABLE_XP_GAIN	"I wish to start gaining experience again"
#define	GOSSIP_BOXMSG_DISABLE_XP_GAIN	"Are you certain you wish to stop gaining experience?"
#define GOSSIP_BOXMSG_ENABLE_XP_GAIN	"Are you certain you wish to start gaining experience again?"

class XpEliminatorGossip : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), plr->GetSession()->language);
			if(plr->CanGainXp())
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, GOSSIP_DISABLE_XP_GAIN, 1, 100000, GOSSIP_BOXMSG_DISABLE_XP_GAIN);
			else
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, GOSSIP_ENABLE_XP_GAIN, 1, 100000, GOSSIP_BOXMSG_ENABLE_XP_GAIN);

			menu.Send(plr);
		}

		void OnSelectOption(Object* pObject, Player* plr, uint32 Id, const char* Code)
		{
			// turning xp gains on/off costs 10g each time
			if(plr->HasGold(100000))
			{
				plr->ModGold(-100000);
				plr->ToggleXpGain();
			}
			Arcemu::Gossip::Menu::Complete(plr);
		}
};

class LockSmith : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object *pObject, Player *Plr)
		{
			Arcemu::Gossip::Menu menu(pObject->GetGUID(), objmgr.GetGossipTextForNpc(pObject->GetEntry()), Plr->GetSession()->language);

			if(Plr->HasFinishedQuest(3201) && !Plr->GetItemInterface()->GetItemCount(5396, true) )
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "I've lost my Key to Searing Gorge.", 1 );
			if(Plr->HasFinishedQuest(10704) && !Plr->GetItemInterface()->GetItemCount(31084, true) )
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "I've lost my Key to the Arcatraz.", 2 );
			if(Plr->HasFinishedQuest(3802) && !Plr->GetItemInterface()->GetItemCount(11000, true) )
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "I've lost my Shadowforge Key.", 3 );
			if((Plr->HasFinishedQuest(5505) || Plr->HasFinishedQuest(5511)) && !Plr->GetItemInterface()->GetItemCount(13704, true))
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "I've lost my Skeleton Key.", 4 );
			if((Plr->HasFinishedQuest(10758) || Plr->HasFinishedQuest(10764)) && !Plr->GetItemInterface()->GetItemCount(28395, true))
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "I've lost my Shattered Halls Key.", 5 );
			if(Plr->HasFinishedQuest(9837) && !Plr->GetItemInterface()->GetItemCount(24490, true))
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "I've lost my Master's Key.", 6 );
			if(Plr->HasFinishedQuest(10109) && !Plr->GetItemInterface()->GetItemCount(27808, true))
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "I've lost my Jump-a-tron 4000 Key.", 7 );
			if(Plr->HasFinishedQuest(13159) && !Plr->GetItemInterface()->GetItemCount(42482, true))
				menu.AddItem(Arcemu::Gossip::ICON_CHAT, "I've lost my Violet Hold Key.", 8 );

			menu.Send(Plr);
		}

		void OnSelectOption(Object *pObject, Player *Plr, uint32 Id, const char *EnteredCode)
		{
			Creature *pCreature = TO_CREATURE(pObject);
			switch(Id)
			{
				case 1: pCreature->CastSpell(Plr, 54880, true); break;	// Create Key to Searing Gorge	
				case 2: pCreature->CastSpell(Plr, 54881, true); break;	// Create Key to the Arcatraz
				case 3: pCreature->CastSpell(Plr, 54882, true); break;	// Create Shadowforge Key
				case 4: pCreature->CastSpell(Plr, 54883, true); break;	// Create Skeleton Key
				case 5: pCreature->CastSpell(Plr, 54884, true); break;	// Create Shattered Halls Key
				case 6: pCreature->CastSpell(Plr, 54885, true); break;	// Create The Master's Key
				case 7: pCreature->CastSpell(Plr, 54886, true); break;	// Create Jump-a-tron 4000 Key
				case 8: pCreature->CastSpell(Plr, 67253, true); break;	// Create The Violet Hold Key		
			}
			Plr->Gossip_Complete();
	   }
};

void SetupGeneralGossip(ScriptMgr* mgr)
{
	mgr->register_creature_gossip(35364, new XpEliminatorGossip);		// Slahtzt the Horde NPC
	mgr->register_creature_gossip(35365, new XpEliminatorGossip);		// Besten the Alliance NPC
	mgr->register_creature_gossip(29725, new LockSmith);		// Benik Boltshear - Stormwind
	mgr->register_creature_gossip(29728, new LockSmith); 	// Walter Soref - Undercity
	mgr->register_creature_gossip(29665, new LockSmith); 	// Pazik "The Pick" Prylock - Dalaran
}
