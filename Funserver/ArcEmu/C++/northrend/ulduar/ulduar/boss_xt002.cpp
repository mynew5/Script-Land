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

#define    SPELL_LIGHT_BOMB  (63018,65121)
#define    SPELL_GRAVITY_BOMB  (63024,64234)

enum
{
    //xt yells
    SAY_AGGRO = -1603000,
    SAY_DEATH = -1603008,
    SAY_TANCTRUM = -1603001,
    SAY_SLAY_01 = -1603002,
    SAY_SLAY_02 = -1603003,
    SAY_BERSERK = -1603007,
    SAY_ADDS = -1603006,
    SAY_HEART_OPEN = -1603004,
    SAY_HEART_CLOSE = -1603005,
 
    //xt-002
    SPELL_TANCTRUM = 62776,
    SPELL_ENRAGE = 47008,
    SPELL_STUN = 3618,
 
    //heart of the deconstructor
    SPELL_EXPOSED_HEART = 63849,
 
    //XE-321 Boombot
    SPELL_BOOM = 38831, // replacing real spell
 
    //XM-024 Pummeller
    SPELL_CLEAVE = 8374,
    SPELL_TRAMPLE = 5568,
    SPELL_UPPERCUT = 10966,
 
    //NPC ids
    NPC_HEART = 33329,
    NPC_SCRAPBOT = 33343,
    NPC_BOOMBOT = 33346,
    NPC_PUMMELER = 33344,
    ACHIEV_TIMED_START_EVENT                      = 21027
};

 
float XtAddX[4];
float XtAddY[4];
float XtAddZ[4];
 
