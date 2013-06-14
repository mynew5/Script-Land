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

class ForgeOfSoulsScript : public MoonInstanceScript
{
	public:
		ADD_INSTANCE_FACTORY_FUNCTION(ForgeOfSoulsScript)
		ForgeOfSoulsScript(MapMgr* pMapMgr) : MoonInstanceScript(pMapMgr){}

		void OnPlayerEnter(Player* pPlayer)
		{
			pPlayer->CastSpell(pPlayer, pPlayer->GetTeam() == TEAM_ALLIANCE ? 55773 : 55774, true);
		}
};

//TODO: Script Devourer of Souls
	 
// Bronjahm
enum BronjahmData{
	NPC_BRONJAHM		= 36497,
	SPELL_MAGICBANE		= 68793,
	SPELL_CORRUPT_SOUL	= 68839,
	SPELL_CONSUME_SOUL	= 68858,
	SPELL_FEAR			= 68950,
	SPELL_SHADOW_BOLT	= 70043,
	SPELL_SOULSTORM		= 68872,
	SPELL_TELEPORT		= 68988
};

class BronjahmAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(BronjahmAI)
		BronjahmAI(Creature* pCreature) : MoonScriptBossAI(pCreature)
		{
			AddSpell(SPELL_MAGICBANE, Target_Current, 35, 0, 5);
			AddSpell(SPELL_SHADOW_BOLT, Target_Current, 30, 1, -1);
			SoulStorm = AddSpell(SPELL_SOULSTORM, Target_Self, 0, 4, 0, 0, 0, true, "The vortex of the harvested calls to you!", Text_Yell, 16599);
			AddPhaseSpell(2, AddSpell(SPELL_FEAR, Target_RandomPlayer, 40, 0, -1));

			AddEmote(Event_OnCombatStart, "Finally... a captive audience!", Text_Yell, 16595);
			AddEmote(Event_OnTargetDied, "Fodder for the engine!", Text_Yell, 16596);
			AddEmote(Event_OnTargetDied, "Another soul to strengthen the host!", Text_Yell, 16597);
			AddEmote(Event_OnDied, "My soul for you, master.", Text_Yell, 16598);
			CorruptedSoulTimer = SpawnTimer = -1;
		}

		void OnCombatStart(Unit * pAttacker)
		{
			CorruptedSoulTimer = AddTimer(25+rand()%11);
			MoonScriptBossAI::OnCombatStart(pAttacker);
		}

		void AIUpdate()
		{
			if(IsTimerFinished(CorruptedSoulTimer))
			{
				Unit * pTarget = GetBestPlayerTarget(TargetFilter_Closest);
				if(!pTarget)
					return;

				_unit->CastSpell(pTarget, SPELL_CORRUPT_SOUL, true);

				SpawnTimer = AddTimer(4*SEC_IN_MS);
				if(IsTimerFinished(SpawnTimer))
				{
					Emote("I will sever your soul from your body!", Text_Yell, 16595);
					SpawnCreature(36535, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ());
					RemoveTimer(SpawnTimer);
				}
			}

			if(GetHealthPercent() == 30 && GetPhase() == 1)
			{
				_unit->CastSpell(_unit, SPELL_TELEPORT, true);
				SetPhase(2, SoulStorm);
			}
			MoonScriptBossAI::AIUpdate();
		}

	private:
		int32 CorruptedSoulTimer, SpawnTimer;
		SpellDesc * SoulStorm;
};

class SoulFragmentAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(SoulFragmentAI)
		SoulFragmentAI(Creature* c) : MoonScriptCreatureAI(c){}

		void OnLoad()
		{
			if(Unit * Boss = ForceCreatureFind(NPC_BRONJAHM))
			{
				_unit->GetAIInterface()->SetUnitToFollow(Boss);
				SetAIUpdateFreq(1*SEC_IN_MS);
			}
			else
				Despawn();
		}

		void AIUpdate()
		{
			if(Unit * Boss = ForceCreatureFind(NPC_BRONJAHM))
			{
				if(GetRangeToUnit(Boss) <= 2.0f)
				{
					Boss->CastSpell(Boss, SPELL_CONSUME_SOUL, true);
					Despawn();
				}
			}
			MoonScriptCreatureAI::AIUpdate();
		}
};

// Devourer of Souls
//ISSUES: Unleash souls & wailing souls shouldn't be done in phases but time-wise
enum DevourerData{
	NPC_DEVOURER		= 36502,
	SPELL_MIRRORSOUL	= 69051,
	SPELL_BLAST			= 68982,
	SPELL_UNLEASHSOULS	= 68939,
	SPELL_WAILSOULS		= 68899,
	SPELL_WELLSOULS		= 68820,
};

class DevourerAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(DevourerAI)
		DevourerAI(Creature* pCreature) : MoonScriptBossAI(pCreature)
		{
			AddSpell(SPELL_BLAST, Target_RandomPlayer, 45, 0, 3);
			AddSpell(SPELL_WELLSOULS, Target_RandomPlayer, 50, 0, 8);
			AddSpell(SPELL_MIRRORSOUL, Target_RandomPlayer, 30, 0, 15);
			AddPhaseSpell(2, AddSpell(SPELL_UNLEASHSOULS, Target_Self, 70, 0, 30));
			AddPhaseSpell(3, AddSpell(SPELL_WAILSOULS, Target_Self, 70, 0, 30));

			AddEmote(Event_OnCombatStart, "You dare look upon the host of souls? I SHALL DEVOUR YOU WHOLE!", Text_Yell, 16884);
			AddEmote(Event_OnTargetDied, "Doomed for eternity!", Text_Yell, 16897);
			AddEmote(Event_OnDied, "The swell of souls will not be abated! You only delay the inevitable!", Text_Yell, 16887);
		}

		void AIUpdate()
		{
			if(GetHealthPercent() == 75 && GetPhase() == 1)
			{
				Emote("SUFFERING! ANGUISH! CHAOS! RISE AND FEED!", Text_Yell, 16888);
				SetPhase(2);
			}
			else if(GetHealthPercent() == 50 && GetPhase() == 2)
			{
				Emote("Stare into the abyss, and see your end!", Text_Yell, 16889);
				SetPhase(3);
			}
			MoonScriptBossAI::AIUpdate();
		}
};

void SetupForgeOfSouls(ScriptMgr * mgr)
{
	mgr->register_instance_script(632, &ForgeOfSoulsScript::Create);
	mgr->register_creature_script(NPC_BRONJAHM, &BronjahmAI::Create);
	mgr->register_creature_script(36535, &SoulFragmentAI::Create);
	mgr->register_creature_script(NPC_DEVOURER, &DevourerAI::Create);
}