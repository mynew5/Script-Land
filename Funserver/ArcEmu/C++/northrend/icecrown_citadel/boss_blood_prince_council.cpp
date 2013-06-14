#include "ScriptedPch.h"
#include "instance_icecrown_citadel.h"

 
struct boss_prince_valanarAI : public ScriptedAI
{
    boss_prince_valanarAI(Creature* pCreature) : ScriptedAI(pCreature)
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
	pInstance->SetData(DATA_BLOODPRINCE_EVENT, IN_PROGRESS);
    }
 
    void JustDied(Unit *killer)
    {
        if(pInstance) 
	pInstance->SetData(DATA_BLOODPRINCE_EVENT, DONE);
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
	    
	me->CastSpell(me,SPELL_BERSERK,true);
 
        DoMeleeAttackIfReady();
    }
};

struct boss_prince_kelesethAI : public ScriptedAI
{
    boss_prince_kelesethAI(Creature* pCreature) : ScriptedAI(pCreature)
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
	pInstance->SetData(DATA_BLOODPRINCE_EVENT, IN_PROGRESS);
    }
 
    void JustDied(Unit *killer)
    {
        if(pInstance) 
	pInstance->SetData(DATA_BLOODPRINCE_EVENT, DONE);
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
	    
	me->CastSpell(me,SPELL_BERSERK,true);
 
        DoMeleeAttackIfReady();
    }
};

struct boss_prince_taldaramAI : public ScriptedAI
{
    boss_prince_taldaramAI(Creature* pCreature) : ScriptedAI(pCreature)
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
	pInstance->SetData(DATA_BLOODPRINCE_EVENT, IN_PROGRESS);
    }
 
    void JustDied(Unit *killer)
    {
        if(pInstance) 
	pInstance->SetData(DATA_BLOODPRINCE_EVENT, DONE);
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
	    
	me->CastSpell(me,SPELL_BERSERK,true);
 
        DoMeleeAttackIfReady();
    }
};
 
 
CreatureAI* GetAI_boss_prince_valanar(Creature* pCreature)
{
    return new boss_prince_valanarAI(pCreature);
}

CreatureAI* GetAI_boss_prince_keleseth(Creature* pCreature)
{
    return new boss_prince_kelesethAI(pCreature);
}

CreatureAI* GetAI_boss_prince_taldaram(Creature* pCreature)
{
    return new boss_prince_taldaramAI(pCreature);
}
 
void AddSC_boss_blood_princce_council()
{
    Script *newscript;
    
    newscript = new Script;
    newscript->Name = "boss_prince_valanar";
    newscript->GetAI = &GetAI_boss_prince_valanar;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "boss_prince_keleseth";
    newscript->GetAI = &GetAI_boss_prince_keleseth;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "boss_prince_taldaram";
    newscript->GetAI = &GetAI_boss_prince_taldaram;
    newscript->RegisterSelf();
}
