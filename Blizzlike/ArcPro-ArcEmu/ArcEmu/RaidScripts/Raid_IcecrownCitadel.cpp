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
 
#include "setup.h"
#include "Raid_IcecrownCitadel.h"

//Thanks for HolyStone, Mangos, MangosR2, TrinityCore and Scriptdev2 teams for some information

class IcecrownCitadelInstanceScript : public MoonInstanceScript
{
	public:
		ADD_INSTANCE_FACTORY_FUNCTION(IcecrownCitadelInstanceScript)
		IcecrownCitadelInstanceScript(MapMgr* pMapMgr) : MoonInstanceScript(pMapMgr)
		{
			mInstance->GetInstanceID();
			if(mInstance->pInstance->m_killedNpcs.size() > 0)
			{
				for(uint8 i = 0; i<ICC_END; i++)
				{
					if(mInstance->pInstance->m_killedNpcs.find(IccBossEntries[i]) != mInstance->pInstance->m_killedNpcs.end())
						SetInstanceData(i, State_Finished);
				}
			}
		}

		void OnPlayerEnter(Player* pPlayer)
		{
			pPlayer->CastSpell(pPlayer, 69127, true);	//chill of throne
			if(pPlayer->GetTeam() == TEAM_ALLIANCE)	
			{//Alliance phase
				pPlayer->CastSpell(pPlayer, 55774, true);
				pPlayer->CastSpell(pPlayer, 73828, true);
			}
			else
			{//Horde phase
				pPlayer->CastSpell(pPlayer, 55773, true);
				pPlayer->CastSpell(pPlayer, 73822, true);
			}
		}

		void SetCreatureStats(uint8 id, Creature * c)
		{
			uint32 hp = 0;
			int32 mp = 0;
			switch(GetInstanceMode())
			{
				case MODE_NORMAL_10MEN:
				{
					hp = ICC_boss_stat_Data[id].Health_10_normal;
					mp = ICC_boss_stat_Data[id].Mana_10_normal;
				}break;
				case MODE_NORMAL_25MEN:
				{
					hp = ICC_boss_stat_Data[id].Health_25_normal;
					mp = ICC_boss_stat_Data[id].Mana_25_normal;
				}break;
				case MODE_HEROIC_10MEN:
				{
					hp = ICC_boss_stat_Data[id].Health_10_heroic;
					mp = ICC_boss_stat_Data[id].Mana_10_heroic;
				}break;
				case MODE_HEROIC_25MEN:
				{
					hp = ICC_boss_stat_Data[id].Health_25_heroic;
					mp = ICC_boss_stat_Data[id].Mana_25_heroic;
				}break;
			}
			c->SetHealth(hp > 0 ? hp : c->GetHealth());
			c->SetHealthPct(100);	//required to avoid cheating, because when setting, boss is regenerating hp...

			//no need to set this for all, only for them, who has mana...
			//deathbringer saurfang - not sure, but i think, he has runic power (no need to set this here)
			if(c->GetPower(POWER_TYPE_MANA) != 0)
				c->SetPower(POWER_TYPE_MANA, mp>0 ? mp : c->GetPower(POWER_TYPE_MANA));
		}

		void OnCreaturePushToWorld(Creature* c)
		{
			//bosses stats
			switch(c->GetEntry())
			{
				case NPC_LICH_KING: SetCreatureStats(10, c); break;
				case NPC_LORD_MARROWGAR: SetCreatureStats(0, c); break;
				case NPC_FESTERGUT: SetCreatureStats(3, c); break;
				case NPC_ROTFACE: SetCreatureStats(4, c); break;
				case NPC_PROFESSOR_PUTRICIDE: SetCreatureStats(5, c); break;
				case NPC_VALITRA_DREAMWALKER: SetCreatureStats(6, c); break;
				case NPC_SINDRAGOSA: SetCreatureStats(6, c); break;
				case NPC_LADY_DEATHWHISPER: SetCreatureStats(1, c); break;
				case NPC_DEATHBRINGER_SAURFANG: SetCreatureStats(2, c); break;
				case NPC_BLOOD_QUEEN_LANATHEL: SetCreatureStats(1, c); break;
				case NPC_PRINCE_VALANAR: SetCreatureStats(8, c); break;
			}
		}
		
