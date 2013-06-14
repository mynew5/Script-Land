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

/************************************************************************/
/* Raid_CoT_BattleForMountHyjal.cpp Script								*/
/************************************************************************/

enum HyjalEvents
{
    HYJAL_EVENT_RAGE_WINTERCHILL,
    HYJAL_EVENT_ANETHERON,
    HYJAL_EVENT_KAZROGAL,
    HYJAL_EVENT_AZGALOR,
    HYJAL_EVENT_ARCHIMONDE
};

enum HyjalPhases
{
    HYJAL_PHASE_NOT_STARTED = 0,
    HYJAL_PHASE_RAGE_WINTERCHILL_COMPLETE,
    HYJAL_PHASE_ANETHERON_COMPLETE,
    HYJAL_PHASE_KAZROGAL_COMPLETE,
    HYJAL_PHASE_AZGALOR_COMPLETE,
    HYJAL_PHASE_ARCHIMONDE_COMPLETE,
};

enum HyjalType
{
    HYJAL_TYPE_BASIC = 0,
    HYJAL_TYPE_END
};

#define MAP_HYJALPAST 534

class MountHyjalScript : public MoonInstanceScript
{
	public:
		MOONSCRIPT_INSTANCE_FACTORY_FUNCTION(MountHyjalScript, MoonInstanceScript);
		MountHyjalScript(MapMgr* pMapMgr) : MoonInstanceScript(pMapMgr)
		{
			InstanceData[HYJAL_TYPE_BASIC][0] = HYJAL_PHASE_NOT_STARTED;
		}

		void SetInstanceData(uint32 pType, uint32 pIndex, uint32 pData)
		{
			if(pType >= HYJAL_TYPE_END || pIndex >= 10)
				return;

			InstanceData[pType][pIndex] = pData;
		}

		uint32 GetInstanceData(uint32 pType, uint32 pIndex)
		{
			if(pType >= HYJAL_TYPE_END || pIndex >= 10)
				return 0;

			return InstanceData[pType][pIndex];
		}

	private:
		uint32 InstanceData[HYJAL_TYPE_END][10]; // Expand this to fit your needs.
		// Type 0 = Basic Data;
		//   Index 0 = Current Phase;
};

#define CN_JAINA_PROUDMOORE 17772
class JainaProudmooreGS : public GossipScript
{
	public:
		void GossipHello(Object* pObject, Player* plr)
		{
			if(pObject->GetMapMgr()->GetMapId() != MAP_HYJALPAST)//in case someone spawned this NPC in another map
				return;
			GossipMenu* Menu;
			objmgr.CreateGossipMenuForPlayer(&Menu, pObject->GetGUID(), 1, plr);

			switch(pObject->GetMapMgr()->GetScript()->GetInstanceData(HYJAL_TYPE_BASIC, 0))
			{
				case HYJAL_PHASE_NOT_STARTED:
					Menu->AddItem(0, "We are ready to defend the Alliance base.", 1);
					break;

				case HYJAL_PHASE_RAGE_WINTERCHILL_COMPLETE:
					Menu->AddItem(0, "We are ready to defend the Alliance base.", 1);
					break;

				case HYJAL_PHASE_ANETHERON_COMPLETE:
					Menu->AddItem(0, "The defenses are holding up: we can continue.", 1);
					break;
			}

			Menu->SendTo(plr);
		}

		void GossipSelectOption(Object* pObject, Player* Plr, uint32 Id, uint32 IntId, const char* Code)
		{
			if(pObject->GetMapMgr()->GetMapId() != MAP_HYJALPAST)//in case someone spawned this NPC in another map
				return;
			Creature* creature = TO_CREATURE(pObject);

			switch(pObject->GetMapMgr()->GetScript()->GetInstanceData(HYJAL_TYPE_BASIC, 0))
			{
				case HYJAL_PHASE_NOT_STARTED:
				case HYJAL_PHASE_RAGE_WINTERCHILL_COMPLETE:
				case HYJAL_PHASE_ANETHERON_COMPLETE:
					break;
			}

			creature->SetUInt32Value(UNIT_NPC_FLAGS, 0);
		}

