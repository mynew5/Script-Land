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
SDName: Instance_Onyxias_Lair
SD%Complete: 
SDComment:
SDCategory: Onyxias Lair
EndScriptData */

#include "ScriptedPch.h"
#include "onyxias_lair.h"

#define MAX_ENCOUNTER 1

/* Encounter 0 = Onyxia
 */

struct instance_onyxias_lair : public ScriptedInstance
{
    instance_onyxias_lair(Map* pMap) : ScriptedInstance(pMap) {Initialize();};

    //Eruption is a BFS graph problem
    //One map to remember all floor, one map to keep floor that still need to erupt and one queue to know what needs to be removed
    std::map<uint64,uint32> FloorEruptionGUID[2]; 
    std::queue<uint64> FloorEruptionGUIDQueue; 
    
    uint64 m_uiOnyxiasGUID;
    uint32 uiOnyxiaKillTimer;
    uint32 uiOnyxiaLiftoffTimer;
    uint32 uiManyWhelpsCounter;
    bool   bAchievManyWhelpsHandleIt;
    bool   bAchievSheDeepBreathMore;
    
    uint32 m_uiEruptTimer;

    uint8 m_auiEncounter[MAX_ENCOUNTER];

    void Initialize()
    {
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));

        m_uiOnyxiasGUID = 0;
        uiOnyxiaKillTimer = 0;
        uiOnyxiaLiftoffTimer = 0;
        uiManyWhelpsCounter = 0;
        bAchievManyWhelpsHandleIt = false;
        bAchievSheDeepBreathMore = true;

        m_uiEruptTimer = 0;
    }

    void OnCreatureCreate(Creature* pCreature, bool add)
    {
        switch (pCreature->GetEntry())
        {
            case NPC_ONYXIA:
                m_uiOnyxiasGUID = pCreature->GetGUID();
                break;
        }
    }

    void OnGameObjectCreate(GameObject* pGo, bool add)
    {
        //Selecting much more objects then needed =/
        if ((pGo->GetGOInfo()->displayId == 4392 || pGo->GetGOInfo()->displayId == 4472) && pGo->GetGOInfo()->trap.spellId == 17731)
        {
            if (add)
                FloorEruptionGUID[0].insert(std::make_pair(pGo->GetGUID(),0));
            else
                FloorEruptionGUID[0].erase(pGo->GetGUID());
            return;
        }

        switch(pGo->GetEntry())
        {
            case GO_WHELP_SPAWNER:
                Position pGoPos;
                pGo->GetPosition(&pGoPos);
                if (Creature* pTemp = pGo->SummonCreature(NPC_WHELP,pGoPos,TEMPSUMMON_CORPSE_DESPAWN))
                {
                    pTemp->SetInCombatWithZone();
                    ++uiManyWhelpsCounter;
                }
                break;
        }
    }

    void FloorEruption(uint64 floorEruptedGUID)
    {
        if (GameObject *pFloorEruption = instance->GetGameObject(floorEruptedGUID))
        {
            //THIS GOB IS A TRAP - What shall i do? =(
            //Cast it spell? Copyed Heigan method
            pFloorEruption->SendCustomAnim();
            pFloorEruption->CastSpell(NULL, Difficulty(instance->GetSpawnMode()) == RAID_DIFFICULTY_10MAN_NORMAL ? 17731 : 69294); //pFloorEruption->GetGOInfo()->trap.spellId

            //Get all immediatly nearby floors 
            std::list<GameObject*> nearFloorList;
            Trinity::GameObjectInRangeCheck check(pFloorEruption->GetPositionX(), pFloorEruption->GetPositionY(), pFloorEruption->GetPositionZ(), 15);
            Trinity::GameObjectListSearcher<Trinity::GameObjectInRangeCheck> searcher(pFloorEruption, nearFloorList, check);
            pFloorEruption->VisitNearbyGridObject(999, searcher);
            //remove all that are not present on FloorEruptionGUID[1] and update treeLen on each GUID
            for (std::list<GameObject*>::const_iterator itr = nearFloorList.begin(); itr != nearFloorList.end(); ++itr)
            {
                if (((*itr)->GetGOInfo()->displayId == 4392 || (*itr)->GetGOInfo()->displayId == 4472) && (*itr)->GetGOInfo()->trap.spellId == 17731)
                {
                    uint64 nearFloorGUID = (*itr)->GetGUID();
                    if (FloorEruptionGUID[1].find(nearFloorGUID) != FloorEruptionGUID[1].end() && (*FloorEruptionGUID[1].find(nearFloorGUID)).second == 0)
                    {
                        (*FloorEruptionGUID[1].find(nearFloorGUID)).second = (*FloorEruptionGUID[1].find(floorEruptedGUID)).second+1;
                        (*FloorEruptionGUID[1].find(nearFloorGUID)).second = (*FloorEruptionGUID[1].find(floorEruptedGUID)).second+1;
                        FloorEruptionGUIDQueue.push(nearFloorGUID);
                    }
                }
            }
        }
        FloorEruptionGUID[1].erase(floorEruptedGUID);
    }

    void SetData(uint32 uiType, uint32 uiData)
    {
        switch(uiType)
        {
            case TYPE_ONYXIA:
                m_auiEncounter[0] = uiData;
                if (uiData == IN_PROGRESS)
                {
                    uiOnyxiaKillTimer = 5*MINUTE*IN_MILISECONDS;
                    SetData(DATA_SHE_DEEP_BREATH_MORE, IN_PROGRESS);
                }
                break;
            case DATA_ONYXIA_PHASE:
                if (uiData == PHASE_BREATH) //Used to mark the liftoff phase
                {
                    bAchievManyWhelpsHandleIt = false;
                    uiManyWhelpsCounter = 0;
                    uiOnyxiaLiftoffTimer = 10*IN_MILISECONDS;
                }
                break;
            case DATA_SHE_DEEP_BREATH_MORE:
                if (uiData == IN_PROGRESS)
                {
                    bAchievSheDeepBreathMore = true;
                }
                else if (uiData == FAIL)
                {
                    bAchievSheDeepBreathMore = false;
                }
                break;
        }
    }

    void SetData64(uint32 uiType, uint64 uiData)
    {
        switch(uiType)
        {
            case DATA_FLOOR_ERUPTION:
                FloorEruptionGUID[1] = FloorEruptionGUID[0];
                FloorEruptionGUIDQueue.push(uiData);
                m_uiEruptTimer = 2500;
                break;
        }
    }

    uint32 GetData(uint32 uiType)
    {
        switch(uiType)
        {
            case TYPE_ONYXIA:
                return m_auiEncounter[0];
        }

        return 0;
    }

    uint64 GetData64(uint32 uiData)
    {
        switch(uiData)
        {
            case DATA_ONYXIA:
                return m_uiOnyxiasGUID;
        }

        return 0;
    }

    bool CheckAchievementCriteriaMeet(uint32 criteria_id, Player const* source, Unit const* target = NULL, uint32 miscvalue1 = 0)
    {
        switch(criteria_id)
        {
            case 12564:  // Criteria for achievement 4402: More Dots! (10 player) 5min kill
                if (Difficulty(instance->GetSpawnMode()) == RAID_DIFFICULTY_10MAN_NORMAL && (uiOnyxiaKillTimer > 0))
                    return true;
                return false;
            case 12565:  // Criteria for achievement 4403: Many Whelps! Handle It! (10 player) Hatch 50 eggs in 10s
                if (Difficulty(instance->GetSpawnMode()) == RAID_DIFFICULTY_10MAN_NORMAL && (bAchievManyWhelpsHandleIt))
                    return true;
                return false;
            case 12566:  // Criteria for achievement 4404: She Deep Breaths More (10 player) Everybody evade Deep Breath
                if (Difficulty(instance->GetSpawnMode()) == RAID_DIFFICULTY_10MAN_NORMAL && (bAchievSheDeepBreathMore))
                    return true;
                return false;
            case 12567:  // Criteria for achievement 4405: More Dots! (25 player) 5min kill
                if (Difficulty(instance->GetSpawnMode()) == RAID_DIFFICULTY_25MAN_NORMAL && (uiOnyxiaKillTimer > 0))
                    return true;
                return false;
            case 12568:  // Criteria for achievement 4406: Many Whelps! Handle It! (25 player) Hatch 50 eggs in 10s
                if (Difficulty(instance->GetSpawnMode()) == RAID_DIFFICULTY_25MAN_NORMAL && (bAchievManyWhelpsHandleIt))
                    return true;
                return false;
            case 12569:  // Criteria for achievement 4407: She Deep Breaths More (25 player) Everybody evade Deep Breath
                if (Difficulty(instance->GetSpawnMode()) == RAID_DIFFICULTY_25MAN_NORMAL && (bAchievSheDeepBreathMore))
                    return true;
                return false;
        }
        return false;
    }
    
    void Update(uint32 uiDiff)
    {
        if(GetData(TYPE_ONYXIA) == IN_PROGRESS)
        {
            if(uiOnyxiaKillTimer > uiDiff)
                uiOnyxiaKillTimer -= uiDiff;
            else 
                uiOnyxiaKillTimer = 0;
            if(uiOnyxiaLiftoffTimer != 0 && uiOnyxiaLiftoffTimer <= uiDiff)
            {
                uiOnyxiaLiftoffTimer = 0;
                if (uiManyWhelpsCounter >= 50)
                    bAchievManyWhelpsHandleIt = true;
            } else uiOnyxiaLiftoffTimer -= uiDiff;
        }

        if (!FloorEruptionGUIDQueue.empty()) 
        {
            if (m_uiEruptTimer <= uiDiff)
            {
                uint32 treeHeight = 0;
                do 
                {
                    treeHeight = (*FloorEruptionGUID[1].find(FloorEruptionGUIDQueue.front())).second;
                    FloorEruption(FloorEruptionGUIDQueue.front());
                    FloorEruptionGUIDQueue.pop();
                } while (!FloorEruptionGUIDQueue.empty() && (*FloorEruptionGUID[1].find(FloorEruptionGUIDQueue.front())).second == treeHeight);
                m_uiEruptTimer = 1000;
            }
            else
                m_uiEruptTimer -= uiDiff;
        }
    }
};

InstanceData* GetInstanceData_instance_onyxias_lair(Map* pMap)
{
    return new instance_onyxias_lair(pMap);
}

void AddSC_instance_onyxias_lair()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "instance_onyxias_lair";
    newscript->GetInstanceData = &GetInstanceData_instance_onyxias_lair;
    newscript->RegisterSelf();
}
