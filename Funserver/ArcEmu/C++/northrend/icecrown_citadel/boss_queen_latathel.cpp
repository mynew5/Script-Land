#include "ScriptedPch.h"
#include "instance_icecrown_citadel.h"

struct boss_queen_latathelAI : public ScriptedAI
{
    boss_queen_latathelAI(Creature* pCreature) : ScriptedAI(pCreature)
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
	pInstance->SetData(DATA_LANATHEL_EVENT, IN_PROGRESS);
    }
 
    void JustDied(Unit *killer)
    {
        if(pInstance) 
	pInstance->SetData(DATA_LANATHEL_EVENT, DONE);
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
	    
	me->CastSpell(me,SPELL_BERSERK,true);
 
        DoMeleeAttackIfReady();
    }
};
 
 
CreatureAI* GetAI_boss_queen_latathel(Creature* pCreature)
{
    return new boss_queen_latathelAI(pCreature);
}

void AddSC_boss_queen_latathel()
{
    Script *newscript;
    
    newscript = new Script;
    newscript->Name = "boss_queen_latathel";
    newscript->GetAI = &GetAI_boss_queen_latathel;
    newscript->RegisterSelf();
}