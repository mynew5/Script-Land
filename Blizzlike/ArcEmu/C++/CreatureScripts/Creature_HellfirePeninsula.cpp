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

class Aeranas : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(Aeranas)
		Aeranas(Creature * pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(15535, Target_Current, 30, 2.0f, 20);
			AddSpell(12553, Target_Current, 50, 0, 10);
			AddSpell(12745, Target_Current, 45, 3, -1);
			AddEmote(Event_OnCombatStart, "Avruu's magic... it still controls me. You must fight me, mortal. It's the only way to break the spell!", Text_Yell, 0);
			_unit->Despawn(180000, 0);	//3 min
		}

		void AIUpdate()
		{
			if(_unit->GetHealthPct() <= 30)
			{
				Emote("Avruu's magic is broken! I'm free once again!", Text_Say, 0);
				_unit->WipeHateList();
				_unit->SetFaction(35);
			}
		}
};

void SetupHellfireCreatures(ScriptMgr * mgr)
{
	mgr->register_creature_script(17085, &Aeranas::Create);
}
