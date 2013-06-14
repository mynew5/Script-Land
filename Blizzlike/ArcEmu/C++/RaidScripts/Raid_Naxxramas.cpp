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

class AnubRekhanAI;
class DeathchargerSteedAI;
class PlaguedWarriorAI;
class PlaguedChampionAI;
class PlaguedGuardianAI;
class PlagueFissureGO;
class SporeAI;
class PortalOfShadowsAI;
class DeathKnightUnderstudyAI;

/////////////////////////////////////////////////////////////////////////////////
////// Naxxramas Instance

#define MAP_NAXXRAMAS 533
#define CN_THADDIUS 15928
#define CN_KELTHUZAD 15990
#define CN_PATCHWERK 16028
#define CN_GLUTH 15932
#define CN_ANUBREKHAN 15956
#define CN_GRAND_WIDOW_FAERLINA	15953

class NaxxramasScript : public MoonInstanceScript
{
	public:
		MOONSCRIPT_INSTANCE_FACTORY_FUNCTION(NaxxramasScript, MoonInstanceScript);
		NaxxramasScript(MapMgr* pMapMgr) : MoonInstanceScript(pMapMgr) {};

		void OnCreatureDeath(Creature* pVictim, Unit* pKiller)
		{
			Creature* KelThuzad = NULL;
			switch(pVictim->GetEntry())
			{
				case 16998: // Kel thuzads cat
					{
						KelThuzad = GetCreatureBySqlId(CN_KELTHUZAD);
						if(KelThuzad && KelThuzad->isAlive())
							KelThuzad->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "No!!! A curse upon you, interlopers! The armies of the Lich King will hunt you down. You will not escape your fate...");
						KelThuzad = NULL;
					}
					break;
				case CN_PATCHWERK: AddGameObjectStateByEntry(181123, GAMEOBJECT_STATE_OPEN); break;
				case CN_GLUTH:
					{
						AddGameObjectStateByEntry(181120, GAMEOBJECT_STATE_OPEN);
						AddGameObjectStateByEntry(181121, GAMEOBJECT_STATE_OPEN);
					}break;
				case CN_ANUBREKHAN:
					{
						AddGameObjectStateByEntry(181195, GAMEOBJECT_STATE_OPEN);
						AddGameObjectStateByEntry(194022, GAMEOBJECT_STATE_OPEN);
					}break;
				case CN_GRAND_WIDOW_FAERLINA: AddGameObjectStateByEntry(181209, GAMEOBJECT_STATE_OPEN); break;
			}
		}
};

/////////////////////////////////////////////////////////////////////////////////
////// The Arachnid Quarter

/////////////////////////////////////////////////////////////////////////////////
////// Vigilant Shade
#define CN_VIGILANT_SHADE								30085
#define VIGILANT_SHADE_INVISIBILITY						55848
#define VIGILANT_SHADE_SHADOW_BOLT_VOLLEY_NORMAL		55850
#define VIGILANT_SHADE_SHADOW_BOLT_VOLLEY_HEROIC		55851
#define NAXXRAMAS_ACOLYTE_SHADOW_BOLT_VOLLEY_NORMAL		56064

// Invisiblity should be removed OnCombatStart ?
class VigilantShadeAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(VigilantShadeAI);
		VigilantShadeAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			// Does it really work ?
			AddSpell(NAXXRAMAS_ACOLYTE_SHADOW_BOLT_VOLLEY_NORMAL, Target_RandomPlayerDestination, 10, 0, 15, 0, 30);
			ApplyAura(VIGILANT_SHADE_INVISIBILITY);
		}

		void OnCombatStart(Unit* pTarget)
		{
			RemoveAura(VIGILANT_SHADE_INVISIBILITY);
			MoonScriptCreatureAI::OnCombatStart(pTarget);
		}

		void OnCombatStop(Unit* pTarget)
		{
			ApplyAura(VIGILANT_SHADE_INVISIBILITY);
			MoonScriptCreatureAI::OnCombatStop(pTarget);
		}
};

/////////////////////////////////////////////////////////////////////////////////
////// Maexxna Spiderling
#define CN_MAEXXNA_SPIDERLING						17055
#define MAEXXNA_SPIDERLING_NECROTIC_POISON_NORMAL	54121
#define MAEXXNA_SPIDERLING_NECROTIC_POISON_HEROIC	28776

class MaexxnaSpiderlingAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(MaexxnaSpiderlingAI)
		MaexxnaSpiderlingAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(MAEXXNA_SPIDERLING_NECROTIC_POISON_NORMAL, Target_Current, 10, 0, 20, 0, 8);
		}
};

/////////////////////////////////////////////////////////////////////////////////
////// Web Wrap
#define CN_WEB_WRAP								16486
#define MAEXXNA_WEB_WRAP						28622

class WebWrapAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(WebWrapAI);
		WebWrapAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			mPlayerGuid = 0;
		}

		void OnCombatStart(Unit* pTarget)
		{
			SetAllowMelee(false);
			SetCanMove(false);
			StopMovement();
			MoonScriptCreatureAI::OnCombatStart(pTarget);
		}

		void OnCombatStop(Unit* pTarget)
		{
			SetAllowMelee(true);
			SetCanMove(true);
			MoonScriptCreatureAI::OnCombatStop(pTarget);
		}

		void OnDied(Unit* pKiller)
		{
			// Slower, but safer
			if(mPlayerGuid != 0)
			{
				Player* PlayerPtr = objmgr.GetPlayer(static_cast<uint32>(mPlayerGuid));
				if(PlayerPtr != NULL && PlayerPtr->HasAura(MAEXXNA_WEB_WRAP))
				{
					PlayerPtr->RemoveAura(MAEXXNA_WEB_WRAP);
					PlayerPtr->Unroot();
				};

				RemoveAIUpdateEvent();
				mPlayerGuid = 0;
			}
			MoonScriptCreatureAI::OnDied(pKiller);
		}

		void AIUpdate()
		{
			if(mPlayerGuid != 0)
			{
				Player* PlayerPtr = objmgr.GetPlayer(static_cast<uint32>(mPlayerGuid));
				if(PlayerPtr == NULL || !PlayerPtr->isAlive() || !PlayerPtr->HasAura(MAEXXNA_WEB_WRAP))
				{
					mPlayerGuid = 0;
					RemoveAIUpdateEvent();
					Despawn(1);
				}
			}
			MoonScriptCreatureAI::AIUpdate();
		}

		void Destroy()
		{
			if(mPlayerGuid != 0)
			{
				Player* PlayerPtr = objmgr.GetPlayer(static_cast<uint32>(mPlayerGuid));
				if(PlayerPtr != NULL && PlayerPtr->HasAura(MAEXXNA_WEB_WRAP))
				{
					PlayerPtr->RemoveAura(MAEXXNA_WEB_WRAP);
					PlayerPtr->Unroot();
				}

				mPlayerGuid = 0;
			}

			delete this;
		}

		uint64	mPlayerGuid;
};

/////////////////////////////////////////////////////////////////////////////////
////// Maexxna
#define CN_MAEXXNA								15952
#define MAEXXNA_WEB_SPRAY_NORMAL				29484
#define MAEXXNA_WEB_SPRAY_HEROIC				54125
#define MAEXXNA_POISON_SHOCK_NORMAL				28741
#define MAEXXNA_POISON_SHOCK_HEROIC				54122
#define MAEXXNA_NECROTIC_POISON_NORMAL			54121
#define MAEXXNA_NECROTIC_POISON_HEROIC			28776
#define MAEXXNA_FRENZY_NORMAL					54123
#define MAEXXNA_FRENZY_HEROIC					54124

static Location WebWrapPos[] =
{
	// Left wall
	{ 3515.307861f, -3837.076172f, 302.671753f, 4.388477f },
	{ 3529.401123f, -3841.910889f, 300.766174f, 4.335070f },
	{ 3541.990479f, -3851.308350f, 298.685272f, 3.804141f },
	// Right wall
	{ 3497.262939f, -3949.542969f, 308.138916f, 1.433983f },
	{ 3510.450928f, -3949.871582f, 309.523193f, 1.613839f },
	{ 3523.486572f, -3946.144287f, 309.651611f, 1.973552f }
};

void SpellFunc_MaexxnaWebWrap(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType);

class MaexxnaAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(MaexxnaAI)
		MaexxnaAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(MAEXXNA_POISON_SHOCK_NORMAL, Target_Self, 100, 0, 10);		// Target_Current with range ?
			AddSpell(MAEXXNA_NECROTIC_POISON_NORMAL, Target_Current, 10, 0, 15, 0, 8);

			mWebWrapProc = AddSpellFunc(&SpellFunc_MaexxnaWebWrap, Target_RandomPlayerNotCurrent, 0, 0, 0);
			mAddsSummonTimer = mWebWrapTimer = mWebSprayTimer = INVALIDATE_TIMER;
			mHasEnraged = false;
			mLeftWall = true;
		}

		void OnCombatStart(Unit* pTarget)
		{
			mAddsSummonTimer = AddTimer(30000);
			mWebSprayTimer = AddTimer(40000);
			mWebWrapTimer = AddTimer(20000);
			mHasEnraged = false;
			if(RandomUInt(1) == 1)
				mLeftWall = !mLeftWall;
			MoonScriptCreatureAI::OnCombatStart(pTarget);
		}

		void OnCombatStop(Unit* pTarget)
		{
			RemoveTimer(mWebWrapTimer);
			MoonScriptCreatureAI::OnCombatStop(pTarget);
		}

		void AIUpdate()
		{
			if(IsTimerFinished(mAddsSummonTimer))
			{
				MoonScriptCreatureAI* Spiderling = NULL;
				for(int32 i = 0; i < 8; ++i)
				{
					Spiderling = SpawnCreature(CN_MAEXXNA_SPIDERLING);
					if(Spiderling != NULL)
					{
						Spiderling->GetUnit()->m_noRespawn = true;
						Spiderling->SetDespawnWhenInactive(true);
						Spiderling->AggroRandomPlayer(1000);
					}
				}

				ResetTimer(mAddsSummonTimer, 40000);
			}

			if(!IsCasting())
			{
				if(!mHasEnraged && GetHealthPercent() <= 30)
				{
					if(IsHeroic())
						ApplyAura(MAEXXNA_FRENZY_HEROIC);
					else
						ApplyAura(MAEXXNA_FRENZY_NORMAL);

					mHasEnraged = true;
				}
				else if(IsTimerFinished(mWebSprayTimer))
				{
					if(IsHeroic())
						ApplyAura(MAEXXNA_WEB_SPRAY_HEROIC);
					else
						ApplyAura(MAEXXNA_WEB_SPRAY_NORMAL);

					ResetTimer(mWebSprayTimer, 40000);
				}
				else if(IsTimerFinished(mWebWrapTimer))
				{
					if(IsHeroic())
						CastSpellNowNoScheduling(mWebWrapProc);

					CastSpellNowNoScheduling(mWebWrapProc);
					ResetTimer(mWebWrapTimer, 40000);
				}
			}
			MoonScriptCreatureAI::AIUpdate();
		}

		SpellDesc*			mWebWrapProc;
		bool				mHasEnraged;
		bool				mLeftWall;
		int32				mAddsSummonTimer;
		int32				mWebSprayTimer;
		int32				mWebWrapTimer;
};

void SpellFunc_MaexxnaWebWrap(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType)
{
	MaexxnaAI* Maexxna = (pCreatureAI != NULL) ? TO< MaexxnaAI* >(pCreatureAI) : NULL;
	if(Maexxna != NULL)
	{
		// Is target really added everytime and isn't this check redundant ?
		if(pTarget == NULL || !pTarget->IsPlayer() || pTarget->HasAura(MAEXXNA_WEB_WRAP) || Maexxna->GetUnit() == NULL || Maexxna->GetUnit()->GetMapMgr() == NULL)
			return;

		uint32 Id = RandomUInt(2);
		if(!Maexxna->mLeftWall)
			Id += 3;

		WebWrapAI* WebWrap = TO< WebWrapAI* >(Maexxna->SpawnCreature(CN_WEB_WRAP, WebWrapPos[ Id ].x, WebWrapPos[ Id ].y, WebWrapPos[ Id ].z, pTarget->GetOrientation()));
		if(WebWrap == NULL)
			return;

		WebWrap->GetUnit()->m_noRespawn = true;
		WebWrap->RegisterAIUpdateEvent(5000);
		WebWrap->mPlayerGuid = TO_PLAYER(pTarget)->GetGUID();

		if(pTarget->GetCurrentSpell() != NULL)
			pTarget->GetCurrentSpell()->cancel();

		// Somewhy root does not apply at all
		TO_PLAYER(pTarget)->SafeTeleport(Maexxna->GetUnit()->GetMapId(), Maexxna->GetUnit()->GetInstanceID(), LocationVector(WebWrapPos[ Id ].x, WebWrapPos[ Id ].y, WebWrapPos[ Id ].z));
		pTarget->CastSpell(pTarget, MAEXXNA_WEB_WRAP, true);
	}
};

/////////////////////////////////////////////////////////////////////////////////
////// Naxxramas Worshipper
#define CN_NAXXRAMAS_WORSHIPPER							16506
#define NAXXRAMAS_WORSHIPPER_FIREBALL_NORMAL			54095
#define NAXXRAMAS_WORSHIPPER_FIREBALL_HEROIC			54096
#define NAXXRAMAS_WORSHIPPER_WIDOW_EMBRACE				28732
#define NAXXRAMAS_WORSHIPPER_MIND_EXHAUSTION			28727

class NaxxramasWorshipperAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(NaxxramasWorshipperAI)
		NaxxramasWorshipperAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			if(IsHeroic())
				AddSpell(NAXXRAMAS_WORSHIPPER_FIREBALL_HEROIC, Target_Current, 10, 2.5, 0, 0, 45);
			else
				AddSpell(NAXXRAMAS_WORSHIPPER_FIREBALL_NORMAL, Target_Current, 10, 2.5, 0, 0, 45);

			mPossessed = false;
		}

		void OnCastSpell(uint32 pSpellId)
		{
			/*if ( pSpellId == NAXXRAMAS_WORSHIPPER_WIDOW_EMBRACE && IsAlive() )
			{
				_unit->DealDamage( _unit, _unit->GetUInt32Value( UNIT_FIELD_HEALTH ), 0, 0, NAXXRAMAS_WORSHIPPER_WIDOW_EMBRACE );
				uint8 Buffer[ 100 ];
				StackPacket DataPacket( SMSG_SPELLINSTAKILLLOG, Buffer, 100 );
				DataPacket << _unit->GetGUID() << _unit->GetGUID() << NAXXRAMAS_WORSHIPPER_WIDOW_EMBRACE;
				_unit->SendMessageToSet( &DataPacket, true );
			};*/
		}

		void OnDied(Unit* pKiller)
		{
		}

		void AIUpdate()
		{
			/*if ( !mPossessed && _unit->HasFlag( UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED_CREATURE ) )
			{
				Player* PlayerPtr = objmgr.GetPlayer( _unit->GetUInt64Value( UNIT_FIELD_CHARMEDBY ) );
				if ( PlayerPtr != NULL )
				{
					AI_Spell* NewSpell = new AI_Spell;
					NewSpell->entryId = _unit->GetEntry();
					NewSpell->minrange = 0;
					NewSpell->maxrange = 15;
					NewSpell->spell = dbcSpell.LookupEntry( NAXXRAMAS_WORSHIPPER_WIDOW_EMBRACE );
					NewSpell->spelltargetType = TTYPE_SOURCE;
					NewSpell->cooldown = NewSpell->cooldowntime = 0;
					NewSpell->autocast_type = 0;
					NewSpell->first_use = true;
					NewSpell->custom_pointer = false;
					NewSpell->floatMisc1 = NewSpell->Misc2 = 0;
					NewSpell->procChance = NewSpell->procCount = NewSpell->procCounter = 0;
					NewSpell->spellType = STYPE_DEBUFF;
					NewSpell->agent = AGENT_SPELL;
					_unit->GetAIInterface()->m_spells.push_back( NewSpell );

					list< uint32 > Spells;
					Spells.push_back( NAXXRAMAS_WORSHIPPER_WIDOW_EMBRACE );
					list< uint32 >::iterator Iter = Spells.begin();

					WorldPacket DataPacket( SMSG_PET_SPELLS, _unit->GetAIInterface()->m_spells.size() * 4 + 20 );
					DataPacket << _unit->GetGUID();
					DataPacket << static_cast< uint32 >( 0x00000000 );	//unk1
					DataPacket << static_cast< uint32 >( 0x00000101 );	//unk2
					DataPacket << static_cast< uint32 >( 0x00000000 );	//unk3
					DataPacket << static_cast< uint32 >( PET_SPELL_ATTACK );

					for ( uint32 i = 1; i < 10; ++i )
					{
						if ( Iter != Spells.end() )
						{
							DataPacket << static_cast< uint16 >( *Iter ) << static_cast< uint16 >( DEFAULT_SPELL_STATE );
							++Iter;
						}
						else
							DataPacket << static_cast< uint16 >( 0 ) << static_cast< uint8 >( 0 ) << static_cast< uint8 >( i + 5 );
					};

					// Send the rest of the spells.
					DataPacket << static_cast< uint8 >( Spells.size() );
					for ( Iter = Spells.begin(); Iter != Spells.end(); ++Iter )
					{
						DataPacket << static_cast< uint16 >( *Iter ) << static_cast< uint16 >( DEFAULT_SPELL_STATE );
					};

					DataPacket << static_cast< uint64 >( 0 );
					PlayerPtr->GetSession()->SendPacket( &DataPacket );
					mPossessed = true;
				};
			}
			else if ( mPossessed && !_unit->HasFlag( UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED_CREATURE ) )
				mPossessed = false;

			if ( mPossessed )
				return;*/
		}

	protected:
		bool					mPossessed;
};

/////////////////////////////////////////////////////////////////////////////////
////// Naxxramas Follower
#define CN_NAXXRAMAS_FOLLOWER							16505
#define NAXXRAMAS_FOLLOWER_BERSERKER_CHARGE_HEROIC		56107
#define NAXXRAMAS_FOLLOWER_SILENCE_HEROIC				54093

void SpellFunc_NaxxramasFollowerCharge(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType);

class NaxxramasFollowerAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(NaxxramasFollowerAI)
		NaxxramasFollowerAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			mCharge = AddSpell(NAXXRAMAS_FOLLOWER_BERSERKER_CHARGE_HEROIC, Target_Current, 0, 0, 0);
			AddSpellFunc(&SpellFunc_NaxxramasFollowerCharge, Target_RandomPlayer, 8, 0, 20, 0, 40);
			AddSpell(NAXXRAMAS_FOLLOWER_SILENCE_HEROIC, Target_Self, 10, 0, 15);
		}

		SpellDesc*				mCharge;
};

void SpellFunc_NaxxramasFollowerCharge(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType)
{
	NaxxramasFollowerAI* NaxxramasFollower = (pCreatureAI != NULL) ? TO< NaxxramasFollowerAI* >(pCreatureAI) : NULL;
	if(NaxxramasFollower != NULL)
	{
		Unit* CurrentTarget = NaxxramasFollower->GetUnit()->GetAIInterface()->getNextTarget();
		if(CurrentTarget != NULL && CurrentTarget != pTarget)
		{
			NaxxramasFollower->GetUnit()->GetAIInterface()->AttackReaction(pTarget, 500);
			NaxxramasFollower->GetUnit()->GetAIInterface()->setNextTarget(pTarget);
			//NaxxramasFollower->GetUnit()->GetAIInterface()->RemoveThreatByPtr( CurrentTarget );
		}

		NaxxramasFollower->CastSpell(NaxxramasFollower->mCharge);
	}
}

/////////////////////////////////////////////////////////////////////////////////
////// Grand Widow Faerlina
#define GRAND_WIDOW_FAERLINA_POISON_VOLLEY_BOLT_NORMAL	28796
#define GRAND_WIDOW_FAERLINA_POISON_VOLLEY_BOLT_HEROIC	54098
#define GRAND_WIDOW_FAERLINA_FRENZY_NORMAL				28798
#define GRAND_WIDOW_FAERLINA_FRENZY_HEROIC				54100
#define GRAND_WIDOW_RAIN_OF_FIRE_NORMAL					39024
#define GRAND_WIDOW_RAIN_OF_FIRE_HEROIC					58936

static Location Worshippers[ 4 ] =
{
	{ -3.0f, 0, 0, 0 },
	{ -9.0f, 0, 0, 0 },
	{ 3.0f, 0, 0, 0 },
	{ 9.0f, 0, 0, 0 }
};

static Location Followers[ 2 ] =
{
	{ -6.0f, 0, 0, 0 },
	{ 6.0f, 0, 0, 0 }
};

class GrandWidowFaerlinaAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(GrandWidowFaerlinaAI)
		GrandWidowFaerlinaAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			mPoisonVolleyBolt = AddSpell(GRAND_WIDOW_FAERLINA_POISON_VOLLEY_BOLT_NORMAL, Target_Self, 0, 0, 0);
			mFrenzy = AddSpell(GRAND_WIDOW_FAERLINA_FRENZY_NORMAL, Target_Self, 0, 0, 0);
			AddSpell(GRAND_WIDOW_RAIN_OF_FIRE_NORMAL, Target_RandomPlayerDestination, 7, 0, 10, 0, 40);

			Emote("Your old lives, your mortal desires, mean nothing. You are acolytes of the master now, and you will serve the cause without question! The greatest glory is to die in the master's service!", Text_Yell, 8799);
			AddEmote(Event_OnCombatStart, "Slay them in the master's name!", Text_Yell, 8794);
			AddEmote(Event_OnTargetDied, "You have failed!", Text_Yell, 8800);
			AddEmote(Event_OnTargetDied, "Pathetic wretch!", Text_Yell, 8801);
			AddEmote(Event_OnDied, "The master... will avenge me!", Text_Yell, 8798);
			mFrenzy->AddEmote("You cannot hide from me!", Text_Yell, 8795);
			mFrenzy->AddEmote("Kneel before me, worm!", Text_Yell, 8796);
			mFrenzy->AddEmote("Run while you still can!", Text_Yell, 8797);
			mPoisonVolleyBoltTimer = mFrenzyTimer = INVALIDATE_TIMER;
		}

		void OnCombatStart(Unit* pTarget)
		{
			mPoisonVolleyBoltTimer = AddTimer(15000);
			mFrenzyTimer = AddTimer(60000 + RandomUInt(20) * 1000);

			GameObject* WebGate = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(3318.65f, -3695.85f, 259.094f, 181235);
			if(WebGate != NULL)
				WebGate->SetState(1);
			MoonScriptCreatureAI::OnCombatStart(pTarget);
		}

		void OnCombatStop(Unit* pTarget)
		{
			mPoisonVolleyBoltTimer = mFrenzyTimer = INVALIDATE_TIMER;

			if(GameObject* WebGate = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(3318.65f, -3695.85f, 259.094f, 181235))
				WebGate->SetState(GAMEOBJECT_STATE_OPEN);

			if(IsAlive())
			{
				if(IsHeroic())
				{
					for(uint32 i = 0; i < 2; ++i)
					{
						MoonScriptCreatureAI * AddAI = SpawnCreature(CN_NAXXRAMAS_FOLLOWER, 3353.364502f + Followers[ i ].x, -3620.322998f, 260.996857f, 4.725017f);
						if(AddAI != NULL)
							AddAI->GetUnit()->m_noRespawn = true;
					}
				}
			}
			MoonScriptCreatureAI::OnCombatStop(pTarget);
		}

		void AIUpdate()
		{
			if(!IsCasting())
			{
				if(IsTimerFinished(mPoisonVolleyBoltTimer))
				{
					CastSpellNowNoScheduling(mPoisonVolleyBolt);
					ResetTimer(mPoisonVolleyBoltTimer, 15000);
				}
				else if(IsTimerFinished(mFrenzyTimer))
				{
					CastSpellNowNoScheduling(mFrenzy);
					ResetTimer(mFrenzyTimer, 60000 + RandomUInt(20) * 1000);
				}
			}
			MoonScriptCreatureAI::AIUpdate();
		}

		set< NaxxramasWorshipperAI* >	mWorshippers;
		set< NaxxramasFollowerAI* >		mFollowers;
		SpellDesc*						mFrenzy;
		SpellDesc*						mPoisonVolleyBolt;
		int32							mFrenzyTimer;
		int32							mPoisonVolleyBoltTimer;
};

