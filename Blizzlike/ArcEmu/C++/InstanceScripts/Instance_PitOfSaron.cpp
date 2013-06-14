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

class PitOfSaronScript : public MoonInstanceScript
{
	public:
		ADD_INSTANCE_FACTORY_FUNCTION(PitOfSaronScript)
		PitOfSaronScript(MapMgr* pMapMgr) : MoonInstanceScript(pMapMgr){}

		void OnPlayerEnter(Player* pPlayer)
		{
			pPlayer->CastSpell(pPlayer, pPlayer->GetTeam() == TEAM_ALLIANCE ? 70057 : 70056, true);
		}
};

// Forgemaster Garfrost
enum GarfrostData{
	NPC_GARFROST		= 36494,
	SPELL_PERMAFROST	= 70326,
	SPELL_FROZEBLADE	= 68774,
	SPELL_FROZEMACE		= 68785,
	SPELL_DEEPFREEZE	= 70381,
	SPELL_STOMP			= 68771,
    SPELL_CHILLINGWAVE	= 68778,
    SPELL_THROWSARONITE	= 68788
};

static Location JumpCords[]=
{
	{639.075f, -208.774f, 528.931f, 0.0f},
	{725.325f, -236.978f, 528.848f, 0.0f},
};

class GarfrostAI : public MoonScriptBossAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(GarfrostAI)
		GarfrostAI(Creature* pCreature) : MoonScriptBossAI(pCreature)
		{
			AddSpell(SPELL_THROWSARONITE, Target_RandomPlayerDestination, 20, 2, 15);
			AddPhaseSpell(2, AddSpell(SPELL_CHILLINGWAVE, Target_Current, 25, 0, 14));
			AddPhaseSpell(3, AddSpell(SPELL_DEEPFREEZE, Target_RandomPlayer, 15, 2, 20));
			AddEmote(Event_OnCombatStart, "Tiny creatures under feet, you bring Garfrost something good to eat!", Text_Yell, 16912);
			AddEmote(Event_OnTargetDied, "That one maybe not so good to eat now, stupied Garfrost! BAD! BAD!", Text_Yell, 16914);
			AddEmote(Event_OnTargetDied, "Will save.. for snack for.. for later!", Text_Yell, 16913);
			AddEmote(Event_OnDied, "Garfrost hope giant underpants clean. Save boss great shame. For later.", Text_Yell, 16915);
		}

		void AIUpdate()
		{
			if((GetPhase() == 1 && GetHealthPercent() <= 66) || (GetPhase() == 2 && GetHealthPercent() <= 33))
			{
				if(GetPhase() == 1)
					Emote("Axe too weak. Garfrost make better weapon and crush you!", Text_Yell, 16916);
				else
					Emote("Garfrost tired of puny mortals, soon your bones will FREEZE!", Text_Yell, 16917);

				_unit->CastSpell(_unit, SPELL_STOMP, false);
				_unit->GetAIInterface()->WipeHateList();
				_unit->GetAIInterface()->MoveJump(JumpCords[GetPhase()-1].x, JumpCords[GetPhase()-1].y, JumpCords[GetPhase()-1].z);

				if(GameObject * pObject = GetNearestGameObject(401006))	//forgemaster's anvil (TEMP)
					_unit->SetFacing(_unit->calcRadAngle(_unit->GetPositionX(), _unit->GetPositionY(), pObject->GetPositionX(), pObject->GetPositionY()));

				_unit->CastSpell(_unit, GetPhase() == 1 ? SPELL_FROZEBLADE : SPELL_FROZEMACE, true);
				SetPhase(GetPhase()+1);
			}
			_unit->CastSpell(_unit, SPELL_PERMAFROST, true);
			MoonScriptBossAI::AIUpdate();
		}
};

// Ick & Krick
//ISSUES:

//Scourgelord Tyrannus
//ISSUES: Need to Implement rimefangs abilities / need to add the beginning speech before he jumps off rimefang.
enum TyrannusData{
	NPC_TYRANNUS		= 36658,
	SPELL_FORCESMASH	= 69155,
	SPELL_BRAND			= 69172,
	SPELL_UNHOLYPOWER	= 69167,
};

class TyrannusAI : public MoonScriptCreatureAI
{
	public:
		ADD_CREATURE_FACTORY_FUNCTION(TyrannusAI)
		TyrannusAI(Creature* pCreature) : MoonScriptCreatureAI(pCreature)
		{
			AddSpell(SPELL_FORCESMASH, Target_Current, 55, 0, 13);
			AddSpell(SPELL_BRAND, Target_RandomPlayerNotCurrent, 45, 0, 15);
			AddSpell(SPELL_UNHOLYPOWER, Target_Self, 80, 0, 20);

			AddEmote(Event_OnCombatStart, "I shall not fail The Lich King! Come and meet your end!", Text_Yell, 16760);
			AddEmote(Event_OnDied, "Rimefang.. warn..", Text_Yell, 16763);
		}
};


void SetupPitOfSaron(ScriptMgr * mgr)
{
	mgr->register_instance_script(658, &PitOfSaronScript::Create);
	mgr->register_creature_script(NPC_GARFROST, &GarfrostAI::Create);
	mgr->register_creature_script(NPC_TYRANNUS, &TyrannusAI::Create);
}
 