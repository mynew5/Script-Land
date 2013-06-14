/* Private_core_332 */

#include "ScriptedPch.h"
#include "ulduar.h"

#define SP_AURA_OF_DESPAIR      62692
#define SP_SHADOW_CRASH         62660
//#define H_SP_SHADOW_CRASH
//#define SP_MARK_OF_FACELESS
#define SP_SEARING_FLAMES       62661
#define SP_SURGE_OF_DARKNESS    63276
#define SP_BERSERK              26662
#define SP_AURA_OF_DESPAIR      62692

struct boss_vezaxAI : public BossAI
{
    boss_vezaxAI(Creature* pCreature) : BossAI(pCreature, TYPE_VEZAX)
    {
        pInstance = pCreature->GetInstanceData();
    }

    ScriptedInstance *pInstance;

    uint32 EnrageTimer;
    uint32 CrashTimer;
    uint32 DarkTimer;
    uint32 MarkTimer;
    uint32 FlamesTimer;
    uint32 SurgeTimer;

    void Reset()
    {
        CrashTimer = 10000 + rand()%10000;
        DarkTimer = 15000 + rand()%15000;
        EnrageTimer = 600000; //10 minutes
        FlamesTimer = 10000 + rand()%10000;
        if(pInstance) pInstance->SetData(TYPE_VEZAX, NOT_STARTED);
    }

    void Aggro(Unit *who) 
    {
        if(pInstance) pInstance->SetData(TYPE_VEZAX, IN_PROGRESS);
        DoCast(NULL, SP_AURA_OF_DESPAIR, true);
    }

    void JustDied(Unit *killer)
    {
        if(pInstance) pInstance->SetData(TYPE_VEZAX, DONE);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
        if(FlamesTimer < diff)
        {
            DoCast(me->getVictim(), SP_SEARING_FLAMES);
            FlamesTimer = 30000;
        }
        else FlamesTimer -= diff;
        if(CrashTimer < diff)
        {
            DoCast(me->getVictim(), SP_SHADOW_CRASH);
            CrashTimer = 30000;
        }
        else CrashTimer -= diff;
                if(DarkTimer < diff)   
        {
            DoCast(me->getVictim(), SP_SURGE_OF_DARKNESS);
            DarkTimer = 30000;
        }
        else DarkTimer -= diff;

        if(EnrageTimer < diff)
        {
            DoCast(me->getVictim(), SP_BERSERK);
            EnrageTimer = 30000;
        }
        else EnrageTimer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_vezax(Creature* pCreature)
{
    return new boss_vezaxAI(pCreature);
}

void AddSC_boss_vezax()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_vezax";
    newscript->GetAI = &GetAI_boss_vezax;
    newscript->RegisterSelf();
}