/////////////////////////////////////////////////////////////////////////////////
////// Crypt Guard
#define CN_CRYPT_GUARD						16573
#define CRYPT_GUARD_ACID_SPLIT_NORMAL		28969
#define CRYPT_GUARD_ACID_SPLIT_HEROIC		56098
#define CRYPT_GUARD_CLEAVE					40504
#define CRYPT_GUARD_FRENZY					8269

class CryptGuardAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(CryptGuardAI)
		CryptGuardAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(CRYPT_GUARD_ACID_SPLIT_NORMAL, Target_RandomPlayer, 8, 0, 15, 0, 40);

			AddSpell(CRYPT_GUARD_CLEAVE, Target_Current, 10, 0, 10, 0, 8);
			mEnraged = false;
		}

		friend class AnubRekhanAI;

		void OnCombatStart(Unit* pTarget)
		{
			mEnraged = false;
			MoonScriptCreatureAI::OnCombatStart(pTarget);
		}

		void AIUpdate()
		{
			if(!mEnraged && GetHealthPercent() <= 50 && !IsCasting())
			{
				ApplyAura(CRYPT_GUARD_FRENZY);
				mEnraged = true;
			}
			MoonScriptCreatureAI::AIUpdate();
		}

		bool			mEnraged;
};

/////////////////////////////////////////////////////////////////////////////////
////// Anub'Rekhan
#define ANUBREKHAN_IMPALE_NORMAL				28783
#define ANUBREKHAN_IMPALE_HEROIC				56090
#define ANUBREKHAN_LOCUST_SWARM_NORMAL			28785
#define ANUBREKHAN_LOCUST_SWARM_HEROIC			54021
#define ANUBREKHAN_SUMMON_CORPSE_SCARABS_5		29105
#define ANUBREKHAN_SUMMON_CORPSE_SCARABS_10		28864
#define ANUBREKHAN_BERSERK						26662

static Location CryptGuards[] =
{
	{ 3300.486572f, -3449.479492f, 287.077850f, 3.883793f },
	{ 3300.568604f, -3503.060059f, 287.077850f, 2.367975f },
	{ 3332.591797f, -3476.102539f, 287.073425f, 0.015707f }
};

void SpellFunc_AnubRekhanCorpseScarabsPlayer(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType);
void SpellFunc_AnubRekhanCorpseScarabsCryptGuard(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType);

class AnubRekhanAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(AnubRekhanAI)
		AnubRekhanAI(Creature* pCreature) : MoonScriptBossAI(pCreature)
		{
			AddSpell(ANUBREKHAN_IMPALE_NORMAL, Target_RandomPlayerDestination, 7, 0, 10, 0, 45);
			mLocustSwarm = AddSpell(ANUBREKHAN_LOCUST_SWARM_NORMAL, Target_Self, 0, 3, 0);

			AddSpellFunc(&SpellFunc_AnubRekhanCorpseScarabsPlayer, Target_Self, 8, 0, 20);
			AddSpellFunc(&SpellFunc_AnubRekhanCorpseScarabsCryptGuard, Target_Self, 8, 0, 20);
			Emote("Ahh... welcome to my parlor.", Text_Yell, 8788);
			AddEmote(Event_OnCombatStart, "Just a little taste...", Text_Yell, 8785);
			AddEmote(Event_OnCombatStart, "There is no way out.", Text_Yell, 8786);
			AddEmote(Event_OnCombatStart, "Yes, run! It makes the blood pump faster!", Text_Yell, 8787);
			AddEmote(Event_OnTargetDied, "Shhh... it will all be over soon.", Text_Yell, 8789);
			AddEmote(Event_OnTaunt, "I hear little hearts beating. Yesss... beating faster now. Soon the beating will stop.", Text_Yell, 8790);
			AddEmote(Event_OnTaunt, "Where to go? What to do? So many choices that all end in pain, end in death.", Text_Yell, 8791);
			AddEmote(Event_OnTaunt, "Which one shall I eat first? So difficult to choose. They all smell so delicious...", Text_Yell, 8792);
			AddEmote(Event_OnTaunt, "Closer now... tasty morsels. I've been too long without food. Without blood to drink.", Text_Yell, 8793);
			SetEnrageInfo(AddSpell(ANUBREKHAN_BERSERK, Target_Self, 0, 0, 0), 600000);
			mLocustSwarmTimer = mCryptSpawnTimer = INVALIDATE_TIMER;
		}

		void OnCombatStart(Unit* pTarget)
		{
			mLocustSwarmTimer = AddTimer(70000 + RandomUInt(50) * 1000);
			mCryptSpawnTimer = AddTimer(20000);
			MoonScriptBossAI::OnCombatStart(pTarget);
		}

		void OnCombatStop(Unit* pTarget)
		{
			mLocustSwarmTimer = mCryptSpawnTimer = INVALIDATE_TIMER;
			MoonScriptBossAI::OnCombatStop(pTarget);
		}

		void AIUpdate()
		{
			if(mCryptSpawnTimer != INVALIDATE_TIMER && IsTimerFinished(mCryptSpawnTimer))
			{
				RemoveTimer(mCryptSpawnTimer);
				if(CryptGuardAI* CryptAI = TO< CryptGuardAI* >(SpawnCreature(CN_CRYPT_GUARD, CryptGuards[2].x, CryptGuards[2].y, CryptGuards[2].z, CryptGuards[2].o)))
				{
					CryptAI->GetUnit()->m_noRespawn = true;
					CryptAI->AggroRandomPlayer(200);
				}
			}

			if(IsTimerFinished(mLocustSwarmTimer))
			{
				if(CryptGuardAI* CryptAI = TO< CryptGuardAI* >(SpawnCreature(CN_CRYPT_GUARD, CryptGuards[ 2 ].x, CryptGuards[ 2 ].y, CryptGuards[ 2 ].z, CryptGuards[ 2 ].o)))
				{
					CryptAI->GetUnit()->m_noRespawn = true;
					CryptAI->AggroRandomPlayer(200);
				}

				CastSpellNowNoScheduling(mLocustSwarm);
				mLocustSwarmTimer = AddTimer(70000 + RandomUInt(50) * 1000);
			}
			MoonScriptBossAI::AIUpdate();
		}

		SpellDesc*				mLocustSwarm;
		int32					mLocustSwarmTimer;
		int32					mCryptSpawnTimer;
};

void SpellFunc_AnubRekhanCorpseScarabsPlayer(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType)
{
	AnubRekhanAI* AnubRekhan = (pCreatureAI != NULL) ? TO< AnubRekhanAI* >(pCreatureAI) : NULL;
	if(AnubRekhan != NULL)
	{
		std::vector< pair< Player* , Location > > PlayerCorpses;
		Player* PlayerPtr = NULL;
		LocationVector spawnLocation;
		for(set< Object* >::iterator Iter = AnubRekhan->GetUnit()->GetInRangePlayerSetBegin(); Iter != AnubRekhan->GetUnit()->GetInRangePlayerSetEnd(); ++Iter)
		{
			if((*Iter) == NULL)
				continue;

			PlayerPtr = TO< Player* >(*Iter);

			if(PlayerPtr->isAlive())
				continue;

			if(PlayerPtr->getDeathState() == JUST_DIED)
				spawnLocation = PlayerPtr->GetPosition();
			else if(PlayerPtr->getDeathState() == CORPSE)
			{
				Corpse* myCorpse = objmgr.GetCorpseByOwner(PlayerPtr->GetLowGUID());
				if(myCorpse == NULL || myCorpse->GetCorpseState() != CORPSE_STATE_BODY)
					continue;

				spawnLocation = PlayerPtr->getMyCorpseLocation();
			}
			else
				continue;

			if(AnubRekhan->GetUnit()->CalcDistance(spawnLocation) > 60.0f)
				continue;

			Location ObjectCoords;
			ObjectCoords.x = spawnLocation.x;
			ObjectCoords.y = spawnLocation.y;
			ObjectCoords.z = spawnLocation.z;
			ObjectCoords.o = spawnLocation.o;
			PlayerCorpses.push_back(make_pair(PlayerPtr, ObjectCoords));
		}

		if(PlayerCorpses.size() > 0)
		{
			uint32 Id = RandomUInt(PlayerCorpses.size() - 1);
			PlayerPtr = PlayerCorpses[ Id ].first;
		}
	}
};

void SpellFunc_AnubRekhanCorpseScarabsCryptGuard(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType)
{
	AnubRekhanAI* AnubRekhan = (pCreatureAI != NULL) ? TO< AnubRekhanAI* >(pCreatureAI) : NULL;
	if(AnubRekhan != NULL)
	{
		Creature* CreaturePtr = NULL;
		for(set< Object* >::iterator Iter = AnubRekhan->GetUnit()->GetInRangeSetBegin(); Iter != AnubRekhan->GetUnit()->GetInRangeSetEnd(); ++Iter)
		{
			if((*Iter) == NULL || !(*Iter)->IsCreature())
				continue;

			CreaturePtr = TO_CREATURE(*Iter);
			if(CreaturePtr->GetEntry() != CN_CRYPT_GUARD)
				continue;

			if(CreaturePtr->isAlive() || !CreaturePtr->IsInWorld())
				continue;

			if(AnubRekhan->GetUnit()->CalcDistance(CreaturePtr) > 60.0f)
				continue;
		}
	}
};

/////////////////////////////////////////////////////////////////////////////////
////// The Plague Quarter

/////////////////////////////////////////////////////////////////////////////////
////// Infectious Ghoul
#define CN_INFECTIOUS_GHOUL						16244
#define INFECTIOUS_GHOUL_FLESH_ROT				54709
#define INFECTIOUS_GHOUL_REND_NORMAL			54703
#define INFECTIOUS_GHOUL_REND_HEROIC			54708
#define INFECTIOUS_GHOUL_FRENZY_NORMAL			54701
#define INFECTIOUS_GHOUL_FRENZY_HEROIC			24318

class InfectiousGhoulAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(InfectiousGhoulAI)
		InfectiousGhoulAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(INFECTIOUS_GHOUL_FLESH_ROT, Target_Current, 10, 0, 15, 0, 8);
			AddSpell(INFECTIOUS_GHOUL_REND_NORMAL, Target_Current, 7, 0, 15, 0, 8);

			mEnraged = false;
		}

		void OnCombatStart(Unit* pTarget)
		{
			mEnraged = false;
			MoonScriptCreatureAI::OnCombatStart(pTarget);
		}

		void AIUpdate()
		{
			if(!mEnraged && !IsCasting() && GetHealthPercent() <= 50)
			{
				ApplyAura(INFECTIOUS_GHOUL_FRENZY_NORMAL);
				mEnraged = true;
			}
			MoonScriptCreatureAI::AIUpdate();
		}

		bool	mEnraged;
};

/////////////////////////////////////////////////////////////////////////////////
////// Stoneskin Gargoyle
#define CN_STONESKIN_GARGOYLE					16168
#define STONESKIN_GARGOYLE_ACID_VOLLEY_NORMAL	29325
#define STONESKIN_GARGOYLE_ACID_VOLLEY_HEROIC	54714
#define STONESKIN_GARGOYLE_STONESKIN_NORMAL		28995
#define STONESKIN_GARGOYLE_STONESKIN_HEROIC		54722

class StoneskinGargoyleAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(StoneskinGargoyleAI)
		StoneskinGargoyleAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(STONESKIN_GARGOYLE_ACID_VOLLEY_NORMAL, Target_Self, 10, 0, 5);
			mStoneskin = AddSpell(STONESKIN_GARGOYLE_STONESKIN_NORMAL, Target_Self, 0, 7, 0);
		}

		void AIUpdate()
		{
			if(IsCasting() || (_unit->HasAura(STONESKIN_GARGOYLE_STONESKIN_NORMAL) || _unit->HasAura(STONESKIN_GARGOYLE_STONESKIN_HEROIC)))
				return;

			else if(_unit->GetEmoteState() == EMOTE_STATE_SUBMERGED)
				_unit->SetEmoteState(0);

			if(!IsCasting() && GetHealthPercent() <= 30)
			{
				CastSpellNowNoScheduling(mStoneskin);
				_unit->SetEmoteState(EMOTE_STATE_SUBMERGED);
				SetBehavior(Behavior_Spell);
				SetCanMove(false);
				StopMovement();
				return;
			}
			MoonScriptCreatureAI::AIUpdate();
		}

		SpellDesc*	mStoneskin;
};

/////////////////////////////////////////////////////////////////////////////////
////// Eye Stalker
#define CN_EYE_STALKER						16236
#define EYE_STALKER_MIND_FLAY_NORMAL		29407
#define EYE_STALKER_MIND_FLAY_HEROIC		54805

class EyeStalkerAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(EyeStalkerAI)
		EyeStalkerAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(EYE_STALKER_MIND_FLAY_NORMAL, Target_Current, 100, 6, 8, 0, 45);
		}

		void OnCombatStart(Unit* pTarget)
		{
			SetBehavior(Behavior_Spell);
			SetCanMove(false);
			StopMovement();
			MoonScriptCreatureAI::OnCombatStart(pTarget);
		}

		void AIUpdate()
		{
			Unit* CurrentTarget = _unit->GetAIInterface()->getNextTarget();
			if(!IsCasting() && CurrentTarget)
			{
				float MaxRange = 45.0f;
				if(IsHeroic())
					MaxRange = 35.0f;

				if(GetRangeToUnit(CurrentTarget) > MaxRange)
				{
					Unit* NewTarget = GetBestUnitTarget(TargetFilter_Closest);
					if(NewTarget != NULL && GetRangeToUnit(NewTarget) <= MaxRange)
					{
						_unit->GetAIInterface()->setNextTarget(NewTarget);
						_unit->GetAIInterface()->AttackReaction(NewTarget, 200);
					}

					_unit->GetAIInterface()->RemoveThreatByPtr(CurrentTarget);
				}
			}

			// Meh, reset it in case something went wrong
			SetBehavior(Behavior_Spell);
			SetCanMove(false);
			StopMovement();
			MoonScriptCreatureAI:;AIUpdate();
		}
};

/////////////////////////////////////////////////////////////////////////////////
////// Noth the Plaguebringer
#define CN_NOTH_THE_PLAGUEBRINGER							15954
#define NOTH_THE_PLAGUEBRINGER_BLINK_HEROIC					29208
#define NOTH_THE_PLAGUEBRINGER_CRIPLE_HEROIC				29212
#define NOTH_THE_PLAGUEBRINGER_CURSE_OF_THE_PLAGUE_NORMAL	29213	// I must check if it's target-limited spell
#define NOTH_THE_PLAGUEBRINGER_CURSE_OF_THE_PLAGUE_HEROIC	54835	// I must check if it's target-limited spell
#define NOTH_THE_PLAGUEBRINGER_BERSERK						47008	// Guessed
#define CN_PLAGUED_WARRIOR						16984
#define CN_PLAGUED_GUARDIAN							16981

static Location SkelPosPhase1[] =
{
	{ 2660.175781f, -3473.315674f, 262.003967f, 5.252077f },
	{ 2717.336426f, -3463.309326f, 262.044098f, 3.703270f },
	{ 2718.720215f, -3524.452881f, 261.943176f, 2.760789f }
};

static Location SkelPosPhase2[] =
{
	{ 2660.932129f, -3474.058105f, 262.004730f, 5.765719f },
	{ 2706.175537f, -3465.862793f, 262.003510f, 4.488667f },
	{ 2723.024170f, -3472.919434f, 262.102020f, 3.809298f },
	{ 2717.878906f, -3518.062988f, 261.905945f, 3.177050f }
};

void SpellFunc_NothToBalconyPhaseSwitch(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType);
void SpellFunc_NothFromBalconyPhaseSwitch(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType);
void SpellFunc_NothCriple(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType);
void SpellFunc_NothBlink(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType);

class NothThePlaguebringerAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(NothThePlaguebringerAI)
		NothThePlaguebringerAI(Creature* pCreature) : MoonScriptBossAI(pCreature)
		{
			if(Is25ManRaid())
			{
				AddPhaseSpell(1, AddSpell(NOTH_THE_PLAGUEBRINGER_CURSE_OF_THE_PLAGUE_HEROIC, Target_Self, 10, 0, 20));
				mCriple = AddSpellFunc(&SpellFunc_NothCriple, Target_Self, 0, 0, 0);
				mBlink = AddSpellFunc(&SpellFunc_NothBlink, Target_RandomPlayer, 0, 0, 0);
			}
			else
			{
				AddPhaseSpell(1, AddSpell(NOTH_THE_PLAGUEBRINGER_CURSE_OF_THE_PLAGUE_NORMAL, Target_Self, 10, 0, 20));
				mCriple = NULL;
				mBlink = NULL;
			}

			mToBalconySwitch = AddSpellFunc(&SpellFunc_NothToBalconyPhaseSwitch, Target_Self, 0, 0, 0);
			mFromBalconySwitch = AddSpellFunc(&SpellFunc_NothFromBalconyPhaseSwitch, Target_RandomPlayer, 0, 0, 0);
			mBlinkTimer = mSkeletonTimer = mPhaseSwitchTimer = INVALIDATE_TIMER;
			mPhaseCounter = 0;

			AddEmote(Event_OnCombatStart, "Glory to the master!", Text_Yell, 8845);
			AddEmote(Event_OnCombatStart, "Your life is forfeit.", Text_Yell, 8846);
			AddEmote(Event_OnCombatStart, "Die, trespasser!", Text_Yell, 8847);
			AddEmote(Event_OnDied, "I will serve the master... in death.", Text_Yell, 8848);
			AddEmote(Event_OnTargetDied, "My task is done!", Text_Yell, 8849);
			AddEmote(Event_OnTargetDied, "Breathe no more.", Text_Yell, 8850);
		}

		friend class PlaguedWarriorAI;
		friend class PlaguedChampionAI;
		friend class PlaguedGuardianAI;

		void OnCombatStart(Unit* pTarget)
		{
			if(Is25ManRaid())
				mBlinkTimer = AddTimer(28000 + RandomUInt(12) * 1000);

			mPhaseSwitchTimer = AddTimer(110000);
			mSkeletonTimer = AddTimer(8000);
			mPhaseCounter = 0;

			if(_unit->GetMapMgr() != NULL && _unit->GetMapMgr()->GetInterface() != NULL)
			{
				if(GameObject* Gate = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(2740.689209f, -3489.697266f, 262.117767f, 181200))
					Gate->SetState(1);

				if(GameObject* Gate = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(2683.670654f, -3556.429688f, 261.823334f, 181201))
					Gate->SetState(1);
			}
			MoonScriptBossAI::OnCombatStart(pTarget);
		}

		void OnCombatStop(Unit* pTarget)
		{
			if(_unit->GetMapMgr() != NULL && _unit->GetMapMgr()->GetInterface() != NULL)
			{
				if(GameObject* Gate = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(2740.689209f, -3489.697266f, 262.117767f, 181200))
					Gate->SetState(GAMEOBJECT_STATE_OPEN);

				if(GameObject* Gate = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(2683.670654f, -3556.429688f, 261.823334f, 181201))
					Gate->SetState(GAMEOBJECT_STATE_OPEN);
			}
			MoonScriptBossAI::OnCombatStop(pTarget);
		}

		void AIUpdate()
		{
			if(GetPhase() == 1)
			{
				if(!IsCasting())
				{
					if(mPhaseCounter < 3 && IsTimerFinished(mPhaseSwitchTimer))
					{
						SetPhase(2, mToBalconySwitch);
						ResetTimer(mPhaseSwitchTimer, 70000);
						ResetTimer(mSkeletonTimer, 0);
						++mPhaseCounter;
						return;
					}

					if(mPhaseCounter == 3)
					{
						ApplyAura(NOTH_THE_PLAGUEBRINGER_BERSERK);
						++mPhaseCounter;
					}

					if(IsHeroic() && IsTimerFinished(mBlinkTimer))
					{
						CastSpellNowNoScheduling(mCriple);
						ResetTimer(mBlinkTimer, 28000 + RandomUInt(12) * 1000);
					}
				}

				if(IsTimerFinished(mSkeletonTimer))
				{
					uint32 SkelLimit = 2;
					if(IsHeroic())
						SkelLimit = 3;

					bool PosTaken[ 3 ];
					for(uint32 i = 0; i < 3; ++i)
						PosTaken[ i ] = false;

					uint32 Id = 0;
					PlaguedWarriorAI* WarriorAI = NULL;
					for(uint32 i = 0; i < SkelLimit; ++i)
					{
						Id = RandomUInt(2);
						if(PosTaken[ Id ])
						{
							for(uint32 j = 0; j < 3; ++j)
							{
								if(!PosTaken[ j ])
								{
									Id = j;
									break;
								}
							}
						}

						PosTaken[ Id ] = true;
					}

					Emote("Rise, my soldiers! Rise and fight once more!", Text_Yell, 8851);
					ResetTimer(mSkeletonTimer, 30000);
					PosTaken[ Id ] = true;
				}
			}
			else
			{
				if(!IsCasting() && IsTimerFinished(mPhaseSwitchTimer))
				{
					SetPhase(1, mFromBalconySwitch);
					ResetTimer(mPhaseSwitchTimer, 70000);
					ResetTimer(mSkeletonTimer, 8000);
					if(IsHeroic())
						ResetTimer(mBlinkTimer, 28000 + RandomUInt(12) * 1000);

					return;
				}

				if(IsTimerFinished(mSkeletonTimer))
				{
					uint32 SpawnLimit = 2;
					if(IsHeroic())
						++SpawnLimit;

					uint32 Id = 0;
					uint32 Champions = 0;
					if(mPhaseCounter <= SpawnLimit + 1)
						Champions = SpawnLimit - mPhaseCounter + 1;

					bool PosTaken[ 4 ];
					for(uint32 i = 0; i < 4; ++i)
						PosTaken[ i ] = false;

					PlaguedChampionAI* ChampionAI = NULL;
					for(uint32 i = 0; i < Champions; ++i)
					{
						Id = RandomUInt(3);
						if(PosTaken[ Id ])
						{
							for(uint32 j = 0; j < 4; ++j)
							{
								if(!PosTaken[ Id ])
								{
									Id = j;
									break;
								}
							}
						}

						PosTaken[ Id ] = true;
					}

					PlaguedGuardianAI* GuardianAI = NULL;
					for(uint32 i = 0; i < SpawnLimit - Champions; ++i)
					{
						Id = RandomUInt(3);
						if(PosTaken[ Id ])
						{
							for(uint32 j = 0; j < 4; ++j)
							{
								if(!PosTaken[ Id ])
								{
									Id = j;
									break;
								}
							}
						}
					}

					ResetTimer(mSkeletonTimer, 35000);
					PosTaken[ Id ] = true;
				}
			}

			if(GetPhase() == 2)
			{
				SetBehavior(Behavior_Spell);
				SetCanMove(false);
				StopMovement();
			}
			MoonScriptBossAI::AIUpdate();
		}

		SpellDesc*					mCriple;
		SpellDesc*					mBlink;
		SpellDesc*					mToBalconySwitch;
		SpellDesc*					mFromBalconySwitch;
		int32						mBlinkTimer;
		int32						mSkeletonTimer;
		int32						mPhaseSwitchTimer;
		uint32						mPhaseCounter;
};

