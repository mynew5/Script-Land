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


class ArmyofDeadGhoul : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(ArmyofDeadGhoul)
		ArmyofDeadGhoul(Creature * pCreature) : MoonScriptCreatureAI(pCreature)
		{
			GetUnit()->GetAIInterface()->m_canMove = false;
		}

		void OnLoad()
		{
			RegisterAIUpdateEvent(200);
		}

		void AIUpdate()
		{
			_unit->CastSpell(_unit, 20480, false);
			_unit->GetAIInterface()->m_canMove = true;
			RemoveAIUpdateEvent();
			MoonScriptCreatureAI::AIUpdate();
		}
};

void SetupMiscCreatures(ScriptMgr * mgr)
{
	mgr->register_creature_script(24207, &ArmyofDeadGhoul::Create);		// Army of the Dead Ghoul
}