		void GossipEnd(Object* pObject, Player* Plr) { GossipScript::GossipEnd(pObject, Plr); }
};

#define CN_THRALL 17852
class ThrallGS : public GossipScript
{
	public:
		void GossipHello(Object* pObject, Player* plr)
		{
			if(pObject->GetMapMgr()->GetMapId() != MAP_HYJALPAST)//in case someone spawned this NPC in another map
				return;
			GossipMenu* Menu;
			objmgr.CreateGossipMenuForPlayer(&Menu, pObject->GetGUID(), 1, plr);

			switch(pObject->GetMapMgr()->GetScript()->GetInstanceData(HYJAL_TYPE_BASIC, 0))
			{
				case HYJAL_PHASE_ANETHERON_COMPLETE:
					Menu->AddItem(0, "We're here to help! The Alliance are overrun.", 1);
					break;

				case HYJAL_PHASE_KAZROGAL_COMPLETE:
					Menu->AddItem(0, "We're okay so far. Let's do this!", 1);
					break;
			}

			Menu->SendTo(plr);
		}

		void GossipSelectOption(Object* pObject, Player* Plr, uint32 Id, uint32 IntId, const char* Code)
		{
			if(pObject->GetMapMgr()->GetMapId() != MAP_HYJALPAST)//in case someone spawned this NPC in another map
				return;
			Creature* creature = TO_CREATURE(pObject);

			switch(pObject->GetMapMgr()->GetScript()->GetInstanceData(HYJAL_TYPE_BASIC, 0))
			{
				case HYJAL_PHASE_ANETHERON_COMPLETE:
				case HYJAL_PHASE_KAZROGAL_COMPLETE:
					break;
			}

			creature->SetUInt32Value(UNIT_NPC_FLAGS, 0);
		}

		void GossipEnd(Object* pObject, Player* Plr) { GossipScript::GossipEnd(pObject, Plr); }
};

//TODO CORRECT TIMERS!!!!!!!!!!!!!!!!!!!!

// Rage WinterchillAI
#define CN_RAGE_WINTERCHILL 17767

#define FROSTBOLT 31249			// it's not correct spell for sure (not sure to others too :P)
#define DEATCH_AND_DECAY 31258
#define FROST_NOVA 31250
#define FROST_ARMOR 31256

class RageWinterchillAI : public MoonScriptCreatureAI
{
public:
	ADD_CREATURE_FACTORY_FUNCTION(RageWinterchillAI)
	RageWinterchillAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
	{
		AddEmote(Event_OnCombatStart, "The Legion's final conquest has begun! Once again the subjugation of this world is within our grasp. Let none survive!", Text_Yell, 11022);
		AddEmote(Event_OnTargetDied, "Crumble and rot!", Text_Yell, 11023);
		AddEmote(Event_OnTargetDied, "All life must perish!", Text_Yell, 11025);
		AddEmote(Event_OnTargetDied, "Ashes to ashes, dust to dust", Text_Yell, 11055);
		AddEmote(Event_OnTargetDied, "Your world is ours now!", Text_Yell, 11056);
		AddEmote(Event_OnTargetDied, "Victory to the Legion!", Text_Yell, 11057);
		AddEmote(Event_OnDied, "You have won this battle, but not... the...war", Text_Yell, 11026);

		AddSpell(FROSTBOLT, Target_RandomPlayer, 8.0f, 0, 10, 0, 80.0f);
		AddSpell(DEATCH_AND_DECAY, Target_RandomPlayer, 3.0f, 0, 30, 0, 30.0f);
		AddSpell(FROST_NOVA, Target_RandomPlayer, 5.0f, 0, 15, 0, 45.0f);
		AddSpell(FROST_NOVA, Target_Self, 5.0f, 0, 10);
	}
};

// AnetheronAI

#define CN_ANETHERON 17808

#define CARRION_SWARM	31306
#define VAMPIRIC_AURA	38196	// 31317
#define INFERNO			31299	// doesn't summon infernal - core bug
#define SLEEP			31298	// 12098
#define BERSERK			26662