		void OnCreatureDeath(Creature* c, Unit* mKiller)
		{
			switch(c->GetEntry())
			{
				case NPC_LICH_KING: 
				case NPC_LORD_MARROWGAR: SetInstanceData(ICC_LORD_MARROWGAR, State_Finished); break;
				case NPC_LADY_DEATHWHISPER:
					break;
				case NPC_ROTFACE: 
				{
					if(GameObject * pGo = FindClosestGameObjectOnMap(GO_OOZE_RELEASE_VALVE, 4432.27f, 3090.88f, 362.253f))
						pGo->SetFlags(0);
				}break;
				case NPC_FESTERGUT: 
				{
					if(GameObject * pGo = FindClosestGameObjectOnMap(GO_GAS_RELEASE_VALVE, 4280.84f, 3090.88f, 362.335f))
						pGo->SetFlags(0);
				}break;
				case NPC_PROFESSOR_PUTRICIDE:
				case NPC_VALITRA_DREAMWALKER:
				case NPC_SINDRAGOSA:
				case NPC_DEATHBRINGER_SAURFANG:
				case NPC_BLOOD_QUEEN_LANATHEL:
				case NPC_PRINCE_VALANAR:
					break;
			}
		}

		void OnGameObjectPushToWorld(GameObject* g)
		{
			switch(g->GetEntry())
			{
				case GO_ICEBLOCK_1:
				case GO_ICEBLOCK_2:
				case GO_DAMMED_ENTRANCE:
				{
					if(GetInstanceData(ICC_LORD_MARROWGAR) == State_Finished)
						g->SetState(GAMEOBJECT_STATE_OPEN);
				}break;
			}
		}

		void OnGameObjectActivate(GameObject* pGO, Player* pPlayer)
		{
			switch(pGO->GetEntry())
			{
				case GO_OOZE_RELEASE_VALVE :
				{
					pGO->SetState(GAMEOBJECT_STATE_OPEN);
					AddGameObjectStateByEntry(GO_SCIENTIST_AIRLOCK_DOOR_GREEN, GAMEOBJECT_STATE_OPEN);
					pGO->SetFlags(16);
					RegisterScriptUpdateEvent();
				}break;
				case GO_GAS_RELEASE_VALVE :
				{
					pGO->SetState(GAMEOBJECT_STATE_OPEN);
					AddGameObjectStateByEntry(GO_SCIENTIST_AIRLOCK_DOOR_ORANGE, GAMEOBJECT_STATE_OPEN);
					pGO->SetFlags(16);
					RegisterScriptUpdateEvent();
				}break;
			}
		}

		void UpdateEvent()
		{
			GameObject * pGO1 = FindClosestGameObjectOnMap(GO_OOZE_RELEASE_VALVE, 4432.27f, 3090.88f, 362.253f);
			if(pGO1 == NULL)
				return;

			GameObject * pGO2 = FindClosestGameObjectOnMap(GO_GAS_RELEASE_VALVE, 4280.84f, 3090.88f, 362.335f);
			if(pGO2 == NULL)
				return;

			if((pGO1->GetState() == GAMEOBJECT_STATE_OPEN) && (pGO2->GetState() == GAMEOBJECT_STATE_OPEN))
			{
				AddGameObjectStateByEntry(GO_SCIENTIST_DOOR_COLLISION, GAMEOBJECT_STATE_OPEN);
				AddGameObjectStateByEntry(GO_SCIENTIST_ENTRANCE, GAMEOBJECT_STATE_OPEN);
			}
		}

		uint32 GetInstanceData(uint32 pIndex)
		{
			return mEncounters[pIndex];
			MoonInstanceScript::GetInstanceData(pIndex);
		}

