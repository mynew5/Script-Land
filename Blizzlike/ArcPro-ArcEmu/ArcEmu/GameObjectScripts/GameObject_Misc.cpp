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

class Blacksmithing_Plans_Use : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(Blacksmithing_Plans_Use)
		Blacksmithing_Plans_Use(GameObject *goinstance) : GameObjectAIScript(goinstance) {}

		void OnLootTaken(Player *pLooter, ItemPrototype *pItemInfo)
		{
			if(pLooter->GetMapId() != 230)
			{
				LocationVector vect(pLooter->GetPositionX()+RandomFloat(2.0f), pLooter->GetPositionY()+RandomFloat(2.0f), pLooter->GetPositionZ(), pLooter->GetOrientation()+3.14f);
				sEAS.SpawnCreature(pLooter, 11120, vect.x, vect.y, vect.z, vect.o, DEFAULT_DESPAWN_TIMER);
			}
		}
};

class DeathGate1 : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(DeathGate1)
		DeathGate1(GameObject *goinstance) : GameObjectAIScript(goinstance) {}

		void OnSpawn()
		{
			RegisterAIUpdateEvent(500);
		}

		void AIUpdate()
		{
			Player* plr = sEAS.GetNearestPlayer(_gameobject);
			if(plr && _gameobject->CalcDistance(_gameobject, plr) <= 1.5f)
			{
				if(plr->GetMapId() == 609)
					plr->SafeTeleport(609, 0, 2390.18f, -5640.28f, 420.84f, 0.57f);
				else if( plr->GetMapId() == 0 )
					plr->SafeTeleport(0, 0, 2387.468994f, -5642.544922f, 420.809937f, 0.620461f);
			}
		}
};

class DeathGate2 : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(DeathGate2)
		DeathGate2(GameObject *goinstance) : GameObjectAIScript(goinstance) {}

		void OnSpawn()
		{
			RegisterAIUpdateEvent(500);
		}

		void AIUpdate()
		{
			Player* plr = sEAS.GetNearestPlayer(_gameobject);
			if( plr && _gameobject->CalcDistance(_gameobject, plr) <= 1.5f)
			{
				if(plr->GetMapId() == 609)
					plr->SafeTeleport(609, 0, 2397.57f, -5636.03f, 377.05f, 0.57f);
				else if(plr->GetMapId() == 0)
					plr->SafeTeleport(0, 0, 2395.233154f, -5637.875488f, 377.086884f, 0.520721f);
			}
		}
};

class Blastenheimer5000 : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(Blastenheimer5000)
		Blastenheimer5000(GameObject * goinstance) : GameObjectAIScript(goinstance)
		{
			pUser = NULL;
			spell = NULL;
		}

		void OnActivate(Player * pPlayer)
		{
			if(pUser != NULL)
				return;

			pUser = pPlayer;

			pPlayer->SetMovement(MOVE_ROOT, 1);

			uint32 spellid = 0;
			if(pPlayer->GetMapId() == 0)	// Elwynn Forest
				spellid = 24730;
			else if (pPlayer->GetMapId() == 1)	// Mulgore
				spellid = 24831;
			else if (pPlayer->GetMapId() == 530)	// Shattrath
				spellid = 42826;
			else
				return;

			spell = new Spell(_gameobject, dbcSpell.LookupEntryForced(spellid), true, NULL);
			SpellCastTargets targets(pPlayer->GetGUID());
			spell->prepare(&targets); // Cast spell: "Cannon Prep", it will teleport the player inside the cannon.
			_gameobject->PlaySoundToSet(8476);
			_gameobject->SetUInt32Value(GAMEOBJECT_FLAGS, 33);
			RegisterAIUpdateEvent(10000);
		}

		void AIUpdate()
		{
			RemoveAIUpdateEvent();
			if(!pUser->IsInWorld())
			{
				pUser = NULL;
				return;
			}

			pUser->SetMovement(MOVE_UNROOT, 1);
			spell = new Spell(_gameobject, dbcSpell.LookupEntryForced( 42867 ), true, NULL);
			SpellCastTargets targets(pUser->GetGUID());
			spell->prepare(&targets); // Cast spell: "Magic Wings".
			_gameobject->SetUInt32Value(GAMEOBJECT_FLAGS, 0);
			pUser = NULL;
		}

	protected:
		Player * pUser;
		Spell * spell;
};

class ManaThistle : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(ManaThistle)
		ManaThistle(GameObject *goinstance) : GameObjectAIScript(goinstance) {}

		void OnLootTaken(Player *pLooter, ItemPrototype *pItemInfo) 
		{
			Spell * spell = new Spell(_gameobject, dbcSpell.LookupEntryForced(28718), true, NULL);
			SpellCastTargets targets(pLooter->GetGUID());
			spell->prepare(&targets); // Cast spell: "Mana Thistle".
		}
};

void SetupMiscGameobjects(ScriptMgr * mgr)
{
	mgr->register_gameobject_script(173232, &Blacksmithing_Plans_Use::Create);	// Blacksmithing Plans
	mgr->register_gameobject_script(191538, &DeathGate1::Create);				// Doodad_Nox_portal_purple_bossroom01
	mgr->register_gameobject_script(191539, &DeathGate2::Create);				// Doodad_Nox_portal_purple_bossroom17
	mgr->register_gameobject_script(180515, &Blastenheimer5000::Create);		// Blastenheimer 5000 Ultra Cannon
	mgr->register_gameobject_script(181281, &ManaThistle::Create);				// Mana Thistle
}
