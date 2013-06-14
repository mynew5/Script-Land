/* Copyright (C) 2006 - 2010 TrinityCore <https://www.trinitycore.org/>
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

#include "ScriptedPch.h"
#include "pit_of_saron.h"

/***************************************SPELLS*************************************/
// Ymirjar Wrathbringer
#define SPELL_BLIGHT                      DUNGEON_MODE(69603,70285)

//Ymirjar Skycaller
#define SPELL_FROSTBLADE                  70291
#define SPELL_GLACIAL_STRIKE              70292

//Ymirjar Flamebearer
#define SPELL_FIREBALL                    DUNGEON_MODE(69583,70282)
#define SPELL_HELLFIRE                    DUNGEON_MODE(69586,70283)
#define SPELL_TACTICAL_BLINK              69584

//Ymirjar Deathbringer
#define SPELL_EMPOWERED_SHADOW_BOLT       DUNGEON_MODE(69528,70281)
#define SPELL_SUMMON_UNDEAD               69516

//Wrathbone Laborer
#define SPELL_BLINDING_DIRT               70302
#define SPELL_PUNCTURE_WOUND              DUNGEON_MODE(70278,70279)
#define SPELL_SHOVELLED                   DUNGEON_MODE(69572,70280)

//Wrathbone Coldwraith
#define SPELL_FREEZING_CIRCLE             DUNGEON_MODE(69574,70276)
#define SPELL_FROSTBOLT                   DUNGEON_MODE(69573,70277)

//Stonespine Gargoyle
#define SPELL_GARGOYLE_STRIKE             DUNGEON_MODE(69520,70275)
#define SPELL_STONEFORM                   69575

// Plagueborn Horror
#define SPELL_BLIGHT_BOMB                 69582
#define SPELL_PUSTULANT_FLESH             DUNGEON_MODE(69581,70273)
#define SPELL_TOXIC_WASTE                 70274

//Iceborn Proto-Drake
#define SPELL_FROST_BREATH                DUNGEON_MODE(69527,70272)

//Hungering Ghoul
#define SPELL_DEVOUR_FLESH                70393

//Fallen Warrior
#define SPELL_ARCING_SLICE                69579
#define SPELL_DEMORALIZING_SHOUT          61044
#define SPELL_SHIELD_BLOCK                69580

//Deathwhisper Torturer
#define SPELL_BLACK_BRAND                 70392
#define SPELL_CURSE_OF_AGONY              70391

//Deathwhisper Shadowcaster
#define SPELL_SHADOW_BOLT                 DUNGEON_MODE(70386,70387)

//Deathwhisper Necrolyte
#define SPELL_CONVERSION_BEAM             DUNGEON_MODE(69578,70269)
#define SPELL_SHADOW_BOLT_2               DUNGEON_MODE(69577,70270)

//Wrathbone Sorcerer
#define SPELL_SHADOW_BOLT_3               DUNGEON_MODE(70386,70387)

//Geist Ambusher
#define SPELL_LEAPING_FACE_MAUL           DUNGEON_MODE(69504,70271)

/****************************************EVENTS************************************/
// Ymirjar Wrathbringer
#define EVENT_BLIGHT                      1

// Ymirjar Skycaller
#define EVENT_FROSTBLADE                  2
#define EVENT_GLACIAL_STRIKE              3

// Ymirjar Flamebearer
#define EVENT_FIREBALL                    4
#define EVENT_HELLFIRE                    5
#define EVENT_TACTICAL_BLINK              6

//Ymirjar Deathbringer
#define EVENT_EMPOWERED_SHADOW_BOLT       7
#define EVENT_SUMMON_UNDEAD               8

//Wrathbone Laborer
#define EVENT_BLINDING_DIRT               9
#define EVENT_PUNCTURE_WOUND              10
#define EVENT_SHOVELLED                   11

