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
SDName: boss_kologarn
SD%Complete: 85%
SDComment: missing yells and stone grip
SDCategory: Ulduar
EndScriptData */

#include "precompiled.h"
#include "ulduar.h"

enum
{
    //yells

    //kologarn
    SPELL_OVERHEAD_SMASH        = 63356,
    SPELL_OVERHEAD_SMASH_H        = 64003,
    SPELL_ONE_ARMED_SMASH        = 63573,
    SPELL_ONE_ARMED_SMASH_H        = 64006,
    SPELL_STONE_SHOUT            = 63716,
    SPELL_STONE_SHOUT_H            = 64005,
    SPELL_PETRIFYING_BREATH        = 62030,
    SPELL_PETRIFYING_BREATH_H    = 63980,
    //left arm
    SPELL_SHOCKWAVE                = 63783,
    SPELL_SHOCKWAVE_H            = 63982,
    //right arm
    SPELL_STONE_GRIP            = 62166,
    SPELL_STONE_GRIP_H            = 63981,
    //both
    SPELL_ARM_VISUAL            = 64753,
    //rubble
    SPELL_RUMBLE                = 63818,
    SPELL_STONE_NOVA            = 63978,
    //NPC ids
    MOB_RUBBLE                    = 33768
};

float LeftArmX;
float LeftArmY;
float LeftArmZ;
float RightArmX;
float RightArmY;
float RightArmZ;

// Rubble
struct FLAMEMU_DLL_DECL mob_ulduar_rubbleAI : public ScriptedAI
{
    mob_ulduar_rubbleAI(Creature* pCreature) : ScriptedAI(pCreature) 
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;

    uint32 Stone_Nova_Timer;
    uint32 Death_Timer;

    bool die;

    void Reset()
    {
        die = false;
        Stone_Nova_Timer = urand(8000, 12000);
    }

    void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
    {
        if (uiDamage > m_creature->GetHealth())
            if (!die)
            {
                uiDamage = 0;
                DoCast(m_creature, SPELL_RUMBLE);
                Death_Timer = 500;
                die = true;
            }
    }

