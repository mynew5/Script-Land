/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
SDName: Boss_Onyxia
SD%Complete: 90
SDComment: Spell Heated Ground is wrong, visual for area effect, Wing Buffet not ignoring armor
SDCategory: Onyxia's Lair
EndScriptData */

#include "ScriptedPch.h"
#include "onyxias_lair.h"

enum Yells
{
    SAY_AGGRO                   = -1249000,
    SAY_KILL                    = -1249001,
    SAY_PHASE_2_TRANS           = -1249002,
    SAY_PHASE_3_TRANS           = -1249003,
    EMOTE_BREATH                = -1249004
};

enum Spells
{
    SPELL_WINGBUFFET            = 18500,
    SPELL_FLAMEBREATH           = 18435,
    SPELL_CLEAVE                = 68868,
    SPELL_TAILSWEEP             = 68867,
    H_SPELL_WINGBUFFET          = 69293,
    H_SPELL_FLAMEBREATH         = 68970,
    H_SPELL_CLEAVE              = 68868,
    H_SPELL_TAILSWEEP           = 69286,

    SPELL_DEEPBREATH            = 23461,
    SPELL_FIREBALL              = 18392,
    H_SPELL_FIREBALL            = 68926,

    //Not much choise about these. We have to make own defintion on the direction/start-end point
    SPELL_BREATH_NORTH_TO_SOUTH = 17086,                    // 20x in "array"
    SPELL_BREATH_SOUTH_TO_NORTH = 18351,                    // 11x in "array"

    SPELL_BREATH_EAST_TO_WEST   = 18576,                    // 7x in "array"
    SPELL_BREATH_WEST_TO_EAST   = 18609,                    // 7x in "array"

    SPELL_BREATH_SE_TO_NW       = 18564,                    // 12x in "array"
    SPELL_BREATH_NW_TO_SE       = 18584,                    // 12x in "array"
    SPELL_BREATH_SW_TO_NE       = 18596,                    // 12x in "array"
    SPELL_BREATH_NE_TO_SW       = 18617,                    // 12x in "array"

    //SPELL_BREATH                = 21131,                  // 8x in "array", different initial cast than the other arrays

    SPELL_BELLOWINGROAR         = 18431,
    ACHIEV_TIMED_START_EVENT    = 6601
};

enum Constants
{
    MAX_WHELP                   = 20,
    H_MAX_WHELP                 = 40,
};

struct sOnyxMove
{
    uint32 uiLocId;
    uint32 uiLocIdEnd;
    uint32 uiSpellId;
    float fX, fY, fZ;
};

static sOnyxMove aMoveData[]=
{
    {0, 1, SPELL_BREATH_WEST_TO_EAST,   -33.5561f, -182.682f, -56.9457f},//west
    {1, 0, SPELL_BREATH_EAST_TO_WEST,   -31.4963f, -250.123f, -55.1278f},//east
    {2, 4, SPELL_BREATH_NW_TO_SE,         6.8951f, -180.246f, -55.896f},//north-west
    {3, 5, SPELL_BREATH_NE_TO_SW,        10.2191f, -247.912f, -55.896f},//north-east
    {4, 2, SPELL_BREATH_SE_TO_NW,       -63.5156f, -240.096f, -55.477f},//south-east
    {5, 3, SPELL_BREATH_SW_TO_NE,       -58.2509f, -189.020f, -55.790f},//south-west
    {6, 7, SPELL_BREATH_SOUTH_TO_NORTH, -65.8444f, -213.809f, -55.2985f},//south
    {7, 6, SPELL_BREATH_NORTH_TO_SOUTH,  22.8763f, -217.152f, -55.0548f},//north
};

const Position MiddleRoomLocation = {-23.6155, -215.357, -55.7344};

static float afSpawnLocations[3][3]=
{
    //Whelps
    {-30.127, -254.463, -89.440},
    {-30.817, -177.106, -89.258},
    //Lair Guard
    {-145.950, -212.831, -68.659}
};

