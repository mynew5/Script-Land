#include "ScriptedPch.h"
#include "def_forge_of_the_souls.h"

#define DEVOURER_OF_SOULS        36502

struct instance_forge_of_the_souls : public ScriptedInstance
{
    instance_forge_of_the_souls(Map* pMap) : ScriptedInstance(pMap) {Initialize();};

    uint32 m_auiEncounter[3];
    std::string strInstData;

    uint64 m_uiLiderGUID;
    uint64 m_uiDevourerGUID;

    void Initialize()
    {
        m_uiLiderGUID = 0;
        m_uiDevourerGUID = 0;
    }

    void OnCreatureCreate(Creature* pCreature)
    {
        switch(pCreature->GetEntry())
        {
            case DEVOURER_OF_SOULS: m_uiDevourerGUID = pCreature->GetGUID(); break;
        }
    }

    void SetData(uint32 uiType, uint32 uiData)
    {
        switch(uiType)
        {
            case TYPE_DEVOURER:
                m_auiEncounter[0] = uiData;
                break;
            case TYPE_INTRO:
                m_auiEncounter[1] = uiData;
                break;
        }
    }

    uint32 GetData(uint32 uiType)
    {
        switch(uiType)
        {
            case TYPE_DEVOURER:
                return m_auiEncounter[0];
            case TYPE_INTRO:
                return m_auiEncounter[1];
        }
        return 0;
    }

    void SetData64(uint32 uiData, uint64 uiGuid)
    {
        switch(uiData)
        {
            case DATA_LIDER:
                m_uiLiderGUID = uiGuid;
        }
    }

    uint64 GetData64(uint32 uiData)
    {
        switch(uiData)
        {
            case DATA_LIDER: return m_uiLiderGUID;
            case DATA_DEVOURER: return m_uiDevourerGUID;
        }

        return 0;
    }
};

InstanceData* GetInstanceData_instance_forge_of_the_souls(Map* pMap)
{
    return new instance_forge_of_the_souls(pMap);
}

void AddSC_instance_forge_of_the_souls()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "instance_forge_of_the_souls";
    newscript->GetInstanceData = &GetInstanceData_instance_forge_of_the_souls;
    newscript->RegisterSelf();
}
