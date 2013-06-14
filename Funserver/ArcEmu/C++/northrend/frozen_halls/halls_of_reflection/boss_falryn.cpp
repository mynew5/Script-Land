/* ScriptData
SDName: boss_falryn
SD%Complete: 0%
SDComment:
SDCategory: Halls of Reflection
EndScriptData */

#include "ScriptedPch.h"

struct boss_falrynAI : public ScriptedAI
{
    boss_falrynAI(Creature* pCreature) : ScriptedAI(pCreature)
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
    }
 
    void JustDied(Unit *killer)
    {
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
	    
        DoMeleeAttackIfReady();
    }
};
 
 
CreatureAI* GetAI_boss_falryn(Creature* pCreature)
{
    return new boss_falrynAI(pCreature);
}

void AddSC_boss_falryn()
{
    Script *newscript;
    
    newscript = new Script;
    newscript->Name = "boss_falryn";
    newscript->GetAI = &GetAI_boss_falryn;
    newscript->RegisterSelf();
}