		void SetInstanceData(uint32 pIndex, uint32 pData)
		{
			if(pIndex >= ICC_END)
				return;

			switch(pIndex)
			{
				case ICC_LORD_MARROWGAR:
				{
					if(pData == State_InProgress)
						AddGameObjectStateByEntry(GO_MARROWGAR_ENTRANCE, GAMEOBJECT_STATE_CLOSED);
					else if(pData == State_NotStarted)
						AddGameObjectStateByEntry(GO_MARROWGAR_ENTRANCE, GAMEOBJECT_STATE_OPEN);
					else if(pData == State_Finished)
					{
						AddGameObjectStateByEntry(GO_DAMMED_ENTRANCE, GAMEOBJECT_STATE_OPEN);
						AddGameObjectStateByEntry(GO_MARROWGAR_ENTRANCE, GAMEOBJECT_STATE_OPEN);
						AddGameObjectStateByEntry(GO_ICEBLOCK_1, GAMEOBJECT_STATE_OPEN);
						AddGameObjectStateByEntry(GO_ICEBLOCK_2, GAMEOBJECT_STATE_OPEN);
					}
				}break;
				default:
					break;
			}
			mEncounters[pIndex] = pData;
			MoonInstanceScript::SetInstanceData(pIndex, pData);
		}

	protected:
		uint32 mEncounters[ICC_END];
};



enum TeleporterSpells{
    LIGHT_S_HAMMER_TELEPORT         = 70781,
    ORATORY_OF_THE_DAMNED_TELEPORT  = 70856,
    RAMPART_OF_SKULLS_TELEPORT      = 70857,
    DEATHBRINGER_S_RISE_TELEPORT    = 70858,
    UPPER_SPIRE_TELEPORT            = 70859,
    FROZEN_THRONE_TELEPORT          = 70860,
    SINDRAGOSA_S_LAIR_TELEPORT      = 70861
};

static LocationExtra ScourgeTelePos[7]=
{
	{-17.1928f, 2211.44f, 30.1158f, 3.14f, LIGHT_S_HAMMER_TELEPORT},
	{-503.62f, 2211.47f, 62.8235f, 3.14f, ORATORY_OF_THE_DAMNED_TELEPORT},
	{-615.145f, 2211.47f, 199.972f, 0, RAMPART_OF_SKULLS_TELEPORT},
	{-549.131f, 2211.29f, 539.291f, 0, UPPER_SPIRE_TELEPORT},
	{4198.42f, 2769.22f, 351.065f, 0, DEATHBRINGER_S_RISE_TELEPORT},
	{4356.580078f, 2565.75f, 220.401993f, 4.90f, SINDRAGOSA_S_LAIR_TELEPORT},
	{528.767273f, -2124.845947f, 1043.1f, 3.14f, FROZEN_THRONE_TELEPORT}
};

class ScourgeTeleporterAI : public GameObjectAIScript
{
	public:
		ScourgeTeleporterAI(GameObject* go) : GameObjectAIScript(go){}
		~ScourgeTeleporterAI() {}
		ADD_GAMEOBJECT_FACTORY_FUNCTION(ScourgeTeleporterAI)

		void OnActivate(Player* player)
		{
			IcecrownCitadelInstanceScript * pInstance = (IcecrownCitadelInstanceScript*)player->GetMapMgr()->GetScript();
			if(!pInstance)
				return;

			_gameobject->SetState(GAMEOBJECT_STATE_OPEN);
			GossipMenu* menu;
			objmgr.CreateGossipMenuForPlayer(&menu, _gameobject->GetGUID(), 0, player);
			menu->AddItem(Arcemu::Gossip::ICON_CHAT, "Teleport to Light's Hammer.", 0);

			if(pInstance->GetInstanceData(ICC_LORD_MARROWGAR) == State_Finished)
				menu->AddItem(Arcemu::Gossip::ICON_CHAT, "Teleport to the Oratory of the Damned.", 1);

			if(pInstance->GetInstanceData(ICC_LADY_DEATHWHISPER) == State_Finished)
			{
				menu->AddItem(Arcemu::Gossip::ICON_CHAT, "Teleport to the Rampart of Skulls.", 2);
				menu->AddItem(Arcemu::Gossip::ICON_CHAT, "Teleport to the Deathbringer's Rise.", 3);
			}
			//check for gunship is disabled temporally, until this event will done - it requires much hard coding.
			/*if( pInstance->GetInstanceData(Data_EncounterState, ICC_GUNSHIP) == State_Finished)
				menu->AddItem(Arcemu::Gossip::ICON_CHAT, "Teleport to the Deathbringer's Rise.", 3);*/

			if(pInstance->GetInstanceData(ICC_SAURFANG) == State_Finished)
				menu->AddItem(Arcemu::Gossip::ICON_CHAT, "Teleport to the Upper Spire.", 4);

			if(pInstance->GetInstanceData(ICC_SAURFANG) == State_Finished
				&& pInstance->GetInstanceData(ICC_PROFESSOR_PUTRICIDE) == State_Finished
				&& pInstance->GetInstanceData(ICC_BLOOD_QUEEN_LANATHEL) == State_Finished
				&& pInstance->GetInstanceData(ICC_VALITRA_DREAMWALKER) == State_Finished)
				menu->AddItem(Arcemu::Gossip::ICON_CHAT, "Teleport to Sindragosa's Lair", 5);

			if(pInstance->GetInstanceData(ICC_SINDRAGOSA) == State_Finished)
				menu->AddItem(Arcemu::Gossip::ICON_CHAT, "Teleport to Frozen Throne", 6);
			menu->SendTo(player);
		}
};

