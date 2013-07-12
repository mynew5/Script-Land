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
 
/* Trial Of Champions
Information: http://www.wowhead.com/zone=4723
ISSUES: Need to have a check if alliance or horde player than spawn the correct people.
*/

class BrightStarAI : public MoonScriptCreatureAI
{
public:
	ADD_CREATURE_FACTORY_FUNCTION(BrightStarAI)
	BrightStarAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
	{
	}
	// This needs work I skipped the horses part this is the 2nd boss.
	void StartInstance(Unit* pTarget)
	{
			if(Creature * mBoss = _unit->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(746.583f, 559.018f, 435.492f, 34996))
			{
				MoonScriptCreatureAI* Tirion = dynamic_cast<MoonScriptCreatureAI *>(mBoss->GetScript());
				Tirion->Emote("Welcome champions! You have heard the call of the Argent Crusade and you boldly answered! It is here, in the Crusaders' Coliseum, that you will face your greatest challenges. Those of you who survive the rigors of the coliseum will join the Argent Crusade on its march to Icecrown Citadel.", Text_Yell, 16036);
				BossSpawnTimer = AddTimer(13000);
			}

			if(IsTimerFinished(BossSpawnTimer))
			{
				Creature * mBoss = _unit->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(746.583f, 559.018f, 435.492f, 34996);
				MoonScriptCreatureAI * Tirion = dynamic_cast<MoonScriptCreatureAI*>(mBoss->GetScript());
				// 50% chance that its the Argent Confessor Paletress or the Eadric the Pure.
				switch(rand()%2)
				{
					case 1:
						Tirion->SpawnCreature(34928, 746.974f, 636.627f, 411.572f, 4.66f); // Argent Confessor Paletress
						Tirion->SpawnCreature(35309, 722.880f, 630.767f, 411.781f, 5.21f); // Adds Right Side (Argent LightWelder)
						Tirion->SpawnCreature(35305, 724.252f, 632.047f, 411.775f, 5.31f); // Adds Right Side (Argent Monk)
						Tirion->SpawnCreature(35307, 725.394f, 633.517f, 411.775f, 5.26f); // Adds Right Side (Argent Priestess)
						Tirion->SpawnCreature(35309, 759.615f, 639.582f, 411.742f, 4.55f); // Adds Left Side (Argent LightWelder)
						Tirion->SpawnCreature(35305, 756.946f, 639.834f, 411.716f, 4.50f); // Adds Left Side (Argent Monk)
						Tirion->SpawnCreature(35307, 761.847f, 639.304f, 411.763f, 4.45f); // Adds Left Side (Argent Priestess)
						break;
					case 2: // NOT SURE IF HE SPAWNS WITH ADDS LIKE PALETRESS DOES
						Tirion->SpawnCreature(35119, 746.974f, 636.627f, 411.572f, 4.66f); // Eadric the Pure
						break;
				}
			}
	}
private:
	int32 BossSpawnTimer;
};

class BrightStarGossip : public Arcemu::Gossip::Script
{
	public:
		void OnHello(Object* pObject, Player* Plr)
		{
			Arcemu::Gossip::Menu::SendQuickMenu(pObject->GetGUID(), 1, Plr, 1, Arcemu::Gossip::ICON_CHAT, "I would like to start the Trial of the Champion");
		}

		void OnSelectOption(Object* pObject, Player*  Plr, uint32 Id, const char* Code)
		{
			if(Id == 1)
			{
				if(BrightStarAI* pBrightStar = TO< BrightStarAI* >(TO_CREATURE(pObject)->GetScript()))
					pBrightStar->StartInstance((Unit*)pBrightStar);
					Plr->Gossip_Complete();
					//Unit*pBrightStar->GetAIInterface()->MoveJump(732.578f, 670.763f, 412.374f);
			}
		}
};

enum BlackKnightData{
	NPC_BLACK			= 35451,
	SPELL_ICYTOUCH		= 67718,
	SPELL_OBLIT			= 67725,
	SPELL_PLAGUE		= 67724,
	SPELL_ARMY			= 67761, // PHASE 2 SPELL
	SPELL_BP			= 67722, // PHASE 2 SPELL
	SPELL_DESCECRATION	= 67778, // PHASE 2 SPELL
	SPELL_DEATHBITE		= 67808 // PHASE 3 SPELL
};

class BlackKnightAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(BlackKnightAI)
		BlackKnightAI(Creature* pCreature) : MoonScriptBossAI(pCreature)
		{
			AddPhaseSpell(1, AddSpell(SPELL_ICYTOUCH, Target_Current, 30, 0, 0));
			AddPhaseSpell(1, AddSpell(SPELL_OBLIT, Target_Current, 45, 0, 4));
			AddPhaseSpell(1, AddSpell(SPELL_PLAGUE, Target_Current, 45, 0, 3));
			Army = AddPhaseSpell(2, AddSpell(SPELL_ARMY, Target_Self, 0, 6, 0));
			AddPhaseSpell(2, AddSpell(SPELL_BP, Target_Current, 45, 6, 2));
			AddPhaseSpell(2, AddSpell(SPELL_ICYTOUCH, Target_Current, 30, 0, 0));
			AddPhaseSpell(2, AddSpell(SPELL_DESCECRATION, Target_Current, 45, 0, 10));
			AddPhaseSpell(3, AddSpell(SPELL_DEATHBITE, Target_Current, 45, 0, 7));

			AddEmote(Event_OnCombatStart, "This farce ends here!", Text_Yell, 0); // need sound ID
			AddEmote(Event_OnTargetDied, "A waste of flesh.", Text_Yell, 0); // need sound
			AddEmote(Event_OnTargetDied, "Pathetic.", Text_Yell, 0); // need sound
			AddEmote(Event_OnDied, "No! I must not fail... again...", Text_Yell, 0);
		}

		void OnLoad()
		{
			SetDisplayWeaponIds(40343, 0);
		}

		void AIUpdate()
		{
			if(GetPhase() == 1 && GetHealthPercent() <= 8)
			{
				_unit->SetDisplayId(29846);
				_unit->SetHealthPct(100);
				SetDisplayWeaponIds(40343, 0);
				Emote("My rotting flesh was just getting in the way!", Text_Yell, 0);// need sound
				SetPhase(2, Army);
			}
			
			if(GetPhase() == 2 && GetHealthPercent() <= 8)
			{
				_unit->SetDisplayId(21300);
				_unit->SetHealthPct(100);
				SetDisplayWeaponIds(0, 0);
				Emote("I have no need for bones to best you!", Text_Yell, 0);// need sound
				SetPhase(3);
			}
			MoonScriptBossAI::AIUpdate();
		}
private:
	SpellDesc * Army;
};

enum PUREData{
	NPC_PURE			= 35119,
	SPELL_HOJ			= 66863,
	SPELL_HOTR			= 66867,
	SPELL_RADIANCE		= 66935
};

class PureAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(PureAI)
		PureAI(Creature* pCreature) : MoonScriptBossAI(pCreature)
		{
			AddPhaseSpell(1, AddSpell(SPELL_HOJ, Target_Current, 30, 0, 8));
			AddPhaseSpell(1, AddSpell(SPELL_HOTR, Target_RandomPlayer, 26, 2.5, 10, 0, 0, false, "Hammer of the Righteous!", Text_Yell, 16136));
			AddPhaseSpell(1, AddSpell(SPELL_RADIANCE, Target_Current, 60, 3, 15, 0, 0, false, "Eadric the Pure begins to radiate light. Shield your eyes!", Text_Emote, 0)); // http://www.youtube.com/watch?v=4Ml5C0NyGSM at 0:12.

			AddEmote(Event_OnCombatStart, "Prepare yourselves!", Text_Yell, 16135);
			AddEmote(Event_OnTargetDied, "You... You need more practice.", Text_Yell, 16137);
			AddEmote(Event_OnTargetDied, "Nay! Nay! And I say yet again nay! Not good enough!", Text_Yell, 16138);
		}

		void OnLoad()
		{
			Emote("Are you up to the challenge? I will not hold back.", Text_Say, 16134);
				// Weapon & Shield
				SetDisplayWeaponIds(40395, 30882);
		}

		void AIUpdate()
		{
			if(GetPhase() == 1 && GetHealthPercent() < 5)
			{
				_unit->WipeHateList();
				_unit->SetFaction(35);
				Emote("I yield! I submit. Excellent work. May I run away now?", Text_Yell, 16139);
				// Not suppose to "jump" despawn, he is suppose to walk off the floor then despawn.
				_unit->GetAIInterface()->MoveJump(747.365f, 692.113f, 412.351f);
				_unit->GetMapMgr()->GetInterface()->SpawnGameObject(195375, 740.981f, 618.552f, 411.172f, 1.49f, true, 0, 0, 1);
				_unit->Despawn(10000, 0);
				SetPhase(4);
			}
			MoonScriptBossAI::AIUpdate();
		}
};

