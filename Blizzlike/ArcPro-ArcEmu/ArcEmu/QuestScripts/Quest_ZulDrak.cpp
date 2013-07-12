/*
 * WhyScripts Scripts for Ascent MMORPG Server
 * Copyright (C) 2010 WhyDB Team <http://www.whydb.org/>
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

class QuetzLunGate : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(QuetzLunGate)
		QuetzLunGate(Creature* pCreature) : MoonScriptCreatureAI(pCreature){};

		void OnLoad()
		{
			Player * pPlayer = GetNearestPlayer();

			if(pPlayer)
			{
				uint32 quests[] = { 12667, 12672, 12668, 12674, 12675, 0 };
				QuestLogEntry * en;
				bool has_quest = false;
				for( int i = 0; i < 6; i++ )
				{
					en = pPlayer->GetQuestLogForEntry( quests[i] );

					if(en != NULL)
					{
						has_quest = true;
						break;
					}
				}

				if( !has_quest )
				{
					pPlayer->RemoveAura(51671);
					return;
				}

				pPlayer->CastSpell(pPlayer, 51671, true);
			}
		}
};

class QuetzLunWorshipper : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(QuetzLunWorshipper)
		QuetzLunWorshipper(Creature* pCreature) : MoonScriptCreatureAI(pCreature){};

		void OnDeath(Unit * killer)
		{
			Player * p = TO_PLAYER(killer);

			QuestLogEntry * q = p->GetQuestLogForEntry(12668);
			if( !q )
				return;

			GameObject * go = GetNearestGameObject(190707);
			if( go )
			{
				float range = GetRangeToObject(go);
				if( range <= 10.0f )
				{
					q->SetMobCount(0, (q->GetMobCount(0))+1);
					q->SendUpdateAddKill(0);
					q->UpdatePlayerFields();
				}
			}
		}
};

class TheLeaders : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(TheLeaders)
		TheLeaders(Creature* pCreature) : MoonScriptCreatureAI(pCreature){};

		void OnDied(Unit * killer)
		{
			Player * p = TO_PLAYER(killer);

			QuestLogEntry * q = p->GetQuestLogForEntry(12622);
			if( !q )
				return;

			// dunno what chance is, in quest that after many kills they will appear
			// for me first appeared after around 20 kills
			// second appeared after about 10 kills
			// and last appeared after about 30 - 40 kills

			if(rand()%2)
			{
				uint32 ids[] = { 193769, 193770, 193768, 0 };

				// find nearest totem
				float dist = 100, dist2 = 100;
				GameObject *pGo = NULL, *pGofin = NULL;
				for( uint8 i = 0; i < 3; i++ )
				{
					pGo = GetNearestGameObject(ids[i]);
					if( !pGo )
						continue;

					dist = GetRangeToObject( pGo );
					if( dist < dist2 )
					{
						dist2 = dist;
						pGofin = pGo;
					}
				}

				if( dist2 > 50.0f || !pGofin)
					return;

				switch( pGofin->GetEntry() )
				{
					case 193768: SpawnCreature(28496, 5514.06f, -3418.86f, 350.327f, 5.3f); break; // spawn chulo the mad
					case 193769: SpawnCreature(28495, 5602.1f, -3496.47f, 350.328f, 2.43f); break; // spawn Gawanil
					case 193770: SpawnCreature(28494, 5552.57f, -3465.25f, 350.33f, 0.78f); break; // spawn Kutube'sa
				}
			}
		}
};

class LeadersSpawnChest : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(LeadersSpawnChest)
		LeadersSpawnChest(Creature* pCreature) : MoonScriptCreatureAI(pCreature){};

		void OnDied(Unit * killer)
		{
			Player * p = TO_PLAYER(killer);

			QuestLogEntry * q = p->GetQuestLogForEntry(12622);
			if( !q )
				return;
/*
			switch( GetUnit()->GetEntry() )
			{
				// spawn Chulo the Mad's chest
				case 28496:
					sEAS.SpawnGameobject(GetUnit(), 190612, GetUnit()->GetPositionX()+1.0f, GetUnit()->GetPositionY()+1.0f, GetUnit()->GetPositionZ(), 3*60*1000);
				break;
				// spawn Gawanil's chest
				case 28495:
					sEAS.SpawnGameobject(GetUnit(), 190613, GetUnit()->GetPositionX()+1.0f, GetUnit()->GetPositionY()+1.0f, GetUnit()->GetPositionZ(), 3*60*1000);
				break;
				// spawn Kutube'sa's chest
				case 28494:
					sEAS.SpawnGameobject(GetUnit(), 190614, GetUnit()->GetPositionX()+1.0f, GetUnit()->GetPositionY()+1.0f, GetUnit()->GetPositionZ(), 3*60*1000);
				break;
			}
			*/
		}
};

