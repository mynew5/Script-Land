/*
 * ArcPro MMORPG Server
 * Copyright (C) 2011-2013 ArcPro Speculation <http://arcpro.sexyi.am/>
 * Copyright (C) 2008-2013 ArcEmu Team <http://www.arcemu.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 */
 
 #include "Setup.h"
 
 class DedicationOfHonorAI : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(DedicationOfHonorAI)
		DedicationOfHonorAI(GameObject* go) : GameObjectAIScript(go){}
		~DedicationOfHonorAI() {}

		void OnActivate(Player* player)
		{
			Arcpro::Gossip::Menu::SendQuickMenu(_gameobject->GetGUID(), 15921, player, 1, Arcpro::Gossip::ICON_CHAT, "See the fall of the Lich King.");
		}
};

class DedicationOfHonorGossip : public GossipScript
{
	public:
		DedicationOfHonorGossip() : GossipScript(){}

		void OnSelectOption(Object* object, Player* player, uint32 Id, const char* enteredcode)
		{
			uint32 id = 16;	//video id
			player->GetSession()->OutPacket(SMSG_TRIGGER_MOVIE, sizeof(uint32), &id);

			Arcpro::Gossip::Menu::Complete(player);
		}
};

void SetupDalaranGossip(ScriptMgr* mgr)
{
	mgr->register_gameobject_script(202443, &DedicationOfHonorAI::Create);
	mgr->register_go_gossip_script(202443, new DedicationOfHonorGossip);
}
