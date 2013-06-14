#include "ScriptedPch.h"
#include "def_hall_of_reflection.h"

#define GO_MAIN_GATE       197341
#define GO_FROSTMOURNE     202302
#define GO_ICE_WALL_01     201385
#define NPC_FALRIC         38112
#define NPC_MARWYN         38113
#define BOSS_LICH_KING     37226

struct instance_hall_of_reflection : public ScriptedInstance
{
    instance_hall_of_reflection(Map* pMap) : ScriptedInstance(pMap) {Initialize();};

    uint32 m_auiEncounter[8];
    std::string strInstData;

    uint64 m_uiLiderGUID;
    uint64 m_uiFalricGUID;
    uint64 m_uiMarwynGUID;  
    uint64 m_uiLichKingGUID; 
    uint64 m_uiEscapeLiderGUID; 
 
    uint64 m_uiMainGateGUID;
    uint64 m_uiFrostmourneGUID;
    uint64 m_uiIceWallGUID[3];

    void Initialize()
    {
        m_uiMainGateGUID = 0;
        m_uiFrostmourneGUID = 0;
        m_uiLiderGUID = 0;
        m_uiFalricGUID = 0;
        m_uiLichKingGUID = 0;
        m_uiEscapeLiderGUID = 0;
        m_uiIceWallGUID[0] = 0;
        m_uiIceWallGUID[1] = 0;
        m_uiIceWallGUID[2] = 0;
        m_uiIceWallGUID[3] = 0;
    }

    void OnCreatureCreate(Creature* pCreature)
    {
        switch(pCreature->GetEntry())
        {
            case NPC_FALRIC: m_uiFalricGUID = pCreature->GetGUID(); break;
            case NPC_MARWYN: m_uiMarwynGUID = pCreature->GetGUID(); break;
            case BOSS_LICH_KING: m_uiLichKingGUID = pCreature->GetGUID(); break;
        }
    }

    void OnObjectCreate(GameObject* pGo)
    {
        if (pGo->GetEntry() == GO_MAIN_GATE)
            m_uiMainGateGUID = pGo->GetGUID();
        if (pGo->GetEntry() == GO_FROSTMOURNE)
            m_uiFrostmourneGUID = pGo->GetGUID();
        if (pGo->GetEntry() == GO_ICE_WALL_01)
            m_uiIceWallGUID[0] = pGo->GetGUID();
    }

    void SetData(uint32 uiType, uint32 uiData)
    {
        switch(uiType)
        {
            case TYPE_INTRO:
                m_auiEncounter[0] = uiData;
                break;
            case TYPE_FALRIC:
                m_auiEncounter[1] = uiData;
                break;
            case TYPE_MARWYN:
                m_auiEncounter[2] = uiData;
                if (uiData == DONE)
                    DoUseDoorOrButton(m_uiMainGateGUID);
                break;
            case TYPE_LICH_KING:
                m_auiEncounter[3] = uiData;
                break;
            case TYPE_ICE_WALL_01:
                m_auiEncounter[4] = uiData;
                break;
            case TYPE_ICE_WALL_02:
                m_auiEncounter[5] = uiData;
                break;
            case TYPE_ICE_WALL_03:
                m_auiEncounter[6] = uiData;
                break;
            case TYPE_ICE_WALL_04:
                m_auiEncounter[7] = uiData;
                break;
        }
    }

    uint32 GetData(uint32 uiType)
    {
        switch(uiType)
        {
            case TYPE_INTRO:
                return m_auiEncounter[0];
            case TYPE_FALRIC:
                return m_auiEncounter[1];
            case TYPE_MARWYN:
                return m_auiEncounter[2];
            case TYPE_LICH_KING:
                return m_auiEncounter[3];
            case TYPE_ICE_WALL_01:
                return m_auiEncounter[4];
            case TYPE_ICE_WALL_02:
                return m_auiEncounter[5];
            case TYPE_ICE_WALL_03:
                return m_auiEncounter[6];
            case TYPE_ICE_WALL_04:
                return m_auiEncounter[7];
        }
        return 0;
    }

    void SetData64(uint32 uiData, uint64 uiGuid)
    {
        switch(uiData)
        {
            case DATA_LIDER:
                m_uiLiderGUID = uiGuid;
                break;
           case DATA_ESCAPE_LIDER:
                m_uiEscapeLiderGUID = uiGuid;
                break;
           case DATA_GO_ICE_WALL_02: 
                m_uiIceWallGUID[1] = uiGuid;
                break;
           case DATA_GO_ICE_WALL_03: 
                m_uiIceWallGUID[2] = uiGuid;
                break;
           case DATA_GO_ICE_WALL_04: 
                m_uiIceWallGUID[3] = uiGuid;
                break;
        }
    }

    uint64 GetData64(uint32 uiData)
    {
        switch(uiData)
        {
            case DATA_GO_MAIN_GATE: return m_uiMainGateGUID;
            case DATA_GO_FROSTMOURNE: return m_uiFrostmourneGUID;
            case DATA_LIDER: return m_uiLiderGUID;
            case DATA_FALRIC: return m_uiFalricGUID;
            case DATA_MARWYN: return m_uiMarwynGUID;
            case DATA_LICH_KING: return m_uiLichKingGUID;
            case DATA_ESCAPE_LIDER: return m_uiEscapeLiderGUID;
            case DATA_GO_ICE_WALL_01: return m_uiIceWallGUID[0];
            case DATA_GO_ICE_WALL_02: return m_uiIceWallGUID[1];
            case DATA_GO_ICE_WALL_03: return m_uiIceWallGUID[2];
            case DATA_GO_ICE_WALL_04: return m_uiIceWallGUID[3];
        }

        return 0;
    }

};

InstanceData* GetInstanceData_instance_hall_of_reflection(Map* pMap)
{
    return new instance_hall_of_reflection(pMap);
}

void AddSC_instance_hall_of_reflection()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "instance_hall_of_reflection";
    newscript->GetInstanceData = &GetInstanceData_instance_hall_of_reflection;
    newscript->RegisterSelf();
}