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

class GryponMasters : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(GryponMasters)
		GryponMasters(Creature *pCreature) : MoonScriptCreatureAI(pCreature) {}

		void OnCombatStart(Unit *mTarget)
		{
			for(int i = 0; i < 2; ++i)
				SpawnCreature(9526, _unit->GetPositionX()+RandomFloat(2.0f), _unit->GetPositionY()+RandomFloat(2.0f), _unit->GetPositionZ(), _unit->GetOrientation());
			MoonScriptCreatureAI::OnCombatStart(mTarget);
		}
};

class HippogryphMasters : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(HippogryphMasters)
		HippogryphMasters(Creature *pCreature) : MoonScriptCreatureAI(pCreature) {}

		void OnCombatStart(Unit *mTarget)
		{
			for(int i = 0; i < 2; ++i)
				SpawnCreature(9527, _unit->GetPositionX()+RandomFloat(2.0f), _unit->GetPositionY()+RandomFloat(2.0f), _unit->GetPositionZ(), _unit->GetOrientation());
			MoonScriptCreatureAI::OnCombatStart(mTarget);
		}
};

class WyvernMasters : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(WyvernMasters)
		WyvernMasters(Creature *pCreature) : MoonScriptCreatureAI(pCreature) {}

		void OnCombatStart(Unit *mTarget)
		{
			for(int i = 0; i < 2; ++i)
				SpawnCreature(9527, _unit->GetPositionX()+RandomFloat(2.0f), _unit->GetPositionY()+RandomFloat(2.0f), _unit->GetPositionZ(), _unit->GetOrientation());
			MoonScriptCreatureAI::OnCombatStart(mTarget);
		}
};

class BatMasters : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(BatMasters)
		BatMasters(Creature *pCreature) : MoonScriptCreatureAI(pCreature) {}

		void OnCombatStart(Unit *mTarget)
		{
			for(int i = 0; i < 2; ++i)
				SpawnCreature(9521, _unit->GetPositionX()+RandomFloat(2.0f), _unit->GetPositionY()+RandomFloat(2.0f), _unit->GetPositionZ(), _unit->GetOrientation());
			MoonScriptCreatureAI::OnCombatStart(mTarget);
		}
};

class DragonhawkMasters : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(DragonhawkMasters)
		DragonhawkMasters(Creature *pCreature) : MoonScriptCreatureAI(pCreature) {}

		void OnCombatStart(Unit *mTarget)
		{
			for(int i = 0; i < 2; ++i)
				SpawnCreature(27946, _unit->GetPositionX()+RandomFloat(2.0f), _unit->GetPositionY()+RandomFloat(2.0f), _unit->GetPositionZ(), _unit->GetOrientation());
			MoonScriptCreatureAI::OnCombatStart(mTarget);
		}
};

class NeutralMasters : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(NeutralMasters)
		NeutralMasters(Creature *pCreature) : MoonScriptCreatureAI(pCreature) {}

		void OnCombatStart(Unit *mTarget)
		{
			for(int i = 0; i < 2; ++i)
				SpawnCreature(9526+i, _unit->GetPositionX()+RandomFloat(2.0f), _unit->GetPositionY()+RandomFloat(2.0f), _unit->GetPositionZ(), _unit->GetOrientation());
			MoonScriptCreatureAI::OnCombatStart(mTarget);
		}
};

void SetupFlightMasterCreatures(ScriptMgr * mgr)
{
	// Gryphon Masters
	uint32 GryponMasterIds[] = {352, 523, 931, 1571, 1572, 1573, 2299, 2409, 2432, 2835, 2859,
	2941, 4321, 7823, 8018, 8609, 12596, 12617, 16822, 17209, 18809, 18931, 18939, 19181, 20234,
	21107, 6326, 6327, 24366, 23704, 26879, 23736, 23859, 24061, 26876, 26877, 26878, 26880, 0};
	mgr->register_creature_script(GryponMasterIds, &GryponMasters::Create);

	// Hippogryph Masters
	uint32 HippogryphMasterIds[] = {3838, 3841, 4267, 4319, 4407, 6706, 8019, 10897, 11138, 12577, 12578,
	15177, 17554, 17555, 18785, 18788, 18789, 18937, 22485, 22935, 22936, 22937, 26881, 30271, 0};
	mgr->register_creature_script(HippogryphMasterIds, &HippogryphMasters::Create);

	// Wyvern Masters
	uint32 WyvernMasterIds[] = {1387, 2851, 2858, 2861, 2995, 3305, 3310, 3615, 4312, 4314, 4317, 6026, 6726,
	7824, 8020, 8610, 10378, 11139, 11899, 11900, 11901, 12616, 12740, 13177,
	15178, 16587, 18791, 18807, 18808, 18930, 18942, 18953, 19317, 19558, 20762,
	24032, 25288, 26566, 26846, 26847, 26848, 26850, 26852, 26853, 29762, 31426, 0};
	mgr->register_creature_script(WyvernMasterIds, &WyvernMasters::Create);

	// Bat Masters
	uint32 BatMasterIds[] = {2226, 2389, 4551, 12636, 3575, 23816, 24155, 26844, 26845, 27344, 27842, 37915, 0};
	mgr->register_creature_script(BatMasterIds, &BatMasters::Create);

	// Dragonhawk Masters
	uint32 DragonhawkMasterIds[] = {16189, 16192, 26560, 30269, 0};
	mgr->register_creature_script(DragonhawkMasterIds, &DragonhawkMasters::Create);

	// Neutral Masters
	uint32 NeutralMasterIds[] = {10583, 11798, 11800, 16227, 18938, 18940, 19581, 19583, 20515,
	21766, 22216, 22455, 22931, 23612, 24851, 29480, 26851, 27046, 28037, 28195, 28196, 28197,
	28574, 28615, 28618, 28621, 28623, 28624, 28674, 29137, 29721, 29749, 29750, 29757, 29950,
	29951, 29952, 30314, 30433, 30569, 30869, 30870, 31069, 31078, 32571, 33849, 37888, 0};
	mgr->register_creature_script(NeutralMasterIds, &NeutralMasters::Create);
}
