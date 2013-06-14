/* Copyright (C) 2006 - 2008 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

/* ScriptData
SDName: Lethon
SD%Complete: 100
SDComment: 
SDCategory: Bosses
EndScriptData */

#include "ScriptedPch.h"

//Spells of Lethon

#define SPELL_DRAWSPIRIT		24811
#define SPELL_NOXIOUSBREATH		24818
#define SPELL_SLEEPINGFOG		24813
#define SPELL_SHADOWBOLTWHIRL	24834
#define SPELL_SUMMONPLAYER		24776
#define SPELL_TAILSWEEP			15847
//#define SPELL_MARKOFNATURE		25040               // Not Working

struct boss_lethonAI : public ScriptedAI
{
    boss_lethonAI(Creature *c) : ScriptedAI(c) {}

	uint32 DrawSpirit_Timer;
	uint32 NoxiousBreath_Timer;
	uint32 SleepingFog_Timer;
	uint32 ShadowBoltWhirl_Timer;
	//uint32 SummonPlayer_Timer;
	uint32 TailSweep_Timer;

	void Reset()
	{
		DrawSpirit_Timer = 30000;
		NoxiousBreath_Timer = 45000;
		SleepingFog_Timer = 40000;
		ShadowBoltWhirl_Timer = 20000;
		TailSweep_Timer = 10000;
	}

	void Aggro(Unit *who)
	{
	}

	void UpdateAI(const uint32 diff)
	{
        //Return since we have no target
        if (!UpdateVictim())
            return;

		//Draw Spirit Timer
		if (DrawSpirit_Timer < diff)
		{
			if( Unit *target = SelectUnit(SELECT_TARGET_RANDOM,0) )
			    DoCast(target,SPELL_DRAWSPIRIT);

			DrawSpirit_Timer = 22000;
		}else DrawSpirit_Timer -= diff;

		//Tail Sweep
		if (TailSweep_Timer < diff)
        {
            if( Unit *target = SelectUnit(SELECT_TARGET_RANDOM,0) )
                DoCast(target,SPELL_TAILSWEEP);

            TailSweep_Timer = 15000;
        }else TailSweep_Timer -= diff;

	//Noxious Breath
	if (NoxiousBreath_Timer < diff)
        {
            DoCast(me->getVictim(),SPELL_NOXIOUSBREATH);
            NoxiousBreath_Timer = 10000;
        }else NoxiousBreath_Timer -= diff;

		//Sleeping Fog Timer
		if (SleepingFog_Timer < diff)
		{
			if( Unit *target = SelectUnit(SELECT_TARGET_RANDOM,0) )
				DoCast(target, SPELL_SLEEPINGFOG);

			SleepingFog_Timer = 18000;
		}else SleepingFog_Timer -= diff;

		//Shadow Bolt Whirl
		if (ShadowBoltWhirl_Timer < diff)
		{
			DoCast(me->getVictim(),SPELL_SHADOWBOLTWHIRL);
			ShadowBoltWhirl_Timer = 12000;
		}else ShadowBoltWhirl_Timer -= diff;

		DoMeleeAttackIfReady();
	}
};
CreatureAI* GetAI_boss_lethon(Creature *_Creature)
{
    return new boss_lethonAI (_Creature);
}

void AddSC_boss_lethon()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="boss_lethon";
    newscript->GetAI = &GetAI_boss_lethon;
    newscript->RegisterSelf();
}
