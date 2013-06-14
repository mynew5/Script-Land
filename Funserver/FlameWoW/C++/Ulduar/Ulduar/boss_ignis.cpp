/* Copyright (C) 2010 FlameScripts <http://www.flame-wow.org/>
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

/* ScriptData
SDName: boss_ignis
SD%Complete: 85%
SDComment: slag pot damage missing. missing bringing adds to water part
SDCategory: Ulduar
EndScriptData */

#include "precompiled.h"
#include "ulduar.h"

enum
{
    //yells

    //ignis the furnace master
    SPELL_FLAME_JETS            = 62680,
    SPELL_FLAME_JETS_H            = 63472,
    SPELL_SLAG_POT                = 62717,
    SPELL_SLAG_POT_H            = 63477,
    SPELL_SLAG_POT_DMG            = 65722,
    SPELL_SLAG_POT_DMG_H        = 65723,
    SPELL_SCORCH                = 62546,
    SPELL_SCORCH_H                = 63474,
    BUFF_STRENGHT_OF_CREATOR    = 64473,
    SPELL_HASTE                    = 66045,
    //iron construct
    SPELL_HEAT                    = 65667,
    SPELL_MOLTEN                = 62373,
    SPELL_BRITTLE                = 62382,
    SPELL_SHATTER                = 62383,
    //scorch target
    AURA_SCORCH                    = 62548,
    AURA_SCORCH_H                = 63476,
    //NPC ids
    MOB_IRON_CONSTRUCT            = 33121,
    MOB_SCORCH_TARGET            = 33221,
};

// scorch target
struct FLAMEMU_DLL_DECL mob_scorch_targetAI : public ScriptedAI
{
    mob_scorch_targetAI(Creature* pCreature) : ScriptedAI(pCreature) 
    {
        Reset();
        SetCombatMovement(false);
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    uint32 Death_Timer;
    uint32 Range_Check_Timer;

    void Reset()
    {
        Death_Timer = 55000;
        Range_Check_Timer = 1000;
        m_creature->SetDisplayId(11686);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        DoCast(m_creature,  m_bIsRegularMode ? AURA_SCORCH : AURA_SCORCH_H);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);

        if (Death_Timer < diff)
        {
            m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        }else Death_Timer -= diff;
    }
};

CreatureAI* GetAI_mob_scorch_target(Creature* pCreature)
{
    return new mob_scorch_targetAI(pCreature);
}

// iron construct
struct FLAMEMU_DLL_DECL mob_iron_constructAI : public ScriptedAI
{
    mob_iron_constructAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;

    uint32 Death_Timer;
    uint32 Aura_Check_Timer;
    bool brittle;
    bool shatter;

    void Reset()
    {
        shatter = false;
        brittle = false;
        Aura_Check_Timer = 1000;
    }

    void JustDied(Unit* pKiller)
    {
        if (!m_pInstance)
            return;
        if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_IGNIS))))
            if (pTemp->isAlive())
                if (pTemp->HasAura(BUFF_STRENGHT_OF_CREATOR))
                {
                    if (pTemp->GetAura(BUFF_STRENGHT_OF_CREATOR, EFFECT_INDEX_0)->GetStackAmount() == 1)
                        pTemp->RemoveAurasDueToSpell(BUFF_STRENGHT_OF_CREATOR);
                    else
                        pTemp->GetAura(BUFF_STRENGHT_OF_CREATOR, EFFECT_INDEX_0)->modStackAmount(-1);
                }
    }

    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if (brittle)
            if (damage>5000){
                DoCast(m_creature, SPELL_SHATTER);
                shatter = true;
                Death_Timer = 1000;
            }
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (Death_Timer < diff && shatter)
        {
            m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        }else Death_Timer -= diff;   

        if (m_creature->HasAura(SPELL_BRITTLE,EFFECT_INDEX_0))
            brittle = true;
        else
            brittle = false;

        if (Aura_Check_Timer < diff)
        {
            if(Aura* aura = m_creature->GetAura(SPELL_HEAT,EFFECT_INDEX_0))
                if(aura->GetStackAmount() > 19)
                {
                DoCast(m_creature, SPELL_BRITTLE); //TODO: change
                brittle = true;
                }
            Aura_Check_Timer = 1000;
        }else Aura_Check_Timer -= diff;
        
        if (!shatter && !brittle)
            DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_iron_construct(Creature* pCreature)
{
    return new mob_iron_constructAI(pCreature);
}

//ignis the furnace master
struct FLAMEMU_DLL_DECL boss_ignisAI : public ScriptedAI
{
    boss_ignisAI(Creature* pCreature) : ScriptedAI(pCreature) 
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();

