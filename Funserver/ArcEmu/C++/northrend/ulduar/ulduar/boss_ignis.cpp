/*
 * Copyright (C) 2008 - 2009 Trinity <http://www.trinitycore.org/>
 *
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
#include "ulduar.h"

#define SPELL_FLAME_JETS		RAID_MODE(62680,63472)
#define SPELL_SLAG_POT			RAID_MODE(62717,63477)
#define SPELL_SLAG_POT_DMG		RAID_MODE(65722,65723)
#define SPELL_SCORCH			RAID_MODE(62546,63474)
#define AURA_SCORCH			RAID_MODE(62548,63476)
enum
{
    //ignis the furnace master
    BUFF_STRENGHT_OF_CREATOR      = 64473,
    SPELL_HASTE                   = 66045,
    //iron construct
    SPELL_HEAT                    = 65667,
    SPELL_MOLTEN                  = 62373,
    SPELL_BRITTLE                 = 62382,
    SPELL_SHATTER                 = 62383,
    //NPC ids
    MOB_IRON_CONSTRUCT            = 33121,
    MOB_SCORCH_TARGET             = 33221,
    ACHIEV_TIMED_START_EVENT                      = 20951
};

// scorch target
struct mob_scorch_targetAI : public ScriptedAI
{
    mob_scorch_targetAI(Creature* pCreature) : ScriptedAI(pCreature) 
    {
        Reset();
        SetCombatMovement(false);
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;

    uint32 Death_Timer;
    uint32 Range_Check_Timer;

    void Reset()
    {
        Death_Timer = 55000;
        Range_Check_Timer = 1000;
        me->SetDisplayId(11686);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        DoCast(me, AURA_SCORCH, true);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!me->getVictim())
            me->DealDamage(me, me->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);

        if (Death_Timer < diff)
        {
            me->DealDamage(me, me->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        }else Death_Timer -= diff;
    }
};

CreatureAI* GetAI_mob_scorch_target(Creature* pCreature)
{
    return new mob_scorch_targetAI(pCreature);
}

// iron construct
struct mob_iron_constructAI : public ScriptedAI
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
        if (Creature* pTemp = ((Creature*)Unit::GetUnit((*me), m_pInstance->GetData64(TYPE_IGNIS))))
            if (pTemp->isAlive())
                if (pTemp->HasAura(BUFF_STRENGHT_OF_CREATOR))
                {
                    if (pTemp->GetAura(BUFF_STRENGHT_OF_CREATOR, 1))
                        pTemp->RemoveAurasDueToSpell(BUFF_STRENGHT_OF_CREATOR);
                    else
                        pTemp->GetAura(BUFF_STRENGHT_OF_CREATOR, 0);
                }
    }

    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if (brittle)
            if (damage>5000)
            {
                DoCast(me, SPELL_SHATTER);
                shatter = true;
                Death_Timer = 1000;
            }
    }

    void UpdateAI(const uint32 diff)
    {
        if (!me->getVictim())
            return;

        if (Death_Timer < diff && shatter)
        {
            me->DealDamage(me, me->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        }else Death_Timer -= diff;   

        if (me->HasAura(SPELL_BRITTLE,0))
            brittle = true;
        else
            brittle = false;

        if (Aura_Check_Timer < diff)
        {
            if(Aura* aura = me->GetAura(SPELL_HEAT,0))
                if(aura->GetStackAmount() > 19)
                {
                    DoCast(me, SPELL_BRITTLE); //TODO: change
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
struct boss_ignisAI : public ScriptedAI
{
    boss_ignisAI(Creature* pCreature) : ScriptedAI(pCreature) 
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

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
        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);
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
                if (Creature* pTemp = (Creature*)Unit::GetUnit(*me, *itr))
                    pTemp->ForcedDespawn();
        }
    }

    void Aggro(Unit* pWho)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_IGNIS, IN_PROGRESS);
    }

    void JustReachedHome()
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_IGNIS, FAIL);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!me->getVictim())
            return;

        if (Flame_Jets_Timer < diff)
        {
            //flame jets yell
            DoCast(me, SPELL_FLAME_JETS);
            Flame_Jets_Timer = 30000;
        }else Flame_Jets_Timer -= diff;   

        if (Slag_Pot_Timer < diff)
        {
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,1))
            {
                DoCast(target, SPELL_SLAG_POT);
                m_uiPotTarget = target->GetGUID();
            }
            Slag_Pot_Timer = 30000;
            Slag_Pot_Dmg_Timer = 1000;
            PotDmgCount = 0;
        }else Slag_Pot_Timer -= diff;  

        if (Slag_Pot_Dmg_Timer < diff)
        {
            if (Unit* pPotTarget = Unit::GetUnit(*me, m_uiPotTarget))
            {
                if (PotDmgCount < 10)
                    DoCast(pPotTarget, SPELL_SLAG_POT_DMG);
                else
                    if (PotDmgCount == 10)
                        DoCast(pPotTarget, SPELL_HASTE);
            }
            ++PotDmgCount;
            Slag_Pot_Dmg_Timer = 1000;
        }else Slag_Pot_Dmg_Timer -= diff;

        if (Summon_Timer < diff)
        {
            if (Creature* pTemp = me->SummonCreature(MOB_IRON_CONSTRUCT, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                {
                    pTemp->AddThreat(pTarget,0.0f);
                    pTemp->AI()->AttackStart(pTarget);
                    m_lIronConstructGUIDList.push_back(pTemp->GetGUID());
                }
                
                Summon_Timer = 40000;
                
                if (me->HasAura(BUFF_STRENGHT_OF_CREATOR))
                    me->GetAura(BUFF_STRENGHT_OF_CREATOR, 1);
                else
                    DoCast(me, BUFF_STRENGHT_OF_CREATOR);
        }else Summon_Timer -= diff;

        if (Scorch_Timer < diff)
        {
            DoCast(me->getVictim(), SPELL_SCORCH);
            if (Creature* pTemp = me->SummonCreature(MOB_SCORCH_TARGET, me->getVictim()->GetPositionX(), me->getVictim()->GetPositionY(), me->getVictim()->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
            {
                pTemp->AddThreat(me->getVictim(),0.0f);
                pTemp->AI()->AttackStart(me->getVictim());
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
    NewScript->GetAI = &GetAI_boss_ignis;
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