class ScourgeTeleporterGossip : public GossipScript
{
	public:
		ScourgeTeleporterGossip() : GossipScript(){}

		void OnSelectOption(Object* object, Player* player, uint32 Id, const char* enteredcode)
		{
			if(Id > 6)
				return;

			Arcemu::Gossip::Menu::Complete(player);
			//player->CastSpell(player, ScourgeTelePos[Id].addition, true);
			player->SafeTeleport(MAP_ICC, player->GetInstanceID(), ScourgeTelePos[Id].x, ScourgeTelePos[Id].y,  ScourgeTelePos[Id].z, ScourgeTelePos[Id].o);
		}
};

//LORD MARROWGAR ENCOUNTER
enum MarrowgarSpells
{
	SPELL_LM_BERSERK		= 47008,
	SPELL_BONE_SLICE		= 69055,
	SPELL_BONE_STORM		= 69076,
	SPELL_BONE_SPIKE		= 69057,
	SPELL_COLDFLAME			= 69140,
	SPELL_SOUL_FEAST		= 71203,
	SPELL_COLDFLAME_BONESTORM	= 72705
};

enum LM_Summons
{
	MAX_COLDFLAMES_XFORM	= 20,
    NPC_BONE_SPIKE			= 38711,
    NPC_COLD_FLAME			= 36672
};

class LordMarrowgarAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(LordMarrowgarAI)
		LordMarrowgarAI(Creature* pCreature) : MoonScriptBossAI(pCreature)
		{
			mInstance = GetInstanceScript();
			Reset();

			SetEnrageInfo(AddSpell(SPELL_LM_BERSERK, Target_Self, 0, 0, 0, 0, 0, false, "THE MASTER'S RAGE COURSES THROUGH ME!", Text_Yell, 16945), MINUTE*10*SEC_IN_MS);

			//Bone Storm!
			sBoneStorm = AddSpell(SPELL_BONE_STORM, Target_Self, 0, 3, -1, 0, 0, false, "BONE STORM!", Text_Yell, 16946, "Lord Marrowgar creates a whirling of bone!");

			//normal phase
			AddPhaseSpell(1, AddSpell(SPELL_BONE_SLICE, Target_Current, 25.0f, 0, -1));
			if((GetInstanceMode() == MODE_HEROIC_10MEN) || (GetInstanceMode() == MODE_HEROIC_25MEN))
			{
				SpellDesc* sBoneSpike = AddPhaseSpell(1, AddSpell(SPELL_BONE_SPIKE, Target_RandomPlayer, 25.0f, 0, rand()%20+15));
				sBoneSpike->AddEmote("Bound by bone!", Text_Yell, 16947);
				sBoneSpike->AddEmote("Stick Around!", Text_Yell, 16948);
				sBoneSpike->AddEmote("The only escape is death!", Text_Yell, 16949);
			}

			Emote("This is the beginning AND the end, mortals. None may enter the master's sanctum!", Text_Yell, 16950);
			AddEmote(Event_OnCombatStart, "The Scourge will wash over this world as a swarm of death and destruction!", Text_Yell, 16941);
			AddEmote(Event_OnTargetDied, "More bones for the offering!", Text_Yell, 16942);
			AddEmote(Event_OnTargetDied, "Languish in damnation!", Text_Yell, 16943);
			AddEmote(Event_OnDied, "I see... only darkness...", Text_Yell, 16944);
		}

		void Reset()
		{
			BoneStormTimer = ChargeTimer = ColdFlameTimer = -1;
			Stage = -1;
			SetBehavior(Behavior_Default);
			_unit->SetSpeeds(RUN, 8.0f);
		}

		void OnCombatStart(Unit* pUnit)
		{
			BoneStormTimer = AddTimer(30*SEC_IN_MS);
			ColdFlameTimer = AddTimer(5*SEC_IN_MS);
			if(mInstance)
				mInstance->SetInstanceData(ICC_LORD_MARROWGAR, State_InProgress);
			MoonScriptBossAI::OnCombatStart(pUnit);
		}

		void OnCombatStop(Unit* mTarget)
		{
			Reset();

			if(mInstance)
				mInstance->SetInstanceData(ICC_LORD_MARROWGAR, State_NotStarted);
			MoonScriptBossAI::OnCombatStop(mTarget);
		}

		void OnDied(Unit* mKiller)
		{
			_unit->CastSpell(_unit, SPELL_SOUL_FEAST, false);
			MoonScriptBossAI::OnDied(mKiller);
		}

		void AIUpdate()
		{
			if(IsTimerFinished(BoneStormTimer) && GetPhase() == 1 && Stage == -1)
				Stage++;

			if(Stage == 0)
			{
				ClearHateList();
				SetBehavior(Behavior_Spell);
				_unit->SetSpeeds(RUN, 18.0f);
				SetPhase(2, sBoneStorm);
				if(_unit->HasAura(SPELL_BONE_STORM))
				{
					_unit->CastSpell(_unit, SPELL_COLDFLAME_BONESTORM, true);
					ChargeTimer = AddTimer(5*SEC_IN_MS);
					Stage++;
				}
			}
			else if(Stage == 1)
			{
				if(IsTimerFinished(ChargeTimer))
				{
					if(Unit* pTarget = GetBestPlayerTarget(TargetFilter_ClosestNotCurrent, 0, 70.0f))
					{
						MoveTo(pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ());
						_unit->CastSpellAoF(_unit->GetPositionX(), _unit->GetPositionY(), _unit->GetPositionZ(), dbcSpell.LookupEntry(SPELL_COLDFLAME_BONESTORM), true);
					}
					ResetTimer(ChargeTimer, 5*SEC_IN_MS);
				}
			}

			if(!_unit->HasAura(SPELL_BONE_STORM) && Stage == 1)
			{
				_unit->SetSpeeds(RUN, 8.0f);
				SetBehavior(Behavior_Default);
				RemoveTimer(ChargeTimer);
				AggroRandomPlayer();
				ResetTimer(BoneStormTimer, 60*SEC_IN_MS);
				Stage = -1;
				SetPhase(1);
			}

			if(IsTimerFinished(ColdFlameTimer) && GetPhase() == 1)
			{
				_unit->CastSpellAoF(_unit->GetPositionX(), _unit->GetPositionY(), _unit->GetPositionZ(), dbcSpell.LookupEntry(SPELL_COLDFLAME), true);
				ResetTimer(ColdFlameTimer, 5*SEC_IN_MS);
			}
			MoonScriptBossAI::AIUpdate();
		}

	protected:
		SpellDesc *sBoneStorm;
		int8 Stage;
		int32 BoneStormTimer, ChargeTimer, ColdFlameTimer;
		MoonInstanceScript* mInstance;
};

class ColdFlameAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(ColdFlameAI)
		ColdFlameAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature){}

		void OnLoad()
		{
			SetCanEnterCombat(false);
			Despawn(15*SEC_IN_MS);
			if(MoonScriptBossAI * pLord = dynamic_cast<MoonScriptBossAI*>(GetNearestCreature(NPC_LORD_MARROWGAR)))
			{
				if(pLord->GetPhase() == 2)
					MoveTo(_unit->GetPositionX()+75.0f, _unit->GetPositionY(), _unit->GetPositionZ());
				else
				{
					if(Unit * pTarget = _unit->GetAIInterface()->getNextTarget())
						MoveTo(pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ());
				} 
			}
		}
};

class BoneSpikeAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(BoneSpikeAI)
		BoneSpikeAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature) {}

		void OnLoad()
		{
			_unit->CastSpell(GetNearestPlayer(), 46598, true);	//Ride vehicle
			_unit->CastSpell(_unit, 69065, false);	//impaled
		}

		void OnDied(Unit * mKiller)
		{
			mKiller->RemoveAura(69065);	//impaled
			_unit->Despawn(0, 0);
		}

		void OnTargetDied(Unit * pUnit)
		{
			_unit->Despawn(0, 0);
		}
};