void SpellFunc_NothToBalconyPhaseSwitch(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType)
{
	NothThePlaguebringerAI* Noth = (pCreatureAI != NULL) ? TO< NothThePlaguebringerAI* >(pCreatureAI) : NULL;
	if(Noth != NULL)
	{
		// Are these coords correct ? Or maybe it should be just disappear / appear thing ? And is this spell correct ? I doubt it ...
		Noth->ApplyAura(NOTH_THE_PLAGUEBRINGER_BLINK_HEROIC);
		Noth->GetUnit()->SetPosition(2631.051025f, -3529.595703f, 274.037811f, 0.109163f);
		Noth->SetBehavior(Behavior_Spell);
		Noth->SetCanMove(false);
		Noth->StopMovement();
	}
};

void SpellFunc_NothFromBalconyPhaseSwitch(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType)
{
	NothThePlaguebringerAI* Noth = (pCreatureAI != NULL) ? TO< NothThePlaguebringerAI* >(pCreatureAI) : NULL;
	if(Noth != NULL)
	{
		Noth->SetBehavior(Behavior_Default);
		Noth->SetCanMove(true);
		Noth->ApplyAura(NOTH_THE_PLAGUEBRINGER_BLINK_HEROIC);
		Noth->GetUnit()->SetPosition(2684.620850f, -3502.447266f, 261.314880f, 0.098174f);

		if(pTarget != NULL)
			Noth->GetUnit()->GetAIInterface()->AttackReaction(pTarget, 200);

		Noth->GetUnit()->GetAIInterface()->setNextTarget(pTarget);
	}
};

void SpellFunc_NothCriple(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType)
{
	NothThePlaguebringerAI* Noth = (pCreatureAI != NULL) ? TO< NothThePlaguebringerAI* >(pCreatureAI) : NULL;
	if(Noth != NULL)
	{
		// Dunno if target count that should be affected is correct
		Noth->ApplyAura(NOTH_THE_PLAGUEBRINGER_CRIPLE_HEROIC);
		Noth->CastSpell(Noth->mBlink);
	}
};

void SpellFunc_NothBlink(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType)
{
	NothThePlaguebringerAI* Noth = (pCreatureAI != NULL) ? TO< NothThePlaguebringerAI* >(pCreatureAI) : NULL;
	if(Noth != NULL)
	{
		Noth->ApplyAura(NOTH_THE_PLAGUEBRINGER_BLINK_HEROIC);
		float Angle = Noth->GetUnit()->GetOrientation();
		float NewX = Noth->GetUnit()->GetPositionX() + 20.0f * cosf(Angle);
		float NewY = Noth->GetUnit()->GetPositionY() + 20.0f * sinf(Angle);
		Noth->GetUnit()->SetPosition(NewX, NewY, Noth->GetUnit()->GetPositionZ(), Angle);
		Noth->ClearHateList();
		if(pTarget != NULL)
			Noth->GetUnit()->GetAIInterface()->AttackReaction(pTarget, 500);

		Noth->GetUnit()->GetAIInterface()->setNextTarget(pTarget);
	}
};

/////////////////////////////////////////////////////////////////////////////////
////// Plagued Warrior
#define PLAGUED_WARRIOR_STRIKE					12057
#define PLAGUED_WARRIOR_CLEAVE					15496

class PlaguedWarriorAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(PlaguedWarriorAI)
		PlaguedWarriorAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(PLAGUED_WARRIOR_STRIKE, Target_Current, 10, 0, 5, 0, 8);
			AddSpell(PLAGUED_WARRIOR_CLEAVE, Target_Current, 10, 0, 10, 0, 8);
		}

		void Destroy()
		{
			delete this;
		}

		NothThePlaguebringerAI*	mNothAI;
};

/////////////////////////////////////////////////////////////////////////////////
////// Heigan the Unclean
#define CN_HEIGAN_THE_UNCLEAN						15936
#define HEIGAN_THE_UNCLEAN_SPELL_DISRUPTION			29310
#define HEIGAN_THE_UNCLEAN_DECREPIT_FEVER_NORMAL	29998
#define HEIGAN_THE_UNCLEAN_DECREPIT_FEVER_HEROIC	55011
#define HEIGAN_THE_UNCLEAN_PLAGUE_CLOUD_CHANNEL		29350
#define HEIGAN_THE_UNCLEAN_PLAGUE_CLOUD_DAMAGE		30122
#define HEIGAN_THE_UNCLEAN_TELEPORT					34673	// Guessed.
#define FISSURE_TRIGGER_ERUPTION				29371

float HeiganPos[2] = {2796, -3707};
const float HeiganEruptionSlope[3] =
{
	(-3685 - HeiganPos[1]) / (2724 - HeiganPos[0]),
	(-3647 - HeiganPos[1]) / (2749 - HeiganPos[0]),
	(-3637 - HeiganPos[1]) / (2771 - HeiganPos[0]),
};

class HeiganTheUncleanAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(HeiganTheUncleanAI)
		HeiganTheUncleanAI(Creature* pCreature) : MoonScriptBossAI(pCreature)
		{
			AddPhaseSpell(1, AddSpell(HEIGAN_THE_UNCLEAN_SPELL_DISRUPTION, Target_Self, 100, 0, 5));
			AddPhaseSpell(1, AddSpell(HEIGAN_THE_UNCLEAN_DECREPIT_FEVER_NORMAL, Target_Self, 100, 0, 20));

			AddPhaseSpell(2, AddSpell(HEIGAN_THE_UNCLEAN_PLAGUE_CLOUD_DAMAGE, Target_Self, 100, 0, 2));

			AddEmote(Event_OnCombatStart, "You are mine now!", Text_Yell, 8825);
			AddEmote(Event_OnCombatStart, "I see you...", Text_Yell, 8826);
			AddEmote(Event_OnCombatStart, "You... are next!", Text_Yell, 8827);
			AddEmote(Event_OnDied, "Arghhaahhhhh!", Text_Yell, 8828);
			AddEmote(Event_OnTargetDied, "Close your eyes. Sleep.", Text_Yell, 8829);
			AddEmote(Event_OnTaunt, "The races of the world will perish... it is only a matter of time.", Text_Yell, 8830);
			AddEmote(Event_OnTaunt, "I see endless suffering... I see torment... I see rage... I see everything.", Text_Yell, 8831);
			AddEmote(Event_OnTaunt, "Soon... the world will tremble.", Text_Yell, 8832);
			AddEmote(Event_OnTaunt, "Hungry worms will feast on your rotting flesh.", Text_Yell, 8834);
			mPhaseSwitchTimer = mEruptionTimer = INVALIDATE_TIMER;
			mEruptionPhase = 3;
			mClockWiseEruption = true;
		}

		uint32 CalculateTriggerArea(float pPosX, float pPosY)
		{
			pPosY -= HeiganPos[1];
			if(pPosY < 1.0f)
				return 0;

			pPosX -= HeiganPos[0];
			if(pPosX > -1.0f)
				return 3;

			float slope = pPosY / pPosX;
			for(uint32 i = 0; i < 3; ++i)
				if(slope > HeiganEruptionSlope[i])
					return i;

			return 3;
		}

		void CallEruptionEvent(int32 pTimerId, int32 pNewTime)
		{
			if(pTimerId < 0)
				return;

			ResetTimer(pTimerId, pNewTime);
			if(mEruptionPhase == 0)
				mClockWiseEruption = false;
			else if(mEruptionPhase == 3)
				mClockWiseEruption = true;

			if(mClockWiseEruption)
				--mEruptionPhase;
			else
				++mEruptionPhase;
		}

		void OnCombatStart(Unit* pTarget)
		{
			mPhaseSwitchTimer = AddTimer(90000);
			mEruptionTimer = AddTimer(8000);
			mEruptionPhase = 3;
			mClockWiseEruption = true;

			if(_unit->GetMapMgr() != NULL && _unit->GetMapMgr()->GetInterface() != NULL)
			{
				if(GameObject* Gate = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(2790.709961f, -3708.669922f, 276.584991f, 181202))
					Gate->SetState(1);

				if(GameObject* Gate = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(2771.718506f, -3739.965820f, 273.616211f, 181203))
					Gate->SetState(1);
			}
			MoonScriptBossAI::OnCombatStart(pTarget);
		}

		void OnCombatStop(Unit* pTarget)
		{
			SetTargetToChannel(NULL, 0);
			if(_unit->GetMapMgr() != NULL && _unit->GetMapMgr()->GetInterface() != NULL)
			{
				if(GameObject* Gate = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(2790.709961f, -3708.669922f, 276.584991f, 181202))
					Gate->SetState(GAMEOBJECT_STATE_OPEN);

				if(GameObject* Gate = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(2771.718506f, -3739.965820f, 273.616211f, 181203))
					Gate->SetState(GAMEOBJECT_STATE_OPEN);
			}
			MoonScriptBossAI::OnCombatStart(pTarget);
		}

		void AIUpdate()
		{
			if(GetPhase() == 1)
			{
				if(!IsCasting() && IsTimerFinished(mPhaseSwitchTimer))
				{
					ApplyAura(HEIGAN_THE_UNCLEAN_TELEPORT);
					Emote("The end is uppon you!", Text_Yell, 8833);
					_unit->SetPosition(2794.235596f, -3707.067627f, 276.545746f, 2.407245f);
					SetTargetToChannel(_unit, HEIGAN_THE_UNCLEAN_PLAGUE_CLOUD_CHANNEL);
					SetBehavior(Behavior_Spell);
					SetCanMove(false);
					StopMovement();
					SetPhase(2);
					mEruptionPhase = 3;
					ResetTimer(mPhaseSwitchTimer, 45000);
					ResetTimer(mEruptionTimer, 3000);
					return;
				}

				if(IsTimerFinished(mEruptionTimer))
					CallEruptionEvent(mEruptionTimer, 8000);
			}
			else
			{
				if(!IsCasting() && IsTimerFinished(mPhaseSwitchTimer))
				{
					SetTargetToChannel(NULL, 0);
					SetBehavior(Behavior_Default);
					SetCanMove(true);
					SetPhase(1);
					ResetTimer(mPhaseSwitchTimer, 90000);
					return;
				}

				if(IsTimerFinished(mEruptionTimer))
					CallEruptionEvent(mEruptionTimer, 3000);
			}

			if(GetPhase() == 2)
			{
				SetBehavior(Behavior_Spell);
				SetCanMove(false);
				StopMovement();
			}
			MoonScriptBossAI::AIUpdate();
		}

		int32										mPhaseSwitchTimer;
		int32										mEruptionTimer;
		int32										mEruptionPhase;
		bool										mClockWiseEruption;
};

/////////////////////////////////////////////////////////////////////////////////
////// Plague Fissure
#define GO_PLAGUE_FISSURE		181533

class PlagueFissureGO : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(PlagueFissureGO)
		PlagueFissureGO(GameObject* pGameObject) : GameObjectAIScript(pGameObject)
		{
			mHeiganAI = NULL;
		}

		void DoErrupt()
		{
			WorldPacket data(SMSG_GAMEOBJECT_CUSTOM_ANIM, 8 + 4);
			data << _gameobject->GetGUID();
			data << (uint32)0;

			//send packet to inrange players
			for(std::set<Object*>::iterator plrIter = _gameobject->GetInRangePlayerSetBegin(); plrIter != _gameobject->GetInRangePlayerSetEnd(); plrIter++)
				TO_PLAYER(*plrIter)->SendPacket(&data);

			Creature* pFissureTrigger = _gameobject->GetMapMgr()->GetInterface()->SpawnCreature(15384, _gameobject->GetPositionX(), _gameobject->GetPositionY(), _gameobject->GetPositionZ(), _gameobject->GetOrientation(), true, false, 0, 0, 1);
			if(!pFissureTrigger)
				return;

			pFissureTrigger->CastSpell(pFissureTrigger, FISSURE_TRIGGER_ERUPTION, true);
			pFissureTrigger->Despawn(2000, 0);
		}

		// I believe it's nowhere hooked in the core.
		void SetState(uint32 pState)
		{
			_gameobject->SetState(pState);
		}

		void ResetHeiganAI() 
		{
			mHeiganAI = NULL;
		}

		HeiganTheUncleanAI*	mHeiganAI;
};

/////////////////////////////////////////////////////////////////////////////////
////// Loatheb
#define CN_LOATHEB							16011
#define LOATHEB_NECROTIC_AURA				55593
#define LOATHEB_SUMMON_SPORE				29234
#define LOATHEB_DEATHBLOOM_NORMAL			29865
#define LOATHEB_DEATHBLOOM_HEROIC			55053
#define LOATHEB_DEATHBLOOM_DAMAGE_NORMAL	55594
#define LOATHEB_DEATHBLOOM_DAMAGE_HEROIC	55601
#define LOATHEB_INEVITABLE_DOOM_NORMAL		29204
#define LOATHEB_INEVITABLE_DOOM_HEROIC		55052
#define LOATHEB_BERSERK						26662	// Unused
#define CN_SPORE						16286

static Location Spores[] =
{
	{ 2880.517334f, -4027.450684f, 273.680695f, 0.848522f },
	{ 2938.914307f, -4027.245850f, 273.617340f, 2.419318f },
	{ 2938.526611f, -3968.206543f, 273.524963f, 3.829108f },
	{ 2879.754883f, -3968.288574f, 273.633698f, 5.525566f }
};

class LoathebAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(LoathebAI)
		LoathebAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(LOATHEB_NECROTIC_AURA, Target_Self, 100, 0, 20);
			if(IsHeroic())
				AddSpell(LOATHEB_DEATHBLOOM_HEROIC, Target_Self, 100, 0, 30);
			else
				AddSpell(LOATHEB_DEATHBLOOM_NORMAL, Target_Self, 100, 0, 30);

			mSporeTimer = mDoomTimer = mDeathbloomTimer = INVALIDATE_TIMER;
			mDoomStaticTimer = 120000;
			mDeathbloomDamagePhase = false;
		}

		void OnCombatStart(Unit* pTarget)
		{
			mDoomStaticTimer = 120000;
			mSporeTimer = AddTimer(30000);
			mDoomTimer = AddTimer(mDoomStaticTimer);
			mDeathbloomTimer = AddTimer(30000);
			mDeathbloomDamagePhase = false;
			MoonScriptCreatureAI::OnCombatStart(pTarget);
		}

		void AIUpdate()
		{
			if(IsTimerFinished(mSporeTimer))
			{
				bool PosTaken[ 4 ];
				for(uint32 i = 0; i < 4; ++i)
					PosTaken[ i ] = false;

				uint32 Id = 0;
				SporeAI* Spore = NULL;
				for(uint32 i = 0; i < 3; ++i)
				{
					Id = RandomUInt(3);
					if(PosTaken[ Id ])
					{
						for(uint32 j = 0; j < 4; ++j)
						{
							if(!PosTaken[ j ])
							{
								Id = j;
								break;
							}
						}
					}
				}

				ResetTimer(mSporeTimer, 30000);
				PosTaken[ Id ] = true;
			}

			if(!IsCasting())
			{
				if(IsTimerFinished(mDoomTimer))
				{
					if(IsHeroic())
						ApplyAura(LOATHEB_INEVITABLE_DOOM_HEROIC);
					else
						ApplyAura(LOATHEB_INEVITABLE_DOOM_NORMAL);

					if(mDoomStaticTimer > 36000)
					{
						if(mDoomStaticTimer <= 36000)
							mDoomStaticTimer = 15000;
						else
							mDoomStaticTimer -= 21000;
					}

					ResetTimer(mDoomTimer, mDoomStaticTimer);
				}
				else if(IsTimerFinished(mDeathbloomTimer))
				{
					if(mDeathbloomDamagePhase)
					{
						Player* PlayerPtr = NULL;
						for(set< Object* >::iterator Iter = _unit->GetInRangePlayerSetBegin(); Iter != _unit->GetInRangePlayerSetEnd(); ++Iter)
						{
							if((*Iter) == NULL)
								continue;

							PlayerPtr = TO< Player* >(*Iter);
							if(!PlayerPtr->isAlive())
								continue;

							if(!PlayerPtr->HasAura(LOATHEB_DEATHBLOOM_NORMAL) && !PlayerPtr->HasAura(LOATHEB_DEATHBLOOM_HEROIC))
								continue;

							if(IsHeroic())
								PlayerPtr->CastSpell(PlayerPtr, LOATHEB_DEATHBLOOM_DAMAGE_HEROIC, true);
							else
								PlayerPtr->CastSpell(PlayerPtr, LOATHEB_DEATHBLOOM_DAMAGE_NORMAL, true);
						};

						ResetTimer(mDeathbloomTimer, 25000);
					}
					else
					{
						if(IsHeroic())
							ApplyAura(LOATHEB_DEATHBLOOM_HEROIC);
						else
							ApplyAura(LOATHEB_DEATHBLOOM_NORMAL);

						ResetTimer(mDeathbloomTimer, 5000);
					}

					mDeathbloomDamagePhase = !mDeathbloomDamagePhase;
				}
			}
			MoonScriptCreatureAI::AIUpdate();
		}

		uint32			mDoomStaticTimer;
		int32			mSporeTimer;
		int32			mDoomTimer;
		int32			mDeathbloomTimer;
		bool			mDeathbloomDamagePhase;
};

/////////////////////////////////////////////////////////////////////////////////
////// Spore
#define SPORE_FUNGAL_CREEP				29232

class SporeAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(SporeAI)
		SporeAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			Despawn(90000);
		}

		void OnDied(Unit* pKiller)
		{
			ApplyAura(SPORE_FUNGAL_CREEP);
			MoonScriptCreatureAI::OnDied(pKiller);
		}
};

/////////////////////////////////////////////////////////////////////////////////
////// The Military Quarter

/////////////////////////////////////////////////////////////////////////////////
////// Shade of Naxxramas
#define CN_SHADE_OF_NAXXRAMAS							16164
#define SHADE_OF_NAXXRAMAS_PORTAL_OF_SHADOWS			28383
#define SHADE_OF_NAXXRAMAS_SHADOW_BOLT_VOLLEY_NORMAL	28407
#define SHADE_OF_NAXXRAMAS_SHADOW_BOLT_VOLLEY_HEROIC	55323
#define CN_GHOST_OF_NAXXRAMAS							16419

class ShadeOfNaxxramasAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(ShadeOfNaxxramasAI)
		ShadeOfNaxxramasAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(SHADE_OF_NAXXRAMAS_SHADOW_BOLT_VOLLEY_NORMAL, Target_Self, 10, 0, 10);
			AddSpell(SHADE_OF_NAXXRAMAS_PORTAL_OF_SHADOWS, Target_Self, 8, 0, 60);
		}

		void OnDied(Unit* pKiller)
		{
			if(MoonScriptCreatureAI* Ghost = SpawnCreature(CN_GHOST_OF_NAXXRAMAS, true))
			{
				Ghost->GetUnit()->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_2);
				Ghost->SetDespawnWhenInactive(true);
				Ghost->AggroNearestPlayer(200);
			}
			MoonScriptCreatureAI::OnDied(pKiller);
		}
};

/////////////////////////////////////////////////////////////////////////////////
////// Portal of Shadows
#define CN_PORTAL_OF_SHADOWS							16420

class PortalOfShadowsAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(PortalOfShadowsAI)
		PortalOfShadowsAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			RegisterAIUpdateEvent(1000);
			mSpawnTimer = AddTimer(15000);
			mShadeAI = NULL;
		}

		void OnCombatStart(Unit* pTarget)
		{
			SetBehavior(Behavior_Spell);
			SetCanMove(false);
			StopMovement();
			MoonScriptCreatureAI::OnCombatStart(pTarget);
		}

		void OnCombatStop(Unit* pTarget)
		{
			CancelAllSpells();
			CancelAllTimers();
			SetCanMove(true);
			SetBehavior(Behavior_Default);
			MoonScriptCreatureAI::OnCombatStop(pTarget);
		}

		void AIUpdate()
		{
			if(mShadeAI != NULL && mShadeAI->GetUnit()->GetAIInterface()->getNextTarget() != NULL)
			{
				if(IsTimerFinished(mSpawnTimer))
				{
					if(MoonScriptCreatureAI* Ghost = SpawnCreature(CN_GHOST_OF_NAXXRAMAS, true))
					{
						Ghost->GetUnit()->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_2);
						Ghost->SetDespawnWhenInactive(true);
						Ghost->AggroNearestPlayer(200);
					}
					ResetTimer(mSpawnTimer, 15000);
				}
			}
			else
			{
				RemoveAIUpdateEvent();
				Despawn();
				return;
			}

			SetBehavior(Behavior_Spell);
			SetCanMove(false);
			StopMovement();
			MoonScriptCreatureAI::AIUpdate();
		}

		ShadeOfNaxxramasAI*	mShadeAI;
		int32				mSpawnTimer;
};

/////////////////////////////////////////////////////////////////////////////////
////// Necro Knight
#define CN_NECRO_KNIGHT							16165
#define NECRO_KNIGHT_ARCANE_EXPLOSION			15453
#define NECRO_KNIGHT_BLAST_WAVE					30092
#define NECRO_KNIGHT_BLINK						28391
#define NECRO_KNIGHT_CONE_OF_COLD				30095
#define NECRO_KNIGHT_FLAMESTRIKE				30091
#define NECRO_KNIGHT_FROST_NOVA					30094

void SpellFunc_NecroKnightBlink(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType);

class NecroKnightAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(NecroKnightAI)
		NecroKnightAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(NECRO_KNIGHT_ARCANE_EXPLOSION, Target_Self, 8, 1.5, 5);
			AddSpell(NECRO_KNIGHT_BLAST_WAVE, Target_Self, 7, 0, 5);
			AddSpell(NECRO_KNIGHT_CONE_OF_COLD, Target_Current, 7, 0, 5, 0, 10);
			AddSpell(NECRO_KNIGHT_FLAMESTRIKE, Target_RandomPlayerDestination, 8, 2, 10, 0, 30);
			AddSpell(NECRO_KNIGHT_FROST_NOVA, Target_Self, 8, 0, 10);
			AddSpellFunc(&SpellFunc_NecroKnightBlink, Target_RandomPlayerNotCurrent, 5, 0, 20, 0, 30);
		}
};

