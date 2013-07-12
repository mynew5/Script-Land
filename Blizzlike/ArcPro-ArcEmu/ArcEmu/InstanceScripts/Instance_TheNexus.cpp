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

/* Instance: Nexus
 * Dev Comment: Last boss needs to be finished
 */

#include "Setup.h"

#define ANOMALUS_CS		188527
#define TELESTRA_CS		188526
#define ORMOROK_CS		188528
#define CN_KERISTRASZA  26723
#define CN_ANOMALUS		26763
#define CN_TELESTRA     26731
#define CN_ORMOROK		26794

#define GO_FLAG_UNCLICKABLE 0x00000010

enum NexusEncounterList
{
    NEXUS_ANOMALUS      = 0,
    NEXUS_TELESTRA      = 1,
    NEXUS_ORMOROK       = 2,
    NEXUS_KERISTRASZA   = 3,

    NEXUS_END           = 4
};

////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////// Anomalus ////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
#define CN_CHAOTIC_RIFT			26918
#define CN_CRAZED_MANA_WRAITH	26746

#define SPARK					47751			
#define CHAOTIC_ENERGY_BURST	47688
#define CHAOTIC_RIFT_AURA		47687
#define SUMMON_MANA_WRAITH		47692

class AnomalusAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(AnomalusAI)
		AnomalusAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddEmote(Event_OnDied, "Of course.", Text_Yell, 13187);
			AddEmote(Event_OnCombatStart, "Chaos beckons.", Text_Yell, 13186);

			mInstance = GetInstanceScript();
			AddSpell(SPARK, Target_RandomPlayer, 80.0f, 0, 3);

			mSummon = 0;
		}

		void OnCombatStart(Unit* mTarget)
		{
			mSummon = 0;
			mRift = false;
			mSummonTimer = AddTimer(HeroicInt(14000, 18000));

			if(mInstance)
				mInstance->SetInstanceData(Data_EncounterState, NEXUS_ANOMALUS, State_InProgress);
			MoonScriptCreatureAI::OnCombatStart(mTarget);
		}

		void AIUpdate()
		{
			if((GetHealthPercent() <= 50 && mSummon == 0))
				mSummon += 1;

			if(mSummon == 1)
				ChargeRift();

			if(IsTimerFinished(mSummonTimer) && mRift == false)
			{
				SummonRift(false);
				ResetTimer(mSummonTimer, IsHeroic() ? 14000 : 18000);
			}

			if(mRift == true && (GetLinkedCreature() == NULL || ! GetLinkedCreature()->IsAlive()))
			{
				RemoveAura(47748);
				mRift = false;
			}
			MoonScriptCreatureAI::AIUpdate();
		}

		void SummonRift(bool bToCharge)
		{
			if(!bToCharge)
				Emote("Reality... unwoven.", Text_Yell, 13188);

			Announce("Anomalus opens a Chaotic Rift!");
			//we are linked with CN_CHAOTIC_RIFT.
			CreatureAIScript* chaoticRift = SpawnCreature(CN_CHAOTIC_RIFT, _unit->GetPositionX() + 13.5f, _unit->GetPositionY(), _unit->GetPositionZ(), _unit->GetOrientation(), false);
			if(chaoticRift != NULL)
			{
				SetLinkedCreature(chaoticRift);
				chaoticRift->SetLinkedCreature(this);
			}
		}

		void ChargeRift()
		{
			SummonRift(true);

			Announce("Anomalus shields himself and diverts his power to the rifts!");
			Emote("Indestructible.", Text_Yell, 13189);
			ApplyAura(47748);   // me immune
			SetCanMove(false);

			mRift = true;
			mSummon += 1;
		}

		void OnDied(Unit* pKiller)
		{
			if(mInstance)
				mInstance->SetInstanceData(Data_EncounterState, NEXUS_ANOMALUS, State_Finished);
			MoonScriptCreatureAI::OnDied(pKiller);
		}

		void OnCombatStop(Unit* pTarget)
		{
			if(mInstance)
				mInstance->SetInstanceData(Data_EncounterState, NEXUS_ANOMALUS, State_Performed);
			MoonScriptCreatureAI::OnCombatStop(pTarget);
		}

	private:
		int32					mSummonTimer;
		uint8					mSummon;
		bool					mRift;
		MoonInstanceScript*		mInstance;
};

class ChaoticRiftAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(ChaoticRiftAI)
		ChaoticRiftAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			SetCanEnterCombat(false);
			AddSpell(SUMMON_MANA_WRAITH, Target_Self, 30, 0, dbcSpell.LookupEntryForced(SUMMON_MANA_WRAITH)->RecoveryTime);
			AddSpell(CHAOTIC_ENERGY_BURST, Target_RandomPlayer, 30, 0, dbcSpell.LookupEntryForced(CHAOTIC_ENERGY_BURST)->RecoveryTime);
		}

		void OnLoad()
		{
			ApplyAura(CHAOTIC_RIFT_AURA);
			Despawn(40000, 0);
		}

		void OnDied(Unit*  mKiller)
		{
			Despawn(2000, 0);
			MoonScriptCreatureAI::OnDied(mKiller);
		}

		void OnCombatStop(Unit* pTarget)
		{
			Despawn(2000, 0);
			MoonScriptCreatureAI::OnCombatStop(pTarget);
		}
};

class CraziedManaWrathAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(CraziedManaWrathAI)
		CraziedManaWrathAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature) {};

		void OnCombatStop(Unit* pTarget)
		{
			Despawn(2000, 0);
			MoonScriptCreatureAI::OnCombatStop(pTarget);
		}

		void OnDied(Unit*  mKiller)
		{
			Despawn(2000, 0);
			MoonScriptCreatureAI::OnDied(mKiller);
		}
};


////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// Grand Magus Telestra //////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

static Location FormSpawns[] =
{
	{ 494.726990f, 89.128799f, -15.941300f, 6.021390f },
	{ 495.006012f, 89.328102f, -16.124609f, 0.027486f },
	{ 504.798431f, 102.248375f, -16.124609f, 4.629921f }
};

#define CN_TELESTRA_FROST 26930
#define CN_TELESTRA_FIRE 26928
#define CN_TELESTRA_ARCANE 26929

#define GRAVITY_WELL 47756

// Normal mode spells
#define ICE_NOVA 47772
#define FIREBOMB 47773

// Arcane spells
#define CRITTER 47731
#define TIME_STOP 47736

// Fire
#define FIRE_BLAST 47721
#define SCORCH 47723

// Frost
#define BLIZZARD 47727
#define ICE_BARB 47729

class TelestraBossAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(TelestraBossAI)
		TelestraBossAI(Creature* pCreature) : MoonScriptBossAI(pCreature)
		{
			mInstance = GetInstanceScript();
			AddSpell(ICE_NOVA, Target_Self, 25.0f, 2.0, 15);
			AddSpell(FIREBOMB, Target_RandomPlayer, 35.0f, 1.5, 5);
			AddSpell(GRAVITY_WELL, Target_Self, 15.0f, 0.5, 20);

			mAddCount = 0;

			AddEmote(Event_OnCombatStart, "You know what they say about curiosity. ", Text_Yell, 13319);
			AddEmote(Event_OnDied, "Damn the... luck.", Text_Yell, 13320);
			AddEmote(Event_OnTargetDied, "Death becomes you!", Text_Yell, 13324);
			mAddArray[0] = mAddArray[1] = mAddArray[2] = NULL;
		}

		void AIUpdate()
		{
			if(GetPhase() == 1 && GetHealthPercent() <= 25)
			{
				switch(rand() % 2)
				{
					case 0: Emote("I'll give you more than you can handle.", Text_Yell, 13321); break;
					case 1: Emote("There's plenty of me to go around.", Text_Yell, 13322); break;
				}
				
				SetPhase(2);
				SetCanMove(false);
				SetAllowRanged(false);
				SetAllowSpell(false);
				SetAllowTargeting(false);
				ApplyAura(60191);

				for(int i = 0; i < 3; ++i)
				{
					mAddArray[i] = _unit->GetMapMgr()->GetInterface()->SpawnCreature(CN_TELESTRA_FIRE + i, FormSpawns[i].x, FormSpawns[i].y, FormSpawns[i].z, FormSpawns[i].o, true, true, 0, 0);
					if(mAddArray[i] != NULL)
						++mAddCount;
				}
			}

			if(GetPhase() == 2)
			{
				for(int i = 0; i < 3; ++i)
				{
					if(mAddArray[i] != NULL)
					{
						mAddArray[i]->Despawn(1000, 0);
						mAddArray[i] = NULL;
						--mAddCount;
					}
				}

				if(mAddCount != 0)
					return;

				Emote("Now to finish the job!", Text_Yell, 13323);
				RemoveAura(60191);
				SetCanMove(true);
				SetPhase(HeroicInt(1, 3));   //3 disables p2
			}
			MoonScriptBossAI::AIUpdate();
		}

		void OnCombatStart(Unit* pTarget)
		{
			if(mInstance)
				mInstance->SetInstanceData(Data_EncounterState, NEXUS_TELESTRA, State_InProgress);
			MoonScriptBossAI::OnCombatStart(pTarget);
		}

		void OnCombatStop(Unit* pTarget)
		{
			for(int i = 0; i < 3; ++i)
			{
				if(mAddArray[i] != NULL)
				{
					mAddArray[i]->Despawn(1000, 0);
					mAddArray[i] = NULL;
				}
			}

			if(mInstance)
				mInstance->SetInstanceData(Data_EncounterState, NEXUS_TELESTRA, State_Performed);
			MoonScriptBossAI::OnCombatStop(pTarget);
		}

		void OnDied(Unit* pKiller)
		{
			for(int i = 0; i < 3; ++i)
			{
				if(mAddArray[i] != NULL)
				{
					mAddArray[i]->Despawn(1000, 0);
					mAddArray[i] = NULL;
				}
			}

			if(mInstance)
				mInstance->SetInstanceData(Data_EncounterState, NEXUS_TELESTRA, State_Finished);
			MoonScriptBossAI::OnDied(pKiller);
		}

	private:
		Creature*   mAddArray[3];
		bool        mHeroic;
		int32       mAddCount;
		MoonInstanceScript* mInstance;
};

class TelestraFireAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(TelestraFireAI)
		TelestraFireAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(FIRE_BLAST, Target_RandomPlayer, 30.0f, 0, 14);
			AddSpell(SCORCH, Target_Current, 100.0f, 1, 3);
		}

		void OnLoad()
		{
			AggroNearestUnit();
		}
};

class TelestraFrostAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(TelestraFrostAI)
		TelestraFrostAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(BLIZZARD, Target_RandomPlayerDestination, 20.0f, 0, 20);
			AddSpell(ICE_BARB, Target_RandomPlayer, 25.0f, 0.5, 6);
		}

		void OnLoad()
		{
			AggroNearestUnit();
		}
};

class TelestraArcaneAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(TelestraArcaneAI)
		TelestraArcaneAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(TIME_STOP, Target_Self, 30.0f, 1.5, 30);
			AddSpell(CRITTER, Target_RandomPlayer, 25.0f, 0, 20);
		}

		void OnLoad()
		{
			AggroNearestUnit();
		}
};

////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// Ormorok the Tree-Shaper ///////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

// creatures
#define CN_CRYSTAL_SPIKE			27099

// spells
#define SPELL_REFLECTION			47981
#define FRENZY						48017

// normal mode spells
#define TRAMPLE						48016
#define CRYSTAL_SPIKES				47958

// Crystal Spike spells
#define SPELL_CRYSTAL_SPIKE_VISUAL	50442
#define SPELL_CRYSTAL_SPIKE			47944

class OrmorokAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(OrmorokAI)
		OrmorokAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddEmote(Event_OnCombatStart, "Noo!", Text_Yell, 13328);
			AddEmote(Event_OnDied, "Aaggh!", Text_Yell, 13330);

			mInstance = GetInstanceScript();
			AddSpell(TRAMPLE, Target_Current, 30.0f, 0, 9);
			AddSpell(SPELL_REFLECTION, Target_Self, 35.0f, 2.0f, 15);
			AddSpell(CRYSTAL_SPIKES, Target_Self, 25.0f, 0, 12, 0, 0, false, "Bleed!", Text_Yell, 13332);

			mEnraged = false;
		}

		void OnCombatStart(Unit* pTarget)
		{
			mEnraged = false;
			MoonScriptCreatureAI::OnCombatStart(pTarget);
		}

		void AIUpdate()
		{
			if(GetHealthPercent() <= 25 && !mEnraged)
			{
				ApplyAura(FRENZY);
				Announce("Ormorok the Tree-Shaper goes into a frenzy!");
				mEnraged = true;
			}
			MoonScriptCreatureAI::AIUpdate();
		}

		void OnDied(Unit* pKiller)
		{
			if(mInstance)
				mInstance->SetInstanceData(Data_EncounterState, NEXUS_ORMOROK, State_Finished);
			MoonScriptCreatureAI::OnDied(pKiller);
		}

	private:
		SpellDesc*	mCrystalSpikes;
		bool		mEnraged;
		MoonInstanceScript* mInstance;
};

class CrystalSpikeAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(CrystalSpikeAI)
		CrystalSpikeAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature) {};

		void OnLoad()
		{
			SetCanEnterCombat(false);
			SetCanMove(false);
			_unit->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

			Despawn(4500, 0);
			RegisterAIUpdateEvent(500);
			m_part = 0;
		}

		void AIUpdate()
		{
			m_part += 1;

			if(m_part == 1)
				ApplyAura(SPELL_CRYSTAL_SPIKE_VISUAL);
			else if(m_part == 5)
				ApplyAura(SPELL_CRYSTAL_SPIKE);
			MoonScriptCreatureAI::AIUpdate();
		}

	private:
		uint8	m_part;
};

////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// Keristrasza //////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
// unfinished
#define TAIL_SWEEP					50155
#define INTENSE_COLD				48094
#define CRYSTAL_CHAINS				50997
#define CRYSTALLIZE					48179
#define ENRAGE						8599

// normal mode
#define CRYSTALFIRE_BREATH			48096

class KeristraszaAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(KeristraszaAI)
		KeristraszaAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddEmote(Event_OnCombatStart, "Preserve? Why? There's no truth in it. No no no... only in the taking! I see that now!", Text_Yell, 13450);
			AddEmote(Event_OnTargetDied, "Now we've come to the truth!", Text_Yell, 13453);
			AddEmote(Event_OnDied, "Dragonqueen... Life-Binder... preserve... me.", Text_Yell, 13454);

			AddSpell(CRYSTALFIRE_BREATH, Target_Self, 30.0f, 1, 14);
			AddSpell(CRYSTAL_CHAINS, Target_RandomPlayer, 30.0f, 0, 12);
			AddSpell(TAIL_SWEEP, Target_Self, 40.0f, 0, 8);

			AddSpell(CRYSTALLIZE, Target_Self, 25.0f, 0, 22, 0, 0, false, "Stay. Enjoy your final moments.", Text_Yell, 13451);

			mEnraged = false;
			SetCanEnterCombat(false);
		}

		void OnLoad()
		{
			ApplyAura(47543);   // frozen prison
		}

		void AIUpdate()
		{
			if(!mEnraged && GetHealthPercent() <= 25)
			{
				ApplyAura(ENRAGE);
				mEnraged = true;
			}
			MoonScriptCreatureAI::AIUpdate();
		}

		void Release()
		{
			SetCanEnterCombat(true);
			RemoveAura(47543);
			ApplyAura(INTENSE_COLD);
		}

	private:
		bool		mEnraged;
		SpellDesc*	mCrystalize;
};

// Nexus Instance script
#define MAP_NEXUS 576

class NexusScript : public MoonInstanceScript
{
	public:
		MOONSCRIPT_INSTANCE_FACTORY_FUNCTION(NexusScript, MoonInstanceScript);
		NexusScript(MapMgr* pMapMgr) : MoonInstanceScript(pMapMgr)
		{
			mAnomalusGUID = 0;
			mTelestraGUID = 0;
			mOrmorokGUID = 0;
			mKeristraszaGUID = 0;

			mCSCount = 0;

			for(uint32 i = 0; i < NEXUS_END; ++i)
				m_uiEncounters[i] = State_NotStarted;
		}

