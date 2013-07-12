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

class StormwindGuardAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(StormwindGuardAI)
		StormwindGuardAI(Creature *pCreature) : MoonScriptCreatureAI(pCreature) 
		{
			//Getting default equiped item
			MainHand = _unit->GetEquippedItem(MELEE);

			//starting guard equipment changes
			RegisterAIUpdateEvent(0);
			IsNightItemSet = false;
		}

		void OnLoad()
		{
			RegisterAIUpdateEvent(0);
		}

		void AIUpdate()
		{
			if(!sEAS.IsDay())
			{
				if(!IsNightItemSet)
				{
					SetDisplayWeaponIds(6341, _unit->GetEquippedItem(OFFHAND));
					IsNightItemSet = true;
				}
				SetAIUpdateFreq(MINUTE*5*SEC_IN_MS);
			}
			else
			{
				if(IsNightItemSet)
				{
					SetDisplayWeaponIds(MainHand, _unit->GetEquippedItem(OFFHAND));
					IsNightItemSet = false;
				}
				SetAIUpdateFreq(MINUTE*5*SEC_IN_MS);
			}
			MoonScriptCreatureAI::AIUpdate();
		}

	private:
		bool IsNightItemSet;
		uint32 MainHand;
};

void SetupElwynForestCreature(ScriptMgr * mgr)
{
	mgr->register_creature_script(1976, &StormwindGuardAI::Create);
}