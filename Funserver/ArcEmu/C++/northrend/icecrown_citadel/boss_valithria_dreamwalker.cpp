#include "ScriptedPch.h"
#include "instance_icecrown_citadel.h"

struct boss_valithria_dreamwalkerAI : public ScriptedAI
{
    boss_valithria_dreamwalkerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }
 
    ScriptedInstance *pInstance;
 
    void Reset()
    {
    }
 
    void Aggro(Unit *who) 
    {
        if(pInstance) 
	pInstance->SetData(DATA_DREAMWALKER_EVENT, IN_PROGRESS);
    }
 
    void JustDied(Unit *killer)
    {
        if(pInstance) 
	pInstance->SetData(DATA_DREAMWALKER_EVENT, DONE);
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
	    
	me->CastSpell(me,SPELL_BERSERK,true);
 
        DoMeleeAttackIfReady();
    }
};
 
 
CreatureAI* GetAI_boss_valithria_dreamwalker(Creature* pCreature)
{
    return new boss_valithria_dreamwalkerAI(pCreature);
}

void AddSC_boss_valithria_dreamwalker()
{
    Script *newscript;
    
    newscript = new Script;
    newscript->Name = "boss_valithria_dreamwalker";
    newscript->GetAI = &GetAI_boss_valithria_dreamwalker;
    newscript->RegisterSelf();
}