class Bloodrose : public GossipScript
{
public:

	void GossipHello(Object *pObject, Player *Plr, bool AutoSend)
	{
		GossipMenu *Menu;
		objmgr.CreateGossipMenuForPlayer( &Menu, pObject->GetGUID(), 13290, Plr );

		if( (Plr->HasQuest(12637) && Plr->GetQuestLogForEntry(12637)->GetMobCount(0) == 0 ) 
			|| (Plr->HasQuest(12638) && Plr->GetQuestLogForEntry(12638)->GetMobCount(0) == 0) )
			Menu->AddItem( 0, "Stefan told me you would demonstrate the purpose of this item.", 1 );

		if( AutoSend )
			Menu->SendTo( Plr );
	}

	void GossipSelectOption(Object *pObject, Player *Plr, uint32 Id, uint32 IntId, const char *EnteredCode)
	{
		// she has also quest ;)
		if( IntId == 1 )
		{
			Plr->Gossip_Complete();
			Creature * cr = TO_CREATURE(pObject);
			Plr->CastSpell(Plr, 51949, true);

			cr->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "Indeed. Watch this, $R.");

			CreatureAIScript * ai = cr->GetScript();
			if( ai )
				ai->RegisterAIUpdateEvent(1000);
		}
	}
};

class BloodroseQuestAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(BloodroseQuestAI)
		BloodroseQuestAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			phase = 1;
		}

		void AIUpdate()
		{
			Creature * cr = _unit->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(_unit->GetPositionX(), _unit->GetPositionY(), _unit->GetPositionZ(), 28541);
			if( phase == 1 )
			{
				MoveTo(5203.76f, -1317.89f, 242.48f, 4.96f, false);
				timer = AddTimer(3000);
				phase = 2;
			}
			else if( IsTimerFinished(timer) && phase == 2 )
			{
				RemoveTimer(timer);
				phase = 3;
				timer = AddTimer(3000);
				Emote("Here, troll... a gift!", Text_Say, 0);
				if( !cr )
					return;

				cr->SetFacing(1.73f);
			}
			else if( IsTimerFinished(timer) && phase == 3 )
			{
				if( !cr )
					return;

				RemoveTimer(timer);
				phase = 4;
				timer = AddTimer(3000);
				cr->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "For me? Really, mon?");
			}
			else if( IsTimerFinished(timer) && phase == 4 )
			{
				if( !cr )
					return;

				RemoveTimer(timer);
				phase = 5;
				timer = AddTimer(3000);
				cr->SendChatMessage(CHAT_MSG_MONSTER_SAY, LANG_UNIVERSAL, "It....it be beautiful!");
			}
			else if( IsTimerFinished(timer) && phase == 5)
			{
				if( !cr )
					return;

				RemoveTimer(timer);
				phase = 6;
				timer = AddTimer(3000);
				cr->CastSpell(cr, 43166, true); // probably bad spell id
				cr->SetDisplayId(28283);
				
			}
			else if( IsTimerFinished(timer) && phase == 6)
			{
				if( !cr )
					return;

				RemoveTimer(timer);
				float x = GetUnit()->m_spawn->x;
				float y = GetUnit()->m_spawn->y;
				float z = GetUnit()->m_spawn->z;
				float o = GetUnit()->m_spawn->o;
				MoveTo(x,y,z,o,false);
				Emote("Ugh... disgusting!", Text_Say, 0);
				
				phase = 7;
				timer = AddTimer(15000);
			}
			else if( IsTimerFinished(timer) && phase == 7 )
			{
				if( !cr )
					return;

				RemoveTimer(timer);
				cr->DeMorph();
				phase = 1;
				RemoveAIUpdateEvent();
			}
		}

	private:
		uint8 phase;
		int32 timer;
};

class DecaingGhoulQuestAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(DecaingGhoulQuestAI)
		DecaingGhoulQuestAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			running = false;
		}

		void OnLoad()
		{
			// we must do it this way :/
			RegisterAIUpdateEvent(1000);
		}

		void AIUpdate()
		{
			// if we are in timer and cretaure should return
			// we dont need to go trough other checks
			if( IsTimerFinished(return_timer) )
			{
				Return();
				return;
			}

			// check for gameobject
			GameObject * go = GetNearestGameObject(190656);
			if( !go )
				return;

			// no bigger range
			if( GetRangeToObject(go) > 25.0f )
				return;

			// we are using go flags internally to check if bowl have been already used
			if( go->GetUInt32Value(GAMEOBJECT_FLAGS) != 0 )
				return;

			// check for player, who created this bowl
			Player * plr = TO_PLAYER(GetUnit()->GetMapMgr()->GetUnit(go->GetUInt64Value(OBJECT_FIELD_CREATED_BY)));
			if( !plr )
				return;

			// check for quest
			QuestLogEntry * ql = plr->GetQuestLogForEntry(12652);
			if( !ql )
				return;

			// already finished this quest
			if( ql->GetMobCount(0) == 10 )
				return;

			// if we are in close range, update quest mobcount
			if( GetRangeToObject(go) < 3.0f )
			{
				ql->SetMobCount(0, ql->GetMobCount(0)+1);
				ql->SendUpdateAddKill(0);
				ql->UpdatePlayerFields();
				// doesnt really matter which flag we will set up for this go
				go->SetUInt32Value(GAMEOBJECT_FLAGS, 4);
				return_timer = AddTimer(10000);
				return;
			}

			// already moving to target
			if( running )
				return;

			running = true;
			float x = go->GetPositionX()+0.5f;
			float y = go->GetPositionY()+0.5f;
			float z = go->GetPositionZ();

			// once they spotted bowl, they were not attacking me
			SetCanEnterCombat(false);
			// move to bowl destination
			MoveTo(x,y,z);
		}

		void Return()
		{
			RemoveTimer(return_timer);

			// return to spawn coords
			float x = GetUnit()->m_spawn->x;
			float y = GetUnit()->m_spawn->y;
			float z = GetUnit()->m_spawn->z;
			float o = GetUnit()->m_spawn->o;

			// restart movement
			GetUnit()->GetAIInterface()->SetAIState(STATE_IDLE);
			GetUnit()->GetAIInterface()->WipeHateList();
			GetUnit()->GetAIInterface()->WipeTargetList();
			MoveTo(x, y, z, o);
			SetCanEnterCombat(true);
		}

	private:
		bool running;
		int32 return_timer;
};

class Gorebag : public GossipScript
{
public:

	void GossipHello(Object *pObject, Player *Plr, bool AutoSend)
	{
		GossipMenu *Menu;
		objmgr.CreateGossipMenuForPlayer( &Menu, pObject->GetGUID(), 13326, Plr );

		if( Plr->HasQuest(12637) && Plr->GetQuestLogForEntry(12637)->GetMobCount(0) == 0 )
			Menu->AddItem( 0, "Uhh, can you send me on the tour of Zul'Drak?", 1 );

		if( AutoSend )
			Menu->SendTo( Plr );
	}