void SpellFunc_NecroKnightBlink(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType)
{
	NecroKnightAI* NecroKnight = (pCreatureAI != NULL) ? TO< NecroKnightAI* >(pCreatureAI) : NULL;
	if(NecroKnight != NULL && pTarget != NULL)
	{
		NecroKnight->ApplyAura(NECRO_KNIGHT_BLINK);
		NecroKnight->GetUnit()->SetPosition(pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), NecroKnight->GetUnit()->GetOrientation());
		NecroKnight->GetUnit()->GetAIInterface()->AttackReaction(pTarget, 500);
		NecroKnight->GetUnit()->GetAIInterface()->setNextTarget(pTarget);
	}
};

/////////////////////////////////////////////////////////////////////////////////
////// Death Knight Cavalier
#define CN_DEATH_KNIGHT_CAVALIER					16163
#define DEATH_KNIGHT_CAVALIER_BONE_ARMOR_NORMAL		55315
#define DEATH_KNIGHT_CAVALIER_BONE_ARMOR_HEROIC		55336
#define DEATH_KNIGHT_CAVALIER_DISMOUNT_DEATHCHARGER	55294
#define DEATH_KNIGHT_CAVALIER_ICY_TOUCH_NORMAL		55313
#define DEATH_KNIGHT_CAVALIER_ICY_TOUCH_HEROIC		55331
#define DEATH_KNIGHT_CAVALIER_STRANGULATE_NORMAL	55314
#define DEATH_KNIGHT_CAVALIER_STRANGULATE_HEROIC	55334
#define DEATH_KNIGHT_CAVALIER_AURA_OF_AGONY			28413
#define DEATH_KNIGHT_CAVALIER_CLEAVE				15284
#define DEATH_KNIGHT_CAVALIER_DEATH_COIL			28412

class DeathKnightCavalierAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(DeathKnightCavalierAI)
		DeathKnightCavalierAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(DEATH_KNIGHT_CAVALIER_BONE_ARMOR_NORMAL, Target_Self, 7, 0, 30);
			AddSpell(DEATH_KNIGHT_CAVALIER_ICY_TOUCH_NORMAL, Target_RandomPlayer, 10, 0, 15, 0, 20);	// Target_Current ?
			AddSpell(DEATH_KNIGHT_CAVALIER_STRANGULATE_NORMAL, Target_RandomPlayer, 7, 1, 15, 0, 50);

			AddSpell(DEATH_KNIGHT_CAVALIER_AURA_OF_AGONY, Target_RandomPlayer, 10, 0, 5, 0, 30);
			AddSpell(DEATH_KNIGHT_CAVALIER_CLEAVE, Target_Current, 10, 0, 10, 0, 8);
			AddSpell(DEATH_KNIGHT_CAVALIER_DEATH_COIL, Target_RandomPlayer, 7, 0, 10, 0, 30);
			_unit->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID , 25278);
			mChargerAI = NULL;
			mIsMounted = true;
		}

		void AIUpdate()
		{
			if(mIsMounted && _unit->GetMount() == 0)
				_unit->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID , 25278);

			if(mIsMounted && RandomUInt(99) < 2)
			{
				_unit->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID , 0);
				ApplyAura(DEATH_KNIGHT_CAVALIER_DISMOUNT_DEATHCHARGER);
				mIsMounted = false;
			}
			MoonScriptCreatureAI::AIUpdate();
		}

		DeathchargerSteedAI*	mChargerAI;
		bool					mIsMounted;
};

/////////////////////////////////////////////////////////////////////////////////
////// Deathcharger Steed
#define CN_DEATHCHARGER_STEED					29818
#define DEATHCHARGER_STEED_CHARGE				55317

void SpellFunc_DeathchargerSteedCharge(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType);

class DeathchargerSteedAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(DeathchargerSteedAI)
		DeathchargerSteedAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			mDeathKnightAI = NULL;
			mCharge = AddSpell(DEATHCHARGER_STEED_CHARGE, Target_Current, 0, 0, 0, 5, 45);
			//AddSpellFunc( &SpellFunc_DeathchargerSteedCharge, Target_RandomPlayer, 8, 0, 15, 5, 45 );

			// We do not consider using a spell that summons this unit by anyone else than Death Knight Cavalier.
			// I don't like this method anyway.
			if(_unit->GetSummonedByGUID() != 0 && _unit->GetMapMgr() != NULL && _unit->GetMapMgr()->GetInterface() != NULL)
			{
				mDeathKnightAI = TO< DeathKnightCavalierAI* >(GetNearestCreature(CN_DEATH_KNIGHT_CAVALIER));
				if(mDeathKnightAI != NULL && mDeathKnightAI->mChargerAI == NULL)
					mDeathKnightAI->mChargerAI = this;
			}
		}

		void OnCombatStop(Unit* pTarget)
		{
			if(mDeathKnightAI != NULL)
			{
				if(mDeathKnightAI->IsInCombat())
					AggroNearestUnit(200);
				else
				{
					mDeathKnightAI->mChargerAI = NULL;
					mDeathKnightAI = NULL;
					Despawn(1);
				}
			}
			MoonScriptCreatureAI::OnCombatStop(pTarget);
		}

		void Destroy()
		{
			if(mDeathKnightAI != NULL)
			{
				mDeathKnightAI->mChargerAI = NULL;
				mDeathKnightAI = NULL;
			}
			delete this;
		}

		DeathKnightCavalierAI*	mDeathKnightAI;
		SpellDesc*				mCharge;
};

void SpellFunc_DeathchargerSteedCharge(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType)
{
	DeathchargerSteedAI* Deathcharger = (pCreatureAI != NULL) ? TO< DeathchargerSteedAI* >(pCreatureAI) : NULL;
	if(Deathcharger != NULL)
	{
		Unit* CurrentTarget = Deathcharger->GetUnit()->GetAIInterface()->getNextTarget();
		if(CurrentTarget != NULL && CurrentTarget != pTarget)
		{
			Deathcharger->GetUnit()->GetAIInterface()->AttackReaction(pTarget, 500);
			Deathcharger->GetUnit()->GetAIInterface()->setNextTarget(pTarget);
			//Deathcharger->GetUnit()->GetAIInterface()->RemoveThreatByPtr( CurrentTarget );
		}

		Deathcharger->CastSpellNowNoScheduling(Deathcharger->mCharge);
	}
};

/////////////////////////////////////////////////////////////////////////////////
////// Dark Touched Warrior
#define CN_DARK_TOUCHED_WARRIOR					16156
#define DARK_TOUCHED_WARRIOR_WHIRLWIND			55267
//#define DARK_TOUCHED_WARRIOR_WHIRLWIND			55266	// This one disables mob's melee

class DarkTouchedWarriorAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(DarkTouchedWarriorAI)
		DarkTouchedWarriorAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			mResetHateTimer = -1;
		}

		void OnCombatStart(Unit* pTarget)
		{
			mResetHateTimer = AddTimer(8000 + RandomUInt(7) * 1000);
			MoonScriptCreatureAI::OnCombatStart(pTarget);
		}

		void AIUpdate()
		{
			if(!IsCasting() && IsTimerFinished(mResetHateTimer))
			{
				ClearHateList();
				mResetHateTimer = AddTimer(8000 + RandomUInt(7) * 1000);
			}
			MoonScriptCreatureAI::AIUpdate();
		}

		int32	mResetHateTimer;
};

/////////////////////////////////////////////////////////////////////////////////
////// Instructor Razuvious
#define CN_INSTRUCTOR_RAZUVIOUS							16061
#define INSTRUCTOR_RAZUVIOUS_DISRUPTING_SHOUT_NORMAL	55543
#define INSTRUCTOR_RAZUVIOUS_DISRUPTING_SHOUT_HEROIC	29107
#define INSTRUCTOR_RAZUVIOUS_JAGGED_KNIFE				55550
#define INSTRUCTOR_RAZUVIOUS_UNBALANCING_STRIKE			55470
#define INSTRUCTOR_RAZUVIOUS_HOPELESS					29125

class InstructorRazuviousAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(InstructorRazuviousAI)
		InstructorRazuviousAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature){}
	
		friend class DeathKnightUnderstudyAI;

		void OnCombatStart(Unit* pTarget){}
		void OnCombatStop(Unit* pTarget){}
		void OnDied(Unit* pKiller){}
		void AIUpdate(){}

		set< DeathKnightUnderstudyAI* >	mStudents;
};

/////////////////////////////////////////////////////////////////////////////////
////// Death Knight Understudy
#define CN_DEATH_KNIGHT_UNDERSTUDY					16803
#define DEATH_KNIGHT_UNDERSTUDY_BLOOD_STRIKE		61696
#define DEATH_KNIGHT_UNDERSTUDY_BONE_BARRIER		29061
#define DEATH_KNIGHT_UNDERSTUDY_TAUNT				29060

class DeathKnightUnderstudyAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(DeathKnightUnderstudyAI)
		DeathKnightUnderstudyAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(DEATH_KNIGHT_UNDERSTUDY_BLOOD_STRIKE, Target_Current, 10, 0, 4, 0, 8);
			AddSpell(DEATH_KNIGHT_UNDERSTUDY_BONE_BARRIER, Target_Self, 8, 0, 30);
			AddSpell(DEATH_KNIGHT_UNDERSTUDY_TAUNT, Target_Current, 8, 0, 10, 0, 8);

			// Blood Strike
			AI_Spell* NewSpell = new AI_Spell;
			NewSpell->spell = dbcSpell.LookupEntry(DEATH_KNIGHT_UNDERSTUDY_BLOOD_STRIKE);
			NewSpell->agent = AGENT_SPELL;
			NewSpell->entryId = _unit->GetEntry();
			NewSpell->maxrange = GetMaxRange(dbcSpellRange.LookupEntry(NewSpell->spell->rangeIndex));
			NewSpell->minrange = GetMinRange(dbcSpellRange.LookupEntry(NewSpell->spell->rangeIndex));
			NewSpell->spelltargetType = TTYPE_SINGLETARGET;
			NewSpell->spellType = STYPE_DAMAGE;
			NewSpell->cooldown = objmgr.GetPetSpellCooldown(NewSpell->spell->Id);
			NewSpell->cooldowntime = 0;
			NewSpell->autocast_type = AUTOCAST_EVENT_NONE;
			NewSpell->floatMisc1 = 0;
			NewSpell->Misc2 = 0;
			NewSpell->procChance = 0;
			NewSpell->procCount = 0;
			_unit->GetAIInterface()->addSpellToList(NewSpell);
			//_unit->GetAIInterface()->m_spells.push_back( NewSpell );

			// Bone Barrier
			NewSpell = new AI_Spell;
			NewSpell->spell = dbcSpell.LookupEntry(DEATH_KNIGHT_UNDERSTUDY_BONE_BARRIER);
			NewSpell->agent = AGENT_SPELL;
			NewSpell->entryId = _unit->GetEntry();
			NewSpell->maxrange = GetMaxRange(dbcSpellRange.LookupEntry(NewSpell->spell->rangeIndex));
			NewSpell->minrange = GetMinRange(dbcSpellRange.LookupEntry(NewSpell->spell->rangeIndex));
			NewSpell->spelltargetType = TTYPE_CASTER;
			NewSpell->spellType = STYPE_BUFF;
			NewSpell->cooldown = objmgr.GetPetSpellCooldown(NewSpell->spell->Id);
			NewSpell->cooldowntime = 0;
			NewSpell->autocast_type = AUTOCAST_EVENT_NONE;
			NewSpell->floatMisc1 = 0;
			NewSpell->Misc2 = 0;
			NewSpell->procChance = 0;
			NewSpell->procCount = 0;
			_unit->GetAIInterface()->addSpellToList(NewSpell);
			//_unit->GetAIInterface()->m_spells.push_back( NewSpell );

			// Taunt
			NewSpell = new AI_Spell;
			NewSpell->spell = dbcSpell.LookupEntry(DEATH_KNIGHT_UNDERSTUDY_TAUNT);
			NewSpell->agent = AGENT_SPELL;
			NewSpell->entryId = _unit->GetEntry();
			NewSpell->maxrange = GetMaxRange(dbcSpellRange.LookupEntry(NewSpell->spell->rangeIndex));
			NewSpell->minrange = GetMinRange(dbcSpellRange.LookupEntry(NewSpell->spell->rangeIndex));
			NewSpell->spelltargetType = TTYPE_SINGLETARGET;
			NewSpell->spellType = STYPE_BUFF;
			NewSpell->cooldown = objmgr.GetPetSpellCooldown(NewSpell->spell->Id);
			NewSpell->cooldowntime = 0;
			NewSpell->autocast_type = AUTOCAST_EVENT_NONE;
			NewSpell->floatMisc1 = 0;
			NewSpell->Misc2 = 0;
			NewSpell->procChance = 0;
			NewSpell->procCount = 0;
			_unit->GetAIInterface()->addSpellToList(NewSpell);
			//_unit->GetAIInterface()->m_spells.push_back( NewSpell )

			mRazuviousAI = NULL;
		}

		void Destroy()
		{
			if(mRazuviousAI != NULL)
			{
				set< DeathKnightUnderstudyAI* >::iterator Iter = mRazuviousAI->mStudents.find(this);
				if(Iter != mRazuviousAI->mStudents.end())
					mRazuviousAI->mStudents.erase(Iter);

				mRazuviousAI = NULL;
			}

			delete this;
		}

		InstructorRazuviousAI*	mRazuviousAI;
		bool					mIsControlled;
};

/////////////////////////////////////////////////////////////////////////////////
////// The Construct Quarter

/////////////////////////////////////////////////////////////////////////////////
////// Patchwork Golem
#define CN_PATCHWORK_GOLEM						16017
#define PATCHWORK_GOLEM_CLEAVE					27794
#define PATCHWORK_GOLEM_DISEASE_CLOUD_NORMAL	27793
#define PATCHWORK_GOLEM_DISEASE_CLOUD_HEROIC	28362
#define PATCHWORK_GOLEM_EXECUTE_NORMAL			7160
#define PATCHWORK_GOLEM_EXECUTE_HEROIC			56426
#define PATCHWORK_GOLEM_WAR_STOMP_NORMAL		27758
#define PATCHWORK_GOLEM_WAR_STOMP_HEROIC		56427

class PatchworkGolemAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(PatchworkGolemAI)
		PatchworkGolemAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(PATCHWORK_GOLEM_CLEAVE, Target_Current, 10, 0, 10, 0, 8);
			AddSpell(PATCHWORK_GOLEM_EXECUTE_NORMAL, Target_Current, 8, 0, 10, 0, 8);
			AddSpell(PATCHWORK_GOLEM_WAR_STOMP_NORMAL, Target_Self, 8, 0, 15);
			ApplyAura(PATCHWORK_GOLEM_DISEASE_CLOUD_NORMAL);
		}

		void OnCombatStart(Unit* pTarget)
		{
			ApplyAura(PATCHWORK_GOLEM_DISEASE_CLOUD_NORMAL);
			MoonScriptCreatureAI::OnCombatStart(pTarget);
		}

		void OnCombatStop(Unit* pTarget)
		{
			ApplyAura(PATCHWORK_GOLEM_DISEASE_CLOUD_NORMAL);
			MoonScriptCreatureAI::OnCombatStop(pTarget);
		}
};

/////////////////////////////////////////////////////////////////////////////////
////// Lightning Totem
#define CN_LIGHTNING_TOTEM							16385
#define LIGHTNING_TOTEM_SHOCK_NORMAL				28297
#define LIGHTNING_TOTEM_SHOCK_HEROIC				54333

class LightningTotemAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(LightningTotemAI)
		LightningTotemAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(LIGHTNING_TOTEM_SHOCK_NORMAL, Target_Self, 100, 0.5, 2);

			_unit->m_noRespawn = true;
			Despawn(60000);
		}

		void OnCombatStart(Unit* pTarget)
		{
			SetBehavior(Behavior_Spell);
			SetCanMove(false);
			StopMovement();
			MoonScriptCreatureAI::OnCombatStart(pTarget);
		}

		void AIUpdate()
		{
			// Meh, reset it in case something went wrong
			SetBehavior(Behavior_Spell);
			SetCanMove(false);
			StopMovement();
			MoonScriptCreatureAI::AIUpdate();
		}
};

/////////////////////////////////////////////////////////////////////////////////
////// Stitched Colossus
#define CN_STITCHED_COLOSSUS					30071
#define STITCHED_COLOSSUS_MASSIVE_STOMP_NORMAL	55821
#define STITCHED_COLOSSUS_MASSIVE_STOMP_HEROIC	55826
#define STITCHED_COLOSSUS_UNSTOPPABLE_ENRAGE	54356

class StitchedColossusAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(StitchedColossusAI)
		StitchedColossusAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(STITCHED_COLOSSUS_MASSIVE_STOMP_NORMAL, Target_Self, 8, 0, 15);
		}

		void OnCombatStart(Unit* pTarget)
		{
			mEnraged = false;
			MoonScriptCreatureAI::OnCombatStart(pTarget);
		}

		void AIUpdate()
		{
			if(!mEnraged && RandomUInt(99) == 0)
			{
				ApplyAura(STITCHED_COLOSSUS_UNSTOPPABLE_ENRAGE);
				mEnraged = true;
			}
			MoonScriptCreatureAI:;AIUpdate();
		}

		bool	mEnraged;
};

/////////////////////////////////////////////////////////////////////////////////
////// Patchwerk

void SpellFunc_PatchwerkHatefulStrike(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType);

#define PATCHWERK_FRENZY 28131
#define PATCHWERK_BERSERK 26662
#define PATCHWERK_HATEFUL_STRIKE_10 41926
#define PATCHWERK_HATEFUL_STRIKE_25 59192

class PatchwerkAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(PatchwerkAI)
		PatchwerkAI(Creature* pCreature) : MoonScriptBossAI(pCreature)
		{
			AddSpellFunc(&SpellFunc_PatchwerkHatefulStrike, Target_Self, 50, 0, 3);
			SetEnrageInfo(AddSpell(PATCHWERK_BERSERK, Target_Self, 0, 0, 0), 360000);

			AddEmote(Event_OnCombatStart, "Patchwerk want to play.", Text_Yell, 8909);
			AddEmote(Event_OnCombatStart, "Kel'Thuzad make Patchwerk his avatar of war!", Text_Yell, 8910);
			AddEmote(Event_OnTargetDied, "No more play?", Text_Yell, 8911);
			AddEmote(Event_OnDied, "What happened to... Patch...", Text_Yell, 8912);
			mEnraged = false;
		}

		void AIUpdate()
		{
			if(mEnraged == false && GetHealthPercent() <= 5)
			{
				ApplyAura(PATCHWERK_FRENZY);
				GetUnit()->SendChatMessage(CHAT_MSG_RAID_BOSS_EMOTE, LANG_UNIVERSAL, "Patchwerk goes into a frenzy!");
				mEnraged = true;
			}
			MoonScriptCreatureAI::AIUpdate();
		}

		bool	mEnraged;
};

void SpellFunc_PatchwerkHatefulStrike(SpellDesc* pThis, MoonScriptCreatureAI* pCreatureAI, Unit* pTarget, TargetType pType)
{
	if(!pThis || !pCreatureAI)
		return;

	uint32 _mostHP = 0;
	Player* pBestTarget = NULL;

	for(set< Object* >::iterator PlayerIter = pCreatureAI->GetUnit()->GetInRangePlayerSetBegin();
	        PlayerIter != pCreatureAI->GetUnit()->GetInRangePlayerSetEnd(); ++PlayerIter)
	{
		if((*PlayerIter) && (TO< Player* >(*PlayerIter))->isAlive() && (*PlayerIter)->GetDistance2dSq(pCreatureAI->GetUnit()) <= 5.0f
		        && (*PlayerIter)->GetUInt32Value(UNIT_FIELD_HEALTH) > _mostHP)
		{
			_mostHP = (*PlayerIter)->GetUInt32Value(UNIT_FIELD_HEALTH);
			pBestTarget = TO< Player* >(*PlayerIter);
		};
	};

	if(pBestTarget == NULL || !pBestTarget->isAlive())
		return;

	if(pCreatureAI->IsHeroic())
		pCreatureAI->GetUnit()->CastSpell(pBestTarget, PATCHWERK_HATEFUL_STRIKE_25, true);
	else
		pCreatureAI->GetUnit()->CastSpell(pBestTarget, PATCHWERK_HATEFUL_STRIKE_10, true);
};

// ---- Abomination Wing ----

// Stitched Spewer AI
#define STICKED_SPEWER 16025

#define CN_SLIME_BOLT 32309
#define CN_UPPERCUT 26007

class StickedSpewerAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(StickedSpewerAI);
		SP_AI_Spell spells[2];
		bool m_spellcheck[2];

		StickedSpewerAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			// -- Number of spells to add --
			nrspells = 2;

			// --- Initialization ---
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
			}
			// ----------------------

			// Create basic info for spells here, and play with it later , fill always the info, targettype and if is instant or not!
			spells[0].info = dbcSpell.LookupEntry(CN_SLIME_BOLT);
			spells[0].targettype = TARGET_VARIOUS;
			spells[0].instant = false;
			spells[0].perctrigger = 10.0f;
			spells[0].attackstoptimer = 2000; // 1sec

			spells[1].info = dbcSpell.LookupEntry(CN_UPPERCUT);
			spells[1].targettype = TARGET_VARIOUS;
			spells[1].instant = false;
			spells[1].perctrigger = 10.0f;
			spells[1].attackstoptimer = 2000; // 1sec

		}

		void OnCombatStart(Unit* mTarget)
		{
			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
			RemoveAIUpdateEvent();
		}

		void OnDied(Unit* mKiller)
		{
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
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
						}
						m_spellcheck[i] = false;
						return;
					}

					if(val > comulativeperc && val <= (comulativeperc + spells[i].perctrigger))
					{
						_unit->setAttackTimer(spells[i].attackstoptimer, false);
						m_spellcheck[i] = true;
					}
					comulativeperc += spells[i].perctrigger;
				}
			}
		}

	protected:

		int nrspells;
};



//Surgical Assistant AI
#define CN_SURGICAL_ASSISTANT 16022

#define MIND_FLAY 28310

class SurgicalAssistantAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(SurgicalAssistantAI);
		SP_AI_Spell spells[1];
		bool m_spellcheck[1];

		SurgicalAssistantAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			// -- Number of spells to add --
			nrspells = 1;

			// --- Initialization ---
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
			}
			// ----------------------

			// Create basic info for spells here, and play with it later , fill always the info, targettype and if is instant or not!
			spells[0].info = dbcSpell.LookupEntry(MIND_FLAY);
			spells[0].targettype = TARGET_ATTACKING;
			spells[0].instant = false;
			spells[0].perctrigger = 20.0f;
			spells[0].attackstoptimer = 6000; // 1sec

		}

		void OnCombatStart(Unit* mTarget)
		{
			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
			RemoveAIUpdateEvent();
		}

		void OnDied(Unit* mKiller)
		{
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
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
						}
						m_spellcheck[i] = false;
						return;
					}

					if(val > comulativeperc && val <= (comulativeperc + spells[i].perctrigger))
					{
						_unit->setAttackTimer(spells[i].attackstoptimer, false);
						m_spellcheck[i] = true;
					}
					comulativeperc += spells[i].perctrigger;
				}
			}
		}

	protected:

		int nrspells;
};