		void SetInstanceData(uint32 pType, uint32 pIndex, uint32 pData)
		{
			if(pType != Data_EncounterState)
				return;

			if(pIndex >= NEXUS_END)
				return;

			m_uiEncounters[pIndex] = pData;

			if(pData == State_Finished)
			{
				GameObject* pSphere = NULL;

				switch(pIndex)
				{
					case NEXUS_ANOMALUS: pSphere = GetGameObjectBySqlId(ANOMALUS_CS); break;
					case NEXUS_TELESTRA: pSphere = GetGameObjectBySqlId(TELESTRA_CS); break;
					case NEXUS_ORMOROK: pSphere = GetGameObjectBySqlId(ORMOROK_CS); break;
				}

				if(pSphere != NULL)
					pSphere->SetState(GAMEOBJECT_STATE_OPEN);
			}
		}

		uint32 GetInstanceData(uint32 pType, uint32 pIndex)
		{
			return m_uiEncounters[pIndex];
		}

		void OnCreaturePushToWorld(Creature* pCreature)
		{
			switch(pCreature->GetEntry())
			{
				case CN_KERISTRASZA: mKeristraszaGUID = pCreature->GetLowGUID(); break;
				case CN_ANOMALUS: mAnomalusGUID = pCreature->GetLowGUID(); break;
				case CN_TELESTRA: mTelestraGUID = pCreature->GetLowGUID(); break;
				case CN_ORMOROK: mOrmorokGUID = pCreature->GetLowGUID(); break;
			}
		}

		void OnGameObjectPushToWorld(GameObject* pGameObject)
		{
			switch(pGameObject->GetEntry())
			{
				case ANOMALUS_CS: pGameObject->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_UNCLICKABLE); break;
				case TELESTRA_CS: pGameObject->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_UNCLICKABLE); break;
				case ORMOROK_CS: pGameObject->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_UNCLICKABLE); break;
			}
		}

		void OnGameObjectActivate(GameObject* pGameObject, Player* pPlayer)
		{
			switch(pGameObject->GetEntry())
			{
				case ANOMALUS_CS:
				{
					pGameObject->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_UNCLICKABLE);
					++mCSCount;
				}break;
				case TELESTRA_CS:
				{
					pGameObject->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_UNCLICKABLE);
					++mCSCount;
				}break;
				case ORMOROK_CS:
				{
					pGameObject->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_UNCLICKABLE);
					++mCSCount;
				}break;
			}

			if(mCSCount == 3)   // release last boss
			{
				Creature* pKeristrasza = GetCreatureByGuid(mKeristraszaGUID);
				if(pKeristrasza == NULL)
					return;

				KeristraszaAI* pKeristraszaAI = TO< KeristraszaAI* >(pKeristrasza->GetScript());
				if(pKeristraszaAI == NULL)
					return;

				pKeristraszaAI->Release();
			}
		}

	protected:
		uint32 mAnomalusGUID, mTelestraGUID, mOrmorokGUID, mKeristraszaGUID, m_uiEncounters[NEXUS_END];
		uint8 mCSCount;
};

void SetupNexus(ScriptMgr* mgr)
{
	// Anomalus Encounter
	mgr->register_creature_script(CN_ANOMALUS, &AnomalusAI::Create);
	mgr->register_creature_script(CN_CHAOTIC_RIFT, &ChaoticRiftAI::Create);
	mgr->register_creature_script(CN_CRAZED_MANA_WRAITH, &CraziedManaWrathAI::Create);

	// Grand Magus Telestra Encounter
	mgr->register_creature_script(CN_TELESTRA, &TelestraBossAI::Create);
	mgr->register_creature_script(CN_TELESTRA_ARCANE, &TelestraArcaneAI::Create);
	mgr->register_creature_script(CN_TELESTRA_FROST, &TelestraFrostAI::Create);
	mgr->register_creature_script(CN_TELESTRA_FIRE, &TelestraFireAI::Create);

	// Ormorok the Tree-Shaper Encounter
	mgr->register_creature_script(CN_ORMOROK, &OrmorokAI::Create);
	mgr->register_creature_script(CN_CRYSTAL_SPIKE, &CrystalSpikeAI::Create);


	// Keristrasza Encounter
	mgr->register_creature_script(CN_KERISTRASZA, &KeristraszaAI::Create);

	mgr->register_instance_script(MAP_NEXUS, &NexusScript::Create);
}