class AnetheronAI : public MoonScriptBossAI
{
public:
	ADD_CREATURE_FACTORY_FUNCTION(AnetheronAI)
	AnetheronAI(Creature* pCreature) : MoonScriptBossAI(pCreature)
	{
		AddEmote(Event_OnCombatStart, "You are defenders of a doomed world. Flee here and perhaps you will prolong your pathetic lives!", Text_Yell, 10977);
		AddEmote(Event_OnTargetDied, "Your hopes are lost.", Text_Yell, 10981);
		AddEmote(Event_OnTargetDied, "Scream for me.", Text_Yell, 11038);
		AddEmote(Event_OnTargetDied, "You look tired", Text_Yell, 10978);
		AddEmote(Event_OnDied, "The clock... is still...ticking.", Text_Yell, 10982);

		AddSpell(CARRION_SWARM, Target_RandomPlayer, 10.0f, 0, 10, 0, 60.0f);
		AddSpell(VAMPIRIC_AURA, Target_Self, 8.0f, 0, 8);
		AddSpell(INFERNO, Target_Self, 6.0f, 3, rand()%30+50, 0, 60.0f, false, "Hit he, no time for a slow death", Text_Yell, 11039);
		AddSpell(VAMPIRIC_AURA, Target_RandomPlayer, 5.0f, 0, 7, 0, 30.0f);
		SpellDesc* pEnrageSpell = AddSpell(BERSERK, Target_Self, 0, 0, 0);
		SetEnrageInfo(pEnrageSpell, 600*1000);
	}
};

// KazrogalAI

#define CN_KAZROGAL 17888

#define K_CLEAVE			31345
#define WAR_STOMP			31480
#define MARK_OF_KAZROGAL	31447
#define MARK_OF_KAZROGAL2	31463	// should it be scripted to attack friends?

class KazrogalAI : public MoonScriptCreatureAI
{
public:
	ADD_CREATURE_FACTORY_FUNCTION(KazrogalAI)
	KazrogalAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
	{
		AddEmote(Event_OnCombatStart, "Cry for mercy! Your meaningless lives will soon be forfeit.", Text_Yell, 11015);
		AddEmote(Event_OnTargetDied, "Your death will be a painful one.", Text_Yell, 11016);
		AddEmote(Event_OnTargetDied, "You... are marked", Text_Yell, 11052);
		AddEmote(Event_OnTargetDied, "You... are nothing!", Text_Yell, 11053);
		AddEmote(Event_OnTargetDied, "Miserable nuisance!", Text_Yell, 11054);
		AddEmote(Event_OnDied, "Miserable nuisance!", Text_Yell, 11018);

		AddSpell(K_CLEAVE, Target_Current, 8.0f, 0, 10);
		AddSpell(WAR_STOMP, Target_Self, 6.0f, 0, 15);

		//not sure, that they're correct
		AddSpell(MARK_OF_KAZROGAL, Target_RandomPlayer, 4.0f, 2, 25);

		MarkDeto = 0;
	}

	void AIUpdate()
	{
		//need to check this (not sure)
		if(MarkDeto)
		{
			for(set<Object*>::iterator itr = _unit->GetInRangeSetBegin(); itr != _unit->GetInRangeSetEnd(); ++itr)
			{
				if(isHostile(_unit, (*itr)) && (*itr)->IsUnit())
				{
					Unit* Target = NULL;
					Target = TO_UNIT(*itr);

					if(Target->isAlive() && Target->FindAura(MARK_OF_KAZROGAL) && (Target->GetPowerType() != POWER_TYPE_MANA || !Target->GetBaseMana()))
							Target->CastSpell(Target, MARK_OF_KAZROGAL2, true);
				}
			}

			MarkDeto++;
			if(MarkDeto == 3)
				MarkDeto = 0;
		}
		MoonScriptCreatureAI::AIUpdate();
	}

protected:
	uint32 MarkDeto;
	SpellDesc* Mark2;
};