// Sludge Belcher AI
#define CN_SLUDGE_BELCHER 16029

#define DISEISE_BUFFET 27891
#define SUMMON_BILE_SLIMES 27889 // TODO: GAWD :P

class SludgeBelcherAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(SludgeBelcherAI);
		SP_AI_Spell spells[2];
		bool m_spellcheck[2];

		SludgeBelcherAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			// -- Number of spells to add --
			nrspells = 2;

			// --- Initialization ---
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
			}
			// ----------------------

			// Create basic info for spells here, and play with it later , fill always the info, targettype and if is instant or not!
			spells[0].info = dbcSpell.LookupEntry(DISEISE_BUFFET);
			spells[0].targettype = TARGET_ATTACKING;
			spells[0].instant = false;
			spells[0].perctrigger = 20.0f;
			spells[0].attackstoptimer = 1000; // 1sec

			spells[1].info = dbcSpell.LookupEntry(SUMMON_BILE_SLIMES);
			spells[1].targettype = TARGET_SELF;
			spells[1].instant = false;
			spells[1].perctrigger = 5.0f;
			spells[1].attackstoptimer = 3000; // 1sec

		}

		void OnCombatStart(Unit* mTarget)
		{
			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
			RemoveAIUpdateEvent();
		}

		void OnDied(Unit* mKiller)
		{
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
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
						}
						m_spellcheck[i] = false;
						return;
					}

					if(val > comulativeperc && val <= (comulativeperc + spells[i].perctrigger))
					{
						_unit->setAttackTimer(spells[i].attackstoptimer, false);
						m_spellcheck[i] = true;
					}
					comulativeperc += spells[i].perctrigger;
				}
			}
		}

	protected:

		int nrspells;
};

// BOSS'S

// Patchwerk AI


// Grobbulus AI
#define CN_GROBBULUS 15931

#define POISON_CLOUD_GROB 31259 // self
#define SLIME_SPRAY 28157 // various
#define SUMMON_FALLOUT_SLIME 28218 // TODO: cast on slime sprayd targets
#define MUTATING_INJECTION 28169 // TODO: DUMMY AURA

class GrobbulusAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(GrobbulusAI);
		SP_AI_Spell spells[2];
		bool m_spellcheck[2];

		GrobbulusAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			// -- Number of spells to add --
			nrspells = 2;

			// --- Initialization ---
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
			}
			// ----------------------

			// Create basic info for spells here, and play with it later , fill always the info, targettype and if is instant or not!
			spells[0].info = dbcSpell.LookupEntry(POISON_CLOUD_GROB);
			spells[0].targettype = TARGET_SELF;
			spells[0].instant = false;
			spells[0].perctrigger = 0.0f;
			spells[0].attackstoptimer = 1000; // 1sec

			spells[1].info = dbcSpell.LookupEntry(SLIME_SPRAY);
			spells[1].targettype = TARGET_VARIOUS;
			spells[1].instant = false;
			spells[1].perctrigger = 15.0f;
			spells[1].attackstoptimer = 3000; // 1sec

		}

		void OnCombatStart(Unit* mTarget)
		{
			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
			_unit->CastSpell(_unit, spells[0].info, spells[0].instant);
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
			RemoveAIUpdateEvent();
		}

		void OnDied(Unit* mKiller)
		{
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
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
						}
						m_spellcheck[i] = false;
						return;
					}

					if(val > comulativeperc && val <= (comulativeperc + spells[i].perctrigger))
					{
						_unit->setAttackTimer(spells[i].attackstoptimer, false);
						m_spellcheck[i] = true;
					}
					comulativeperc += spells[i].perctrigger;
				}
			}
		}

	protected:

		int nrspells;
};


// Gluth AI
#define MORTAL_WOUND 28308 // target
#define DECIMATE 28374 // TODO: needs to be scripted
#define TERRIFYING_ROAR 37939
#define FRENZY 38664 // self

class GluthAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(GluthAI);
		SP_AI_Spell spells[3];
		bool m_spellcheck[3];

		GluthAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			// -- Number of spells to add --
			nrspells = 3;

			// --- Initialization ---
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
			}
			// ----------------------

			// Create basic info for spells here, and play with it later , fill always the info, targettype and if is instant or not!
			spells[0].info = dbcSpell.LookupEntry(MORTAL_WOUND);
			spells[0].targettype = TARGET_ATTACKING;
			spells[0].instant = false;
			spells[0].perctrigger = 15.0f;
			spells[0].attackstoptimer = 2000; // 1sec

			spells[1].info = dbcSpell.LookupEntry(TERRIFYING_ROAR);
			spells[1].targettype = TARGET_VARIOUS;
			spells[1].instant = false;
			spells[1].perctrigger = 5.0f;
			spells[1].attackstoptimer = 3000; // 1sec

			spells[2].info = dbcSpell.LookupEntry(FRENZY);
			spells[2].targettype = TARGET_SELF;
			spells[2].instant = false;
			spells[2].perctrigger = 5.0f;
			spells[2].attackstoptimer = 1000; // 1sec

		}

		void OnCombatStart(Unit* mTarget)
		{
			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
			RemoveAIUpdateEvent();
		}

		void OnTargetDied(Unit* mTarget)
		{
		}

		void OnDied(Unit* mKiller)
		{
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
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
						}
						m_spellcheck[i] = false;
						return;
					}

					if(val > comulativeperc && val <= (comulativeperc + spells[i].perctrigger))
					{
						_unit->setAttackTimer(spells[i].attackstoptimer, false);
						m_spellcheck[i] = true;
					}
					comulativeperc += spells[i].perctrigger;
				}
			}
		}

	protected:

		int nrspells;
};

// ---- Deathknight Wing ----

// Bony Construct AI
#define CN_BONY_CONSTRUCT 16167

#define SWEEPING_SLAM 25322
//TODO: Melee Chain Cleave - Strikes enemies in front of the Construct, chaining to anyone in melee range of the targets.

class BonyConstructAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(BonyConstructAI);
		SP_AI_Spell spells[1];
		bool m_spellcheck[1];

		BonyConstructAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			// -- Number of spells to add --
			nrspells = 1;

			// --- Initialization ---
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
			}
			// ----------------------

			// Create basic info for spells here, and play with it later , fill always the info, targettype and if is instant or not!
			spells[0].info = dbcSpell.LookupEntry(SWEEPING_SLAM);
			spells[0].targettype = TARGET_VARIOUS;
			spells[0].instant = false;
			spells[0].perctrigger = 15.0f;
			spells[0].attackstoptimer = 2000; // 1sec

		}

		void OnCombatStart(Unit* mTarget)
		{
			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
			RemoveAIUpdateEvent();
		}

		void OnDied(Unit* mKiller)
		{
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
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
						}
						m_spellcheck[i] = false;
						return;
					}

					if(val > comulativeperc && val <= (comulativeperc + spells[i].perctrigger))
					{
						_unit->setAttackTimer(spells[i].attackstoptimer, false);
						m_spellcheck[i] = true;
					}
					comulativeperc += spells[i].perctrigger;
				}
			}
		}

	protected:

		int nrspells;
};



// Death Lord AI
#define CN_DEATH_LORD 16861

#define AURA_OF_AGONY 28413

class DeathLordAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(DeathLordAI);
		SP_AI_Spell spells[1];
		bool m_spellcheck[1];

		DeathLordAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			// -- Number of spells to add --
			nrspells = 1;

			// --- Initialization ---
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
			}
			// ----------------------

			// Create basic info for spells here, and play with it later , fill always the info, targettype and if is instant or not!
			spells[0].info = dbcSpell.LookupEntry(AURA_OF_AGONY);
			spells[0].targettype = TARGET_VARIOUS;
			spells[0].instant = false;
			spells[0].perctrigger = 15.0f;
			spells[0].attackstoptimer = 2000; // 1sec

		}

		void OnCombatStart(Unit* mTarget)
		{
			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
			RemoveAIUpdateEvent();
		}

		void OnDied(Unit* mKiller)
		{
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
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
						}
						m_spellcheck[i] = false;
						return;
					}

					if(val > comulativeperc && val <= (comulativeperc + spells[i].perctrigger))
					{
						_unit->setAttackTimer(spells[i].attackstoptimer, false);
						m_spellcheck[i] = true;
					}
					comulativeperc += spells[i].perctrigger;
				}
			}
		}

	protected:

		int nrspells;
};

// -- BOSS'S --

// Instructor Razuvious AI
#define CN_INSTRUCTOR_RAZUVIOUS 16061

#define UNBALANCING_STRIKE 26613
#define DISRUPTING_SHOUT 29107

class RazuviousAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(RazuviousAI);
		SP_AI_Spell spells[2];
		bool m_spellcheck[2];

		RazuviousAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			// -- Number of spells to add --
			nrspells = 2;

			// --- Initialization ---
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
			}
			// ----------------------

			// Create basic info for spells here, and play with it later , fill always the info, targettype and if is instant or not!
			spells[0].info = dbcSpell.LookupEntry(DISRUPTING_SHOUT);
			spells[0].targettype = TARGET_VARIOUS;
			spells[0].instant = false;
			spells[0].perctrigger = 15.0f;
			spells[0].attackstoptimer = 3000; // 1sec

			spells[1].info = dbcSpell.LookupEntry(UNBALANCING_STRIKE);
			spells[1].targettype = TARGET_ATTACKING;
			spells[1].instant = false;
			spells[1].perctrigger = 35.0f;
			spells[1].attackstoptimer = 1000; // 1sec

		}

		void OnCombatStart(Unit* mTarget)
		{
			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
			RemoveAIUpdateEvent();
		}

		void OnTargetDied(Unit* mTarget)
		{
			if(Rand(50.0f))
			{
				_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "You should've stayed home!");
				_unit->PlaySoundToSet(8862);
			}
			else
			{
				_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "You disappoint me, students!");
				_unit->PlaySoundToSet(8863);
			}
		}

		void OnDied(Unit* mKiller)
		{
			_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "An honorable... death...");
			_unit->PlaySoundToSet(8860);
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
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
						}
						m_spellcheck[i] = false;
						return;
					}

					if(val > comulativeperc && val <= (comulativeperc + spells[i].perctrigger))
					{
						_unit->setAttackTimer(spells[i].attackstoptimer, false);
						m_spellcheck[i] = true;
					}
					comulativeperc += spells[i].perctrigger;
				}
			}
		}

	protected:

		int nrspells;
};
// - The Four Horsemen: -

// Thane Korth'azz AI
#define CN_THANE_KORTHAZZ 16064

#define MARK_OF_KORTHAZZ 28832
#define METEOR 35181 // 1 target

class KorthazzAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(KorthazzAI);
		SP_AI_Spell spells[2];
		bool m_spellcheck[2];

		KorthazzAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			// -- Number of spells to add --
			nrspells = 2;

			// --- Initialization ---
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
			}
			// ----------------------

			tountcooldown = 6;
			tountcont = 0;
			m_attackstart = false;

			// Create basic info for spells here, and play with it later , fill always the info, targettype and if is instant or not!
			spells[0].info = dbcSpell.LookupEntry(MARK_OF_KORTHAZZ);
			spells[0].targettype = TARGET_VARIOUS;
			spells[0].instant = false;
			spells[0].perctrigger = 5.0f;
			spells[0].attackstoptimer = 1000; // 1sec

			spells[1].info = dbcSpell.LookupEntry(METEOR);
			spells[1].targettype = TARGET_ATTACKING;
			spells[1].instant = false;
			spells[1].perctrigger = 15.0f;
			spells[1].attackstoptimer = 3000; // 1sec

		}

		void OnCombatStart(Unit* mTarget)
		{
			m_attackstart = true;
			_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Come out and fight ye wee ninny!");
			_unit->PlaySoundToSet(8899);

			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStop(Unit* mTarget)
		{
			m_attackstart = false;
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
			RemoveAIUpdateEvent();
		}

		void OnTargetDied(Unit* mTarget)
		{
			_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Next time, bring more friends!");
			_unit->PlaySoundToSet(8901);
		}

		void OnDied(Unit* mKiller)
		{
			_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "What a bloody waste this is!");
			_unit->PlaySoundToSet(8900);
			_unit->CastSpell(_unit, spells[1].info, spells[1].instant);
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
			if(!m_attackstart)
			{
				if(!tountcooldown)
				{
					tountcooldown = 6;

					switch(tountcont)
					{
						case 0:
							_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "To arms, ye roustabouts! We've got company!");
							_unit->PlaySoundToSet(8903);
						case 1:
							_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "I heard about enough of yer sniveling. Shut yer fly trap 'afore I shut it for ye!");
							_unit->PlaySoundToSet(8904);
						case 2:
							_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "I'm gonna enjoy killin' these slack-jawed daffodils!");
							_unit->PlaySoundToSet(8905);

					}
					tountcont++;
					if(tountcont >= 3)
						tountcont = 0;
				}
				tountcooldown--;
			}

			if(m_spellcheck[0])
			{
				_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "I like my meat extra crispy!");
				_unit->PlaySoundToSet(8902);
			}

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
						}
						m_spellcheck[i] = false;
						return;
					}

					if(val > comulativeperc && val <= (comulativeperc + spells[i].perctrigger))
					{
						_unit->setAttackTimer(spells[i].attackstoptimer, false);
						m_spellcheck[i] = true;
					}
					comulativeperc += spells[i].perctrigger;
				}
			}
		}

	protected:

		bool m_attackstart;
		uint32 tountcooldown, tountcont;
		int nrspells;
};

/*
8899 - Come out and fight ye wee ninny!
8900 - what a bloody waste this is!
8901 - next time. bring more friend
8902 - i like my meat extra crispy
8903 - To arms, ye roustabouts! We've got company!
8904 - I heard about enough of yer sniveling. Shut yer fly trap 'afore I shut it for ye!
8905 - I'm gonna enjoy killin' these slack-jawed daffodils!

8899, 'A_KOR_NAXX_AGGRO'
8900, 'A_KOR_NAXX_DEATH'
8901, 'A_KOR_NAXX_SLAY'
8902, 'A_KOR_NAXX_SPECIAL'
8903, 'A_KOR_NAXX_TAUNT01'
8904, 'A_KOR_NAXX_TAUNT02'
8905, 'A_KOR_NAXX_TAUNT03'
*/

// Baron Rivendare AI
#define CN_Baron_Rivendare_4H 30549 //4H not to confuse with Strat UD Side.. 
//Gief new Strat boss blizz or you make Stab a sad panda


// Lady Blaumeux AI
#define CN_LADY_BLAUMEUX 16065

#define MARK_OF_BLAUMEUX 28833
#define VOID_ZONE 28863 // TODO: DUMMY PART

class BlaumeuxAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(BlaumeuxAI);
		SP_AI_Spell spells[2];
		bool m_spellcheck[2];

		BlaumeuxAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			// -- Number of spells to add --
			nrspells = 2;

			// --- Initialization ---
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
			}
			// ----------------------

			tountcooldown = 16;
			tountcont = 0;
			m_attackstart = false;

			// Create basic info for spells here, and play with it later , fill always the info, targettype and if is instant or not!
			spells[0].info = dbcSpell.LookupEntry(MARK_OF_BLAUMEUX);
			spells[0].targettype = TARGET_VARIOUS;
			spells[0].instant = false;
			spells[0].perctrigger = 5.0f;
			spells[0].attackstoptimer = 1000; // 1sec

			spells[1].info = dbcSpell.LookupEntry(VOID_ZONE);
			spells[1].targettype = TARGET_VARIOUS;
			spells[1].instant = false;
			spells[1].perctrigger = 15.0f;
			spells[1].attackstoptimer = 3000; // 1sec

		}

		void OnCombatStart(Unit* mTarget)
		{
			m_attackstart = true;
			_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "Defend yourself!");
			_unit->PlaySoundToSet(8892);

			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStop(Unit* mTarget)
		{
			m_attackstart = false;
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
			RemoveAIUpdateEvent();
		}

		void OnTargetDied(Unit* mTarget)
		{
			_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Who's next?");
			_unit->PlaySoundToSet(8894);
		}

		void OnDied(Unit* mKiller)
		{
			_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Tou...che.");
			_unit->PlaySoundToSet(8893);
			_unit->CastSpell(_unit, spells[1].info, spells[1].instant);
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
			if(!m_attackstart)
			{
				if(!tountcooldown)
				{
					tountcooldown = 16;

					switch(tountcont)
					{
						case 0:
							_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Come, Zeliek, do not drive them out. Not before we've had our fun.");
							_unit->PlaySoundToSet(8896);
						case 1:
							_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "I do hope they stay alive long enough for me to... introduce myself.");
							_unit->PlaySoundToSet(8897);
						case 2:
							_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "The first kill goes to me! Anyone care to wager?");
							_unit->PlaySoundToSet(8898);

					}
					tountcont++;
					if(tountcont >= 3)
						tountcont = 0;
				}
				tountcooldown--;
			}

			if(m_spellcheck[0])
			{
				_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Your life is mine!");
				_unit->PlaySoundToSet(8895);
			}

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
						}
						m_spellcheck[i] = false;
						return;
					}

					if(val > comulativeperc && val <= (comulativeperc + spells[i].perctrigger))
					{
						_unit->setAttackTimer(spells[i].attackstoptimer, false);
						m_spellcheck[i] = true;
					}
					comulativeperc += spells[i].perctrigger;
				}
			}
		}

	protected:

		bool m_attackstart;
		uint32 tountcooldown, tountcont;
		int nrspells;
};

/*
8892 - Defend yourself
8893 - Tou...che
8894 - Who's next?
8895 - Your life is mine!
8896 - Come, Zeliek, do not drive them out. Not before we've had our fun
8897 - I do hope they stay alive long enough for me to... introduce myself,
8898 - The first kill goes to me! Anyone care to wager?

8892, 'A_BLA_NAXX_AGGRO'
8893, 'A_BLA_NAXX_DEATH'
8894, 'A_BLA_NAXX_SLAY'
8895, 'A_BLA_NAXX_SPECIAL'
8896, 'A_BLA_NAXX_TAUNT01'
8897, 'A_BLA_NAXX_TAUNT02'
8898, 'A_BLA_NAXX_TAUNT03'
*/

// Sir Zeliek AI
#define CN_SIR_ZELIEK 16063

#define MARK_OF_ZELIEK 28835
#define HOLY_WRATH 32445 // 1target

class ZeliekAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(ZeliekAI);
		SP_AI_Spell spells[2];
		bool m_spellcheck[2];

		ZeliekAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			// -- Number of spells to add --
			nrspells = 2;

			// --- Initialization ---
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
			}
			// ----------------------

			tountcooldown = 13;
			tountcont = 0;
			m_attackstart = false;

			// Create basic info for spells here, and play with it later , fill always the info, targettype and if is instant or not!
			spells[0].info = dbcSpell.LookupEntry(MARK_OF_ZELIEK);
			spells[0].targettype = TARGET_VARIOUS;
			spells[0].instant = false;
			spells[0].perctrigger = 5.0f;
			spells[0].attackstoptimer = 1000; // 1sec

			spells[1].info = dbcSpell.LookupEntry(HOLY_WRATH);
			spells[1].targettype = TARGET_ATTACKING;
			spells[1].instant = false;
			spells[1].perctrigger = 15.0f;
			spells[1].attackstoptimer = 1000; // 1sec

		}

		void OnCombatStart(Unit* mTarget)
		{
			m_attackstart = true;
			_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Flee before its too late!");
			_unit->PlaySoundToSet(8913);

			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStop(Unit* mTarget)
		{
			m_attackstart = false;
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
			RemoveAIUpdateEvent();
		}

		void OnTargetDied(Unit* mTarget)
		{
			_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Forgive me!");
			_unit->PlaySoundToSet(8915);
		}

		void OnDied(Unit* mKiller)
		{
			_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "It is... as it should be.");
			_unit->PlaySoundToSet(8914);
			_unit->CastSpell(_unit, spells[1].info, spells[1].instant);
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
			if(!m_attackstart)
			{
				if(!tountcooldown)
				{
					tountcooldown = 13;

					switch(tountcont)
					{
						case 0:
							_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Invaders, cease this foolish venture at once! Turn away while you still can!");
							_unit->PlaySoundToSet(8917);
						case 1:
							_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Perhaps they will come to their senses, and run away as fast as they can!");
							_unit->PlaySoundToSet(8918);
						case 2:
							_unit->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Do not continue! Turn back while there's still time!");
							_unit->PlaySoundToSet(8919);

					}
					tountcont++;
					if(tountcont >= 3)
						tountcont = 0;
				}
				tountcooldown--;
			}

			if(m_spellcheck[0])
			{
				_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "i have no choice but to obey!");
				_unit->PlaySoundToSet(8916);
			}

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
						}
						m_spellcheck[i] = false;
						return;
					}

					if(val > comulativeperc && val <= (comulativeperc + spells[i].perctrigger))
					{
						_unit->setAttackTimer(spells[i].attackstoptimer, false);
						m_spellcheck[i] = true;
					}
					comulativeperc += spells[i].perctrigger;
				}
			}
		}

	protected:

		bool m_attackstart;
		uint32 tountcooldown, tountcont;
		int nrspells;
};

// -- Sapphiron Encounter by M4ksiu -- //

// Settings

#define DISABLE_FROST_BREATH

// Frost Breath TrgiggerAI

#define CN_FROST_BREATH_TRIGGER		50010	// Flying "ball" of frost energy
#define CN_FROST_BREATH_TRIGGER2	50011	// Explosion
#define CN_FROST_BREATH_TRIGGER3	50012	// Wing Buffet
#define CN_CHILL_TRIGGER			50013	// Mass chill trigger (used, because we can't cast many aoe triggers on one character >_>)

// Air phase spells
#define FROST_BREATH		28524
#define FROST_BREATH_EFFECT	30101
#define FROST_BREATH_DAMAGE	29318

// Additional spells
#define SAPPHIRONS_WING_BUFFET	29328

struct Location PhaseTwoWP[] =
{
	{  },
	{ 3520.820068f, -5233.799805f, 137.626007f, 4.553010f }
};

struct Location IceBlocks[] =	// Those are not blizzlike pos, because those blocks are spawned randomly
{
	{  },
	{ 3580.986084f, -5241.330078f, 137.627304f, 3.006957f },
	{ 3562.967285f, -5257.952148f, 137.860916f, 2.468959f },
	{ 3569.620850f, -5276.108398f, 137.582733f, 2.480744f },
	{ 3551.420410f, -5283.535156f, 137.731903f, 2.009505f },
	{ 3535.933594f, -5294.710938f, 138.080002f, 1.823366f },
	{ 3522.235107f, -5286.610352f, 138.115601f, 1.532768f },
	{ 3503.184814f, -5296.418945f, 138.111252f, 1.222535f },
	{ 3489.055664f, -5278.863770f, 138.119934f, 0.884814f },
	{ 3473.002686f, -5277.641602f, 137.733414f, 0.680609f },
	{ 3472.302734f, -5255.734863f, 137.755569f, 0.331107f },
	{ 3458.193848f, -5241.013672f, 137.566147f, 0.111195f },
	{ 3463.324463f, -5221.530273f, 137.634888f, 6.084152f },
	{ 3467.574219f, -5200.617676f, 137.559662f, 5.860314f },
	{ 3479.394775f, -5178.301758f, 140.904312f, 5.405583f },
	{ 3507.219727f, -5180.725098f, 140.625473f, 4.431685f },
	{ 3518.371338f, -5172.666504f, 142.269135f, 4.694800f },
	{ 3542.516846f, -5184.699707f, 140.655182f, 4.470973f },
	{ 3559.013916f, -5183.916016f, 140.899689f, 4.644558f },
	{ 3559.006592f, -5183.923340f, 140.895554f, 3.952624f },
	{ 3571.978760f, -5209.633301f, 137.671906f, 3.514374f }
};