        Reset();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    std::list<uint64> m_lIronConstructGUIDList;

    uint32 Flame_Jets_Timer;
    uint32 Slag_Pot_Timer;
    uint32 Slag_Pot_Dmg_Timer;
    uint32 Scorch_Timer;
    uint32 Summon_Timer;
    uint32 PotDmgCount;

    uint64 m_uiPotTarget;

    void Reset()
    {
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);
        Flame_Jets_Timer = 20000;
        Slag_Pot_Timer = 25000;
        Slag_Pot_Dmg_Timer = 26000;
        Scorch_Timer = 14000;
        Summon_Timer = 10000;
        PotDmgCount = 0;
        m_uiPotTarget = 0;
        m_lIronConstructGUIDList.clear();
    }

    void JustDied(Unit* pKiller)
    {
        //death yell
        if (m_pInstance)
            m_pInstance->SetData(TYPE_IGNIS, DONE);
        if (!m_lIronConstructGUIDList.empty())
            {
                for(std::list<uint64>::iterator itr = m_lIronConstructGUIDList.begin(); itr != m_lIronConstructGUIDList.end(); ++itr)
                    if (Creature* pTemp = (Creature*)Unit::GetUnit(*m_creature, *itr))
                            pTemp->ForcedDespawn();
            }
    }

    void Aggro(Unit* pWho)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_IGNIS, IN_PROGRESS);
        //aggro yell
    }

    void JustReachedHome()
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_IGNIS, FAIL);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (Flame_Jets_Timer < diff)
        {
            //flame jets yell
            DoCast(m_creature, m_bIsRegularMode ? SPELL_FLAME_JETS : SPELL_FLAME_JETS_H);
            Flame_Jets_Timer = 30000;
        }else Flame_Jets_Timer -= diff;   

        if (Slag_Pot_Timer < diff)
        {
            //slag pot yell
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,1)){
                DoCast(target, m_bIsRegularMode ? SPELL_SLAG_POT : SPELL_SLAG_POT_H);
                m_uiPotTarget = target->GetGUID();
            }
            Slag_Pot_Timer = 30000;
            Slag_Pot_Dmg_Timer = 1000;
            PotDmgCount = 0;
        }else Slag_Pot_Timer -= diff;  

        if (Slag_Pot_Dmg_Timer < diff)
        {
            if (Unit* pPotTarget = Unit::GetUnit(*m_creature, m_uiPotTarget)){
                if (PotDmgCount < 10)
                    DoCast(pPotTarget, m_bIsRegularMode ? SPELL_SLAG_POT_DMG : SPELL_SLAG_POT_DMG_H);
                else
                    if (PotDmgCount == 10)
                        DoCast(pPotTarget, SPELL_HASTE);
            }
            ++PotDmgCount;
            Slag_Pot_Dmg_Timer = 1000;
        }else Slag_Pot_Dmg_Timer -= diff;

        if (Summon_Timer < diff)
        {
            //summon yell
            if (Creature* pTemp = m_creature->SummonCreature(MOB_IRON_CONSTRUCT, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                {
                    pTemp->AddThreat(pTarget,0.0f);
                    pTemp->AI()->AttackStart(pTarget);
                    m_lIronConstructGUIDList.push_back(pTemp->GetGUID());
                }
            Summon_Timer = 40000;
            if (m_creature->HasAura(BUFF_STRENGHT_OF_CREATOR))
                    m_creature->GetAura(BUFF_STRENGHT_OF_CREATOR, EFFECT_INDEX_0)->modStackAmount(+1);
                else
                    DoCast(m_creature, BUFF_STRENGHT_OF_CREATOR);
        }else Summon_Timer -= diff;

        if (Scorch_Timer < diff)
        {
            DoCast(m_creature->getVictim(), SPELL_SCORCH);
            if (Creature* pTemp = m_creature->SummonCreature(MOB_SCORCH_TARGET, m_creature->getVictim()->GetPositionX(), m_creature->getVictim()->GetPositionY(), m_creature->getVictim()->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
            {
                pTemp->AddThreat(m_creature->getVictim(),0.0f);
                pTemp->AI()->AttackStart(m_creature->getVictim());
            }
            Scorch_Timer = 28000;
        }else Scorch_Timer -= diff;
        
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_ignis(Creature* pCreature)
{
    return new boss_ignisAI(pCreature);
}

void AddSC_boss_ignis()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "boss_ignis";
    NewScript->GetAI = GetAI_boss_ignis;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "mob_scorch_target";
    NewScript->GetAI = &GetAI_mob_scorch_target;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "mob_iron_construct";
    NewScript->GetAI = &GetAI_mob_iron_construct;
    NewScript->RegisterSelf();
}