struct boss_onyxiaAI : public ScriptedAI
{
    boss_onyxiaAI(Creature* pCreature) : ScriptedAI(pCreature), Summons(me) 
    {
        pInstance = pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* pInstance;
    SummonList Summons;

    uint32 m_uiPhase;

    uint32 m_uiFlameBreathTimer;
    uint32 m_uiCleaveTimer;
    uint32 m_uiTailSweepTimer;
    uint32 m_uiWingBuffetTimer;

    uint32 m_uiMovePoint;
    uint32 m_uiMovementTimer;
    sOnyxMove* m_pPointData;

    uint32 m_uiFireballTimer;
    uint32 m_uiWhelpTimer;
    uint32 m_uiLairGuardTimer;
    uint32 m_uiDeepBreathTimer;

    uint32 m_uiBellowingRoarTimer;

    uint8 m_uiSummonWhelpCount;
    uint8 m_uiSummonLairGuardCount;
    bool m_bIsSummoningWhelps;
    bool m_bIsSummoningLairGuards;
    bool m_bIsMoving;
    
    void Reset()
    {
        if (pInstance)
            pInstance->DoStopTimedAchievement(ACHIEVEMENT_TIMED_TYPE_EVENT, ACHIEV_TIMED_START_EVENT);

        if (!IsCombatMovement())
            SetCombatMovement(true);

        m_uiPhase = PHASE_START;

        m_uiFlameBreathTimer = urand(10000, 20000);
        m_uiTailSweepTimer = urand(15000, 20000);
        m_uiCleaveTimer = urand(2000, 5000);
        m_uiWingBuffetTimer = urand(10000, 20000);

        m_uiMovePoint = urand(0, 5);
        m_uiMovementTimer = 20000;
        m_pPointData = GetMoveData();

        m_uiFireballTimer = 15000;
        m_uiWhelpTimer = 1000;
        m_uiLairGuardTimer = 15000;
        m_uiDeepBreathTimer = 85000;

        m_uiBellowingRoarTimer = 30000;

        Summons.DespawnAll();
        m_uiSummonWhelpCount = 0;
        m_uiSummonLairGuardCount = 0;
        m_bIsSummoningWhelps = false;
        m_bIsSummoningLairGuards = false;
        m_bIsMoving = false;
        
        if (pInstance)
        {
            pInstance->SetData(TYPE_ONYXIA, NOT_STARTED);
            pInstance->SetData(DATA_ONYXIA_PHASE, m_uiPhase);
        }
    }

    void EnterCombat(Unit* pWho)
    {
        DoScriptText(SAY_AGGRO, me);
        me->SetInCombatWithZone();
        
        if (pInstance)
            pInstance->SetData(TYPE_ONYXIA, IN_PROGRESS);
		pInstance->DoStartTimedAchievement(ACHIEVEMENT_TIMED_TYPE_EVENT, ACHIEV_TIMED_START_EVENT);
    }

    void JustDied(Unit* killer)
    {
        if (pInstance)
            pInstance->SetData(TYPE_ONYXIA, DONE);

        Summons.DespawnAll();
    }

    void JustSummoned(Creature *pSummoned)
    {
        pSummoned->SetInCombatWithZone();
        if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
            pSummoned->AI()->AttackStart(pTarget);
        
        Summons.Summon(pSummoned);
        if (pSummoned->GetEntry() == NPC_WHELP)
            ++m_uiSummonWhelpCount;
        else if (pSummoned->GetEntry() == NPC_LAIRGUARD)
            ++m_uiSummonLairGuardCount;
    }

    void KilledUnit(Unit* pVictim)
    {
        DoScriptText(SAY_KILL, me);
    }

    void SpellHit(Unit *pCaster, const SpellEntry* pSpell)
    {
        if (pSpell->Id == SPELL_BREATH_EAST_TO_WEST ||
            pSpell->Id == SPELL_BREATH_WEST_TO_EAST ||
            pSpell->Id == SPELL_BREATH_SE_TO_NW ||
            pSpell->Id == SPELL_BREATH_NW_TO_SE ||
            pSpell->Id == SPELL_BREATH_SW_TO_NE ||
            pSpell->Id == SPELL_BREATH_NE_TO_SW)
        {
            m_pPointData = GetMoveData();
            m_uiMovePoint = m_pPointData->uiLocIdEnd;

            me->SetSpeed(MOVE_FLIGHT, 1.5f);
            me->GetMotionMaster()->MovePoint(8, MiddleRoomLocation);
        }
    }

    void MovementInform(uint32 type, uint32 id)
    {
        if (type == POINT_MOTION_TYPE)
        {
            switch (id)
            {
                case 8:
                    m_pPointData = GetMoveData();
                    if (m_pPointData)
                    {
                        me->SetSpeed(MOVE_FLIGHT, 1.0f);
                        me->GetMotionMaster()->MovePoint(m_pPointData->uiLocId, m_pPointData->fX, m_pPointData->fY, m_pPointData->fZ);
                    }
                    break;
                case 9:
                    me->GetMotionMaster()->MoveChase(me->getVictim());
                    m_uiBellowingRoarTimer = 1000;
                    break;
                default:
                    m_bIsMoving = false;
                    break;
            }
            
        }
    }
    
    void SpellHitTarget(Unit* target, const SpellEntry* pSpell) 
    {
        //Workaround - Couldn't find a way to group this spells (All Eruption)
        if (((pSpell->Id >= 17086 && pSpell->Id <= 17095) || 
            (pSpell->Id == 17097) ||
            (pSpell->Id >= 18351 && pSpell->Id <= 18361) ||
            (pSpell->Id >= 18564 && pSpell->Id <= 18576) ||
            (pSpell->Id >= 18578 && pSpell->Id <= 18607) ||
            (pSpell->Id == 18609) ||
            (pSpell->Id >= 18611 && pSpell->Id <= 18628) ||
            (pSpell->Id >= 21132 && pSpell->Id <= 21133) ||
            (pSpell->Id >= 21135 && pSpell->Id <= 21139) ||
            (pSpell->Id >= 22191 && pSpell->Id <= 22202) ||
            (pSpell->Id >= 22267 && pSpell->Id <= 22268)) &&
            (target->GetTypeId() == TYPEID_PLAYER))
        {
            if (pInstance)
            {
                pInstance->SetData(DATA_SHE_DEEP_BREATH_MORE, FAIL);
            }
        }
    }

    sOnyxMove* GetMoveData()
    {
        uint32 uiMaxCount = sizeof(aMoveData)/sizeof(sOnyxMove);

        for (uint32 i = 0; i < uiMaxCount; ++i)
        {
            if (aMoveData[i].uiLocId == m_uiMovePoint)
                return &aMoveData[i];
        }

        return NULL;
    }

    void SetNextRandomPoint()
    {
        uint32 uiMaxCount = sizeof(aMoveData)/sizeof(sOnyxMove);

        int iTemp = rand()%(uiMaxCount-1);

        if (iTemp >= m_uiMovePoint)
            ++iTemp;

        m_uiMovePoint = iTemp;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

        if (m_uiPhase == PHASE_START || m_uiPhase == PHASE_END)
        {
            if (m_uiFlameBreathTimer <= uiDiff)
            {
                DoCast(me->getVictim(), RAID_MODE(SPELL_FLAMEBREATH,H_SPELL_FLAMEBREATH));
                m_uiFlameBreathTimer = urand(10000, 20000);
            }
            else
                m_uiFlameBreathTimer -= uiDiff;

            if (m_uiTailSweepTimer <= uiDiff)
            {
                DoCastAOE(RAID_MODE(SPELL_TAILSWEEP,H_SPELL_TAILSWEEP));
                m_uiTailSweepTimer = urand(15000, 20000);
            }
            else
                m_uiTailSweepTimer -= uiDiff;

            if (m_uiCleaveTimer <= uiDiff)
            {
                DoCast(me->getVictim(), RAID_MODE(SPELL_CLEAVE,H_SPELL_CLEAVE));
                m_uiCleaveTimer = urand(2000, 5000);
            }
            else
                m_uiCleaveTimer -= uiDiff;

            if (m_uiWingBuffetTimer <= uiDiff)
            {
                DoCast(me->getVictim(), RAID_MODE(SPELL_WINGBUFFET,H_SPELL_WINGBUFFET));
                m_uiWingBuffetTimer = urand(15000, 30000);
            }
            else
                m_uiWingBuffetTimer -= uiDiff;

            if (m_uiPhase == PHASE_END)
            {
                if (m_uiBellowingRoarTimer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_BELLOWINGROAR);

                    // Eruption code
                    GameObject* pFloor = NULL;
                    Trinity::GameObjectInRangeCheck check(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 15);
                    Trinity::GameObjectLastSearcher<Trinity::GameObjectInRangeCheck> searcher(me, pFloor, check);
                    me->VisitNearbyGridObject(999, searcher);
                    if (pInstance && pFloor)
                        pInstance->SetData64(DATA_FLOOR_ERUPTION, pFloor->GetGUID());
                    m_uiBellowingRoarTimer = 30000;
                }
                else
                    m_uiBellowingRoarTimer -= uiDiff;
            }
            else
            {
                if (me->GetHealth()*100 / me->GetMaxHealth() < 60)
                {
                    m_uiPhase = PHASE_BREATH;
                    
                    if (pInstance)
                        pInstance->SetData(DATA_ONYXIA_PHASE, m_uiPhase);

                    SetCombatMovement(false);

                    me->GetMotionMaster()->Clear(false);
                    me->GetMotionMaster()->MoveIdle();
                    me->SetFlying(true);

                    DoScriptText(SAY_PHASE_2_TRANS, me);

                    if (m_pPointData)
                        me->GetMotionMaster()->MovePoint(m_pPointData->uiLocId, m_pPointData->fX, m_pPointData->fY, m_pPointData->fZ);

                    m_uiWhelpTimer = 1000;
                    return;
                }
            }

            DoMeleeAttackIfReady();
        }
        else
        {
            if (me->GetHealth()*100 / me->GetMaxHealth() < 40)
            {
                m_uiPhase = PHASE_END;
                if (pInstance)
                    pInstance->SetData(DATA_ONYXIA_PHASE, m_uiPhase);
                DoScriptText(SAY_PHASE_3_TRANS, me);

                SetCombatMovement(true);
                me->SetFlying(false);
                m_bIsMoving = false;
                me->GetMotionMaster()->MovePoint(9,me->GetHomePosition());
                return;
            }

            if (m_uiDeepBreathTimer <= uiDiff)
            {
                if (!m_bIsMoving) {
                    if (me->IsNonMeleeSpellCasted(false))
                            me->InterruptNonMeleeSpells(false);

                    DoScriptText(EMOTE_BREATH, me);
                    DoCast(me, m_pPointData->uiSpellId);
                    m_uiDeepBreathTimer = 70000;
                }
            } else
                m_uiDeepBreathTimer -= uiDiff;

            if (m_uiMovementTimer <= uiDiff)
            {
                if (!m_bIsMoving) {
                    SetNextRandomPoint();
                    m_pPointData = GetMoveData();

                    if (!m_pPointData)
                        return;

                    me->GetMotionMaster()->MovePoint(m_pPointData->uiLocId, m_pPointData->fX, m_pPointData->fY, m_pPointData->fZ);
                    m_bIsMoving = true;
                    m_uiMovementTimer = 25000;
                }
            } else
                m_uiMovementTimer -= uiDiff;

            if (m_uiFireballTimer <= uiDiff)
            {
                if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != POINT_MOTION_TYPE)
                {
                    if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                        DoCast(pTarget, RAID_MODE(SPELL_FIREBALL,H_SPELL_FIREBALL));

                    m_uiFireballTimer = 8000;
                }
            }
            else
                m_uiFireballTimer -= uiDiff;

            //Summons - Keep that code at the end of update!
            if (m_uiLairGuardTimer <= uiDiff)            
            {
                me->SummonCreature(NPC_LAIRGUARD, afSpawnLocations[2][0], afSpawnLocations[2][1], afSpawnLocations[2][2], 0.0f, TEMPSUMMON_CORPSE_DESPAWN);
                m_uiLairGuardTimer = 2000;
                if (m_uiSummonLairGuardCount >= RAID_MODE(1,2))
                {
                    m_uiSummonLairGuardCount = 0;
                    m_uiLairGuardTimer = 30000;
                }
                return;
            }
            else
                m_uiLairGuardTimer -= uiDiff;

            if (m_uiWhelpTimer <= uiDiff)
            {
                me->SummonCreature(NPC_WHELP, afSpawnLocations[0][0], afSpawnLocations[0][1], afSpawnLocations[0][2], 0.0f, TEMPSUMMON_CORPSE_DESPAWN);
                me->SummonCreature(NPC_WHELP, afSpawnLocations[1][0], afSpawnLocations[1][1], afSpawnLocations[1][2], 0.0f, TEMPSUMMON_CORPSE_DESPAWN);
                m_uiWhelpTimer = 500;
                if (m_uiSummonWhelpCount >= RAID_MODE(MAX_WHELP,H_MAX_WHELP))
                {
                    m_uiSummonWhelpCount = 0;
                    m_uiWhelpTimer = 90000;    
                }
                return;
            }
            else
                m_uiWhelpTimer -= uiDiff;
        }
    }
};

CreatureAI* GetAI_boss_onyxiaAI(Creature* pCreature)
{
    return new boss_onyxiaAI (pCreature);
}

void AddSC_boss_onyxia()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_onyxia";
    newscript->GetAI = &GetAI_boss_onyxiaAI;
    newscript->RegisterSelf();
}