/*struct Spawns IceBlocks[]=	// Those are not blizzlike pos, because those blocks are spawned randomly
{
	{  },
	{ 3580.986084f, -5241.330078f, 137.627304f, 3.006957f },
	{ 3562.967285f, -5257.952148f, 137.860916f, 2.468959f },
	{ 3569.620850f, -5276.108398f, 137.582733f, 2.480744f },

	{ 3535.933594f, -5294.710938f, 138.080002f, 1.823366f },
	{ 3522.235107f, -5286.610352f, 138.115601f, 1.532768f },
	{ 3503.184814f, -5296.418945f, 138.111252f, 1.222535f },

	{ 3473.002686f, -5277.641602f, 137.733414f, 0.680609f },
	{ 3472.302734f, -5255.734863f, 137.755569f, 0.331107f },
	{ 3458.193848f, -5241.013672f, 137.566147f, 0.111195f },

	{ 3467.574219f, -5200.617676f, 137.559662f, 5.860314f },
	{ 3479.394775f, -5178.301758f, 140.904312f, 5.405583f },
	{ 3507.219727f, -5180.725098f, 140.625473f, 4.431685f },

	{ 3542.516846f, -5184.699707f, 140.655182f, 4.470973f },
	{ 3559.013916f, -5183.916016f, 140.899689f, 4.644558f },
	{ 3559.006592f, -5183.923340f, 140.895554f, 3.952624f },

	{ 3551.420410f, -5283.535156f, 137.731903f, 2.009505f },
	{ 3489.055664f, -5278.863770f, 138.119934f, 0.884814f },
	{ 3463.324463f, -5221.530273f, 137.634888f, 6.084152f },
	{ 3518.371338f, -5172.666504f, 142.269135f, 4.694800f },
	{ 3571.978760f, -5209.633301f, 137.671906f, 3.514374f }
};*/

class FrostBreathTriggerAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(FrostBreathTriggerAI);

		FrostBreathTriggerAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			_unit->GetAIInterface()->MoveTo(PhaseTwoWP[1].x, PhaseTwoWP[1].y, PhaseTwoWP[1].z + 10.5f, PhaseTwoWP[1].o);
			_unit->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			_unit->GetAIInterface()->SetFly();
			_unit->m_noRespawn = true;
			_unit->Despawn(7000, 0);

			RegisterAIUpdateEvent(1000);

			AICounter = 7;
		}

		void OnCombatStart(Unit* mTarget) {}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
		}

		void OnDied(Unit* mKiller)
		{
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
			_unit->CastSpell(_unit, FROST_BREATH_EFFECT, true);

			AICounter--;
			if(AICounter == 6)
				_unit->GetAIInterface()->MoveTo(PhaseTwoWP[1].x, PhaseTwoWP[1].y, PhaseTwoWP[1].z + AICounter * 1.5f, PhaseTwoWP[1].o);
			else
				_unit->GetAIInterface()->MoveTo(PhaseTwoWP[1].x, PhaseTwoWP[1].y, PhaseTwoWP[1].z, PhaseTwoWP[1].o);
		}

	protected:

		int AICounter;
};

class FrostBreathTrigger2AI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(FrostBreathTrigger2AI);

		FrostBreathTrigger2AI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
#ifdef DISABLE_FROST_BREATH
			_unit->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
#else
			_unit->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_2);
#endif
			_unit->GetAIInterface()->disable_melee = true;
			_unit->GetAIInterface()->m_canMove = false;
			_unit->m_noRespawn = true;
			_unit->Despawn(8000, 0);

			_unit->CastSpell(_unit, FROST_BREATH, false);
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
		}

		void OnDied(Unit* mKiller)
		{
			RemoveAIUpdateEvent();
		}
};

class FrostBreathTrigger3AI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(FrostBreathTrigger3AI);

		FrostBreathTrigger3AI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			_unit->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_2);
			_unit->CastSpell(_unit, SAPPHIRONS_WING_BUFFET, true);
			_unit->GetAIInterface()->disable_melee = true;
			_unit->GetAIInterface()->m_canMove = false;
			_unit->m_noRespawn = true;

			RegisterAIUpdateEvent(1000);
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
		}

		void OnDied(Unit* mKiller)
		{
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
			_unit->CastSpell(_unit, SAPPHIRONS_WING_BUFFET, true);
		}
};

class ChillTriggerAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(ChillTriggerAI);

		ChillTriggerAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			_unit->CastSpellAoF(_unit->GetPositionX(), _unit->GetPositionY(), _unit->GetPositionZ(), dbcSpell.LookupEntry(28547), true);
			_unit->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_2);
			_unit->GetAIInterface()->disable_melee = true;
			_unit->GetAIInterface()->m_canMove = false;
			_unit->m_noRespawn = true;
			_unit->Despawn(15000, 0);
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
		}
};

// SapphironAI
// Missing spawning effect with building skeleton of Sappiron
#define CN_SAPPHIRON	15989

// Land phase spells
#define LIFE_DRAIN					28542
#define CHILL						28547
#define FROST_AURA					28531

// Air phase spells
#define ICEBOLT						28522

// Additional spells
#define SAPPHIRON_DIES				29357
#define BERSERK						26662	// 28498 - casts frostbolt (would be cool for Sapphiron), but every 2 sec for 5 min (~16k dmg per hit);
// 27680 - 10 mins instead 5 mins
// Researches
#define SAPPHIRON_BIRTH				181356
#define FROSTWYRM_WATERFALL_DOOR	181225
#define ICE_BLOCK_GO				181247

// Move types
#define WALK	0
#define RUN		256
#define FLY		768

// Immunities
#define IMMUNITY_DISEASE			6681
#define IMMUNITY_SHADOW				7743
#define IMMUNITY_FROST				7940
#define IMMUNITY_NATURE				7941
#define IMMUNITY_FIRE				7942
#define IMMUNITY_HOLY				34182
#define IMMUNITY_ARCANE				34184
#define IMMUNITY_PHYSICAL			34310

class SapphironAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(SapphironAI);
		SP_AI_Spell spells[4];
		bool m_spellcheck[4];

		SapphironAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			_unit->GetAIInterface()->addWayPoint(CreateWaypoint(1, 3000, RUN));

			nrspells = 2;
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
				spells[i].casttime = 0;
			}

			spells[0].info = dbcSpell.LookupEntry(LIFE_DRAIN);
			spells[0].targettype = TARGET_VARIOUS;
			spells[0].instant = true;
			spells[0].perctrigger = 8.0f;
			spells[0].cooldown = 20;
			spells[0].attackstoptimer = 2000;

			spells[1].info = dbcSpell.LookupEntry(CHILL);
			spells[1].targettype = TARGET_RANDOM_DESTINATION;
			spells[1].instant = true;
			spells[1].perctrigger = 10.0f;
			spells[1].cooldown = 15;
			spells[1].attackstoptimer = 1000;
			spells[1].mindist2cast = 0.0f;
			spells[1].maxdist2cast = 40.0f;
			spells[1].minhp2cast = 0;
			spells[1].maxhp2cast = 100;

			spells[2].info = dbcSpell.LookupEntry(ICEBOLT);
			spells[2].targettype = TARGET_RANDOM_SINGLE;
			spells[2].instant = true;
			spells[2].perctrigger = 0.0f;
			spells[2].cooldown = 0;
			spells[2].attackstoptimer = 1000;
			spells[2].mindist2cast = 0.0f;
			spells[2].maxdist2cast = 70.0f;
			spells[2].minhp2cast = 0;
			spells[2].maxhp2cast = 100;

			spells[3].info = dbcSpell.LookupEntry(BERSERK);
			spells[3].targettype = TARGET_SELF;
			spells[3].instant = true;
			spells[3].perctrigger = 0.0f;
			spells[3].cooldown = 900;
			spells[3].attackstoptimer = 1000;

			_unit->GetAIInterface()->setMoveType(MOVEMENTTYPE_DONTMOVEWP);
			_unit->GetAIInterface()->SetAllowedToEnterCombat(true);
			_unit->GetAIInterface()->StopFlying();
			_unit->GetAIInterface()->m_canMove = true;
			_unit->CastSpell(_unit, IMMUNITY_FROST, true);

			WorldPacket data(SMSG_MOVE_UNSET_HOVER, 13);
			data << _unit->GetNewGUID();
			data << uint32(0);
			_unit->SendMessageToSet(&data, false);

			ChillTarget = NULL;
			FlightActions = 0;
			ChillCounter = 0;
			PhaseTimer = 0;
			m_phase = 1;
		}

		void OnCombatStart(Unit* mTarget)
		{
			for(int i = 0; i < nrspells; i++)
				spells[i].casttime = 0;

			spells[3].casttime = (uint32)time(NULL) + spells[3].cooldown;

			_unit->GetAIInterface()->setMoveType(MOVEMENTTYPE_DONTMOVEWP);
			_unit->GetAIInterface()->SetAllowedToEnterCombat(true);
			_unit->GetAIInterface()->StopFlying();
			_unit->GetAIInterface()->m_canMove = true;

			WorldPacket data(SMSG_MOVE_UNSET_HOVER, 13);
			data << _unit->GetNewGUID();
			data << uint32(0);
			_unit->SendMessageToSet(&data, false);

			GameObject* Waterfall = NULL;
			Waterfall = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(3536.852783f, -5159.951172f, 143.636139f, FROSTWYRM_WATERFALL_DOOR);
			if(Waterfall != NULL)
			{
				Waterfall->SetState(1);
			}

			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));

			PhaseTimer = (uint32)time(NULL) + 35;
			ChillTarget = NULL;
			FlightActions = 0;
			ChillCounter = 0;
			m_phase = 1;
		}

		void OnCombatStop(Unit* mTarget)
		{
			Creature* BreathTrigger = NULL;
			BreathTrigger = _unit->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(PhaseTwoWP[1].x, PhaseTwoWP[1].y, PhaseTwoWP[1].z, CN_FROST_BREATH_TRIGGER3);
			if(BreathTrigger != NULL)
				BreathTrigger->Despawn(0, 0);

			for(int i = 1; i < 21; i++)
			{
				if(GameObject* IceBlock = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(IceBlocks[i].x, IceBlocks[i].y, IceBlocks[i].z, ICE_BLOCK_GO))
					IceBlock->Delete();
			}

			if(GameObject* Waterfall = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(3536.852783f, -5159.951172f, 143.636139f, FROSTWYRM_WATERFALL_DOOR))
				Waterfall->SetState(GAMEOBJECT_STATE_OPEN);

			_unit->GetAIInterface()->setMoveType(MOVEMENTTYPE_DONTMOVEWP);
			_unit->GetAIInterface()->SetAllowedToEnterCombat(true);
			_unit->GetAIInterface()->StopFlying();
			_unit->GetAIInterface()->m_canMove = true;

			WorldPacket data(SMSG_MOVE_UNSET_HOVER, 13);
			data << _unit->GetNewGUID();
			data << uint32(0);
			_unit->SendMessageToSet(&data, false);

			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);

			RemoveAIUpdateEvent();
		}

		void OnTargetDied(Unit* mTarget)
		{
		}

		void OnDied(Unit* mKiller)
		{
			_unit->CastSpell(_unit, SAPPHIRON_DIES, true);

			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
			uint32 t = (uint32)time(NULL);
			if(t > spells[3].casttime && _unit->GetCurrentSpell() == NULL)
			{
				_unit->CastSpell(_unit, spells[3].info, spells[3].instant);

				spells[3].casttime = t + spells[3].cooldown;
			}

			switch(m_phase)
			{
				case 1:
					PhaseOne();
					break;
				case 2:
					PhaseTwo();
					break;
				default:
					{
					}
			}
		}

		void PhaseOne()
		{
			_unit->CastSpell(_unit, FROST_AURA, true);

			if(_unit->GetAIInterface()->getMoveType() == MOVEMENTTYPE_WANTEDWP)
				return;

			if(_unit->GetHealthPct() > 10)
			{
				uint32 t = (uint32)time(NULL);
				if(t > PhaseTimer)
				{
					if(_unit->GetCurrentSpell() != NULL)
						_unit->GetCurrentSpell()->cancel();

					_unit->GetAIInterface()->SetAllowedToEnterCombat(false);
					_unit->GetAIInterface()->StopMovement(0);
					_unit->GetAIInterface()->SetAIState(STATE_SCRIPTMOVE);
					_unit->GetAIInterface()->setMoveType(MOVEMENTTYPE_WANTEDWP);
					_unit->GetAIInterface()->setWaypointToMove(1);

					return;
				}
			}

			if(ChillCounter > 0)
			{
				ChillCounter--;
				if(ChillTarget != NULL)
				{
					_unit->GetMapMgr()->GetInterface()->SpawnCreature(CN_CHILL_TRIGGER, ChillTarget->GetPositionX(), ChillTarget->GetPositionY(), ChillTarget->GetPositionZ(), ChillTarget->GetOrientation(), true, false, 0, 0);
				}

				if(ChillCounter == 0)
				{
					ChillTarget = NULL;
				}
			}

			float val = RandomFloat(100.0f);
			SpellCast(val);
		}

		void PhaseTwo()
		{
			if(FlightActions == 0)
			{
				_unit->GetAIInterface()->m_canMove = false;
				_unit->GetAIInterface()->SetAllowedToEnterCombat(true);
				_unit->GetAIInterface()->setCurrentAgent(AGENT_SPELL);
				_unit->GetAIInterface()->SetAIState(STATE_SCRIPTIDLE);
				_unit->GetAIInterface()->setMoveType(MOVEMENTTYPE_DONTMOVEWP);
				_unit->GetAIInterface()->setWaypointToMove(0);
			}

			if(FlightActions < 5)
			{
				if(_unit->GetCurrentSpell() == NULL)
				{
					if(_unit->GetAIInterface()->getNextTarget() != NULL)
					{
						CastSpellOnRandomTarget(2, 0.0f, 40.0f, 0, 100);

						FlightActions++;
						if(FlightActions >= 5)
						{
							uint32 LastOne = 0;
							for(int i = 0; i < 2; i++)
							{
								uint32 Block = 0;
								while(LastOne == Block)
								{
									Block = RandomUInt(5) + 15;
								}

								LastOne = Block;

								GameObject* IceBlock = NULL;
								IceBlock = _unit->GetMapMgr()->GetInterface()->SpawnGameObject(ICE_BLOCK_GO, IceBlocks[Block].x, IceBlocks[Block].y, IceBlocks[Block].z, IceBlocks[Block].o, true, 0, 0);
								if(IceBlock != NULL)
								{
									IceBlock->SetUInt32Value(GAMEOBJECT_FLAGS, 1);
								}
							}

							RemoveAIUpdateEvent();
							RegisterAIUpdateEvent(3000);

							FlightActions = 5;
						}

						if(FlightActions == 2)
						{
							for(int i = 0; i < 2; i++)
							{
								uint32 Block = 0;
								if(i == 0)
									Block = RandomUInt(3) + 1;
								else
									Block = RandomUInt(3) + 10;

								GameObject* IceBlock = NULL;
								IceBlock = _unit->GetMapMgr()->GetInterface()->SpawnGameObject(ICE_BLOCK_GO, IceBlocks[Block].x, IceBlocks[Block].y, IceBlocks[Block].z, IceBlocks[Block].o, true, 0, 0);
								if(IceBlock != NULL)
								{
									IceBlock->SetUInt32Value(GAMEOBJECT_FLAGS, 1);
								}
							}
						}

						if(FlightActions == 4)
						{
							for(int i = 0; i < 2; i++)
							{
								uint32 Block = 0;
								if(i == 0)
									Block = RandomUInt(3) + 7;
								else
									Block = RandomUInt(9) + 13;

								GameObject* IceBlock = NULL;
								IceBlock = _unit->GetMapMgr()->GetInterface()->SpawnGameObject(ICE_BLOCK_GO, IceBlocks[Block].x, IceBlocks[Block].y, IceBlocks[Block].z, IceBlocks[Block].o, true, 0, 0);
								if(IceBlock != NULL)
								{
									IceBlock->SetUInt32Value(GAMEOBJECT_FLAGS, 1);
								}
							}
						}
					}
				}
			}

			else
			{
				if(FlightActions == 5)
				{
					Unit* FlyingFrostBreath = NULL;
					FlyingFrostBreath = _unit->GetMapMgr()->GetInterface()->SpawnCreature(CN_FROST_BREATH_TRIGGER, PhaseTwoWP[1].x, PhaseTwoWP[1].y, PhaseTwoWP[1].z + 18.0f, _unit->GetOrientation(), true, false, 0, 0);
					if(FlyingFrostBreath != NULL)
					{
						FlyingFrostBreath->GetAIInterface()->MoveTo(PhaseTwoWP[1].x, PhaseTwoWP[1].y, PhaseTwoWP[1].z, PhaseTwoWP[1].o);
					}

					_unit->GetMapMgr()->GetInterface()->SpawnCreature(CN_FROST_BREATH_TRIGGER2, PhaseTwoWP[1].x, PhaseTwoWP[1].y, PhaseTwoWP[1].z, _unit->GetOrientation(), true, false, 0, 0);

					RemoveAIUpdateEvent();
					RegisterAIUpdateEvent(10000);

					Creature* BreathTrigger = NULL;
					BreathTrigger = _unit->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(PhaseTwoWP[1].x, PhaseTwoWP[1].y, PhaseTwoWP[1].z, CN_FROST_BREATH_TRIGGER3);
					if(BreathTrigger != NULL)
						BreathTrigger->Despawn(0, 0);
				}

				if(FlightActions == 6)
				{
					for(int i = 1; i < 21; i++)
					{
						GameObject* IceBlock = NULL;
						IceBlock = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(IceBlocks[i].x, IceBlocks[i].y, IceBlocks[i].z, ICE_BLOCK_GO);
						if(IceBlock != NULL)
						{
							IceBlock->Delete();
						}
					}

					_unit->GetAIInterface()->StopFlying();
					_unit->Emote(EMOTE_ONESHOT_LAND);

					WorldPacket data(SMSG_MOVE_UNSET_HOVER, 13);
					data << _unit->GetNewGUID();
					data << uint32(0);
					_unit->SendMessageToSet(&data, false);

					RemoveAIUpdateEvent();
					RegisterAIUpdateEvent(3000);
				}

				if(FlightActions == 7)
				{
					_unit->GetAIInterface()->m_canMove = true;
					_unit->GetAIInterface()->SetAllowedToEnterCombat(true);
					_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
					_unit->GetAIInterface()->SetAIState(STATE_SCRIPTIDLE);
					_unit->GetAIInterface()->setMoveType(MOVEMENTTYPE_DONTMOVEWP);
					_unit->GetAIInterface()->setWaypointToMove(0);

					RemoveAIUpdateEvent();
					RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));

					PhaseTimer = (uint32)time(NULL) + 67;
					ChillTarget = NULL;
					FlightActions = 0;
					ChillCounter = 0;
					m_phase = 1;
				}

				FlightActions++;
			}
		}

		void SpellCast(float val)
		{
			if(_unit->GetCurrentSpell() == NULL && _unit->GetAIInterface()->getNextTarget() != NULL)
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

						if(spells[i].speech != "")
						{
							_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, spells[i].speech.c_str());
							_unit->PlaySoundToSet(spells[i].soundid);
						}

						m_spellcheck[i] = false;
						return;
					}

					uint32 t = (uint32)time(NULL);
					if((val > comulativeperc && val <= (comulativeperc + spells[i].perctrigger)) && t > spells[i].casttime)
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

			if(_unit->GetCurrentSpell() == NULL && _unit->GetAIInterface()->getNextTarget() != NULL)
			{
				std::vector<Unit*> TargetTable;		/* From M4ksiu - Big THX to Capt who helped me with std stuff to make it simple and fully working <3 */
				/* If anyone wants to use this function, then leave this note!										 */
				for(set<Object*>::iterator itr = _unit->GetInRangeSetBegin(); itr != _unit->GetInRangeSetEnd(); ++itr)
				{
					if(isHostile(_unit, (*itr)) && (*itr) != _unit && (*itr)->IsUnit())
					{
						Unit* RandomTarget = NULL;
						RandomTarget = TO_UNIT(*itr);

						if(RandomTarget->isAlive() && _unit->GetDistance2dSq(RandomTarget) >= mindist2cast * mindist2cast && _unit->GetDistance2dSq(RandomTarget) <= maxdist2cast * maxdist2cast && _unit->GetAIInterface()->getThreatByPtr(RandomTarget) > 0 && isHostile(_unit, RandomTarget))
						{
							TargetTable.push_back(RandomTarget);
						}
					}
				}

				if(!TargetTable.size())
					return;

				size_t RandTarget = rand() % TargetTable.size();

				Unit*  RTarget = TargetTable[RandTarget];

				if(RTarget == NULL)
					return;

				if(i == 1)
				{
					ChillCounter = RandomUInt(3) + 3;
					ChillTarget = RTarget;
				}

				else
				{
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
				}

				TargetTable.clear();
			}
		}

		void OnReachWP(uint32 iWaypointId, bool bForwards)
		{
			if(iWaypointId == 1)
			{
				_unit->GetMapMgr()->GetInterface()->SpawnCreature(CN_FROST_BREATH_TRIGGER3, PhaseTwoWP[1].x, PhaseTwoWP[1].y, PhaseTwoWP[1].z, _unit->GetOrientation(), true, false, 0, 0);
				_unit->GetAIInterface()->SetFly();
				_unit->Emote(EMOTE_ONESHOT_LIFTOFF);

				WorldPacket data(SMSG_MOVE_SET_HOVER, 13);
				data << _unit->GetNewGUID();
				data << uint32(0);
				_unit->SendMessageToSet(&data, false);

				RemoveAIUpdateEvent();
				RegisterAIUpdateEvent(3500);

				ChillTarget = NULL;
				FlightActions = 0;
				ChillCounter = 0;
				m_phase = 2;
			}
		}

		inline WayPoint* CreateWaypoint(int id, uint32 waittime, uint32 flags)
		{
			WayPoint* wp = _unit->CreateWaypointStruct();
			wp->id = id;
			wp->x = PhaseTwoWP[id].x;
			wp->y = PhaseTwoWP[id].y;
			wp->z = PhaseTwoWP[id].z;
			wp->o = PhaseTwoWP[id].o;
			wp->waittime = waittime;
			wp->flags = flags;
			wp->forwardemoteoneshot = 0;
			wp->forwardemoteid = 0;
			wp->backwardemoteoneshot = 0;
			wp->backwardemoteid = 0;
			wp->forwardskinid = 0;
			wp->backwardskinid = 0;
			return wp;
		}

	protected:

		Unit* ChillTarget;	// I don't like it >_>

		uint32 FlightActions;
		uint32 ChillCounter;
		uint32 PhaseTimer;
		uint32 m_phase;
		int nrspells;
};