//Wrathbone Coldwraith
#define EVENT_FREEZING_CIRCLE             12
#define EVENT_FROSTBOLT                   13

//Stonespine Gargoyle
#define EVENT_GARGOYLE_STRIKE             14
#define EVENT_STONEFORM                   15

//Plagueborn Horror
#define EVENT_BLIGHT_BOMB                 16
#define EVENT_PUSTULANT_FLESH             17
#define EVENT_TOXIC_WASTE                 18

//Iceborn Proto-Drake
#define EVENT_FROST_BREATH                19

//Hungering Ghoul
#define EVENT_DEVOUR_FLESH                20

//Fallen Warrior
#define EVENT_ARCING_SLICE                21
#define EVENT_DEMORALIZING_SHOUT          22
#define EVENT_SHIELD_BLOCK                23

//Deathwhisper Torturer
#define EVENT_BLACK_BRAND                 24
#define EVENT_CURSE_OF_AGONY              25

//Deathwhisper Shadowcaster
#define EVENT_SHADOW_BOLT                 26

//Deathwhisper Necrolyte
#define EVENT_CONVERSION_BEAM             27
#define EVENT_SHADOW_BOLT_2               28

#define EVENT_SHADOW_BOLT_3               29

//Geist Ambusher
#define EVENT_LEAPING_FACE_MAUL           30

