#include "ScriptedPch.h"
#include "ulduar.h"
//spells

#define SP_ENRAGE           26662
#define SP_FROZEN_BLOWS     RAID_MODE(62478,63512)
#define SP_FREEZE           62469
#define SP_FROZEN			61968
//#define SP_FROZE_NO_MOVE	62038

//Says
#define SAY_AGGRO   -1603012
#define SAY_DEATH   -1603013
#define SAY_SLAY01  -1603014
#define SAY_SLAY02  -1603015
#define SAY_FLASH_FREEZE    -1603016
#define SAY_FROZEN_BLOWS    -1603017
//Sound
#define SOUND_FROZEN_BLOWS  15556

//Events
#define EVENT_ENRAGE			1
#define EVENT_FROZEN_BLOWS		2
#define EVENT_FREEZE			3
//#define EVENT_FROZE_NO_MOVE		4
#define EVENT_FROZEN			5
#define EVENT_ENRAGE			6

//to do: achiv
#define ACHIEVEMENT  RAID_MODE(3182, 3184)
#define MAX_ENCOUNTER_TIME                     6 * 60 * 1000
#define MAX_ENCOUNTER_TIME2                    6 * 60 * 1000

struct boss_hodirAI : public BossAI
{
    boss_hodirAI(Creature *c) : BossAI(c, TYPE_HODIR)
    {
		pInstance = c->GetInstanceData();
    }

    bool Enraged;
    ScriptedInstance *pInstance;
  
	uint32 EncounterTime;
	uint32 EncounterTime2;

    void Reset()
    {
	Enraged = false;
        EncounterTime = 0;
	EncounterTime2 = 0;
 
	}

    void EnterCombat(Unit *who)
    {
        _EnterCombat();
        DoScriptText(SAY_AGGRO, me);
        //events.ScheduleEvent(EVENT_FROZE_NO_MOVE, 30000);
		events.ScheduleEvent(EVENT_FROZEN, 80000);
		events.ScheduleEvent(EVENT_FREEZE, 20000);
        events.ScheduleEvent(EVENT_FROZEN_BLOWS, 60000);
		events.ScheduleEvent(EVENT_ENRAGE, 540000);
    }
    void JustDied(Unit *killer)
    {
            if(EncounterTime <= MAX_ENCOUNTER_TIME)
			{
				pInstance->SetData(TYPE_HODIR_HARD, DONE);
            }

			else pInstance->SetData(TYPE_HODIR, DONE);
            
						
        DoScriptText(SAY_DEATH, me);
        //achiv
		if(EncounterTime <= MAX_ENCOUNTER_TIME)
        {
            AchievementEntry const *Achiev = GetAchievementStore()->LookupEntry(ACHIEVEMENT);
            if(Achiev)
            {
                Map *pMap = me->GetMap();
                if(pMap && pMap->IsDungeon())
                {
                    Map::PlayerList const &players = pMap->GetPlayers();
                    for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                        itr->getSource()->CompletedAchievement(Achiev);
                }
            }
        }
	}

    void KilledUnit(Unit *who)
    {
        if(irand(0,1))
            DoScriptText(SAY_SLAY01, me);
        else
            DoScriptText(SAY_SLAY02, me);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
		
		events.Update(diff);
		
		EncounterTime += diff;
		EncounterTime2 += diff;
        
		while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_FROZEN:
                {
					DoScriptText(SAY_SLAY01, me);
                    DoCast(me->getVictim(), SP_FROZEN);
                    events.ScheduleEvent(EVENT_FROZEN, 80000);
                    return;
                }
                case EVENT_FROZEN_BLOWS:
                    DoCast(me, SP_FROZEN_BLOWS);
                    events.ScheduleEvent(EVENT_FROZEN_BLOWS, 50000);
                    return;
                case EVENT_FREEZE:
				//	DoScriptText(SAY_FLASH_FREEZE, me);
                    DoCast(me->getVictim(), SP_FREEZE);
                    events.ScheduleEvent(EVENT_FREEZE, 20000);
                    return;
  /*              case EVENT_FROZE_NO_MOVE:
                    DoCast(me->getVictim(), SP_FROZE_NO_MOVE);
                    events.ScheduleEvent(EVENT_FROZE_NO_MOVE, 30000);
                    return; */
                case EVENT_ENRAGE:
                    DoCast(me, SP_ENRAGE);
                    DoScriptText(SAY_DEATH, me);
                    events.ScheduleEvent(EVENT_FREEZE, 30000);
                    return;
            }
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_hodir(Creature* pCreature)
{
    return new boss_hodirAI(pCreature);
}

void AddSC_boss_hodir()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_hodir";
    newscript->GetAI = &GetAI_boss_hodir;
    newscript->RegisterSelf();

}