// -- Kel'thuzad Encounter by M4ksiu -- //

// Encounter mobs

#define CN_THE_LICH_KING 16980
#define CN_SOLDIER_OF_THE_FROZEN_WASTES 16427
#define CN_UNSTOPPABLE_ABOMINATION 16428
#define CN_SOUL_WEAVER 16429
#define CN_GUARDIAN_OF_ICECROWN 16441

/*
  _____
 /  K  \
/1     4\
|       |
|2     5|
|       |
\3     6/
 \_ 7 _/
   | |

*/

static Location SFrozenWastes[] =	// Soldier of the Frozen Wastes (no idea about those :| )
{
	{ 3759.149902f, -5074.879883f, 143.175003f, 1.203640f },	// 1
	{ 3762.959961f, -5067.399902f, 143.453003f, 0.893413f },
	{ 3772.419922f, -5076.379883f, 143.466995f, 3.606970f },
	{ 3779.699951f, -5078.180176f, 143.764008f, 4.038940f },
	{ 3770.219971f, -5065.740234f, 143.477005f, 0.630304f },
	{ 3765.709961f, -5060.799805f, 143.748001f, 1.608120f },
	{ 3776.909912f, -5066.100098f, 143.550003f, 5.130640f },
	{ 3782.659912f, -5069.529785f, 143.757004f, 5.150280f },
	{ 3773.909912f, -5059.589844f, 143.774002f, 6.257680f },
	{ 3780.260010f, -5061.580078f, 143.742996f, 5.169910f },
	{ 3721.429932f, -5052.759766f, 143.442993f, 1.457330f },	// 2
	{ 3732.149902f, -5051.589844f, 143.444000f, 1.017500f },
	{ 3741.889893f, -5047.439941f, 143.886002f, 3.075250f },
	{ 3726.229980f, -5043.410156f, 143.455994f, 6.150070f },
	{ 3718.679932f, -5042.520020f, 143.768005f, 1.614410f },
	{ 3733.060059f, -5040.979980f, 143.557007f, 1.669380f },
	{ 3741.860107f, -5038.410156f, 143.917999f, 4.410420f },
	{ 3736.189941f, -5032.810059f, 143.847000f, 5.026970f },
	{ 3723.219971f, -5035.770020f, 143.764999f, 4.701020f },
	{ 3728.760010f, -5031.759766f, 143.785995f, 3.723200f },
	{ 3683.189941f, -5062.419922f, 143.175995f, 0.559623f },	// 3
	{ 3687.739990f, -5057.779785f, 143.175995f, 1.345020f },
	{ 3674.040039f, -5067.899902f, 143.524994f, 0.005909f },
	{ 3688.340088f, -5052.009766f, 143.473007f, 2.299280f },
	{ 3681.659912f, -5052.549805f, 143.263000f, 3.343860f },
	{ 3678.840080f, -5055.529785f, 143.332993f, 3.512720f },
	{ 3685.800049f, -5045.779785f, 143.615997f, 6.253750f },
	{ 3673.479980f, -5053.350098f, 143.554993f, 1.945840f },
	{ 3670.649902f, -5061.149902f, 143.820007f, 4.266700f },
	{ 3688.018311f, -5061.541992f, 143.178223f, 0.512497f },
	{ 3742.659912f, -5157.009766f, 143.171005f, 0.773261f },	// 4
	{ 3750.310059f, -5153.779785f, 143.179993f, 5.603460f },
	{ 3739.770020f, -5163.000000f, 143.662994f, 1.095270f },
	{ 3746.649902f, -5164.560059f, 143.520004f, 1.970990f },
	{ 3748.479980f, -5169.109863f, 143.649002f, 2.591460f },
	{ 3744.560059f, -5173.520020f, 143.895996f, 1.370160f },
	{ 3758.260010f, -5156.299805f, 143.570999f, 6.192510f },
	{ 3762.620117f, -5159.149902f, 143.712997f, 4.433220f },
	{ 3760.840088f, -5162.959961f, 143.649002f, 4.280060f },
	{ 3756.580078f, -5170.060059f, 143.623001f, 3.031280f },
	{ 3705.229980f, -5163.189941f, 143.266998f, 5.692200f },	// 5
	{ 3696.949951f, -5163.370117f, 143.608002f, 0.901274f },
	{ 3710.080078f, -5168.709961f, 143.585999f, 4.675110f },
	{ 3697.030029f, -5170.220215f, 143.606003f, 0.343642f },
	{ 3692.030029f, -5170.020020f, 143.815994f, 0.932691f },
	{ 3710.320068f, -5175.319824f, 143.705002f, 4.639770f },
	{ 3694.550049f, -5177.540039f, 143.839005f, 1.549230f },
	{ 3705.830078f, -5179.120117f, 143.729996f, 3.956480f },
	{ 3712.800049f, -5179.109863f, 143.891006f, 3.855950f },
	{ 3701.669922f, -5181.859863f, 143.804001f, 1.380370f },
	{ 3676.590088f, -5144.899902f, 143.186005f, 3.575550f },	// 6
	{ 3670.649902f, -5142.629883f, 143.173996f, 4.313820f },
	{ 3665.689941f, -5136.279785f, 143.177994f, 1.176150f },
	{ 3664.870117f, -5132.330078f, 143.205002f, 3.249600f },
	{ 3662.120117f, -5144.299805f, 143.320007f, 2.256080f },
	{ 3658.979980f, -5139.490234f, 143.421997f, 6.077040f },
	{ 3651.850098f, -5137.140137f, 143.764999f, 0.799161f },
	{ 3654.689941f, -5144.009766f, 143.546997f, 2.519180f },
	{ 3666.020020f, -5149.500000f, 143.587006f, 3.359560f },
	{ 3667.959961f, -5153.120117f, 143.791000f, 4.015380f },
	{ 3659.979980f, -5100.450195f, 143.453003f, 5.168254f },	// 7
	{ 3662.800049f, -5088.189941f, 143.557999f, 4.409650f },
	{ 3658.439941f, -5090.649902f, 143.470001f, 5.528840f },
	{ 3652.810059f, -5090.450195f, 143.475998f, 1.362310f },
	{ 3651.780029f, -5095.339844f, 143.388000f, 0.981387f },
	{ 3652.629883f, -5098.970215f, 143.544998f, 2.799580f },
	{ 3652.679932f, -5083.479980f, 143.774994f, 0.482659f },
	{ 3647.189941f, -5085.490234f, 143.570999f, 1.919940f },
	{ 3645.120117f, -5097.240234f, 143.487000f, 0.765403f },
	{ 3646.360107f, -5101.200195f, 143.681000f, 2.909540f }
};

static Location Abomination[] =	// Unstoppable Abomination
{
	{ 3776.229980f, -5081.439941f, 143.779999f, 4.043730f },	// 1
	{ 3774.419922f, -5071.490234f, 143.423996f, 4.214940f },
	{ 3759.850098f, -5064.479980f, 143.636002f, 6.255410f },
	{ 3740.899902f, -5052.740234f, 143.785995f, 1.836760f },	// 2
	{ 3726.919922f, -5040.020020f, 143.535995f, 2.481570f },
	{ 3715.010010f, -5049.259766f, 143.632004f, 5.071810f },
	{ 3695.060059f, -5052.160156f, 143.548004f, 3.792400f },	// 3
	{ 3678.129883f, -5048.060059f, 143.436996f, 5.363980f },
	{ 3676.120117f, -5061.359863f, 143.492004f, 5.726840f },
	{ 3756.780029f, -5149.419922f, 143.460007f, 2.774530f },	// 4
	{ 3752.262695f, -5164.782227f, 143.409119f, 0.383768f },
	{ 3740.669922f, -5168.600098f, 143.873993f, 1.051360f },
	{ 3714.020020f, -5171.129883f, 143.776993f, 1.742510f },	// 5
	{ 3702.185303f, -5174.303711f, 143.532303f, 5.443298f },
	{ 3693.739990f, -5162.149902f, 143.748001f, 5.696990f },
	{ 3673.189941f, -5150.500000f, 143.751999f, 3.030570f },	// 6
	{ 3658.570068f, -5147.799805f, 143.494003f, 1.230440f },
	{ 3659.560059f, -5132.129883f, 143.677002f, 5.988380f },
	{ 3651.130859f, -5104.800293f, 143.798248f, 5.374194f },	// 7
	{ 3646.947021f, -5092.266113f, 143.305878f, 5.005841f },
	{ 3658.618408f, -5083.832031f, 143.778641f, 5.951464f }
};

static Location SoulWeaver[] =	// Soul Weaver
{
	{ 3768.540039f, -5075.140137f, 143.203995f, 5.096160f },
	{ 3728.030029f, -5047.359863f, 143.306000f, 5.230460f },
	{ 3682.929932f, -5055.819824f, 143.184006f, 5.368690f },
	{ 3749.429932f, -5160.419922f, 143.283997f, 4.723090f },
	{ 3706.120117f, -5169.250000f, 143.436996f, 2.682630f },
	{ 3665.310059f, -5142.339844f, 143.220001f, 1.147180f },
	{ 3656.365234f, -5094.724121f, 143.306641f, 6.203571f }
};

static Location Guardians[] =		// Guardians of Icecrown
{
	{ 3778.371582f, -5065.141113f, 143.614639f, 3.700061f },
	{ 3731.733398f, -5032.681152f, 143.775040f, 4.485459f },
	{ 3758.592285f, -5170.157715f, 143.667297f, 2.144972f },
	{ 3700.936279f, -5183.230469f, 143.858582f, 1.314648f }
};

static Location Waves[] =			// Spawn positions of units that attack circle
{
	{ 3756.380615f, -5080.560059f, 142.906921f, 3.762599f },
	{ 3726.448242f, -5058.546387f, 142.467331f, 4.262112f },
	{ 3690.084229f, -5066.993164f, 142.705917f, 5.245427f },
	{ 3742.711670f, -5146.786133f, 142.964890f, 2.178441f },
	{ 3706.024902f, -5155.362793f, 142.655304f, 1.294868f },
	{ 3676.363281f, -5133.007324f, 142.806168f, 0.615499f },
	{ 3668.310303f, -5096.927246f, 142.307312f, 6.128994f }
};

// Kel'thuzad AI
// each ~10-20 sec new mob

#define SFROSTBOLT 28478
#define MFROSTBOLT 28479
#define CHAINS_OF_KELTHUZAD 28410
#define DETONATE_MANA 27819
#define SHADOW_FISSURE 27810
#define FROST_BLAST 27808

#define KELTHUZAD_CHANNEL 29423

class KelthuzadAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(KelthuzadAI);
		SP_AI_Spell spells[7];
		bool m_spellcheck[7];
		bool FrozenWastes[7];
		bool Abominations[7];
		bool SoulWeavers[7];

		KelthuzadAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			nrspells = 6;

			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
				spells[i].casttime = 0;
			}

			for(int i = 0; i < 7; i++)
			{
				FrozenWastes[i] = false;
				Abominations[i] = false;
				SoulWeavers[i] = false;
			}

			spells[0].info = dbcSpell.LookupEntry(SFROSTBOLT);
			spells[0].targettype = TARGET_ATTACKING;
			spells[0].instant = false;
			spells[0].perctrigger = 7.0f;
			spells[0].cooldown = 0;
			spells[0].attackstoptimer = 2000;

			spells[1].info = dbcSpell.LookupEntry(MFROSTBOLT);
			spells[1].targettype = TARGET_VARIOUS;
			spells[1].instant = true;
			spells[1].perctrigger = 0.1f;
			spells[1].cooldown = 15;			// it's casted after 15 sec anyway, so it does need additional perctrigger
			spells[1].attackstoptimer = 1000;

			spells[2].info = dbcSpell.LookupEntry(CHAINS_OF_KELTHUZAD);
			spells[2].targettype = TARGET_RANDOM_SINGLE;
			spells[2].instant = true;
			spells[2].perctrigger = 5.0f;
			spells[2].cooldown = 20;
			spells[2].attackstoptimer = 1000;
			spells[2].mindist2cast = 0.0f;
			spells[2].maxdist2cast = 40.0f;
			spells[2].minhp2cast = 0;
			spells[2].maxhp2cast = 100;

			spells[3].info = dbcSpell.LookupEntry(DETONATE_MANA);
			spells[3].targettype = TARGET_RANDOM_SINGLE;
			spells[3].instant = true;
			spells[3].perctrigger = 6.0f;
			spells[3].cooldown = 7;
			spells[3].attackstoptimer = 2000;
			spells[3].mindist2cast = 0.0f;
			spells[3].maxdist2cast = 40.0f;
			spells[3].minhp2cast = 0;
			spells[3].maxhp2cast = 100;

			spells[4].info = dbcSpell.LookupEntry(SHADOW_FISSURE);
			spells[4].targettype = TARGET_ATTACKING;
			spells[4].instant = true;
			spells[4].perctrigger = 5.0f;
			spells[4].cooldown = 10;
			spells[4].attackstoptimer = 2000;

			spells[5].info = dbcSpell.LookupEntry(FROST_BLAST);
			spells[5].targettype = TARGET_RANDOM_SINGLE;
			spells[5].instant = true;
			spells[5].perctrigger = 6.0f;
			spells[5].cooldown = 10;
			spells[5].attackstoptimer = 2000;
			spells[5].soundid = 8815;
			spells[5].speech = "I shall freeze the blood in your veins!";	// not sure if it's to this one or to one of bolt spells
			spells[5].mindist2cast = 0.0f;
			spells[5].maxdist2cast = 40.0f;
			spells[5].minhp2cast = 0;
			spells[5].maxhp2cast = 100;

			spells[6].info = dbcSpell.LookupEntry(KELTHUZAD_CHANNEL);
			spells[6].targettype = TARGET_SELF;
			spells[6].instant = false;
			spells[6].perctrigger = 0.0f;
			spells[6].cooldown = 0;
			spells[6].attackstoptimer = 1000;

			_unit->GetAIInterface()->disable_melee = false;
			_unit->SetUInt64Value(UNIT_FIELD_FLAGS, 0);
			_unit->GetAIInterface()->m_canMove = true;

			DespawnTrash = false;
			EventStart = false;
			SpawnCounter = 0;
			PhaseTimer = 310;
			SpawnTimer = 0;
			GCounter = 0;
			m_phase = 0;
		}

		void OnCombatStart(Unit* mTarget)
		{
			_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "Minions, servants, soldiers of the cold dark, obey the call of Kel'Thuzad!");
			_unit->PlaySoundToSet(8819);

			Unit* TheLichKing = NULL;
			TheLichKing = _unit->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(3767.58f, -5117.15f, 174.49f, CN_THE_LICH_KING);
			if(TheLichKing != NULL)
			{
				_unit->SetChannelSpellTargetGUID(TheLichKing->GetGUID());
				_unit->SetChannelSpellId(29423);
			}

			GameObject*  KelGate  = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(3635.44f, -5090.33f, 143.205f, 181228);

			if(KelGate)
				KelGate->SetState(1);

			_unit->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			_unit->GetAIInterface()->disable_melee = true;
			_unit->GetAIInterface()->m_canMove = false;

			RegisterAIUpdateEvent(1000);
			CastTime();

			DespawnTrash = false;
			EventStart = true;
			SpawnCounter = 0;
			PhaseTimer = 310;
			SpawnTimer = 0;
			GCounter = 0;
			m_phase = 1;
		}

		void OnCombatStop(Unit* mTarget)
		{
			GameObject*  KelGate  = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(3635.44f, -5090.33f, 143.205f, 181228);
			if(KelGate != NULL)
				KelGate->SetState(GAMEOBJECT_STATE_OPEN);

			for(int i = 0; i < 4; i++)
			{
				GameObject*  WindowGate  = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(Guardians[i].x, Guardians[i].y, Guardians[i].z, 200002);
				if(WindowGate != NULL)
					WindowGate->SetState(1);
			}

			_unit->SetChannelSpellTargetGUID(0);
			_unit->SetChannelSpellId(0);
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);
			_unit->GetAIInterface()->disable_melee = false;
			_unit->SetUInt64Value(UNIT_FIELD_FLAGS, 0);
			_unit->GetAIInterface()->m_canMove = true;
			RemoveAIUpdateEvent();

			DespawnTrash = true;
			EventStart = false;
			SpawnCounter = 0;
			PhaseTimer = 310;
			SpawnTimer = 0;
			GCounter = 0;
			m_phase = 0;
		}

		void CastTime()
		{
			for(int i = 0; i < nrspells; i++)
				spells[i].casttime = 0;
		}

		void OnTargetDied(Unit* mTarget)
		{
			if(_unit->GetHealthPct() == 0) return;

			uint32 RandomSpeach = rand() % 2;
			switch(RandomSpeach)
			{
				case 0:
					_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "The dark void awaits you!");
					_unit->PlaySoundToSet(8817);
					break;
				case 1:
					//_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "");	// no text?
					_unit->PlaySoundToSet(8818);
					break;
			}
		}

		void OnDied(Unit* mKiller)
		{
			GameObject*  KelGate  = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(3635.44f, -5090.33f, 143.205f, 181228);
			if(KelGate != NULL)
				KelGate->SetState(GAMEOBJECT_STATE_OPEN);

			for(int i = 0; i < 4; i++)
			{
				GameObject*  WindowGate  = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(Guardians[i].x, Guardians[i].y, Guardians[i].z, 200002);
				if(WindowGate != NULL)
					WindowGate->SetState(1);
			}

			_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "Do not rejoice... your victory is a hollow one... for I shall return with powers beyond your imagining!");
			_unit->PlaySoundToSet(8814);

			_unit->GetAIInterface()->disable_melee = false;
			_unit->SetUInt64Value(UNIT_FIELD_FLAGS, 0);
			_unit->GetAIInterface()->m_canMove = true;
			RemoveAIUpdateEvent();

			EventStart = false;
			SpawnCounter = 0;
			PhaseTimer = 310;
			SpawnTimer = 0;
			GCounter = 0;
			m_phase = 0;
		}

		void AIUpdate()
		{
			switch(m_phase)
			{
				case 1:
					PhaseOne();
					break;
				case 2:
					PhaseTwo();
					break;
				case 3:
					PhaseThree();
					break;
				default:
					{
					}
			}
		}

		void PhaseOne()
		{
			if(EventStart == true)
			{
				SpawnTimer++;
				if(SpawnTimer == 5 || SpawnTimer == 10)
				{
					for(int i = 0; i < 7; i++)
					{
						int Counter = 0;

						while(Counter == 0)
						{
							if(FrozenWastes[i] == false && (rand() % 3 == 0 || SpawnCounter > 0))
							{
								for(int x = 0; x < 10; x++)
								{
									uint32 SpawnID = 10 * i + x;
									_unit->GetMapMgr()->GetInterface()->SpawnCreature(CN_SOLDIER_OF_THE_FROZEN_WASTES, SFrozenWastes[SpawnID].x, SFrozenWastes[SpawnID].y, SFrozenWastes[SpawnID].z, SFrozenWastes[SpawnID].o, true, false, 0, 0);
								}

								FrozenWastes[i] = true;
								Counter++;
							}

							if(Abominations[i] == false && (rand() % 3 == 0 || SpawnCounter > 0))
							{
								for(int x = 0; x < 3; x++)
								{
									uint32 SpawnID = 3 * i + x;
									_unit->GetMapMgr()->GetInterface()->SpawnCreature(CN_UNSTOPPABLE_ABOMINATION, Abomination[SpawnID].x, Abomination[SpawnID].y, Abomination[SpawnID].z, Abomination[SpawnID].o, true, false, 0, 0);
								}

								Abominations[i] = true;
								Counter++;
							}

							if(SoulWeavers[i] == false && ((rand() % 3 == 0 && Counter < 2) || Counter == 0 || SpawnCounter > 0))
							{
								uint32 SpawnID = i;
								_unit->GetMapMgr()->GetInterface()->SpawnCreature(CN_SOUL_WEAVER, SoulWeaver[SpawnID].x, SoulWeaver[SpawnID].y, SoulWeaver[SpawnID].z, SoulWeaver[SpawnID].o, true, false, 0, 0);

								SoulWeavers[i] = true;
								Counter++;
							}

							if(SoulWeavers[i] == true && Abominations[i] == true && FrozenWastes[i] == true)
								Counter = 1;
						}
					}

					SpawnCounter++;
				}

				if(SpawnCounter == 2)
				{
					for(int i = 0; i < 7; i++)
					{
						FrozenWastes[i] = false;
						Abominations[i] = false;
						SoulWeavers[i] = false;
					}

					WaveTimer = rand() % 6 + 10;
					EventStart = false;
					SpawnCounter = 0;
					PhaseTimer = 310;
					SpawnTimer = 0;
				}
			}

			else
			{
				PhaseTimer--;
				WaveTimer--;

				if(PhaseTimer == 5)
				{
					uint32 RandomSpeach = rand() % 3;
					switch(RandomSpeach)
					{
						case 0:
							_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "Pray for mercy!");
							_unit->PlaySoundToSet(8809);
							break;
						case 1:
							_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "Scream your dying breath!");
							_unit->PlaySoundToSet(8810);
							break;
						case 2:
							_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "The end is upon you!");
							_unit->PlaySoundToSet(8811);
							break;
					}
				}

				if(PhaseTimer == 3)
					DespawnTrash = true;

				if(!PhaseTimer)
				{
					_unit->SetChannelSpellTargetGUID(0);
					_unit->SetChannelSpellId(0);
					_unit->GetAIInterface()->disable_melee = false;
					_unit->SetUInt64Value(UNIT_FIELD_FLAGS, 0);
					_unit->GetAIInterface()->m_canMove = true;

					DespawnTrash = false;
					HelpDialog = 0;
					GCounter = 0;
					m_phase = 2;
					return;
				}

				else if(!WaveTimer && PhaseTimer > 5)
				{
					uint32 SpawnPoint = RandomUInt(7);
					uint32 RandomSU = 0;
					if(PhaseTimer > 250)
						RandomSU = RandomUInt(4);
					if(PhaseTimer <= 250 && PhaseTimer >= 150)
						RandomSU = RandomUInt(5);
					if(PhaseTimer <= 150 && PhaseTimer > 100)
						RandomSU = RandomUInt(6);
					if(PhaseTimer <= 100)
						RandomSU = RandomUInt(7);

					uint32 UnitType;

					switch(RandomSU)
					{
						case 0:
						case 1:
							UnitType = CN_SOLDIER_OF_THE_FROZEN_WASTES;
							break;
						case 2:
						case 4:
							UnitType = CN_SOUL_WEAVER;
							break;
						case 3:
						case 5:
						case 6:
							UnitType = CN_UNSTOPPABLE_ABOMINATION;
							break;
						default:
							{
								UnitType = CN_UNSTOPPABLE_ABOMINATION;
							}
					}

					_unit->GetMapMgr()->GetInterface()->SpawnCreature(UnitType, Waves[SpawnPoint].x, Waves[SpawnPoint].y, Waves[SpawnPoint].z, Waves[SpawnPoint].o, true, false, 0, 0);
					WaveTimer = rand() % 11 + 10;
				}
			}
		}

		void PhaseTwo()
		{
			if(_unit->GetHealthPct() <= 40)
			{
				HelpDialog++;
				if(HelpDialog == 1)
				{
					_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "Master! I require aid!");
					_unit->PlaySoundToSet(8816);
				}

				if(HelpDialog == 4)
				{
					Unit* TheLichKing = NULL;
					TheLichKing = _unit->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(3767.58f, -5117.15f, 174.49f, CN_THE_LICH_KING);
					if(TheLichKing != NULL)
					{
						TheLichKing->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "Very well... warriors of the frozen wastes, rise up, I command you to fight, kill, and die for your master. Let none survive...");
						TheLichKing->PlaySoundToSet(8824);
					}

					else
					{
						_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "Very well... warriors of the frozen wastes, rise up, I command you to fight, kill, and die for your master. Let none survive...");
						_unit->PlaySoundToSet(8824);
					}

					for(int i = 0; i < 4; i++)
					{
						if(GameObject*  WindowGate  = _unit->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(Guardians[i].x, Guardians[i].y, Guardians[i].z, 200002))
							WindowGate->SetState(GAMEOBJECT_STATE_OPEN);
					}
				}

				if(HelpDialog == 10 || HelpDialog == 12 || HelpDialog == 14 || HelpDialog == 16 || HelpDialog == 18)
				{
					Unit* Guardian = NULL;
					uint32 i = RandomUInt(4);
					Guardian = _unit->GetMapMgr()->GetInterface()->SpawnCreature(CN_GUARDIAN_OF_ICECROWN, Guardians[i].x, Guardians[i].y, Guardians[i].z, Guardians[i].o, true, false, 0, 0);
					if(Guardian  != NULL)
					{
						if(Guardian->GetAIInterface()->getNextTarget() != NULL)
							Guardian->GetAIInterface()->AttackReaction(Guardian->GetAIInterface()->getNextTarget(), 1, 0);
					}

					GCounter++;
					if(GCounter == 5)
					{
						GCounter = 0;
						m_phase = 3;
					}
				}
			}

			float val = RandomFloat(100.0f);
			SpellCast(val);
		}

		void PhaseThree()
		{
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

						if(i == 2)
							ChainSound();

						if(spells[i].speech != "")
						{
							_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, spells[i].speech.c_str());
							_unit->PlaySoundToSet(spells[i].soundid);
						}

						m_spellcheck[i] = false;
						return;
					}

					uint32 t = (uint32)time(NULL);
					if(((val > comulativeperc && val <= (comulativeperc + spells[i].perctrigger)) || i == 1) && t > spells[i].casttime)
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

		void ChainSound()
		{
			uint32 RandomSpeach = rand() % 2;
			switch(RandomSpeach)
			{
				case 0:
					_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "Your soul is bound to me now!");
					_unit->PlaySoundToSet(8812);
					break;
				case 1:
					_unit->SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "There will be no escape!");
					_unit->PlaySoundToSet(8813);
					break;
			}
		}

		bool GetDespawnTrash() { return DespawnTrash; }

	protected:

		bool DespawnTrash, EventStart;
		uint32 SpawnCounter;
		uint32 HelpDialog;
		uint32 SpawnTimer;
		uint32 PhaseTimer;
		uint32 WaveTimer;
		uint32 GCounter;
		uint32 m_phase;
		int nrspells;
};