/****************************************AI****************************************/
struct npc_YmirjarWrathbringerAI : public ScriptedAI
{
    npc_YmirjarWrathbringerAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
        events.ScheduleEvent(EVENT_BLIGHT, 7000);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_BLIGHT:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_BLIGHT);
                    events.RescheduleEvent(EVENT_BLIGHT, 8000);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_YmirjarSkyCallerAI: public ScriptedAI
{
    npc_YmirjarSkyCallerAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
        events.ScheduleEvent(EVENT_FROSTBLADE, 1);
        events.ScheduleEvent(EVENT_GLACIAL_STRIKE, 8000);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_GLACIAL_STRIKE:
                    DoCast(me->getVictim(), SPELL_GLACIAL_STRIKE);
                    events.RescheduleEvent(EVENT_GLACIAL_STRIKE, 8000);
                    return;
                case EVENT_FROSTBLADE:
                    DoCast(me, SPELL_FROSTBLADE);
                    events.CancelEvent(EVENT_FROSTBLADE);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_YmirjarFlamebearerAI: public ScriptedAI
{
    npc_YmirjarFlamebearerAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
    events.ScheduleEvent(EVENT_FIREBALL, 4000);
    events.ScheduleEvent(EVENT_HELLFIRE, 8000);
    events.ScheduleEvent(EVENT_TACTICAL_BLINK, 15000);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_FIREBALL:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_FIREBALL);
                    events.RescheduleEvent(EVENT_FIREBALL, 5000);
                    return;
                case EVENT_HELLFIRE:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_HELLFIRE);
                    events.RescheduleEvent(EVENT_HELLFIRE, 10000);
                    return;
                case EVENT_TACTICAL_BLINK:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_TACTICAL_BLINK);
                    events.RescheduleEvent(EVENT_TACTICAL_BLINK, 12000);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_YmirjarDeathbringerAI: public ScriptedAI
{
    npc_YmirjarDeathbringerAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
    events.ScheduleEvent(EVENT_EMPOWERED_SHADOW_BOLT, 8000);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_EMPOWERED_SHADOW_BOLT:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_EMPOWERED_SHADOW_BOLT);
                    events.RescheduleEvent(EVENT_EMPOWERED_SHADOW_BOLT, 8000);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_WrathboneLaborerAI: public ScriptedAI
{
    npc_WrathboneLaborerAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
    events.ScheduleEvent(EVENT_BLINDING_DIRT, 8000);
    events.ScheduleEvent(EVENT_PUNCTURE_WOUND, 9000);
    events.ScheduleEvent(EVENT_SHOVELLED, 5000);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_BLINDING_DIRT:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_BLINDING_DIRT);
                    events.RescheduleEvent(EVENT_BLINDING_DIRT, 10000);
                    return;
                case EVENT_PUNCTURE_WOUND:
                    DoCast(me->getVictim(), SPELL_PUNCTURE_WOUND);
                    events.RescheduleEvent(EVENT_PUNCTURE_WOUND, 9000);
                    return;
                case EVENT_SHOVELLED:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_SHOVELLED);
                    events.RescheduleEvent(EVENT_SHOVELLED, 7000);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_WrathboneColdwraithAI: public ScriptedAI
{
    npc_WrathboneColdwraithAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
    events.ScheduleEvent(EVENT_FREEZING_CIRCLE, 9000);
    events.ScheduleEvent(EVENT_FROSTBOLT, 5000);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_FREEZING_CIRCLE:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_FREEZING_CIRCLE);
                    events.RescheduleEvent(EVENT_FREEZING_CIRCLE, 9000);
                    return;
                case EVENT_FROSTBOLT:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_FROSTBOLT);
                    events.RescheduleEvent(EVENT_FROSTBOLT, 5000);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_StonespineGargoyleAI: public ScriptedAI
{
    npc_StonespineGargoyleAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
    events.ScheduleEvent(EVENT_GARGOYLE_STRIKE, 5000);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_GARGOYLE_STRIKE:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_GARGOYLE_STRIKE);
                    events.RescheduleEvent(EVENT_GARGOYLE_STRIKE, 6000);
                    return;
                case EVENT_STONEFORM:
                    if (HealthBelowPct(10))
                    DoCast(me, SPELL_STONEFORM);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_PlaguebornHorrorAI: public ScriptedAI
{
    npc_PlaguebornHorrorAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
    events.ScheduleEvent(EVENT_BLIGHT_BOMB, 999999);
    events.ScheduleEvent(EVENT_PUSTULANT_FLESH, 5000);
    events.ScheduleEvent(EVENT_TOXIC_WASTE, 8000);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_BLIGHT_BOMB:
                    if (HealthBelowPct(15))
                    DoCast(me, SPELL_BLIGHT_BOMB);
                    return;
                case EVENT_PUSTULANT_FLESH:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_PUSTULANT_FLESH);
                    events.RescheduleEvent(EVENT_PUSTULANT_FLESH, 10000);
                    return;
                case EVENT_TOXIC_WASTE:
                    DoCast(me, SPELL_TOXIC_WASTE);
                    events.RescheduleEvent(EVENT_TOXIC_WASTE, 8000);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_IcebornProtoDrakeAI: public ScriptedAI
{
    npc_IcebornProtoDrakeAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
        events.ScheduleEvent(EVENT_FROST_BREATH, 5000);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_FROST_BREATH:
                    DoCast(me->getVictim(), SPELL_FROST_BREATH);
                    events.RescheduleEvent(EVENT_FROST_BREATH, 10000);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_HungeringGhoulAI: public ScriptedAI
{
    npc_HungeringGhoulAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
        events.ScheduleEvent(EVENT_DEVOUR_FLESH, 4000);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_DEVOUR_FLESH:
                    DoCast(me->getVictim(), SPELL_DEVOUR_FLESH);
                    events.RescheduleEvent(EVENT_DEVOUR_FLESH, 8000);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_FallenWarriorAI: public ScriptedAI
{
    npc_FallenWarriorAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
    events.ScheduleEvent(EVENT_ARCING_SLICE, 8000);
    events.ScheduleEvent(EVENT_DEMORALIZING_SHOUT, 20000);
    events.ScheduleEvent(EVENT_SHIELD_BLOCK, 8000);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_ARCING_SLICE:
                    DoCast(me->getVictim(), SPELL_ARCING_SLICE);
                    events.RescheduleEvent(EVENT_ARCING_SLICE, 10000);
                    return;
                case EVENT_DEMORALIZING_SHOUT:
                    DoCast(me, SPELL_DEMORALIZING_SHOUT);
                    events.RescheduleEvent(EVENT_DEMORALIZING_SHOUT, 20000);
                    return;
                case EVENT_SHIELD_BLOCK:
                    DoCast(me->getVictim(), SPELL_SHIELD_BLOCK);
                    events.RescheduleEvent(EVENT_SHIELD_BLOCK, 8000);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_DeathwhisperTorturerAI: public ScriptedAI
{
    npc_DeathwhisperTorturerAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
    events.ScheduleEvent(EVENT_BLACK_BRAND, 10000);
    events.ScheduleEvent(EVENT_CURSE_OF_AGONY, 6000);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_BLACK_BRAND:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_BLACK_BRAND);
                    events.RescheduleEvent(EVENT_BLACK_BRAND, 10000);
                    return;
                case EVENT_CURSE_OF_AGONY:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_CURSE_OF_AGONY);
                    events.RescheduleEvent(EVENT_CURSE_OF_AGONY, 13000);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_DeathwhisperShadowcasterAI: public ScriptedAI
{
    npc_DeathwhisperShadowcasterAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
    events.ScheduleEvent(EVENT_SHADOW_BOLT, 3000);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_SHADOW_BOLT:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_SHADOW_BOLT);
                    events.RescheduleEvent(EVENT_SHADOW_BOLT, 5000);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_DeathwhisperNecrolyteAI: public ScriptedAI
{
    npc_DeathwhisperNecrolyteAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
    events.ScheduleEvent(EVENT_CONVERSION_BEAM, 12000);
    events.ScheduleEvent(EVENT_SHADOW_BOLT_2, 4000);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_CONVERSION_BEAM:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_CONVERSION_BEAM);
                    events.RescheduleEvent(EVENT_CONVERSION_BEAM, 12000);
                    return;
                case EVENT_SHADOW_BOLT_2:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_SHADOW_BOLT_2);
                    events.RescheduleEvent(EVENT_SHADOW_BOLT_2, 5000);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_WrathboneSorcererAI: public ScriptedAI
{
    npc_WrathboneSorcererAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
        events.ScheduleEvent(EVENT_SHADOW_BOLT_3, 3000);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_SHADOW_BOLT_3:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_SHADOW_BOLT_3);
                    events.RescheduleEvent(EVENT_SHADOW_BOLT_3, 5000);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

struct npc_GeistAmbusherAI: public ScriptedAI
{
    npc_GeistAmbusherAI(Creature *c) : ScriptedAI(c)
    {
    }
    EventMap events;

    void Reset()
    {
        events.Reset();
    }

    void EnterCombat(Unit* who)
    {
	//Only here so when I figure out how to make it cast on an NPC i can do that.
        events.ScheduleEvent(EVENT_LEAPING_FACE_MAUL, 99999);
    }

    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
			//Should only be used on NPCs
                case EVENT_LEAPING_FACE_MAUL:
                    if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_LEAPING_FACE_MAUL);
                    events.CancelEvent(EVENT_LEAPING_FACE_MAUL);
                    return;
            }
        }
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_YmirjarWrathbringerAI(Creature* pCreature)
{
    return new npc_YmirjarWrathbringerAI (pCreature);
}

