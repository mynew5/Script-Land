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
#define	NPC_ARCHAVON			31125
#define	NPC_TEMPEST_MINION		33998
#define	NPC_EMALON				33993

struct Location TempestMinions[4] =
{
    {-203.980103f, -281.287720f, 91.650223f, 1.598807f},
    {-233.489410f, -281.139282f, 91.652412f, 1.598807f},
    {-233.267578f, -297.104645f, 91.681915f, 1.598807f},
    {-203.842529f, -297.097015f, 91.745163f, 1.598807f}
};

class VaulOfArchavon : public MoonInstanceScript
{
	public:
		MOONSCRIPT_INSTANCE_FACTORY_FUNCTION( VaulOfArchavon, MoonInstanceScript);
		VaulOfArchavon(MapMgr* pMapMgr) : MoonInstanceScript(pMapMgr)
		{
		}

		uint32 GetInstanceData(uint32 pType, uint32 pIndex)
		{
			return mEncounter[pIndex];
		}

		void SetInstanceData(uint32 pType, uint32 pIndex, uint32 pData)
		{
			if(pIndex == 1)
			{
				//Wipe!!!
				if(pData == State_Performed && pType == Data_EncounterState)
				{
					Creature * CurrentCreature = NULL;
					for(std::vector< Creature* >::iterator CreatureIter = mInstance->CreatureStorage.begin(); CreatureIter != mInstance->CreatureStorage.end(); ++CreatureIter)
					{
						CurrentCreature = (*CreatureIter);
						if(CurrentCreature != NULL)
						{
							if(CurrentCreature->GetEntry() == NPC_TEMPEST_MINION)
								CurrentCreature->Despawn(0, 0);
						}
					}
					pData = State_NotStarted;
				}
			}
			mEncounter[pIndex] = pData;
		}

	private:
		uint32 mEncounter[2];
};

#define SPELL_ROCK_SHARDS		58678
#define	SPELL_CRUSHING_LEAP		58963
#define	SPELL_STOMP				58663
#define SPELL_IMPALE			58666
#define	SPELL_CHOCKING_CLOUD	58965
#define	SPELL_ARCHAVON_BERSERK	47008

class ArchavonAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(ArchavonAI)
		ArchavonAI(Creature *pCreature) : MoonScriptBossAI(pCreature)
		{
			mStompTimer = INVALIDATE_TIMER;
			SetEnrageInfo(AddSpell(SPELL_ARCHAVON_BERSERK, Target_Self, 0, 0, 0), MINUTE*5*SEC_IN_MS);
		
			AddSpell(SPELL_ROCK_SHARDS, Target_Self, 20, 0.5f, 0);
			AddSpell(SPELL_CRUSHING_LEAP, Target_RandomPlayer, 30, 0, 0);
			AddSpell(SPELL_CHOCKING_CLOUD, Target_RandomPlayer, 30, 0, 0);
		}

		void OnCombatStart(Unit *mTarget)
		{
			mStompTimer = AddTimer(45*SEC_IN_MS);
			MoonScriptBossAI::OnCombatStart(mTarget);
		}

		void AIUpdate()
		{
			if(IsTimerFinished(mStompTimer))
			{
				_unit->CastSpell(_unit, SPELL_STOMP, false);
				_unit->CastSpell(_unit, SPELL_IMPALE, false);
				ResetTimer(mStompTimer, 45*SEC_IN_MS);
			}

			/*if(_unit->GetCurrentSpell() == SPELL_CRUSHING_LEAP)
				_unit->CastSpell(_unit, SPELL_CHOCKING_CLOUD, false);*/
			MoonScriptBossAI::AIUpdate();
		}

	private:
		int32 mStompTimer;
};

#define	SPELL_CHAIN_LIGHTNING	64213
#define SPELL_LIGHTNING_NOVA	64216
#define SPELL_EMALON_BERSERK	26662
#define SPELL_OVERCHARGE		64218

class EmalonAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(EmalonAI)
		EmalonAI(Creature *pCreature) : MoonScriptBossAI(pCreature)
		{
			mInstance = GetInstanceScript();
			SetEnrageInfo(AddSpell(SPELL_EMALON_BERSERK, Target_Self, 0, 0, 0), MINUTE*6*SEC_IN_MS);
			AddSpell(SPELL_CHAIN_LIGHTNING, Target_RandomPlayer, 20, 1, 5);
			AddSpell(SPELL_LIGHTNING_NOVA, Target_Self, 30, 5, 40);
			//mSpellOverchargeTimer = -1;
			SummonMinions();
		}

		void SummonMinions()
		{
			for(uint8 i = 0; i<4; i++)
			{
				if(!ForceCreatureFind(NPC_TEMPEST_MINION, TempestMinions[i].x, TempestMinions[i].y, TempestMinions[i].z))
					SpawnCreature(NPC_TEMPEST_MINION, TempestMinions[i].x, TempestMinions[i].y, TempestMinions[i].z);
			}
		}

		void OnCombatStart(Unit* mAttacker)
		{
			if(mInstance)
				mInstance->SetInstanceData(Data_EncounterState, 1, State_InProgress);
			//mSpellOverchargeTimer = AddTimer(45*SEC_IN_MS);
			MoonScriptBossAI::OnCombatStart(mAttacker);
		}

		void OnCombatStop(Unit* pUnit)
		{
			if(mInstance)
				mInstance->SetInstanceData(Data_EncounterState, 1, State_Performed);
			SummonMinions();
			MoonScriptBossAI::OnCombatStop(pUnit);
		}

		void OnDied(Unit* mKiller)
		{
			if(mInstance)
				mInstance->SetInstanceData(Data_EncounterState, 1, State_Finished);
			MoonScriptBossAI::OnDied(mKiller);
		}

		void AIUpdate()
		{/* need to fix 64217 aura
			if(IsTimerFinished(mSpellOverchargeTimer))
			{
				Unit * pMinion = ForceCreatureFind(NPC_TEMPEST_MINION);
				if(pMinion != NULL)
				{
					_unit->CastSpell(pMinion, SPELL_OVERCHARGE, true);
					pMinion->SetHealthPct(100);
				}
				ResetTimer(mSpellOverchargeTimer, 45*SEC_IN_MS);
			}*/
			MoonScriptBossAI::AIUpdate();
		}

	private:
		//int32 mSpellOverchargeTimer;
		MoonInstanceScript * mInstance;
};

#define	SPELL_SHOCK					64363
#define	SPELL_OVERCHARGED			64217
#define	SPELL_OVERCHARGED_BLAST		64219    // Cast when Overcharged reaches 10 stacks. Mob dies after that

class EmalonMinionAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(EmalonMinionAI)
		EmalonMinionAI(Creature *pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(SPELL_SHOCK, Target_Self, 99, 0, 20);
		}

		void OnDied(Unit* mKiller)
		{
			Creature * pEmalon = _unit->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(_unit->GetPositionX(), _unit->GetPositionY(), _unit->GetPositionZ(), NPC_EMALON);
			if(pEmalon != NULL && pEmalon->isAlive())
			{
				Creature * pSummon = pEmalon->GetMapMgr()->GetInterface()->SpawnCreature(NPC_TEMPEST_MINION, pEmalon->GetPositionX(), pEmalon->GetPositionY(), pEmalon->GetPositionZ(), pEmalon->GetOrientation(), false, true, 0, 0, 1);
				if(pSummon != NULL)
					pSummon->GetAIInterface()->AttackReaction(mKiller, 100);
			}
			MoonScriptCreatureAI::OnDied(mKiller);
		}

		void AIUpdate()
		{
			if(_unit->GetAuraStackCount(SPELL_OVERCHARGED) < 10 && _unit->HasAura(SPELL_OVERCHARGED))
				_unit->CastSpell(_unit, SPELL_OVERCHARGED_BLAST, true);
			else if(_unit->GetAuraStackCount(SPELL_OVERCHARGED) == 10)
			{
				_unit->CastSpell(_unit, SPELL_OVERCHARGED_BLAST, false);
				Despawn();
			}
			MoonScriptCreatureAI::AIUpdate();
		}

	private:
		int32 OverChargedTimer;
};