enum PALETRESSData{
	NPC_PALETRESS		= 34928,
	SPELL_HOLYSMITE		= 66536,
	SPELL_HOLYNOVA		= 66546,
	SPELL_REFLECTSHIELD	= 66515,
	SPELL_RENEW			= 66537,
	SPELL_MEMORY		= 66543,
	SPELL_CONFESS		= 66680
};

class PaletressAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(PaletressAI)
		PaletressAI(Creature* pCreature) : MoonScriptBossAI(pCreature)
		{
			AddSpell(SPELL_HOLYSMITE, Target_RandomPlayer, 60, 2, 0);
			AddSpell(SPELL_HOLYNOVA, Target_Self, 40, 0, 10);
			AddSpell(SPELL_RENEW, Target_Self, 10, 1, 15);
			Confess = AddSpell(SPELL_CONFESS, Target_Self, 0, 5, 0);

			AddEmote(Event_OnCombatStart, "Well then, let us begin.", Text_Yell, 16247);
			AddEmote(Event_OnTargetDied, "Take your rest.", Text_Yell, 16250);
			AddEmote(Event_OnTargetDied, "Be at ease.", Text_Yell, 16251);
		}

		void OnLoad()
		{
			SetDisplayWeaponIds(812, 0);// Isn't the right staff but it will for now can't find her real staff
		}

		void AIUpdate()
		{
			if(GetPhase() == 1 && GetHealthPercent() <= 50)
			{
				_unit->CastSpell(_unit, SPELL_REFLECTSHIELD, true);
				Emote("Take this time to consider your past deeds.", Text_Yell, 16248);
				//need correction, it should be spawned in center of coliseum
				SpawnCreature(34942);
				SetPhase(2, Confess);
			}

			if(GetPhase() == 3 && GetHealthPercent() < 5)
			{
				_unit->WipeHateList();
				_unit->SetFaction(35);
				Emote("Excellent work!", Text_Yell, 16252);
				// Not suppose to "jump" despawn, she is suppose to walk off the floor then despawn.
				_unit->GetAIInterface()->MoveJump(747.365f, 692.113f, 412.351f);
				_unit->GetMapMgr()->GetInterface()->SpawnGameObject(195323, 748.76f, 618.309f, 411.089f, 1.58f, true, 0, 0, 1);
				_unit->Despawn(10000, 0);
				SetPhase(4);
			}
			MoonScriptBossAI::AIUpdate();
		}

	private:
		SpellDesc * Confess;
};

class MemoryAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(MemoryAI)
		MemoryAI(Creature* pCreature) : MoonScriptBossAI(pCreature)
		{
		}

		void OnDied(Unit * mKiller)
		{
			if(Creature * mBoss = _unit->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(_unit->GetPositionX(), _unit->GetPositionY(), _unit->GetPositionZ(), NPC_PALETRESS))
			{
				MoonScriptBossAI * pBoss = dynamic_cast<MoonScriptBossAI*>(mBoss->GetScript());
				pBoss->RemoveAura(SPELL_REFLECTSHIELD);
				pBoss->Emote("Even the darkest memory fades when confronted.", Text_Yell, 16249);
				pBoss->SetPhase(3);
			}
			MoonScriptBossAI::OnDied(mKiller);
		}
};

void SetupTrialOfChampionHold(ScriptMgr * mgr)
{
	 mgr->register_creature_script(NPC_PALETRESS, &PaletressAI::Create);
	 mgr->register_creature_script(34942, &MemoryAI::Create);
	 mgr->register_creature_gossip(35005, new BrightStarGossip);
	 mgr->register_creature_script(35005, &BrightStarAI::Create);
	 mgr->register_creature_script(NPC_PURE, &PureAI::Create);
	 mgr->register_creature_script(NPC_BLACK, &BlackKnightAI::Create);
}
 