bool ColdFlame_BoneStorm(uint32 i, Spell* s)
{
	s->u_caster->CastSpell(s->u_caster, 72701, true);
	s->u_caster->CastSpell(s->u_caster, 72702, true);
	s->u_caster->CastSpell(s->u_caster, 72703, true);
	s->u_caster->CastSpell(s->u_caster, 72704, true);
	return true;
};

bool ColdFlame(uint32 i, Spell* s)
{
	s->u_caster->CastSpell(s->u_caster, 69146, false);
	s->u_caster->CastSpell(s->u_caster, 69145, false);
	return true;
};

bool ColdFlameRandom(uint32 i, Spell* s)
{
	s->u_caster->CastSpell(s->u_caster, 69138, false);
	return true;
};

//LADY DEATHWHISPER ENCOUNTER
enum LadyDeathwhisper{
	SPELL_MANA_BARRIER              = 70842,
    SPELL_SHADOW_BOLT               = 71254,
    SPELL_DEATH_AND_DECAY           = 71001,
    SPELL_DOMINATE_MIND_H           = 71289,
    SPELL_FROSTBOLT                 = 71420,
    SPELL_FROSTBOLT_VOLLEY          = 72905,
    SPELL_TOUCH_OF_INSIGNIFICANCE   = 71204,
    SPELL_SUMMON_SHADE              = 71363,
    SPELL_SHADOW_CHANNELING         = 43897, // Prefight, during intro
    SPELL_DARK_TRANSFORMATION_T     = 70895,
    SPELL_DARK_EMPOWERMENT_T        = 70896,
    SPELL_DARK_MARTYRDOM_T          = 70897
};

static LocationExtra LD_SummonPositions[] ={
    {-578.7066f, 2154.167f, 51.01529f, 1.692969f, 37890}, // 1 Left Door 1 (Cult Fanatic)
    {-598.9028f, 2155.005f, 51.01530f, 1.692969f, 37949}, // 2 Left Door 2 (Cult Adherent)
    {-619.2864f, 2154.460f, 51.01530f, 1.692969f, 37890}, // 3 Left Door 3 (Cult Fanatic)
    {-578.6996f, 2269.856f, 51.01529f, 4.590216f, 37949}, // 4 Right Door 1 (Cult Adherent)
    {-598.9688f, 2269.264f, 51.01529f, 4.590216f, 37890}, // 5 Right Door 2 (Cult Fanatic)
    {-619.4323f, 2268.523f, 51.01530f, 4.590216f, 37949}, // 6 Right Door 3 (Cult Adherent)
    {-524.2480f, 2211.920f, 62.90960f, 3.141592f, 0} // 7 Upper (Random Cultist)
};

class LadyDeathwhisperAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(LadyDeathwhisperAI)
		LadyDeathwhisperAI(Creature* pCreature) : MoonScriptBossAI(pCreature)
		{
			DominateHandTimer = SummonCultistTimer = -1;
			Count = 0;
			SetEnrageInfo(AddSpell(26662, Target_Self, 0, 0, 0), MINUTE*10*SEC_IN_MS);
			SetCanMove(false);

			//Both phases
			AddSpell(SPELL_DEATH_AND_DECAY, Target_RandomPlayer, 30, 0, -1);
			DominateHand = AddSpell(SPELL_DOMINATE_MIND_H, Target_RandomPlayer, 0, 0, -1);

			//Phase 1
			AddPhaseSpell(1, AddSpell(SPELL_SHADOW_BOLT, Target_RandomPlayer, 20, 2, -1));
			AddPhaseSpell(2, AddSpell(SPELL_FROSTBOLT, Target_Current, 20, 2, -1));
			AddPhaseSpell(2, AddSpell(SPELL_FROSTBOLT_VOLLEY, Target_Self, 25, 0, -1));
			LeftSide = true;
		}

		void OnCombatStart(Unit * pAttacker)
		{
			DominateHandTimer = AddTimer(27*SEC_IN_MS);
			SummonCultistTimer = AddTimer((20+rand()%10)*SEC_IN_MS);
			_unit->CastSpell(_unit, SPELL_MANA_BARRIER, true);
			MoonScriptBossAI::OnCombatStart(pAttacker);
		}

		void OnCombatStop(Unit* pUnit)
		{
			for(uint8 i = 0; i<7; i++)
			{
				if(pSummons[i])
					pSummons[i]->Despawn();
			}
			MoonScriptBossAI::OnCombatStop(pUnit);
		}

		uint8 GetAlliveSummonsCount()
		{
			uint8 count = 0;
			for(uint8 i = 0; i<7; i++)
			{
				if(pSummons[i]->IsAlive() && pSummons[i])
					count++;
			}
			return count;
		}

		void AIUpdate()
		{
			if(IsTimerFinished(DominateHandTimer))
			{
				CastSpell(DominateHand);
				Count++;
				if(Count != 3)
					ResetTimer(DominateHandTimer, (40+rand()%5)*SEC_IN_MS);
			}

			if(IsTimerFinished(SummonCultistTimer))
			{
				if(GetAlliveSummonsCount() == 0)
				{
					for(uint8 i = 0; i<6; i++)
					{
						if(LeftSide && i<3)
						{
							//Left
							if(pSummons[i] = SpawnCreature(LD_SummonPositions[i].addition, LD_SummonPositions[i].x, LD_SummonPositions[i].y, LD_SummonPositions[i].z, LD_SummonPositions[i].o))
								pSummons[i]->ApplyAura(41236);	//Teleport Visual
							LeftSide = true;
						}
						else
						{
							//Right
							if(pSummons[i] = SpawnCreature(LD_SummonPositions[i].addition, LD_SummonPositions[i].x, LD_SummonPositions[i].y, LD_SummonPositions[i].z, LD_SummonPositions[i].o))
								pSummons[i]->ApplyAura(41236);	//Teleport Visual
							LeftSide = false;
						}
					}

					if(Is25ManRaid())
					{
						if(pSummons[6] = SpawnCreature(rand()%2 ? 37949 : 37890, LD_SummonPositions[6].x, LD_SummonPositions[6].y, LD_SummonPositions[6].z, LD_SummonPositions[6].o))
							pSummons[6]->ApplyAura(41236);	//Teleport Visual
					}
				}
				ResetTimer(SummonCultistTimer, 60*SEC_IN_MS);
			}

			if(GetManaPercent() == 0 && GetPhase() == 1)
			{
				SetCanMove(false);
				SetPhase(2);
			}
			MoonScriptBossAI::AIUpdate();
		}

	private:
		SpellDesc * DominateHand;
		uint8 Count;
		int32 DominateHandTimer, SummonCultistTimer;
		MoonScriptCreatureAI * pSummons[7];
		bool LeftSide;
};

void SetupIcecrownCitadel(ScriptMgr* mgr)
{
	mgr->register_instance_script(MAP_ICC, &IcecrownCitadelInstanceScript::Create);
	mgr->register_gameobject_script(202235, &ScourgeTeleporterAI::Create);
	mgr->register_go_gossip_script(202235, new ScourgeTeleporterGossip);
	mgr->register_gameobject_script(202223, &ScourgeTeleporterAI::Create);
	mgr->register_go_gossip_script(202223, new ScourgeTeleporterGossip);

	for(uint8 i = 0; i < 5; i++)
	{
		mgr->register_gameobject_script(202242+i, &ScourgeTeleporterAI::Create);
		mgr->register_go_gossip(202242+i, new ScourgeTeleporterGossip);
	}

	//Lord marrowgar event related
	mgr->register_creature_script(NPC_LORD_MARROWGAR, &LordMarrowgarAI::Create);
	mgr->register_creature_script(NPC_COLD_FLAME, &ColdFlameAI::Create);
	mgr->register_creature_script(NPC_BONE_SPIKE, &BoneSpikeAI::Create);
	mgr->register_script_effect(SPELL_COLDFLAME_BONESTORM, &ColdFlame_BoneStorm);
	mgr->register_script_effect(69147, &ColdFlame);
	mgr->register_script_effect(69140, &ColdFlameRandom);

	//Lady DeathWhisper event related
	//mgr->register_creature_script(NPC_LADY_DEATHWHISPER, &LadyDeathwhisperAI::Create);
}