	void GossipSelectOption(Object *pObject, Player *Plr, uint32 Id, uint32 IntId, const char *EnteredCode)
	{
		Plr->Gossip_Complete();
		Plr->GetQuestLogForEntry(12637)->SendQuestComplete();
		// there is no taxi path for this?
		/*TaxiPath *path = sTaxiMgr.GetTaxiPath( 1053 );
		Plr->TaxiStart( path, 26308, 0 );*/
	}
};

// these 2 scripts are not working cuz he's mount is vehicle, not mount only and i cant fly
bool SummonStefan(uint32 i, Spell * pSpell)
{
	Player * plr = pSpell->p_caster;
	if( !plr )
		return false;

	if( plr->GetAreaID() != 4315 )
		return false;

	sEAS.SpawnCreature(plr, 28518, plr->GetPositionX(), plr->GetPositionY(), plr->GetPositionZ(), plr->GetOrientation(), 60*1000);
	return true;
};

class StefanVaduQuestAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(StefanVaduQuestAI)
		StefanVaduQuestAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature){};

		void OnLoad()
		{
			if( _unit->GetMapMgr()->GetAreaID( _unit->GetPositionX(), _unit->GetPositionY()) == 4315 )
			{
				_unit->SetMount(26595);
				//SetFlyMode(true);
				SetCanEnterCombat(false);
				/*Player * plr = TO_PLAYER(GetUnit()->GetMapMgr()->GetUnit(_unit->GetUInt64Value(OBJECT_FIELD_CREATED_BY)));
				if( !plr )
					return;*/

				//MoveTo(plr->GetPositionX(), plr->GetPositionY(), plr->GetPositionZ(), plr->GetOrientation(), false);
				RegisterAIUpdateEvent(1000);
				timer = AddTimer(45000);
			}
		}

		void AIUpdate()
		{
			if( IsTimerFinished(timer) )
			{
				RemoveTimer(timer);
				//MoveTo(_unit->GetPositionX(), _unit->GetPositionY(), _unit->GetPositionZ()+20.0f, _unit->GetOrientation(), false);
				RemoveAIUpdateEvent();
				return;
			}
		}

	private:
		int32 timer;
};

class HebJinDrum : public GameObjectAIScript
{
	public:
		ADD_GAMEOBJECT_FACTORY_FUNCTION(HebJinDrum);
		HebJinDrum(GameObject *goinstance) : GameObjectAIScript(goinstance) {}

		void OnActivate(Player * pPlayer)
		{
			Creature * cr = pPlayer->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(pPlayer->GetPositionX(), pPlayer->GetPositionY(), 0, 28636);
			if( cr )
				return;

			sEAS.SpawnCreature(pPlayer, 28636, 5988.72f, -3878.04f, 425.14f, 2.3f, 5*60*1000);
		}
};

class HebJinAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(HebJinAI)
		HebJinAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			phase = 1;

			AddSpell(12734, Target_Current, 75, 0, 15);
			AddSpell(12555, Target_Current, 60, 0, 10);
			AddSpell(15548, Target_Current, 60, 0, 15);
		}

		void OnLoad()
		{
			_unit->SetMount(11829);
			SetFlyMode(true);
			MoveTo(5917.68f, -3813.49f, 363.52f, 2.31f, false);
			timer = AddTimer(8000);
			RegisterAIUpdateEvent(1000);
			Emote("Who's that beatin' on my drum?", Text_Yell, 0);
		}

		void OnCombatStop(Unit * pTarget)
		{
			phase = 1;
		}

		void AIUpdate()
		{
			if( IsTimerFinished(timer) && phase == 1 )
			{
				RemoveTimer(timer);
				phase = 2;
				timer = AddTimer(3000);
				Player * plr = TO_PLAYER(GetUnit()->GetMapMgr()->GetUnit(_unit->GetUInt64Value(UNIT_FIELD_SUMMONEDBY)));
				if( !plr )
					return;

				Emote("I'm gonna come down there and kill you good, $R!", Text_Yell, 0);
			}else if( IsTimerFinished(timer) && phase == 2 )
			{
				RemoveTimer(timer);
				phase = 3;
				_unit->SetMount(0);
				SetFlyMode(false);
				Emote("Now you gonna die!", Text_Yell, 0);
				if(MoonScriptCreatureAI* pSummon = SpawnCreature(28639, _unit->GetPositionX()-3.0f, _unit->GetPositionY()-3.0f, 364.82f, 2.47f))
					pSummon->Despawn(MINUTE*6*SEC_IN_MS);
				AggroNearestPlayer();
			}
		}

	private:
		uint8 phase;
		int32 timer;
};

