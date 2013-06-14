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

class KirithAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(KirithAI)
		KirithAI(Creature* c) : MoonScriptCreatureAI(c)
		{
			PieceArmorTimer = (rand()%3+4)*1000;
			ManaBurnTimer = (rand()%13+9)*1000;
		}

		void OnDied(Unit *mKiller)
		{
			MoonScriptCreatureAI::OnDied(mKiller);
			_unit->CastSpell(_unit, 10853, true);	//Spirit of Kirith
		}

		void AIUpdate()
		{
			MoonScriptCreatureAI::AIUpdate();
			if(PieceArmorTimer <= mAIUpdateFrequency)
			{
				_unit->CastSpell(GetBestPlayerTarget(TargetFilter_NotCurrent), 12097, true);
				PieceArmorTimer = (rand()%8+20)*1000;
			}else PieceArmorTimer -= mAIUpdateFrequency;

			if(ManaBurnTimer <= mAIUpdateFrequency)
			{
				_unit->CastSpell(GetBestPlayerTarget(TargetFilter_NotCurrent), 12745, true);
				ManaBurnTimer = (rand()%3+2)*1000;
			}else ManaBurnTimer -= mAIUpdateFrequency;
		}

	private:
		uint32 ManaBurnTimer;
		uint32 PieceArmorTimer;
};

void SetupBlastedLandsCreature(ScriptMgr * mgr)
{
	mgr->register_creature_script(7728,  &KirithAI::Create);
}
