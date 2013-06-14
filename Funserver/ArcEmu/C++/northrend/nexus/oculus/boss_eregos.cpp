/* Copyright (C) 2008 - 2010 TrinityCore <http://www.trinitycore.org>
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#include "ScriptedPch.h"
#include "oculus.h"

//Types of drake mounts: Ruby(Tank),  Amber(DPS),  Emerald(Healer)
//Two Repeating phases

enum Spells
{
    SPELL_ARCANE_BARRAGE                          = 50804,
    H_SPELL_ARCANE_BARRAGE                        = 59381,
    SPELL_ARCANE_VOLLEY                           = 51153,
    H_SPELL_ARCANE_VOLLEY                         = 59382,
    SPELL_ENRAGED_ASSAULT                         = 51170,
    SPELL_PLANAR_ANOMALIES                        = 57959,
    SPELL_PLANAR_SHIFT                            = 51162,
    //Yells
    SAY_AGGRO            = -1578030,
    SAY_KILL_1           = -1578031,
    SAY_KILL_2           = -1578032,
    SAY_KILL_3           = -1578033,
    SAY_DEATH            = -1578034,
    SAY_ARCANE_SHIELD    = -1578035,
    SAY_FIRE_SHIELD      = -1578036,
    SAY_NATURE_SHIELD    = -1578037,
    SAY_FRENZY           = -1578038,
    SAY_SPAWN            = -1578039
};
/*
INSERT INTO script_texts (entry,content_default,type,language) VALUES
(-1578030,'You brash interlopers are out of your element! I will ground you!',1,0),
(-1578031,'It\'s a long way down...',1,0),
(-1578032,'Back to the earth with you!',1,0),
(-1578033,'Enjoy the fall!',1,0),
(-1578034,'Savor this small victory, foolish little creatures. You and your dragon allies have won this battle. But we will win... the Nexus War.',1,0),
(-1578035,'We command the arcane! It shall not be used against us.',1,0),
(-1578036,'It is trivial to extinguish your fire!',1,0),
(-1578037,'No magic of nature will help you now!',1,0),
(-1578038,'Such insolence... such arrogance... must be PUNISHED!',1,0),
(-1578039,'Simpletons! You cannot comprehend the forces you have set in motion. The ley line conduit will not be disrupted! Your defeat shall be absolute!',6,0);
*/
/*Ruby Drake ,
(npc 27756) (item 37860)
(summoned by spell Ruby Essence = 37860 ---> Call Amber Drake == 49462 ---> Summon 27756)
*/
enum RubyDrake
{
    NPC_RUBY_DRAKE_VEHICLE                        = 27756,
    SPELL_RIDE_RUBY_DRAKE_QUE                     = 49463,          //Apply Aura: Periodic Trigger, Interval: 3 seconds ---> 49464
    SPELL_RUBY_DRAKE_SADDLE                       = 49464,          //Allows you to ride on the back of an Amber Drake. ---> Dummy
    SPELL_RUBY_SEARING_WRATH                      = 50232,          //(60 yds) - Instant - Breathes a stream of fire at an enemy dragon, dealing 6800 to 9200 Fire damage and then jumping to additional dragons within 30 yards. Each jump increases the damage by 50%. Affects up to 5 total targets
    SPELL_RUBY_EVASIVE_AURA                       = 50248,          //Instant - Allows the Ruby Drake to generate Evasive Charges when hit by hostile attacks and spells.
    SPELL_RUBY_EVASIVE_MANEUVERS                  = 50240,          //Instant - 5 sec. cooldown - Allows your drake to dodge all incoming attacks and spells. Requires Evasive Charges to use. Each attack or spell dodged while this ability is active burns one Evasive Charge. Lasts 30 sec. or until all charges are exhausted.
    //you do not have acces to until you kill Mage-Lord Urom
    SPELL_RUBY_MARTYR                             = 50253          //Instant - 10 sec. cooldown - Redirect all harmful spells cast at friendly drakes to yourself for 10 sec.
};
/*Amber Drake,
(npc 27755)  (item 37859)
(summoned by spell Amber Essence = 37859 ---> Call Amber Drake == 49461 ---> Summon 27755)
*/
enum AmberDrake
{
    NPC_AMBER_DRAKE_VEHICLE                       = 27755,
    SPELL_RIDE_AMBER_DRAKE_QUE                    = 49459,          //Apply Aura: Periodic Trigger, Interval: 3 seconds ---> 49460
    SPELL_AMBER_DRAKE_SADDLE                      = 49460,          //Allows you to ride on the back of an Amber Drake. ---> Dummy
    SPELL_AMBER_SHOCK_LANCE                       = 49840,         //(60 yds) - Instant - Deals 4822 to 5602 Arcane damage and detonates all Shock Charges on an enemy dragon. Damage is increased by 6525 for each detonated.
//  SPELL_AMBER_STOP_TIME                                    //Instant - 1 min cooldown - Halts the passage of time, freezing all enemy dragons in place for 10 sec. This attack applies 5 Shock Charges to each affected target.
    //you do not have access to until you kill the  Mage-Lord Urom.
    SPELL_AMBER_TEMPORAL_RIFT                     = 49592         //(60 yds) - Channeled - Channels a temporal rift on an enemy dragon for 10 sec. While trapped in the rift, all damage done to the target is increased by 100%. In addition, for every 15,000 damage done to a target affected by Temporal Rift, 1 Shock Charge is generated.
};
/*Emerald Drake,
(npc 27692)  (item 37815),
 (summoned by spell Emerald Essence = 37815 ---> Call Emerald Drake == 49345 ---> Summon 27692)
*/
enum EmeraldDrake
{
    NPC_EMERALD_DRAKE_VEHICLE                     = 27692,
    SPELL_RIDE_EMERALD_DRAKE_QUE                  = 49427,         //Apply Aura: Periodic Trigger, Interval: 3 seconds ---> 49346
    SPELL_EMERALD_DRAKE_SADDLE                    = 49346,         //Allows you to ride on the back of an Amber Drake. ---> Dummy
    SPELL_EMERALD_LEECHING_POISON                 = 50328,         //(60 yds) - Instant - Poisons the enemy dragon, leeching 1300 to the caster every 2 sec. for 12 sec. Stacks up to 3 times.
    SPELL_EMERALD_TOUCH_THE_NIGHTMARE             = 50341,         //(60 yds) - Instant - Consumes 30% of the caster's max health to inflict 25,000 nature damage to an enemy dragon and reduce the damage it deals by 25% for 30 sec.
    // you do not have access to until you kill the Mage-Lord Urom
    SPELL_EMERALD_DREAM_FUNNEL                    = 50344         //(60 yds) - Channeled - Transfers 5% of the caster's max health to a friendly drake every second for 10 seconds as long as the caster channels.
};