    void UpdateAI(const uint32 diff)
    {
        if (Death_Timer < diff && die)
        {
            m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        }else Death_Timer -= diff;

        if (Stone_Nova_Timer < diff && !die)
        {
            DoCast(m_creature, SPELL_STONE_NOVA);
            Stone_Nova_Timer = urand(7000, 9000);
        }else Stone_Nova_Timer -= diff;

        if (!die)
            DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_ulduar_rubble(Creature* pCreature)
{
    return new mob_ulduar_rubbleAI(pCreature);
}

// Left Arm
struct FLAMEMU_DLL_DECL boss_left_armAI : public ScriptedAI
{
    boss_left_armAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        SetCombatMovement(false);
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        LeftArmX = 1777.636841; LeftArmY = -47.970596; LeftArmZ = 448.805908;
    }

    bool m_bIsRegularMode;
    ScriptedInstance* m_pInstance;

    uint32 Shockwave_Timer;
    uint32 Addcount;

    void Reset()
    {
        Shockwave_Timer = 30000;
        Addcount = 0;
        DoCast(m_creature, SPELL_ARM_VISUAL);
    }

    void Aggro(Unit* pWho)
    {
        if (m_pInstance)
        {
            if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_RIGHT_ARM))))
                if (pTemp->isAlive())
                    pTemp->SetInCombatWithZone();
            if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_KOLOGARN))))
                if (pTemp->isAlive())
                    pTemp->SetInCombatWithZone();
        }
    }

    void JustDied(Unit* pKiller)
    {
        if (!m_pInstance)
            return;
        if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_KOLOGARN))))
            if (pTemp->isAlive())
                pTemp->DealDamage(pTemp, m_creature->GetMaxHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        do{
            if (Creature* pTemp = m_creature->SummonCreature(MOB_RUBBLE, LeftArmX, LeftArmY, LeftArmZ, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                    {
                        pTemp->AddThreat(pTarget,0.0f);
                        pTemp->AI()->AttackStart(pTarget);
                    }
            Addcount++;
        } while(Addcount<5);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (Shockwave_Timer < diff)
        {
            DoCast(m_creature, m_bIsRegularMode ? SPELL_SHOCKWAVE : SPELL_SHOCKWAVE_H);
            Shockwave_Timer = 30000;
        }else Shockwave_Timer -= diff;
    }
};

CreatureAI* GetAI_boss_left_arm(Creature* pCreature)
{
    return new boss_left_armAI(pCreature);
}

// Right Arm
struct FLAMEMU_DLL_DECL boss_right_armAI : public ScriptedAI
{
    boss_right_armAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        SetCombatMovement(false);
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        RightArmX = 1779.671753; RightArmY = 1.514701; RightArmZ = 448.810577;
    }

    bool m_bIsRegularMode;
    ScriptedInstance* m_pInstance;

    uint32 Stone_Grip_Timer;
    uint32 Addcount;
    uint32 gripdmg;
    uint32 freedmg;
    uint64 GripTarget;

    bool grip;

    void Reset()
    {
        Stone_Grip_Timer = 20000;
        Addcount = 0;
        GripTarget = 0;
        gripdmg = 0;
        freedmg = 0;
        grip = false;
        DoCast(m_creature, SPELL_ARM_VISUAL);
    }

    void Aggro(Unit* pWho)
    {
        if (m_pInstance)
        {
            if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_LEFT_ARM))))
                if (pTemp->isAlive())
                    pTemp->SetInCombatWithZone();
            if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_KOLOGARN))))
                if (pTemp->isAlive())
                    pTemp->SetInCombatWithZone();
        }
    }

    void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
    {
        if (grip)
        {
            gripdmg += uiDamage;
            freedmg = m_bIsRegularMode ? 100000 : 480000;
            if (gripdmg > freedmg || uiDamage > m_creature->GetHealth())
            {
                if (Unit* pGripTarget = Unit::GetUnit(*m_creature, GripTarget)){
                    if (pGripTarget->HasAura(SPELL_STONE_GRIP))
                        pGripTarget->RemoveAurasDueToSpell(SPELL_STONE_GRIP);
                    if (pGripTarget->HasAura(SPELL_STONE_GRIP_H))
                        pGripTarget->RemoveAurasDueToSpell(SPELL_STONE_GRIP_H);
                }
                grip = false;
                gripdmg = 0;
            }
        }
    }

    void JustDied(Unit* pKiller)
    {
        if (!m_pInstance)
            return;
        if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_KOLOGARN))))
            if (pTemp->isAlive())
                pTemp->DealDamage(pTemp, m_creature->GetMaxHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        do{
            if (Creature* pTemp = m_creature->SummonCreature(MOB_RUBBLE, RightArmX, RightArmY, RightArmZ, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                    {
                        pTemp->AddThreat(pTarget,0.0f);
                        pTemp->AI()->AttackStart(pTarget);
                    }
            Addcount++;
        } while(Addcount<5);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (Stone_Grip_Timer < diff)
        {
            //stone grip emote
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0)){
                //DoCast(target, m_bIsRegularMode ? SPELL_STONE_GRIP : SPELL_STONE_GRIP_H);
                GripTarget = target->GetGUID();
                grip = true;
                gripdmg = 0;
            }
            Stone_Grip_Timer = 30000;
        }else Stone_Grip_Timer -= diff;
    }
};

CreatureAI* GetAI_boss_right_arm(Creature* pCreature)
{
    return new boss_right_armAI(pCreature);
}