// The Lich KingAI

class TheLichKingAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(TheLichKingAI);

		TheLichKingAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			_unit->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
		}
};

// Soldier of the Frozen WastesAI

#define DARK_BLAST 28457 // 28458

class SoldierOfTheFrozenWastesAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(SoldierOfTheFrozenWastesAI);
		SoldierOfTheFrozenWastesAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			_unit->m_noRespawn = true;

			OnStart = false;

			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStart(Unit* mTarget)
		{
			LastPosX = _unit->GetPositionX();
			LastPosY = _unit->GetPositionY();
			LastPosZ = _unit->GetPositionZ();

			//RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);

			//RemoveAIUpdateEvent();
		}

		void OnDied(Unit* mKiller)
		{
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
			Creature* Kelthuzad = NULL;
			Kelthuzad = _unit->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(3749.950195f, -5113.451660f, 141.288635f, 15990);
			if(Kelthuzad == NULL || !Kelthuzad->isAlive())
			{
				_unit->Despawn(0, 0);
				return;
			}
			else if(Kelthuzad->GetScript())
			{
				CreatureAIScript* pScript = Kelthuzad->GetScript();
				if(TO< KelthuzadAI* >(pScript)->GetDespawnTrash())
				{
					_unit->Despawn(0, 0);
					return;
				}
			}
			if(_unit->GetPositionX() == LastPosX && _unit->GetPositionY() == LastPosY && _unit->GetPositionZ() == LastPosZ)
			{
				_unit->GetAIInterface()->MoveTo(newposx, newposy, 141.290451f, _unit->GetOrientation());
			}
			if(OnStart == false)
			{
				for(int i = 0; i < 7; i++)
				{
					if(_unit->GetPositionX() == Waves[i].x && _unit->GetPositionY() == Waves[i].y && _unit->GetPositionZ() == Waves[i].z)
					{
						float xchange  = RandomFloat(10.0f);
						float distance = 10.0f;

						float ychange = sqrt(distance * distance - xchange * xchange);

						if(rand() % 2 == 1)
							xchange *= -1;
						if(rand() % 2 == 1)
							ychange *= -1;

						newposx = 3715.845703f + xchange;
						newposy = -5106.928223f + ychange;

						_unit->GetAIInterface()->MoveTo(newposx, newposy, 141.290451f, _unit->GetOrientation());
					}
				}

				OnStart = true;
			}

			if(_unit->GetAIInterface()->getNextTarget() != NULL)
			{
				Unit* target = _unit->GetAIInterface()->getNextTarget();
				if(_unit->GetDistance2dSq(target) <= 49.0f)
					_unit->CastSpell(_unit, DARK_BLAST, true);
			}
		}

	protected:

		float LastPosX, LastPosY, LastPosZ;
		float newposx;
		float newposy;
		bool OnStart;
};

// Unstoppable Abomination AI

#define UA_MORTAL_WOUND 25646	// 36814

class UnstoppableAbominationAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(UnstoppableAbominationAI);
		SP_AI_Spell spells[1];
		bool m_spellcheck[1];

		UnstoppableAbominationAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			nrspells = 1;
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
				spells[i].casttime = 0;
			}

			spells[0].info = dbcSpell.LookupEntry(UA_MORTAL_WOUND);
			spells[0].targettype = TARGET_ATTACKING;
			spells[0].instant = true;
			spells[0].cooldown = 10;
			spells[0].perctrigger = 15.0f;
			spells[0].attackstoptimer = 1000;

			_unit->m_noRespawn = true;

			OnStart = false;

			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStart(Unit* mTarget)
		{
			LastPosX = _unit->GetPositionX();
			LastPosY = _unit->GetPositionY();
			LastPosZ = _unit->GetPositionZ();

			//RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));

			for(int i = 0; i < nrspells; i++)
				spells[i].casttime = 0;
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);

			//RemoveAIUpdateEvent();
		}

		void OnDied(Unit* mKiller)
		{
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
			Creature* Kelthuzad = NULL;
			Kelthuzad = _unit->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(3749.950195f, -5113.451660f, 141.288635f, 15990);
			if(Kelthuzad == NULL || !Kelthuzad->isAlive())
			{
				_unit->Despawn(0, 0);
				return;
			}
			else if(Kelthuzad->GetScript())
			{
				CreatureAIScript* pScript = Kelthuzad->GetScript();
				if(TO< KelthuzadAI* >(pScript)->GetDespawnTrash())
				{
					_unit->Despawn(0, 0);
					return;
				}
			}
			if(_unit->GetPositionX() == LastPosX && _unit->GetPositionY() == LastPosY && _unit->GetPositionZ() == LastPosZ)
			{
				_unit->GetAIInterface()->MoveTo(newposx, newposy, 141.290451f, _unit->GetOrientation());
			}
			if(OnStart == false)
			{
				for(int i = 0; i < 7; i++)
				{
					if(_unit->GetPositionX() == Waves[i].x && _unit->GetPositionY() == Waves[i].y && _unit->GetPositionZ() == Waves[i].z)
					{
						float xchange  = RandomFloat(10.0f);
						float distance = 10.0f;

						float ychange = sqrt(distance * distance - xchange * xchange);

						if(rand() % 2 == 1)
							xchange *= -1;
						if(rand() % 2 == 1)
							ychange *= -1;

						newposx = 3715.845703f + xchange;
						newposy = -5106.928223f + ychange;

						_unit->GetAIInterface()->MoveTo(newposx, newposy, 141.290451f, _unit->GetOrientation());
					}
				}

				OnStart = true;
			}

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

						if(i == 0 && _unit->GetDistance2dSq(target) > 25.0f) return;

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

	protected:

		float LastPosX, LastPosY, LastPosZ;
		float newposx;
		float newposy;
		bool OnStart;
		int nrspells;
};

// Soul Weaver AI

#define WAIL_OF_SOULS 28459

class SoulWeaverAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(SoulWeaverAI);
		SP_AI_Spell spells[1];
		bool m_spellcheck[1];

		SoulWeaverAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			nrspells = 1;
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
				spells[i].casttime = 0;
			}

			spells[0].info = dbcSpell.LookupEntry(WAIL_OF_SOULS);
			spells[0].targettype = TARGET_VARIOUS;
			spells[0].instant = true;
			spells[0].cooldown = 10;
			spells[0].perctrigger = 15.0f;
			spells[0].attackstoptimer = 1000;

			_unit->m_noRespawn = true;

			OnStart = false;

			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStart(Unit* mTarget)
		{
			LastPosX = _unit->GetPositionX();
			LastPosY = _unit->GetPositionY();
			LastPosZ = _unit->GetPositionZ();

			//RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));

			for(int i = 0; i < nrspells; i++)
				spells[i].casttime = 0;
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);

			//RemoveAIUpdateEvent();
		}

		void OnDied(Unit* mKiller)
		{
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
			Creature* Kelthuzad = NULL;
			Kelthuzad = _unit->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(3749.950195f, -5113.451660f, 141.288635f, 15990);
			if(Kelthuzad == NULL || !Kelthuzad->isAlive())
			{
				_unit->Despawn(0, 0);
				return;
			}
			else if(Kelthuzad->GetScript())
			{
				CreatureAIScript* pScript = Kelthuzad->GetScript();
				if(TO< KelthuzadAI* >(pScript)->GetDespawnTrash())
				{
					_unit->Despawn(0, 0);
					return;
				}
			}
			if(_unit->GetPositionX() == LastPosX && _unit->GetPositionY() == LastPosY && _unit->GetPositionZ() == LastPosZ)
			{
				_unit->GetAIInterface()->MoveTo(newposx, newposy, 141.290451f, _unit->GetOrientation());
			}
			if(OnStart == false)
			{
				for(int i = 0; i < 7; i++)
				{
					if(_unit->GetPositionX() == Waves[i].x && _unit->GetPositionY() == Waves[i].y && _unit->GetPositionZ() == Waves[i].z)
					{
						float xchange  = RandomFloat(10.0f);
						float distance = 10.0f;

						float ychange = sqrt(distance * distance - xchange * xchange);

						if(rand() % 2 == 1)
							xchange *= -1;
						if(rand() % 2 == 1)
							ychange *= -1;

						newposx = 3715.845703f + xchange;
						newposy = -5106.928223f + ychange;

						_unit->GetAIInterface()->MoveTo(newposx, newposy, 141.290451f, _unit->GetOrientation());
					}
				}

				OnStart = true;
			}

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

						if(i == 0 && _unit->GetDistance2dSq(target) > 64.0f) return;	// 8yards

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

	protected:

		float LastPosX, LastPosY, LastPosZ;
		float newposx;
		float newposy;
		bool OnStart;
		int nrspells;
};

// Guardian of Icecrown AI

#define BLOOD_TAP 28459

class GuardianOfIcecrownAI : public CreatureAIScript
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(GuardianOfIcecrownAI);
		SP_AI_Spell spells[1];
		bool m_spellcheck[1];

		GuardianOfIcecrownAI(Creature* pCreature) : CreatureAIScript(pCreature)
		{
			nrspells = 1;
			for(int i = 0; i < nrspells; i++)
			{
				m_spellcheck[i] = false;
			}

			spells[0].info = dbcSpell.LookupEntry(BLOOD_TAP);
			spells[0].targettype = TARGET_SELF;
			spells[0].instant = true;
			spells[0].cooldown = 0;
			spells[0].perctrigger = 0.0f;
			spells[0].attackstoptimer = 1000;

			_unit->GetAIInterface()->SetRun();
			_unit->m_noRespawn = true;

			OnStart = false;

			RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStart(Unit* mTarget)
		{
			if(_unit->GetAIInterface()->getNextTarget())
				LastTarget = _unit->GetAIInterface()->getNextTarget();

			LastPosX = _unit->GetPositionX();
			LastPosY = _unit->GetPositionY();
			LastPosZ = _unit->GetPositionZ();

			//RegisterAIUpdateEvent(_unit->GetBaseAttackTime(MELEE));
		}

		void OnCombatStop(Unit* mTarget)
		{
			_unit->GetAIInterface()->setCurrentAgent(AGENT_NULL);
			_unit->GetAIInterface()->SetAIState(STATE_IDLE);

			//RemoveAIUpdateEvent();
		}

		void OnDied(Unit* mKiller)
		{
			RemoveAIUpdateEvent();
		}

		void AIUpdate()
		{
			Unit* Kelthuzad = NULL;
			Kelthuzad = _unit->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(3715.950195f, -5106.451660f, 141.288635f, 15990);
			if(Kelthuzad && !Kelthuzad->isAlive())
			{
				_unit->Despawn(0, 0);
				return;
			}
			if(_unit->GetPositionX() == LastPosX && _unit->GetPositionY() == LastPosY && _unit->GetPositionZ() == LastPosZ)
			{
				_unit->GetAIInterface()->MoveTo(newposx, newposy, 141.290451f, _unit->GetOrientation());
			}
			if(OnStart == false)
			{
				for(int i = 0; i < 4; i++)
				{
					if(_unit->GetPositionX() == Guardians[i].x && _unit->GetPositionY() == Guardians[i].y && _unit->GetPositionZ() == Guardians[i].z)
					{
						float xchange  = RandomFloat(10.0f);
						float distance = 10.0f;

						float ychange = sqrt(distance * distance - xchange * xchange);

						if(rand() % 2 == 1)
							xchange *= -1;
						if(rand() % 2 == 1)
							ychange *= -1;

						newposx = 3715.845703f + xchange;
						newposy = -5106.928223f + ychange;

						_unit->GetAIInterface()->MoveTo(newposx, newposy, 141.290451f, _unit->GetOrientation());
					}
				}

				OnStart = true;
			}

			if(_unit->GetAIInterface()->getNextTarget())
			{
				Unit* target = NULL;
				target = _unit->GetAIInterface()->getNextTarget();

				if(!LastTarget) { LastTarget = target; return; }

				if(LastTarget != target)
					_unit->CastSpell(_unit, spells[0].info, spells[0].instant);

				LastTarget = target;
			}
		}

	protected:

		float LastPosX, LastPosY, LastPosZ;
		Unit* LastTarget;
		float newposx;
		float newposy;
		bool OnStart;
		int nrspells;
};

void SetupNaxxramas(ScriptMgr* pScriptMgr)
{
	pScriptMgr->register_instance_script(MAP_NAXXRAMAS, &NaxxramasScript::Create);
	/////////////////////////////////////////////////////////////////////////////////
	////// The Arachnid Quarter
	// ---- Trash ----
	pScriptMgr->register_creature_script(CN_VIGILANT_SHADE, &VigilantShadeAI::Create);
	pScriptMgr->register_creature_script(CN_WEB_WRAP, &WebWrapAI::Create);
	pScriptMgr->register_creature_script(CN_MAEXXNA_SPIDERLING, &MaexxnaSpiderlingAI::Create);
	pScriptMgr->register_creature_script(CN_NAXXRAMAS_WORSHIPPER, &NaxxramasWorshipperAI::Create);
	pScriptMgr->register_creature_script(CN_NAXXRAMAS_FOLLOWER, &NaxxramasFollowerAI::Create);
	pScriptMgr->register_creature_script(CN_CRYPT_GUARD, &CryptGuardAI::Create);
	// ---- Bosses ----
	pScriptMgr->register_creature_script(CN_MAEXXNA, &MaexxnaAI::Create);
	pScriptMgr->register_creature_script(CN_GRAND_WIDOW_FAERLINA, &GrandWidowFaerlinaAI::Create);
	pScriptMgr->register_creature_script(CN_ANUBREKHAN, &AnubRekhanAI::Create);

	/////////////////////////////////////////////////////////////////////////////////
	////// The Plague Quarter
	// ---- Trash ----
	pScriptMgr->register_creature_script(CN_INFECTIOUS_GHOUL, &InfectiousGhoulAI::Create);
	pScriptMgr->register_creature_script(CN_STONESKIN_GARGOYLE, &StoneskinGargoyleAI::Create);
	pScriptMgr->register_creature_script(CN_EYE_STALKER, &EyeStalkerAI::Create);
	pScriptMgr->register_creature_script(CN_PLAGUED_WARRIOR, &PlaguedWarriorAI::Create);
	pScriptMgr->register_creature_script(CN_SPORE, &SporeAI::Create);
	for(uint32 Id = 181510; Id < 181553; ++Id)
	{
		pScriptMgr->register_gameobject_script(Id, &PlagueFissureGO::Create);
	};

	for(uint32 Id = 181676; Id < 181679; ++Id)
	{
		pScriptMgr->register_gameobject_script(Id, &PlagueFissureGO::Create);
	};
	pScriptMgr->register_gameobject_script(181695, &PlagueFissureGO::Create);
	// ---- Bosses ----
	pScriptMgr->register_creature_script(CN_NOTH_THE_PLAGUEBRINGER, &NothThePlaguebringerAI::Create);
	pScriptMgr->register_creature_script(CN_HEIGAN_THE_UNCLEAN, &HeiganTheUncleanAI::Create);
	pScriptMgr->register_creature_script(CN_LOATHEB, &LoathebAI::Create);

	/////////////////////////////////////////////////////////////////////////////////
	////// The Military Quarter
	// ---- Trash ----
	pScriptMgr->register_creature_script(CN_SHADE_OF_NAXXRAMAS, &ShadeOfNaxxramasAI::Create);
	pScriptMgr->register_creature_script(CN_PORTAL_OF_SHADOWS, &PortalOfShadowsAI::Create);
	pScriptMgr->register_creature_script(CN_NECRO_KNIGHT, &NecroKnightAI::Create);
	pScriptMgr->register_creature_script(CN_DEATH_KNIGHT_CAVALIER, &DeathKnightCavalierAI::Create);
	pScriptMgr->register_creature_script(CN_DEATHCHARGER_STEED, &DeathchargerSteedAI::Create);
	pScriptMgr->register_creature_script(CN_DARK_TOUCHED_WARRIOR, &DarkTouchedWarriorAI::Create);
	pScriptMgr->register_creature_script(CN_DEATH_KNIGHT_UNDERSTUDY, &DeathKnightUnderstudyAI::Create);
	// ---- Bosses ----
	pScriptMgr->register_creature_script(CN_INSTRUCTOR_RAZUVIOUS, &InstructorRazuviousAI::Create);

	/////////////////////////////////////////////////////////////////////////////////
	////// The Construct Quarter
	// ---- Trash ----
	pScriptMgr->register_creature_script(CN_PATCHWORK_GOLEM, &PatchworkGolemAI::Create);
	pScriptMgr->register_creature_script(CN_LIGHTNING_TOTEM, &LightningTotemAI::Create);
	pScriptMgr->register_creature_script(CN_STITCHED_COLOSSUS, &StitchedColossusAI::Create);

	// ---- Abomination Wing ----
	pScriptMgr->register_creature_script(STICKED_SPEWER, &StickedSpewerAI::Create);
	pScriptMgr->register_creature_script(CN_SURGICAL_ASSISTANT, &SurgicalAssistantAI::Create);
	pScriptMgr->register_creature_script(CN_SLUDGE_BELCHER, &StickedSpewerAI::Create);
	// BOSS'S
	pScriptMgr->register_creature_script(CN_PATCHWERK, &PatchwerkAI::Create);
	pScriptMgr->register_creature_script(CN_GROBBULUS, &GrobbulusAI::Create);
	pScriptMgr->register_creature_script(CN_GLUTH, &GluthAI::Create);

	// ---- Deathknight Wing ----
	pScriptMgr->register_creature_script(CN_BONY_CONSTRUCT, &BonyConstructAI::Create);
	pScriptMgr->register_creature_script(CN_DEATH_LORD, &DeathLordAI::Create);
	// BOSS'S
	//pScriptMgr->register_creature_script(CN_INSTRUCTOR_RAZUVIOUS, &RazuviousAI::Create);
	// The Four Horsemen:
	pScriptMgr->register_creature_script(CN_THANE_KORTHAZZ, &KorthazzAI::Create);
	pScriptMgr->register_creature_script(CN_LADY_BLAUMEUX, &BlaumeuxAI::Create);
	pScriptMgr->register_creature_script(CN_SIR_ZELIEK, &ZeliekAI::Create);
	//pScriptMgr->register_creature_script(CN_Baron_Rivendare_4H, &RivendareAI::Create);

	// ---- Frostwyrm Lair ---- > Sapphiron Encounter:
	pScriptMgr->register_creature_script(CN_FROST_BREATH_TRIGGER, &FrostBreathTriggerAI::Create);
	pScriptMgr->register_creature_script(CN_FROST_BREATH_TRIGGER2, &FrostBreathTrigger2AI::Create);
	pScriptMgr->register_creature_script(CN_FROST_BREATH_TRIGGER3, &FrostBreathTrigger3AI::Create);
	pScriptMgr->register_creature_script(CN_CHILL_TRIGGER, &ChillTriggerAI::Create);
	pScriptMgr->register_creature_script(CN_SAPPHIRON, &SapphironAI::Create);

	// ---- Frostwyrm Lair ---- > Kel'thuzad Encounter:
	pScriptMgr->register_creature_script(CN_THE_LICH_KING , &TheLichKingAI::Create);
	pScriptMgr->register_creature_script(CN_SOLDIER_OF_THE_FROZEN_WASTES , &SoldierOfTheFrozenWastesAI::Create);
	pScriptMgr->register_creature_script(CN_UNSTOPPABLE_ABOMINATION , &UnstoppableAbominationAI::Create);
	pScriptMgr->register_creature_script(CN_SOUL_WEAVER , &SoulWeaverAI::Create);
	pScriptMgr->register_creature_script(CN_GUARDIAN_OF_ICECROWN , &GuardianOfIcecrownAI::Create);
	pScriptMgr->register_creature_script(CN_KELTHUZAD, &KelthuzadAI::Create);

	// ---- Go Scripts ---- >
};