struct boss_eregosAI : public ScriptedAI
{
    boss_eregosAI(Creature *c) : ScriptedAI(c)
    {
        pInstance = c->GetInstanceData();
    }

    ScriptedInstance* pInstance;
    
    uint32 uiArcaneBarrageTimer;
    uint32 uiArcaneVolleyTimer;
    uint32 uiEnragedAssaultTimer;
    uint16 uiPhase;
    uint32 uiPhaseTimer;

    void Reset()
    {
        if (pInstance)
            pInstance->SetData(DATA_EREGOS_EVENT, NOT_STARTED);
	
    uiArcaneBarrageTimer = 12000;
    uiArcaneVolleyTimer = 17000;
    uiEnragedAssaultTimer = 24000;
    uiPhase = 0;
    uiPhaseTimer = 18000;
    }

    void EnterCombat(Unit* who)
    {
	DoScriptText(SAY_AGGRO, me);
        if (pInstance)
            pInstance->SetData(DATA_EREGOS_EVENT, IN_PROGRESS);
    }

    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
	if (!UpdateVictim())
            return;
	    
	if (uiPhaseTimer <= diff)
	{
	uint32 uiHpPct = (me->GetHealth() * 100) / me->GetMaxHealth();
	if((uiPhase == 0 && uiHpPct <= 60) || (uiPhase == 2 && uiHpPct <= 20))
           {
                DoCast(me, SPELL_PLANAR_SHIFT, true);
		DoCast(me, SPELL_PLANAR_ANOMALIES, true);
		++uiPhase;
		uiPhaseTimer = 18000;
            }
	} else uiPhaseTimer -= diff;

	
	if (uiArcaneBarrageTimer <= diff)
	{
	DoCastAOE(DUNGEON_MODE(SPELL_ARCANE_BARRAGE, H_SPELL_ARCANE_BARRAGE));
	uiArcaneBarrageTimer = 12000;
	} else uiArcaneBarrageTimer -= diff;
	
	if (uiArcaneVolleyTimer <= diff)
	{
	DoCast(DUNGEON_MODE(SPELL_ARCANE_VOLLEY, H_SPELL_ARCANE_VOLLEY));
	uiArcaneVolleyTimer = 17000;
	} else uiArcaneVolleyTimer -= diff;
	
	if (uiEnragedAssaultTimer <= diff)
	{
	DoCast(me, SPELL_ENRAGED_ASSAULT);
	uiEnragedAssaultTimer = 44000;
	} else uiEnragedAssaultTimer -= diff;

        DoMeleeAttackIfReady();
    }

    void KilledUnit(Unit *victim)
    {
        if (victim == me)
            return;
        DoScriptText(RAND(SAY_KILL_1,SAY_KILL_2,SAY_KILL_3), me);
    }
    
    void JustDied(Unit* killer)
    {
	DoScriptText(SAY_DEATH, me);
        if (pInstance)
            pInstance->SetData(DATA_EREGOS_EVENT, DONE);
    }
};

CreatureAI* GetAI_boss_eregos(Creature* pCreature)
{
    return new boss_eregosAI (pCreature);
}

void AddSC_boss_eregos()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_eregos";
    newscript->GetAI = &GetAI_boss_eregos;
    newscript->RegisterSelf();
}
