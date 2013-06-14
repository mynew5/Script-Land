/* ScriptData
SDName: Boss Avatar of Hakkar
SD%Complete:
SDComment: Doors, Timers and say are temp.
EndScriptData */

#include "ScriptedPch.h"
#include "sunken_temple.h"

static Position SpawnPositions[] =
{
  //spawns
  {-457.80, 261.21, -90.62, 2.38},
  {-457.80, 285.71, -90.62, 3.22},
  {-480.65, 285.71, -90.62, 5.55},
  {-480.65, 261.21, -90.62, 0.46},
  //center
  {-467.00, 275.96, -90.70, 3.00}
};


enum eAvatarOfHakkar
{
    GO_DOOR                     = 400000, //TEMP GO atm (need retail info)
};

#define SAY_AGGRO               "Fleeing will do you no good, mortals!"
#define SOUND_AGGRO             8414

struct boss_avatar_of_hakkarAI: public ScriptedAI
{
    boss_avatar_of_hakkarAI(Creature* c) : ScriptedAI(c), Summons(me)
    {
        pInstance = c->GetInstanceData();
        debug_log("DEBUG: HAKKAR CREATED!");
    }

    ScriptedInstance* pInstance;
    uint64 HakkarGUID;
    GameObject* pDoorHakkar[2];
    uint32 SummonTimer;
    uint32 SavedPhase;
    bool bSuppressorSpawned;
    bool bHakkarIsWaiting;
    bool bOnReset;

    SummonList Summons;
    int SummonsCount;

    void Reset()
    {
        Summons.DespawnAll();//despawn all adds
        SummonTimer = 10000;
        SummonsCount = 0;
        SavedPhase = 0;
        bOnReset = true;

        bSuppressorSpawned = false;
        bHakkarIsWaiting = true;
        //if doors spawned?
        memset(&pDoorHakkar, 0, sizeof(pDoorHakkar));

        me->SetVisibility(VISIBILITY_OFF);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        me->SetReactState(REACT_PASSIVE);

        if (pInstance)
        {
            uint32 state = pInstance->GetData(TYPE_HAKKAR);
            if((state != DONE) && (state != IN_PROGRESS))
            {
                //close doors
                SetDoors(NOT_STARTED);
                SetDoors(IN_PROGRESS);
                pInstance->SetData(TYPE_HAKKAR, IN_PROGRESS);
            }
            else
            {
                bHakkarIsWaiting = false;
                //kill me
                me->DealDamage(me, me->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            }
        }

        bOnReset = false;
        debug_log("DEBUG: HAKKAR RESET!");
    }

    void JustSummoned(Creature *summoned)
    {
        Summons.Summon(summoned);
        SummonsCount++;
    }

    void SummonedCreatureDespawn(Creature* summoned)
    {
        Summons.Despawn(summoned);
        SummonsCount--;
    }


    void SummonCreatureWithRandomTarget(uint32 guid, uint32 pos = 0)
    {
        Creature *Spawned = NULL;
        if(!pos)
        {
            pos = rand()%4;
            Spawned = me->SummonCreature(guid, SpawnPositions[pos], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
        }
        else
        {
            Spawned = me->SummonCreature(guid, SpawnPositions[pos], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 350000);
        }
        if(!Spawned)
            return;

        Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,1);
        if (!pTarget)
        {
            pTarget = Unit::GetUnit(*me, pInstance->GetData64(0)); //get whoLightsOut
        }

        Spawned->GetMotionMaster()->MoveRandom(45);
        Spawned->AddThreat(pTarget, 500.0f);
        Spawned->AI()->AttackStart(pTarget);
    }

    void SetDoors(uint32 state)
    {
        switch(state)
        {
            case NOT_STARTED://spawn - doors closed
                if((pDoorHakkar[0] == NULL) && (pDoorHakkar[1] == NULL)){
                    pDoorHakkar[0] = me->SummonGameObject(GO_DOOR, -517.89, 275.68, -77, 1.58, 0, 0, 0, 0, 0);
                    pDoorHakkar[1] = me->SummonGameObject(GO_DOOR, -416.17, 275.68, -77, 4.71, 0, 0, 0, 0, 0);
                }
                break;
            case IN_PROGRESS:
                pInstance->HandleGameObject(NULL, false, pDoorHakkar[0]);
                pInstance->HandleGameObject(NULL, false, pDoorHakkar[1]);
                pInstance->SetData(EVENT_HAKKAR_STATE, 1); //go spawns, go!
                break;
            case DONE: //open doors
                pInstance->HandleGameObject(NULL, true, pDoorHakkar[0]);
                pInstance->HandleGameObject(NULL, true, pDoorHakkar[1]);
                break;
        }
    }

    void SummonCreatures()
    {
        if(SummonsCount > 6)
            return;

        uint32 Phase = pInstance->GetData(EVENT_HAKKAR_STATE);
        debug_log("DEBUG - HAKKAR: Summon Phase(%u)", Phase);

        switch(Phase)
        {
            case 5:
                //active boss, event is ended
                me->SetVisibility(VISIBILITY_ON);

                me->RemoveFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_DISABLE_MOVE);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->SetReactState(REACT_AGGRESSIVE);

                bHakkarIsWaiting = false;
                return;
            case 4:
                if(!bSuppressorSpawned)
                {
                    //special summon
                    SummonCreatureWithRandomTarget(8497, 4);
                    bSuppressorSpawned = true;
                }
            default:
                //basic summons
                SummonCreatureWithRandomTarget(8437);
                SummonCreatureWithRandomTarget(8437);
                SummonCreatureWithRandomTarget(8437);
                break;
        }

        if(SavedPhase != Phase && rand()%3 == 0)
        {
            SummonCreatureWithRandomTarget(8438, 4);
            SavedPhase = Phase;
        }

    }

    void EnterCombat()
    {
        me->MonsterYell(SAY_AGGRO, LANG_UNIVERSAL, NULL);
        DoPlaySoundToSet(me, SOUND_AGGRO);
        debug_log("DEBUG: HAKKAR IN COMBAT!!");
    }

    void UpdateAI(const uint32 diff)
    {
        if( bHakkarIsWaiting )
        {
            if (SummonTimer <= diff)
            {
                SummonCreatures();
                SummonTimer = urand(8000, 14000);
            } else SummonTimer -= diff;
        }

        if (!UpdateVictim())
            return;

        DoMeleeAttackIfReady();
    }

    void JustDied(Unit* killer)
    {
        debug_log("DEBUG: HAKKAR KILLED!!!");
        if(!bOnReset) //check killed on reset
        {
            if (pInstance)
                pInstance->SetData(TYPE_HAKKAR, DONE);
            SetDoors(DONE);
        }
    }

};

CreatureAI* GetAI_boss_avatar_of_hakkar(Creature* pCreature)
{
    return new boss_avatar_of_hakkarAI (pCreature);
}

bool GOHello_go_hakkar_lights(Player* pPlayer, GameObject* pGo)
{
    pGo->SetGoState(GO_STATE_ACTIVE);
    pGo->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_UNK1);

    ScriptedInstance *pInstance = pGo->GetInstanceData();
    pInstance->SetData(EVENT_HAKKAR_STATE, pInstance->GetData(EVENT_HAKKAR_STATE) + 1);

    return true;
}

void AddSC_boss_avatar_of_hakkar()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "go_hakkar_lights";
    newscript->pGOHello = &GOHello_go_hakkar_lights;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "boss_avatar_of_hakkar";
    newscript->GetAI = &GetAI_boss_avatar_of_hakkar;
    newscript->RegisterSelf();
}
