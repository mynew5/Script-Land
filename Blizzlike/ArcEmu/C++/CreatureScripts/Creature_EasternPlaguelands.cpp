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

class MobsGhoulFlayer : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(MobsGhoulFlayer);
		MobsGhoulFlayer(Creature* c) : MoonScriptCreatureAI(c){}

		void OnDied(Unit *mKiller)
		{
			if(!mKiller->IsPlayer())
				return;

			SpawnCreature(11064, _unit->GetPositionX(), _unit->GetPositionY(), _unit->GetPositionZ(), _unit->GetOrientation());
			MoonScriptCreatureAI::OnDied(mKiller);
		}
};

class ArajTheSummoner : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(ArajTheSummoner);
		ArajTheSummoner(Creature* c) : MoonScriptCreatureAI(c){}

		void OnDied(Unit* mKiller)
		{
			if(!mKiller->IsPlayer())
				return;

			_unit->GetMapMgr()->GetInterface()->SpawnGameObject(177241, _unit->GetPositionX(), _unit->GetPositionY(), _unit->GetPositionZ(), _unit->GetOrientation(), true, 0, 0, 1);
			MoonScriptCreatureAI::OnDied(mKiller);
		}
};

class CursedMageAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(CursedMageAI);
		CursedMageAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(20829, Target_Current, 20, 1, -1);
		}

		void OnDied(Unit* mKiller)
		{
			_unit->CastSpell(mKiller, 16567, true);	//Tainted Mind
			MoonScriptCreatureAI::OnDied(mKiller);
		}
};

class CarrionDevourerAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(CarrionDevourerAI);
		CarrionDevourerAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(16449, Target_Current, 20, 0, -1);
		}

		void OnDied(Unit* mKiller)
		{
			_unit->CastSpell(mKiller, 17197, true);	//Maggot Goo
			MoonScriptCreatureAI::OnDied(mKiller);
		}
};

void SetupEasternPlaguelandsCreatures(ScriptMgr * mgr)
{
	mgr->register_creature_script(8530,  &MobsGhoulFlayer::Create);
	mgr->register_creature_script(8531,  &MobsGhoulFlayer::Create);
	mgr->register_creature_script(8532,  &MobsGhoulFlayer::Create);
	mgr->register_creature_script(1852, &ArajTheSummoner::Create);
	mgr->register_creature_script(8524, &CursedMageAI::Create);
	mgr->register_creature_script(8605, &CarrionDevourerAI::Create);
}