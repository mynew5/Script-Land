#include "ScriptedPch.h"
#include "instance_icecrown_citadel.h"

enum BossSpells
{
    SPELL_OOZE_FLOOD = 69789,
    SPELL_OOZE_FLOOD_0 = 69788,
    SPELL_OOZE_FLOOD_1 = 69783,
    SPELL_SLIME_SPRAY = 69508,
    SPELL_MUTATED_INFECTION = 69674,
    SPELL_STICKY_OOZE = 69774,
    SPELL_RADIATING_OOZE = 69750,
    SPELL_RADIATING_OOZE_1 = 69760,
    SPELL_UNSTABLE_OOZE = 69558,
    SPELL_OOZE_EXPLODE = 69839,
};

struct boss_rotfaceAI : public ScriptedAI
{
    boss_rotfaceAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance *pInstance;
    
    uint32 OozeFloodTimer;
    uint32 SlimeSprayTimer;
    uint32 MutatedInfectionTimer;
    uint32 BerserkTimer;

    void Reset()
    {
	OozeFloodTimer = urand(4000,8000);
	SlimeSprayTimer = irand(6000,14000);
	MutatedInfectionTimer = urand(12000,16000);
	BerserkTimer = 400000;
    }

    void Aggro(Unit *who)
    {
        if(pInstance) pInstance->SetData(DATA_ROTFACE_EVENT, IN_PROGRESS);
    }

    void JustDied(Unit *killer)
    {
        if(pInstance) pInstance->SetData(DATA_ROTFACE_EVENT, DONE);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
	
	if (OozeFloodTimer <= uiDiff)
	{
          DoCast(SPELL_OOZE_FLOOD_1);
	  OozeFloodTimer = urand(5000,8000);
	} else OozeFloodTimer -= uiDiff;
	
	if (SlimeSprayTimer <= uiDiff)
	{
          DoCast(SPELL_SLIME_SPRAY);
	  SlimeSprayTimer = irand(9000,16000);
	} else SlimeSprayTimer -= uiDiff;
	
	if (MutatedInfectionTimer <= uiDiff)
	{
          DoCast(SPELL_MUTATED_INFECTION);
	  MutatedInfectionTimer = urand(14000,18000);
	} else MutatedInfectionTimer -= uiDiff;
	
	if (BerserkTimer <= uiDiff)
	{
          me->CastSpell(me,SPELL_BERSERK,true);
	  BerserkTimer = 5000;
	} else BerserkTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};


CreatureAI* GetAI_boss_rotface(Creature* pCreature)
{
    return new boss_rotfaceAI(pCreature);
}

void AddSC_boss_rotface()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_rotface";
    newscript->GetAI = &GetAI_boss_rotface;
    newscript->RegisterSelf();
}