// Spells Koralon
#define NPC_KORALON				35013
#define	SPELL_BURNING_BREATH	66665
#define	SPELL_BURNING_FURY		66721
#define	SPELL_FLAME_CINDER		66684
#define	SPELL_METEOR_FISTS		66725

class KoralonAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(KoralonAI)
		KoralonAI(Creature *pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(SPELL_METEOR_FISTS, Target_Self, 35, 1.5f, 45);
			AddSpell(SPELL_FLAME_CINDER, Target_Self, 30, 0, 30);
			mBreathTimer = mBurningFuryTimer = -1;
		}

		void OnCombatStart(Unit * pUnit)
		{
			mBreathTimer = AddTimer(15*SEC_IN_MS);
			mBurningFuryTimer = AddTimer(20*SEC_IN_MS);
			MoonScriptCreatureAI::OnCombatStart(pUnit);
		}

		void AIUpdate()
		{
			if(IsTimerFinished(mBreathTimer))
			{
				CastOnAllInrangePlayers(SPELL_BURNING_BREATH, true);
				ResetTimer(mBreathTimer, 45*SEC_IN_MS);
			}

			if(IsTimerFinished(mBurningFuryTimer))
			{
				_unit->CastSpell(_unit, SPELL_BURNING_FURY, true);
				ResetTimer(mBurningFuryTimer, 20*SEC_IN_MS);
			}
			MoonScriptCreatureAI::AIUpdate();
		}

	private:
		int32 mBreathTimer, mBurningFuryTimer;
};

// Toravon
#define NPC_TORAVAN				38433
#define	SPELL_FREEZING_GROUND	72090
#define	SPELL_FROZEN_ORB		72091
#define	SPELL_WHITEOUT          72034
#define	SPELL_FROZEN_MALLET     71993

// Frost Warder
#define	SPELL_FROST_BLAST       72123
#define	SPELL_FROZEN_MALLET_2   72122

// Frozen Orb
#define	SPELL_FROZEN_ORB_DMG    72081    // priodic dmg aura
#define	SPELL_FROZEN_ORB_AURA   72067    // make visible

// Frozen Orb Stalker
#define	SPELL_FROZEN_ORB_SUMMON 72093    // summon orb


class ToravonAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(ToravonAI)
		ToravonAI(Creature *pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(SPELL_FREEZING_GROUND, Target_RandomPlayer, 30, 0, 20);
			mFrozenOrbTimer = -1;
		}

		void OnCombatStart(Unit * pUnit)
		{
			_unit->CastSpell(_unit, SPELL_FROZEN_MALLET, true);
			mFrozenOrbTimer = AddTimer(11*SEC_IN_MS);
			MoonScriptCreatureAI::OnCombatStop(pUnit);
		}

		void AIUpdate()
		{
			if(IsTimerFinished(mFrozenOrbTimer))
			{
				_unit->CastSpell(_unit, SPELL_FROZEN_ORB, false);
				_unit->CastSpell(_unit, SPELL_WHITEOUT, false);
				ResetTimer(mFrozenOrbTimer, 38*SEC_IN_MS);
			}
			MoonScriptCreatureAI::AIUpdate();
		}

	private:
		uint32 mFrozenOrbTimer;
};

void SetupVaultOfArchavon(ScriptMgr * mgr)
{
	mgr->register_instance_script(624, &VaulOfArchavon::Create);
	mgr->register_creature_script(NPC_ARCHAVON, &ArchavonAI::Create);
	mgr->register_creature_script(NPC_EMALON, &EmalonAI::Create);
	mgr->register_creature_script(NPC_TEMPEST_MINION, &EmalonMinionAI::Create);
	mgr->register_creature_script(NPC_KORALON, &KoralonAI::Create);
	mgr->register_creature_script(NPC_TORAVAN, &ToravonAI::Create);
}