CreatureAI* GetAI_npc_YmirjarSkyCallerAI(Creature* pCreature)
{
    return new npc_YmirjarSkyCallerAI (pCreature);
}

CreatureAI* GetAI_npc_YmirjarFlamebearerAI(Creature* pCreature)
{
    return new npc_YmirjarFlamebearerAI (pCreature);
}

CreatureAI* GetAI_npc_YmirjarDeathbringerAI(Creature* pCreature)
{
    return new npc_YmirjarDeathbringerAI (pCreature);
}

CreatureAI* GetAI_npc_WrathboneLaborerAI(Creature* pCreature)
{
    return new npc_WrathboneLaborerAI (pCreature);
}

CreatureAI* GetAI_npc_WrathboneColdwraithAI(Creature* pCreature)
{
    return new npc_WrathboneColdwraithAI (pCreature);
}

CreatureAI* GetAI_npc_StonespineGargoyleAI(Creature* pCreature)
{
    return new npc_StonespineGargoyleAI (pCreature);
}

CreatureAI* GetAI_npc_PlaguebornHorrorAI(Creature* pCreature)
{
    return new npc_PlaguebornHorrorAI (pCreature);
}

CreatureAI* GetAI_npc_IcebornProtoDrakeAI(Creature* pCreature)
{
    return new npc_IcebornProtoDrakeAI (pCreature);
}