// AzgalorAI

#define CN_AZGALOR 17842

#define CLEAVE			31345
#define RAIN_OF_FIRE	31340
#define HOWL_OF_AZGALOR	31344
#define DOOM			31347	// it's applied, but doesn't do anything more - should be scripted?

class AzgalorAI : public MoonScriptCreatureAI
{
public:
	ADD_CREATURE_FACTORY_FUNCTION(AzgalorAI)
	AzgalorAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
	{
		AddEmote(Event_OnCombatStart, "Abandon all hope! The legion has returned to finish what was begun so many years ago. This time there will be no escape!", Text_Yell, 10999);
		AddEmote(Event_OnTargetDied, "Reesh, hokta!", Text_Yell, 11001);
		AddEmote(Event_OnTargetDied, "No one is going to save you!", Text_Yell, 11047);
		AddEmote(Event_OnTargetDied, "Don't fight it", Text_Yell, 11048);
		AddEmote(Event_OnDied, "Your time is almost... up!", Text_Yell, 11002);

		AddSpell(CLEAVE, Target_Current, 8.0f, 0, 10);
		AddSpell(RAIN_OF_FIRE, Target_RandomPlayerDestination, 7.0f, 0, 15, 0, 40.0f);
		AddSpell(HOWL_OF_AZGALOR, Target_RandomPlayer, 5.0f, 0, 15);
		AddSpell(DOOM, Target_RandomPlayer, 0, 0, 45, 0, 50.0f);
	}
};

// Archimonde Channel TriggerAI

#define CN_ARCHIMONDE_CHANNEL_TRIGGER 30004

// Additional
#define DRAIN_WORLD_TREE_VISUAL		39140
#define DRAIN_WORLD_TREE_VISUAL2	39141

class ArchimondeTriggerAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(ArchimondeTriggerAI);

		ArchimondeTriggerAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			_unit->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			_unit->GetAIInterface()->SetAllowedToEnterCombat(false);
			_unit->m_noRespawn = true;

			Unit* Archimonde = _unit->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(5598.629883f, -3447.719971f, 1576.650024f, 17968);
			if(Archimonde!=NULL)
			{
				_unit->SetChannelSpellTargetGUID(Archimonde->GetGUID());
				_unit->SetChannelSpellId(DRAIN_WORLD_TREE_VISUAL2);
			}
		}
};

// DoomfireAI

#define CN_DOOMFIRE 18095

class DoomfireAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(DoomfireAI);

		DoomfireAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			_unit->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			_unit->GetAIInterface()->SetAllowedToEnterCombat(false);
			_unit->m_noRespawn = true;

			RegisterAIUpdateEvent(1000);

			DespawnTimer = 0;
			DirChange = 0;
		}

		void AIUpdate()
		{
			DespawnTimer++;
			if(DespawnTimer >= 27)
			{
				_unit->Despawn(0, 0);
				return;
			}
			// After 4 sec of last direction change, doomfire has 33% chance to change direction
			DirChange++;
			if((DirChange == 4 && RandomUInt(3) == 1) || DirChange >= 5)
			{
				if(_unit->GetAIInterface()->getUnitToFollow())
				{
					if(RandomUInt(3) == 1 || _unit->GetDistance2dSq(_unit->GetAIInterface()->getUnitToFollow()) <= 2.0f)
					{
						_unit->GetAIInterface()->ResetUnitToFollow();
						_unit->GetAIInterface()->SetUnitToFollowAngle(0.0f);
					}
				}

				if(!_unit->GetAIInterface()->getUnitToFollow())
				{
					if(RandomUInt(3) == 1)
					{
						Unit* NewTarget = NULL;
						NewTarget = FindTarget();
						if(NewTarget)
						{
							_unit->GetAIInterface()->SetUnitToFollow(NewTarget);
							_unit->GetAIInterface()->SetUnitToFollowAngle(2.0f);
						}
					}

					if(!_unit->GetAIInterface()->getUnitToFollow())
					{
						float movedist = 10.0f;
						float x = 0.0f;
						float y = 0.0f;

						float xchange = RandomFloat(movedist);
						float ychange = sqrt(movedist * movedist - xchange * xchange);

						if(RandomUInt(2) == 1)
							xchange *= -1;
						if(RandomUInt(2) == 1)
							ychange *= -1;

						x = _unit->GetPositionX() + xchange;
						y = _unit->GetPositionY() + ychange;

						_unit->GetAIInterface()->MoveTo(x, y, _unit->GetPositionZ(), _unit->GetOrientation());
					}
				}

				DirChange = 0;
			}
		}
		// A bit rewritten FindTarget function
		Unit* FindTarget()
		{
			Unit* target = NULL;
			float distance = 15.0f;
			float z_diff;

			Unit* pUnit;
			float dist;

			for(set<Object*>::iterator itr = _unit->GetInRangeOppFactsSetBegin(); itr != _unit->GetInRangeOppFactsSetEnd(); itr++)
			{
				if(!(*itr)->IsUnit())
					continue;

				pUnit = TO_UNIT((*itr));

				if(pUnit->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_FEIGN_DEATH))
					continue;

				z_diff = fabs(_unit->GetPositionZ() - pUnit->GetPositionZ());
				if(z_diff > 2.5f)
					continue;

//			if(pUnit->m_auracount[SPELL_AURA_MOD_INVISIBILITY])
//				continue;

				if(!pUnit->isAlive() || _unit == pUnit)
					continue;

				dist = _unit->GetDistance2dSq(pUnit);

				if(dist > distance * distance)
					continue;

				if(dist < 3.0f)
					continue;

				distance = dist;
				target = pUnit;
			}

			return target;
		}

	protected:

		uint32 DespawnTimer;
		uint32 DirChange;
};

/* * Doomfire - Leaves a trail of fire on the ground, which does 2400 fire
		damage per second (occasionally feared people run into these and die) */

// ArchimondeAI

#define CN_ARCHIMONDE 17968

#define FEAR						33547
#define AIR_BURST					32014
#define GRIP_OF_THE_LEGION			31972
#define DOOMFIRE_STRIKE				31903
#define FINGER_OF_DEATH				31984	// should be casted only when no one in melee range
#define HAND_OF_DEATH				35354	// used if too close to Well of Eternity or if after 10 min caster has more than 10% hp
#define SOUL_CHARGER				32053	// If player dies whole raid gets one of those 3 buffs
#define SOUL_CHARGEO				32054
#define SOUL_CHARGEG				32057

class ArchimondeAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(ArchimondeAI);
		SP_AI_Spell spells[7];
		bool m_spellcheck[7];

		ArchimondeAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			nrspells = 3;
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
			}

			spells[0].info = dbcSpell.LookupEntry(AIR_BURST);
			spells[0].targettype = TARGET_ATTACKING;
			spells[0].instant = false;
			spells[0].perctrigger = 5.0f;
			spells[0].attackstoptimer = 1000;
			spells[0].cooldown = 25;

			spells[1].info = dbcSpell.LookupEntry(GRIP_OF_THE_LEGION);
			spells[1].targettype = TARGET_RANDOM_SINGLE;
			spells[1].instant = true;
			spells[1].perctrigger = 5.0f;
			spells[1].attackstoptimer = 1000;
			spells[1].cooldown = 25;
			spells[1].mindist2cast = 0.0f;
			spells[1].maxdist2cast = 60.0f;

			spells[2].info = dbcSpell.LookupEntry(DOOMFIRE_STRIKE);
			spells[2].targettype = TARGET_VARIOUS;
			spells[2].instant = true;
			spells[2].perctrigger = 7.0f;
			spells[2].attackstoptimer = 2000;

			spells[3].info = dbcSpell.LookupEntry(FEAR);
			spells[3].targettype = TARGET_VARIOUS;
			spells[3].instant = true;
			spells[3].perctrigger = 0.0f;
			spells[3].attackstoptimer = 1000;
			spells[3].cooldown = 40;

			spells[4].info = dbcSpell.LookupEntry(FINGER_OF_DEATH);
			spells[4].targettype = TARGET_RANDOM_SINGLE;
			spells[4].instant = false;
			spells[4].perctrigger = 0.0f;
			spells[4].attackstoptimer = 1000;
			spells[4].mindist2cast = 30.0f;
			spells[4].maxdist2cast = 80.0f;

			spells[5].info = dbcSpell.LookupEntry(HAND_OF_DEATH);
			spells[5].targettype = TARGET_VARIOUS;
			spells[5].instant = true;
			spells[5].perctrigger = 0.0f;
			spells[5].attackstoptimer = 1000;
			spells[5].cooldown = 600;

			spells[6].instant = false;
			spells[6].cooldown = 10;

			Trigger = _unit->GetMapMgr()->GetInterface()->SpawnCreature(CN_ARCHIMONDE_CHANNEL_TRIGGER, 5501.476563f, -3524.868408f, 1604.188965f, 0.393633f, true, false, 0, 0);

			if(Trigger && Trigger->IsInWorld())
			{
				Trigger->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
				Trigger->GetAIInterface()->SetAllowedToEnterCombat(false);
				Trigger->m_noRespawn = true;

				Trigger->SetChannelSpellTargetGUID(_unit->GetGUID());
				Trigger->SetChannelSpellId(DRAIN_WORLD_TREE_VISUAL2);

				_unit->SetChannelSpellTargetGUID(Trigger->GetGUID());
				_unit->SetChannelSpellId(DRAIN_WORLD_TREE_VISUAL);
			}
		}

		void OnCombatStart(Unit* mTarget)
		{
			_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "Your resistance is insignificant.");
			_unit->PlaySoundToSet(10987);

			_unit->SetChannelSpellTargetGUID(0);
			_unit->SetChannelSpellId(0);

			if(Trigger && Trigger->IsInWorld())
			{
				Trigger->SetChannelSpellTargetGUID(0);
				Trigger->SetChannelSpellId(0);
			}

			for(int i = 0; i < nrspells; i++)
				spells[i].casttime = 0;

			uint32 t = (uint32)time(NULL);
			spells[3].casttime = t + spells[3].cooldown;
			spells[5].casttime = t + spells[5].cooldown;
			spells[6].casttime = 0;

			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnTargetDied(Unit* mTarget)
		{
			if(_unit->GetHealthPct() > 0)	// Hack to prevent double yelling (OnDied and OnTargetDied when creature is dying)
			{
				int RandomSpeach = rand() % 3;
				switch(RandomSpeach)
				{
					case 0:
						_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "Your soul will languish for eternity.");
						_unit->PlaySoundToSet(10991);
						break;
					case 1:
						_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "All creation will be devoured!");
						_unit->PlaySoundToSet(11044);
						break;
					case 2:
						_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "I am the coming of the end!");
						_unit->PlaySoundToSet(11045);
						break;
				}

				uint32 t = (uint32)time(NULL);
				if(mTarget->IsPlayer() && _unit->isAlive() && !_unit->GetCurrentSpell() && t > spells[6].casttime)
				{
					uint32 SpellID = 0;
					if(mTarget->getClass() == WARRIOR || mTarget->getClass() == ROGUE || mTarget->getClass() == MAGE)
						SpellID = SOUL_CHARGEO;
					if(mTarget->getClass() == PRIEST || mTarget->getClass() == PALADIN || mTarget->getClass() == WARLOCK)
						SpellID = SOUL_CHARGER;
					else
						SpellID = SOUL_CHARGEG;

					_unit->CastSpell(_unit, dbcSpell.LookupEntry(SpellID), spells[6].instant);

					spells[6].casttime = t + spells[6].cooldown;
				}
			}
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);

			if(Trigger && Trigger->IsInWorld() && _unit->isAlive())
			{
				Trigger->SetChannelSpellTargetGUID(_unit->GetGUID());
				Trigger->SetChannelSpellId(DRAIN_WORLD_TREE_VISUAL2);

				_unit->SetChannelSpellTargetGUID(Trigger->GetGUID());
				_unit->SetChannelSpellId(DRAIN_WORLD_TREE_VISUAL);
			}

			RemoveAIUpdateEvent();
		}

		void OnDied(Unit* mKiller)
		{
			_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "No, it cannot be! Nooo!");
			_unit->PlaySoundToSet(10992);

			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
			//_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);

			uint32 t = (uint32)time(NULL);
			if(t > spells[3].casttime && _unit->GetCurrentSpell() == NULL)
			{
				_unit->CastSpell(_unit, spells[3].info, spells[3].instant);

				spells[3].casttime = t + spells[3].cooldown;
			}

			else if(t > spells[5].casttime && _unit->GetCurrentSpell() == NULL)
			{
				_unit->CastSpell(_unit, spells[5].info, spells[5].instant);

				spells[5].casttime = t + spells[5].cooldown;
			}
			/*	Crashes server if Archimonde kills player o_O (even with TARGET_ATTACKING, without StopMovement, without setting current agent and so on
					else if (_unit->GetAIInterface()->GetNextTarget())
					{
						if (FingerOfDeath())
						{
							_unit->GetAIInterface()->setCurrentAgent(AGENT_SPELL);
							_unit->GetAIInterface()->StopMovement(2000);

							if (_unit->GetCurrentSpell() == NULL)
							{
								CastSpellOnRandomTarget(4, spells[4].mindist2cast, spells[4].maxdist2cast, 0, 100);
								return;
							}
						}
					}
			*/
			float val = RandomFloat(100.0f);
			SpellCast(val);
		}

		void SpellCast(float val)
		{
			if(_unit->GetCurrentSpell() == NULL && _unit->GetAIInterface()->getNextTarget())
			{
				float comulativeperc = 0;
				Unit* target = NULL;
				for(int i = 0; i < nrspells; i++)
				{
					if(!spells[i].perctrigger) continue;

					if(m_spellcheck[i])
					{
						target = _unit->GetAIInterface()->getNextTarget();
						switch(spells[i].targettype)
						{
							case TARGET_SELF:
							case TARGET_VARIOUS:
								_unit->CastSpell(_unit, spells[i].info, spells[i].instant);
								break;
							case TARGET_ATTACKING:
								_unit->CastSpell(target, spells[i].info, spells[i].instant);
								break;
							case TARGET_DESTINATION:
								_unit->CastSpellAoF(target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), spells[i].info, spells[i].instant);
								break;
							case TARGET_RANDOM_FRIEND:
							case TARGET_RANDOM_SINGLE:
							case TARGET_RANDOM_DESTINATION:
								CastSpellOnRandomTarget(i, spells[i].mindist2cast, spells[i].maxdist2cast, spells[i].minhp2cast, spells[i].maxhp2cast);
								break;
						}

						m_spellcheck[i] = false;
						return;
					}

					uint32 t = (uint32)time(NULL);
					if(val > comulativeperc && val <= (comulativeperc + spells[i].perctrigger) && t > spells[i].casttime)
					{
						_unit->setAttackTimer(spells[i].attackstoptimer, false);
						spells[i].casttime = t + spells[i].cooldown;
						m_spellcheck[i] = true;
					}
					comulativeperc += spells[i].perctrigger;
				}
			}
		}

		void CastSpellOnRandomTarget(uint32 i, float mindist2cast, float maxdist2cast, int minhp2cast, int maxhp2cast)
		{
			if(!maxdist2cast) maxdist2cast = 100.0f;
			if(!maxhp2cast) maxhp2cast = 100;

			if(_unit->GetCurrentSpell() == NULL && _unit->GetAIInterface()->getNextTarget())
			{
				std::vector<Unit*> TargetTable;		/* From M4ksiu - Big THX to Capt who helped me with std stuff to make it simple and fully working <3 */
				/* If anyone wants to use this function, then leave this note!										 */
				for(set<Object*>::iterator itr = _unit->GetInRangeSetBegin(); itr != _unit->GetInRangeSetEnd(); ++itr)
				{
					if(((spells[i].targettype == TARGET_RANDOM_FRIEND && isFriendly(_unit, (*itr))) || (spells[i].targettype != TARGET_RANDOM_FRIEND && isHostile(_unit, (*itr)) && (*itr) != _unit)) && (*itr)->IsUnit())  // isAttackable(_unit, (*itr)) &&
					{
						Unit* RandomTarget = NULL;
						RandomTarget = TO_UNIT(*itr);

						if(RandomTarget->isAlive() && _unit->GetDistance2dSq(RandomTarget) >= mindist2cast * mindist2cast && _unit->GetDistance2dSq(RandomTarget) <= maxdist2cast * maxdist2cast && ((RandomTarget->GetHealthPct() >= minhp2cast && RandomTarget->GetHealthPct() <= maxhp2cast && spells[i].targettype == TARGET_RANDOM_FRIEND) || (_unit->GetAIInterface()->getThreatByPtr(RandomTarget) > 0 && isHostile(_unit, RandomTarget))))
						{
							TargetTable.push_back(RandomTarget);
						}
					}
				}

				if(_unit->GetHealthPct() >= minhp2cast && _unit->GetHealthPct() <= maxhp2cast && spells[i].targettype == TARGET_RANDOM_FRIEND)
					TargetTable.push_back(_unit);

				if(!TargetTable.size())
					return;

				size_t RandTarget = rand() % TargetTable.size();

				Unit*  RTarget = TargetTable[RandTarget];

				if(!RTarget)
					return;

				switch(spells[i].targettype)
				{
					case TARGET_RANDOM_FRIEND:
					case TARGET_RANDOM_SINGLE:
						_unit->CastSpell(RTarget, spells[i].info, spells[i].instant);
						break;
					case TARGET_RANDOM_DESTINATION:
						_unit->CastSpellAoF(RTarget->GetPositionX(), RTarget->GetPositionY(), RTarget->GetPositionZ(), spells[i].info, spells[i].instant);
						break;
				}

				TargetTable.clear();
			}
		}

		bool FingerOfDeath()
		{
			Unit* NextTarget = NULL;

			for(set<Object*>::iterator itr = _unit->GetInRangeSetBegin(); itr != _unit->GetInRangeSetEnd(); ++itr)
			{
				if(isHostile(_unit, (*itr)) && (*itr)->IsUnit() && _unit->GetDistance2dSq((*itr)) <= spells[4].mindist2cast * spells[4].mindist2cast)
				{
					NextTarget = TO_UNIT(*itr);
					if(NextTarget->isAlive() && _unit->GetAIInterface()->getThreatByPtr(NextTarget) > 0)
					{
						_unit->GetAIInterface()->WipeTargetList();
						_unit->GetAIInterface()->WipeHateList();
						_unit->GetAIInterface()->AttackReaction(NextTarget, 1, 0);
						return false;
					}
				}
			}

			return true;
		}

	protected:
		Creature* Trigger;
		int nrspells;
};

void SetupBattleOfMountHyjal(ScriptMgr* mgr)
{
	mgr->register_instance_script(MAP_HYJALPAST, &MountHyjalScript::Create);

	mgr->register_gossip_script(CN_JAINA_PROUDMOORE, new JainaProudmooreGS);
	mgr->register_gossip_script(CN_THRALL, new ThrallGS);

	mgr->register_creature_script(CN_RAGE_WINTERCHILL, &RageWinterchillAI::Create);
	mgr->register_creature_script(CN_ANETHERON, &AnetheronAI::Create);
	mgr->register_creature_script(CN_KAZROGAL, &KazrogalAI::Create);
	mgr->register_creature_script(CN_AZGALOR, &AzgalorAI::Create);
	mgr->register_creature_script(CN_ARCHIMONDE_CHANNEL_TRIGGER, &ArchimondeTriggerAI::Create);
	mgr->register_creature_script(CN_DOOMFIRE, &DoomfireAI::Create);
	mgr->register_creature_script(CN_ARCHIMONDE, &ArchimondeAI::Create);
}