bool DiluteCauldron(uint32 i, Spell * pSpell)
{
	Player * plr = pSpell->p_caster;
	if( !plr )
		return false;

	Creature * cr = plr->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(plr->GetPositionX(), plr->GetPositionY(), plr->GetPositionZ(), 28739);
	if( !cr )
		return false;

	if( plr->CalcDistance(cr) > 10.0f )
	{
		pSpell->SendCastResult(SPELL_FAILED_OUT_OF_RANGE);
		return false;
	}

	if( cr->HasAura(52231) )
		return false;

	QuestLogEntry * ql = plr->GetQuestLogForEntry(12669);
	if( !ql )
		return false;

	ql->SetMobCount(1, ql->GetMobCount(1)+1);
	ql->SendUpdateAddKill(1);
	ql->UpdatePlayerFields();

	cr->CastSpell(cr, 52231, true);

	return true;
};

/*bool HarvestBlightCrystal(uint32 i, Spell * pSpell)
{
	Unit * u = pSpell->u_caster;
	if( !u )
		return false;

	GameObject * go = u->GetMapMgr()->GetInterface()->GetGameObjectNearestCoords(u->GetPositionX(), u->GetPositionY(), u->GetPositionZ(), 28739);
	if( !go )
		return false;

	if( u->CalcDistance(go) > 15.0f )
	{
		return false;
	}

	if( u->HasAura(53149) )
		return false;

	Player * plr = TO_PLAYER(u->GetMapMgr()->GetUnit(u->GetCharmedByGUID()));
	if( !plr )
		return false;

	QuestLogEntry * ql = plr->GetQuestLogForEntry(12673);
	if( !ql )
		return false;

	TO_CREATURE(u)->GetScript()->RegisterAIUpdateEvent(1000);

	return true;
};*/

void SetupZulDrak( ScriptMgr * mgr )
{
	mgr->register_creature_script(28478, &QuetzLunGate::Create);
	mgr->register_creature_script(28747, &QuetzLunWorshipper::Create);
	mgr->register_creature_script(28388, &TheLeaders::Create);
	mgr->register_creature_script(28504, &TheLeaders::Create);
	mgr->register_creature_script(28496, &LeadersSpawnChest::Create);
	mgr->register_creature_script(28495, &LeadersSpawnChest::Create);
	mgr->register_creature_script(28494, &LeadersSpawnChest::Create);
	mgr->register_creature_script(28532, &BloodroseQuestAI::Create);
	mgr->register_creature_script(28565, &DecaingGhoulQuestAI::Create);
	mgr->register_creature_script(28518, &StefanVaduQuestAI::Create);
	mgr->register_creature_script(28636, &HebJinAI::Create);

	mgr->register_gameobject_script(190695, &HebJinDrum::Create);

	mgr->register_gossip_script(28532, new Bloodrose);
	mgr->register_gossip_script(28666, new Gorebag);

	mgr->register_dummy_spell(55368, &SummonStefan);

	mgr->register_dummy_spell(52227, &DiluteCauldron);

	//mgr->register_dummy_spell(52245, &HarvestBlightCrystal);
}