CreatureAI* GetAI_npc_HungeringGhoulAI(Creature* pCreature)
{
    return new npc_HungeringGhoulAI (pCreature);
}

CreatureAI* GetAI_npc_FallenWarriorAI(Creature* pCreature)
{
    return new npc_FallenWarriorAI (pCreature);
}

CreatureAI* GetAI_npc_DeathwhisperTorturerAI(Creature* pCreature)
{
    return new npc_DeathwhisperTorturerAI (pCreature);
}

CreatureAI* GetAI_npc_DeathwhisperShadowcasterAI(Creature* pCreature)
{
    return new npc_DeathwhisperShadowcasterAI (pCreature);
}

CreatureAI* GetAI_npc_DeathwhisperNecrolyteAI(Creature* pCreature)
{
    return new npc_DeathwhisperNecrolyteAI (pCreature);
}

CreatureAI* GetAI_npc_WrathboneSorcererAI(Creature* pCreature)
{
    return new npc_WrathboneSorcererAI (pCreature);
}

CreatureAI* GetAI_npc_GeistAmbusherAI(Creature* pCreature)
{
    return new npc_GeistAmbusherAI (pCreature);
}

void AddSC_SaronTrash()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="npc_ymirjar_wrathbringer";
    newscript->GetAI = &GetAI_npc_YmirjarWrathbringerAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_ymirjar_skycaller";
    newscript->GetAI = &GetAI_npc_YmirjarSkyCallerAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_ymirjar_flamebearer";
    newscript->GetAI = &GetAI_npc_YmirjarFlamebearerAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_ymirjar_deathbringer";
    newscript->GetAI = &GetAI_npc_YmirjarDeathbringerAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_wrathbone_laborer";
    newscript->GetAI = &GetAI_npc_WrathboneLaborerAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_wrathbone_coldwraith";
    newscript->GetAI = &GetAI_npc_WrathboneColdwraithAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_stonespine_gargoyle";
    newscript->GetAI = &GetAI_npc_StonespineGargoyleAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_plagueborn_horror";
    newscript->GetAI = &GetAI_npc_PlaguebornHorrorAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_iceborn_proto_drake";
    newscript->GetAI = &GetAI_npc_IcebornProtoDrakeAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_hungering_ghoul";
    newscript->GetAI = &GetAI_npc_HungeringGhoulAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_fallen_warrior";
    newscript->GetAI = &GetAI_npc_FallenWarriorAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_deathwhisper_torturer";
    newscript->GetAI = &GetAI_npc_DeathwhisperTorturerAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_deathwhisper_shadowcaster";
    newscript->GetAI = &GetAI_npc_DeathwhisperShadowcasterAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_deathwhisper_necrolyte";
    newscript->GetAI = &GetAI_npc_DeathwhisperNecrolyteAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_wrathbone_sorcerer";
    newscript->GetAI = &GetAI_npc_WrathboneSorcererAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_geist_ambusher";
    newscript->GetAI = &GetAI_npc_GeistAmbusherAI;
    newscript->RegisterSelf();
}