//XT-002 Deconstructor
struct boss_xt002AI : public ScriptedAI
{
    boss_xt002AI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = pCreature->GetInstanceData();
        XtAddX[0] = 792.706; XtAddY[0] = 64.033; XtAddZ[0] = 413.632;
        XtAddX[1] = 879.750; XtAddY[1] = 64.815; XtAddZ[1] = 409.804;
        XtAddX[2] = 896.488; XtAddY[2] = -93.018; XtAddZ[2] = 411.731;
        XtAddX[3] = 791.016; XtAddY[3] = -83.516; XtAddZ[3] = 409.804;
        Reset();
    }
 
    ScriptedInstance* m_pInstance;

 
    std::list<uint64> m_lScrapbotsGUIDList;
    std::list<uint64> m_lBoombotsGUIDList;
    std::list<uint64> m_lPummelerGUIDList;
 
    uint32 Heart_Timer;
    uint32 Light_Bomb_Timer;
    uint32 Gravity_Bomb_Timer;
    uint32 Tanctrum_Timer;
    uint32 add_summon_delay;
    uint32 Enrage_Timer;
    uint32 Range_Check_Timer;
    uint32 Addcount;
    bool heart1;
    bool heart2;
    bool heart3;
    bool enrage;
    bool phase2;
    bool add1;
    bool add2;
    bool add3;
    bool add4;
 
    void Reset()
    {
	if (m_pInstance)
            m_pInstance->SetData(TYPE_XT002, NOT_STARTED);
        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);
        Light_Bomb_Timer = 7000; //7 seconds the first 14 secs all after(7 secs in 25man)
        Gravity_Bomb_Timer = 11000; //11 seconds first 18 secs all after(11 secs in 25man)
        Tanctrum_Timer = 38000; // 38 seconds first 40 secs all after
        add_summon_delay = 5000;
        Enrage_Timer = 600000;
        Range_Check_Timer = 1000;
        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        Addcount = 0;
        heart1 = false;
        heart2 = false;
        heart3 = false;
        enrage = false;
        phase2 = false;
        add1 = false;
        add2 = false;
        add3 = false;
        add4 = false;
        m_lScrapbotsGUIDList.clear();
        m_lBoombotsGUIDList.clear();
        m_lPummelerGUIDList.clear();
    }
 
    void JustDied(Unit* pKiller)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_XT002, DONE);
        DoScriptText(SAY_DEATH, me);
        if (!m_lScrapbotsGUIDList.empty())
            {
                for(std::list<uint64>::iterator itr = m_lScrapbotsGUIDList.begin(); itr != m_lScrapbotsGUIDList.end(); ++itr)
                    if (Creature* pTemp = (Creature*)Unit::GetUnit(*me, *itr))
                            pTemp->ForcedDespawn();
            }
        if (!m_lBoombotsGUIDList.empty())
            {
                for(std::list<uint64>::iterator itr = m_lBoombotsGUIDList.begin(); itr != m_lBoombotsGUIDList.end(); ++itr)
                    if (Creature* pTemp = (Creature*)Unit::GetUnit(*me, *itr))
                            pTemp->ForcedDespawn();
            }
        if (!m_lPummelerGUIDList.empty())
            {
                for(std::list<uint64>::iterator itr = m_lPummelerGUIDList.begin(); itr != m_lPummelerGUIDList.end(); ++itr)
                    if (Creature* pTemp = (Creature*)Unit::GetUnit(*me, *itr))
                            pTemp->ForcedDespawn();
            }
    }
 
    void Aggro(Unit* pWho)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_XT002, IN_PROGRESS);
        DoScriptText(SAY_AGGRO, me);
    }
 
    void JustReachedHome()
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_XT002, FAIL);
    }
 
    void KilledUnit(Unit* pVictim)
    {
        switch(urand(0, 1))
                {
                    case 0: DoScriptText(SAY_SLAY_01, me); break;
                    case 1: DoScriptText(SAY_SLAY_02, me); break;
                }
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!me->getVictim())
            return;
 
        if (Light_Bomb_Timer < diff && !phase2)
	{
	if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,1))
	DoCast(target, SPELL_LIGHT_BOMB);
	Light_Bomb_Timer = urand(7000,14000);
	}else Light_Bomb_Timer -= diff;
 
	/*if (Gravity_Bomb_Timer < diff && !phase2)
	{
	if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,1))
	DoCast(target, m_bIsRegularMode ? SPELL_GRAVITY_BOMB : SPELL_GRAVITY_BOMB_H);
	Gravity_Bomb_Timer = m_bIsRegularMode ? 18000 :11000;
	}else Gravity_Bomb_Timer -= diff; */
 
        if (Tanctrum_Timer < diff && !phase2)
        {
            DoCast(me, SPELL_TANCTRUM);
            DoScriptText(SAY_TANCTRUM, me);
            Tanctrum_Timer = 40000;
        }else Tanctrum_Timer -= diff;
 
        if (Enrage_Timer < diff && !enrage && !phase2)
        {
            DoCast(me, SPELL_ENRAGE);
            if (me->HasAura(SPELL_ENRAGE))
            {
                enrage = true;
                DoScriptText(SAY_BERSERK, me);
            }
            else
                Enrage_Timer = 5000;
        }else Enrage_Timer -= diff;
 
        if (Range_Check_Timer < diff)
        {
            if (!m_lScrapbotsGUIDList.empty())
            {
                for(std::list<uint64>::iterator itr = m_lScrapbotsGUIDList.begin(); itr != m_lScrapbotsGUIDList.end(); ++itr)
                    if (Creature* pTemp = (Creature*)Unit::GetUnit(*me, *itr))
                        if (pTemp->isAlive() && me->IsWithinDistInMap(pTemp, ATTACK_DISTANCE))
                        {
                            me->SetHealth(me->GetHealth() + me->GetMaxHealth() * 0.01);
                            pTemp->DealDamage(pTemp, pTemp->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
                        }
            }
            if (!m_lBoombotsGUIDList.empty())
            {
                for(std::list<uint64>::iterator itr = m_lBoombotsGUIDList.begin(); itr != m_lBoombotsGUIDList.end(); ++itr)
                    if (Creature* pTemp = (Creature*)Unit::GetUnit(*me, *itr))
                        if (pTemp->isAlive() && me->IsWithinDistInMap(pTemp, ATTACK_DISTANCE))
                        {
                            pTemp->DealDamage(pTemp, pTemp->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
                        }
            }
            Range_Check_Timer = 1000;
        }else Range_Check_Timer -= diff;
 
        if (!phase2 && !heart1 && (me->GetHealth()*100 / me->GetMaxHealth()) < 75)
        {
            Heart_Timer = 30000;
            heart1 = true;
            phase2 = true;
            add1 = false;
            add2 = false;
            add3 = false;
            add4 = false;
            add_summon_delay = 5000;
            DoScriptText(SAY_HEART_OPEN, me);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            DoCast(me, SPELL_STUN);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SummonCreature(NPC_HEART, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
        }
 
        if (!phase2 && heart1 && !heart2 && (me->GetHealth()*100 / me->GetMaxHealth()) < 50)
        {
            Heart_Timer = 30000;
            heart2 = true;
            phase2 = true;
            add1 = false;
            add2 = false;
            add3 = false;
            add4 = false;
            add_summon_delay = 5000;
            DoScriptText(SAY_HEART_OPEN, me);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            DoCast(me, SPELL_STUN);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SummonCreature(NPC_HEART, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
        }
 
        if (!phase2 && heart1 && heart2 && !heart3 && (me->GetHealth()*100 / me->GetMaxHealth()) < 25)
        {
            Heart_Timer = 30000;
            heart3 = true;
            phase2 = true;
            add1 = false;
            add2 = false;
            add3 = false;
            add4 = false;
            add_summon_delay = 5000;
            DoScriptText(SAY_HEART_OPEN, me);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            DoCast(me, SPELL_STUN);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SummonCreature(NPC_HEART, 0.0f, 0.0f, 0.0f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
        }
 
        if (phase2 && Heart_Timer < diff)
        {
            DoScriptText(SAY_HEART_CLOSE, me);
            me->RemoveAurasDueToSpell(SPELL_STUN);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->AI()->AttackStart(me->getVictim());
            phase2 = false;
            Light_Bomb_Timer = 7000;
            Gravity_Bomb_Timer = 11000;
            Tanctrum_Timer = 38000;
        }else Heart_Timer -= diff;
 
        if (phase2 && add_summon_delay < diff)
        {
            if (!add1)
            {
                Addcount = 0;
                do{
                if (Creature* pTemp = me->SummonCreature(NPC_SCRAPBOT, XtAddX[0], XtAddY[0], XtAddZ[0], 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
                {
                    pTemp->AddThreat(me->getVictim(),1000.0f);
                    pTemp->AI()->AttackStart(me->getVictim());
                    m_lScrapbotsGUIDList.push_back(pTemp->GetGUID());
                    Addcount++;
                }} while(Addcount<3);
                Addcount = 0;
                do{
                if (Creature* pTemp = me->SummonCreature(NPC_BOOMBOT, XtAddX[0], XtAddY[0], XtAddZ[0], 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
                {
                    pTemp->AddThreat(me->getVictim(),1000.0f);
                    pTemp->AI()->AttackStart(me->getVictim());
                    m_lBoombotsGUIDList.push_back(pTemp->GetGUID());
                    Addcount++;
                }} while(Addcount<1);
                add1 = true;
                add_summon_delay = 4000;
            }
            if (!add2 && add1)
            {
                Addcount = 0;
                do{
                if (Creature* pTemp = me->SummonCreature(NPC_SCRAPBOT, XtAddX[1], XtAddY[1], XtAddZ[1], 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
                {
                    pTemp->AddThreat(me->getVictim(),1000.0f);
                    pTemp->AI()->AttackStart(me->getVictim());
                    m_lScrapbotsGUIDList.push_back(pTemp->GetGUID());
                    Addcount++;
                }} while(Addcount<3);
                Addcount = 0;
                do{
                if (Creature* pTemp = me->SummonCreature(NPC_BOOMBOT, XtAddX[1], XtAddY[1], XtAddZ[1], 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
                {
                    pTemp->AddThreat(me->getVictim(),1000.0f);
                    pTemp->AI()->AttackStart(me->getVictim());
                    m_lBoombotsGUIDList.push_back(pTemp->GetGUID());
                    Addcount++;
                }} while(Addcount<1);
                add2 = true;
                DoScriptText(SAY_ADDS, me);
                add_summon_delay = 1000;
            }
            if (!add3 && add2 && add1)
            {
                Addcount = 0;
                do{
                if (Creature* pTemp = me->SummonCreature(NPC_SCRAPBOT, XtAddX[2], XtAddY[2], XtAddZ[2], 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
                {
                    pTemp->AddThreat(me->getVictim(),1000.0f);
                    pTemp->AI()->AttackStart(me->getVictim());
                    m_lScrapbotsGUIDList.push_back(pTemp->GetGUID());
                    Addcount++;
                }} while(Addcount<3);
                Addcount = 0;
                do{
                if (Creature* pTemp = me->SummonCreature(NPC_BOOMBOT, XtAddX[2], XtAddY[2], XtAddZ[2], 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
                {
                    pTemp->AddThreat(me->getVictim(),1000.0f);
                    pTemp->AI()->AttackStart(me->getVictim());
                    m_lBoombotsGUIDList.push_back(pTemp->GetGUID());
                    Addcount++;
                }} while(Addcount<1);
                add3 = true;
                add_summon_delay = 4000;
            }
            if (!add4 && add3 && add2 && add1)
            {
                if (Creature* pTemp = me->SummonCreature(NPC_PUMMELER, XtAddX[3], XtAddY[3], XtAddZ[3], 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
                if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                {
                    pTemp->AddThreat(pTarget,0.0f);
                    pTemp->AI()->AttackStart(pTarget);
                    m_lPummelerGUIDList.push_back(pTemp->GetGUID());
                }
                Addcount = 0;
                do{
                if (Creature* pTemp = me->SummonCreature(NPC_SCRAPBOT, XtAddX[3], XtAddY[3], XtAddZ[3], 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
                {
                    pTemp->AddThreat(me->getVictim(),1000.0f);
                    pTemp->AI()->AttackStart(me->getVictim());
                    m_lScrapbotsGUIDList.push_back(pTemp->GetGUID());
                    Addcount++;
                }} while(Addcount<3);
                Addcount = 0;
                do{
                if (Creature* pTemp = me->SummonCreature(NPC_BOOMBOT, XtAddX[3], XtAddY[3], XtAddZ[3], 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
                {
                    pTemp->AddThreat(me->getVictim(),1000.0f);
                    pTemp->AI()->AttackStart(me->getVictim());
                    m_lBoombotsGUIDList.push_back(pTemp->GetGUID());
                    Addcount++;
                }} while(Addcount<1);
                add4 = true;
                add_summon_delay = 30000;
            }
        }else add_summon_delay -= diff;
 
        if (!phase2)
            DoMeleeAttackIfReady();
    }
};

struct mob_pummelerAI : public ScriptedAI
{
    mob_pummelerAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}
 
    uint32 Spell_Timer;
 
    void Reset()
    {
        Spell_Timer = urand(15000, 25000);
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!me->getVictim())
            return;
 
        if (Spell_Timer < diff)
        {
            switch(urand(0, 2))
            {
                case 0:
                    DoCast(me->getVictim(), SPELL_CLEAVE);
                break;
                case 1:
                    DoCast(me->getVictim(), SPELL_TRAMPLE);
                break;
                case 2:
                    DoCast(me->getVictim(), SPELL_UPPERCUT);
                break;
            }
            Spell_Timer = urand(15000, 25000);
        }else Spell_Timer -= diff;
        
        DoMeleeAttackIfReady();
    }
};

struct mob_boombotAI : public ScriptedAI
{
    mob_boombotAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}
 
    void Reset()
    {
    }
 
    void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
    {
        if (uiDamage > me->GetHealth()){
            uiDamage = 0;
            DoCast(me, SPELL_BOOM);
        }
    }
 
    void DoMeleeAttackIfReady()
    {
        //If we are within range melee the target
        if (me->IsWithinDistInMap(me->getVictim(), ATTACK_DISTANCE))
        {
            DoCast(me, SPELL_BOOM);
        }
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!me->getVictim())
            return;
 
        DoMeleeAttackIfReady();
    }
};

struct mob_xtheartAI : public ScriptedAI
{
    mob_xtheartAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        SetCombatMovement(false);
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }
 
    ScriptedInstance* m_pInstance;
 
    uint32 Exposed_Timer;
    uint32 heartdamage;
 
    void Reset()
    {
        Exposed_Timer = 30000;
        DoCast(me, SPELL_EXPOSED_HEART);
        heartdamage = 0;
    }
 
    void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
    {
        heartdamage += uiDamage;
    }
 
    void JustDied(Unit* pKiller)
    {
        if (heartdamage != 0)
            if (Creature* pTemp = ((Creature*)Unit::GetUnit((*me), m_pInstance->GetData64(NPC_XT002))))
                if (pTemp->isAlive())
                {
                    pTemp->DealDamage(pTemp, heartdamage, NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
                    heartdamage = 0;
                }
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (Exposed_Timer < diff)
        {
            if (Creature* pTemp = ((Creature*)Unit::GetUnit((*me), m_pInstance->GetData64(NPC_XT002))))
                if (pTemp->isAlive())
                    pTemp->DealDamage(pTemp, heartdamage, NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            heartdamage = 0;
            me->DealDamage(me, me->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        }else Exposed_Timer -= diff;
            
    }
 
};

CreatureAI* GetAI_boss_xt002(Creature* pCreature)
{
    return new boss_xt002AI(pCreature);
}
 
CreatureAI* GetAI_mob_xtheart(Creature* pCreature)
{
    return new mob_xtheartAI(pCreature);
}
 
CreatureAI* GetAI_mob_boombot(Creature* pCreature)
{
    return new mob_boombotAI(pCreature);
}

CreatureAI* GetAI_mob_pummeler(Creature* pCreature)
{
    return new mob_pummelerAI(pCreature);
}

void AddSC_boss_xt002()
{
    Script* NewScript;
 
    NewScript = new Script;
    NewScript->Name = "boss_xt002";
    NewScript->GetAI = GetAI_boss_xt002;
    NewScript->RegisterSelf();
 
    NewScript = new Script;
    NewScript->Name = "mob_pummeler";
    NewScript->GetAI = &GetAI_mob_pummeler;
    NewScript->RegisterSelf();
 
    NewScript = new Script;
    NewScript->Name = "mob_boombot";
    NewScript->GetAI = &GetAI_mob_boombot;
    NewScript->RegisterSelf();
 
    NewScript = new Script;
    NewScript->Name = "mob_xtheart";
    NewScript->GetAI = &GetAI_mob_xtheart;
    NewScript->RegisterSelf();
}