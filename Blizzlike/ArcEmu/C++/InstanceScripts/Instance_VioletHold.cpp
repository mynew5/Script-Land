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

/*/ The Violet Hold
// ISSUES: There is 18 waves but we need world states so the portal #'s can show. Prison gate thing does not work.
class LieutenantSinclariGossip : public GossipScript
{
	public:
		void GossipHello(Object* pObject, Player* Plr)
		{
			GossipMenu* Menu;
			objmgr.CreateGossipMenuForPlayer(&Menu, pObject->GetGUID(), 1, Plr);

			Menu->AddItem(0, "Activate the crystals when we're in trouble, right?", 1); // Not sure if this is the right text.

			Menu->SendTo(Plr);
		}

		void GossipSelectOption(Object* pObject, Player*  Plr, uint32 Id, uint32 IntId, const char* Code)
		{
			switch(IntId)
			{
				case 0:
					{
						GossipHello(pObject, Plr);
					}
					break;
				case 1:
					{
						_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Im locking the door, thanks again for doing this.", 1000);
						_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
						_unit->GetAIInterface()->SetAIState(STATE_SCRIPTIDLE);
					*/


 void SetupVioletHold(ScriptMgr * mgr)
 {
 }
 