// Kologarn
struct FLAMEMU_DLL_DECL boss_kologarnAI : public ScriptedAI
{
    boss_kologarnAI(Creature* pCreature) : ScriptedAI(pCreature) 
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        SetCombatMovement(false);
        Reset();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    uint32 Spell_Timer;
    uint32 Check_Timer;
    uint32 respawnright;
    uint32 respawnleft;

    bool right;
    bool left;

    void Reset()
    {
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);
        Spell_Timer = 10000;
        Check_Timer = 6300;
        right = true;
        left = true;
    }

    void JustDied(Unit* pKiller)
    {
        //death yell
        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_KOLOGARN, DONE);
            if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_LEFT_ARM))))
                if (pTemp->isAlive())
                    pTemp->DealDamage(pTemp, pTemp->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_RIGHT_ARM))))
                if (pTemp->isAlive())
                    pTemp->DealDamage(pTemp, pTemp->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        }
    }

    void Aggro(Unit* pWho)
    {
        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_KOLOGARN, IN_PROGRESS);
            if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_LEFT_ARM))))
                if (pTemp->isAlive())
                    pTemp->SetInCombatWithZone();
            if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_RIGHT_ARM))))
                if (pTemp->isAlive())
                    pTemp->SetInCombatWithZone();
        }
        //aggro yell
    }

    void JustReachedHome()
    {
        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_KOLOGARN, FAIL);
            if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_LEFT_ARM))))
                if (!pTemp->isAlive())
                    pTemp->Respawn();
            if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_RIGHT_ARM))))
                if (!pTemp->isAlive())
                    pTemp->Respawn();
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (Spell_Timer < diff)
        {
            if (right && left)
                DoCast(m_creature->getVictim(), m_bIsRegularMode ? SPELL_OVERHEAD_SMASH : SPELL_OVERHEAD_SMASH_H);
            else
                if (!right && !left)
                    DoCast(m_creature->getVictim(), m_bIsRegularMode ? SPELL_STONE_SHOUT : SPELL_STONE_SHOUT_H);
                else
                    DoCast(m_creature->getVictim(), m_bIsRegularMode ? SPELL_ONE_ARMED_SMASH : SPELL_ONE_ARMED_SMASH_H);
            Spell_Timer = 20000;
        }else Spell_Timer -= diff;   

        if (respawnleft < diff && !left)
        {
            if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_LEFT_ARM))))
                if (!pTemp->isAlive())
                    pTemp->Respawn();
            left = true;
        }else respawnleft -= diff;  

        if (respawnright < diff && !right)
        {
            if (Creature* pTemp = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_RIGHT_ARM))))
                if (!pTemp->isAlive())
                    pTemp->Respawn();
            right = true;
        }else respawnright -= diff; 

        if (Check_Timer < diff)
        {
            if (Creature* lArm = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_LEFT_ARM))))
                if (!lArm->isAlive() && left)
                {
                    left = false;
                    respawnleft = 60000;
                }
            if (Creature* rArm = ((Creature*)Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_RIGHT_ARM))))
                if (!rArm->isAlive() && right)
                {
                    right = false;
                    respawnright = 60000;
                }
            if (!m_creature->IsWithinDistInMap(m_creature->getVictim(), 10))
                DoCast(m_creature->getVictim(), m_bIsRegularMode ? SPELL_PETRIFYING_BREATH : SPELL_PETRIFYING_BREATH_H);
            Check_Timer = 500;
        }else Check_Timer -= diff;
        
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_kologarn(Creature* pCreature)
{
    return new boss_kologarnAI(pCreature);
}

void AddSC_boss_kologarn()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "boss_kologarn";
    NewScript->GetAI = GetAI_boss_kologarn;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "mob_ulduar_rubble";
    NewScript->GetAI = &GetAI_mob_ulduar_rubble;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_left_arm";
    NewScript->GetAI = &GetAI_boss_left_arm;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_right_arm";
    NewScript->GetAI = &GetAI_boss_right_arm;
    NewScript->RegisterSelf();
}