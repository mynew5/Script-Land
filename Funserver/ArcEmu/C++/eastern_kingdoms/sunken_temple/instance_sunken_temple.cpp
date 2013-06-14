/* ScriptData
SDName: Instance_Sunken_Temple
SD%Complete: 100
SDComment: tc2_core
SDCategory: Sunken Temple
EndScriptData */

#include "ScriptedPch.h"
#include "sunken_temple.h"

#define GO_ATALAI_STATUE1 148830
#define GO_ATALAI_STATUE2 148831
#define GO_ATALAI_STATUE3 148832
#define GO_ATALAI_STATUE4 148833
#define GO_ATALAI_STATUE5 148834
#define GO_ATALAI_STATUE6 148835
#define GO_ATALAI_IDOL 148836

#define GO_ATALAI_LIGHT1 148883
#define GO_ATALAI_LIGHT2 148937

#define MAX_ENCOUNTER 3

struct instance_sunken_temple : public ScriptedInstance
{
    instance_sunken_temple(Map* pMap) : ScriptedInstance(pMap)
    {
        Initialize();
    };

    GameObject* AtalaiStatue1;
    GameObject* AtalaiStatue2;
    GameObject* AtalaiStatue3;
    GameObject* AtalaiStatue4;
    GameObject* AtalaiStatue5;
    GameObject* AtalaiStatue6;
    GameObject* AtalaiIdol;

    uint64 GOAtalaiStatue1;
    uint64 GOAtalaiStatue2;
    uint64 GOAtalaiStatue3;
    uint64 GOAtalaiStatue4;
    uint64 GOAtalaiStatue5;
    uint64 GOAtalaiStatue6;
    uint64 GOAtalaiIdol;
    uint32 m_auiEncounter[MAX_ENCOUNTER];

    uint64 whoLightsOutGUID;
    uint64 AtalalarionGUID;

    uint32 uiHakkarPhase;
    uint32 uiAtalaiState;

    bool s1;
    bool s2;
    bool s3;
    bool s4;
    bool s5;
    bool s6;

    std::string strInstData;

    void Initialize()
    {
        GOAtalaiStatue1 = 0;
        GOAtalaiStatue2 = 0;
        GOAtalaiStatue3 = 0;
        GOAtalaiStatue4 = 0;
        GOAtalaiStatue5 = 0;
        GOAtalaiStatue6 = 0;
        GOAtalaiIdol = 0;
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));
        uiAtalaiState = 0;
        uiHakkarPhase = 0;
        whoLightsOutGUID = 0;
        AtalalarionGUID = 0;
        AtalaiStatue1 = NULL;
        AtalaiStatue2 = NULL;
        AtalaiStatue3 = NULL;
        AtalaiStatue4 = NULL;
        AtalaiStatue5 = NULL;
        AtalaiStatue6 = NULL;
        AtalaiIdol = NULL;
        s1 = false;
        s2 = false;
        s3 = false;
        s4 = false;
        s5 = false;
        s6 = false;
    }

    void OnCreatureCreate(Creature *pCreature, bool bAdd)
    {
        switch (pCreature->GetEntry())
        {
            case 8580: //atalarion
                AtalalarionGUID = pCreature->GetGUID();
                pCreature->SetVisibility(VISIBILITY_OFF);
                pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                pCreature->SetReactState(REACT_PASSIVE);
                break;
        }
    }

    void OnGameObjectCreate(GameObject* pGo, bool add)
     {
         switch(pGo->GetEntry())
         {
         case GO_ATALAI_STATUE1:
             AtalaiStatue1 = pGo;
             GOAtalaiStatue1 = pGo->GetGUID();
             if(GetData(TYPE_ATALARION) == DONE)
             {
                UseStatue(pGo);
             }
             break;
         case GO_ATALAI_STATUE2:
             AtalaiStatue2 = pGo;
             GOAtalaiStatue2 = pGo->GetGUID();
             if(GetData(TYPE_ATALARION) == DONE)
             {
                UseStatue(pGo);
             }
             break;
         case GO_ATALAI_STATUE3:
             AtalaiStatue3 = pGo;
             GOAtalaiStatue3 = pGo->GetGUID();
             if(GetData(TYPE_ATALARION) == DONE)
             {
                UseStatue(pGo);
             }
             break;
         case GO_ATALAI_STATUE4:
             AtalaiStatue4 = pGo;
             GOAtalaiStatue4 = pGo->GetGUID();
             if(GetData(TYPE_ATALARION) == DONE)
             {
                UseStatue(pGo);
             }
             break;
         case GO_ATALAI_STATUE5:
             AtalaiStatue5 = pGo;
             GOAtalaiStatue5 = pGo->GetGUID();
             if(GetData(TYPE_ATALARION) == DONE)
             {
                UseStatue(pGo);
             }
             break;
         case GO_ATALAI_STATUE6:
             AtalaiStatue6 = pGo;
             GOAtalaiStatue6 = pGo->GetGUID();
             if(GetData(TYPE_ATALARION) == DONE)
             {
                uiAtalaiState = GO_ATALAI_STATUE6; //dont call UseLastStatue here.
             }
             break;
         case GO_ATALAI_IDOL:
             AtalaiIdol = pGo;
             GOAtalaiIdol = pGo->GetGUID();
             break;
         }
     };

     virtual void Update(uint32 diff) // correct order goes form 1-6
     {
         switch(uiAtalaiState)
         {
         case GO_ATALAI_STATUE1:
            if (!s1 && !s2 && !s3 && !s4 && !s5 && !s6)
            {
                UseStatue(AtalaiStatue1);
                s1 = true;
                uiAtalaiState = 0;
                SetData(TYPE_ATALARION, IN_PROGRESS);
            };
            break;
         case GO_ATALAI_STATUE2:
            if (s1 && !s2 && !s3 && !s4 && !s5 && !s6)
            {
                UseStatue(AtalaiStatue2);
                s2 = true;
                uiAtalaiState = 0;
            };
            break;
         case GO_ATALAI_STATUE3:
            if (s1 && s2 && !s3 && !s4 && !s5 && !s6)
            {
                UseStatue(AtalaiStatue3);
                s3 = true;
                uiAtalaiState = 0;
            };
            break;
         case GO_ATALAI_STATUE4:
            if (s1 && s2 && s3 && !s4 && !s5 && !s6)
            {
                UseStatue(AtalaiStatue4);
                s4 = true;
                uiAtalaiState = 0;
            }
            break;
         case GO_ATALAI_STATUE5:
            if (s1 && s2 && s3 && s4 && !s5 && !s6)
            {
                UseStatue(AtalaiStatue5);
                s5 = true;
                uiAtalaiState = 0;
            }
            break;
         case GO_ATALAI_STATUE6:
            if (s1 && s2 && s3 && s4 && s5 && !s6)
            {
                UseLastStatue(AtalaiStatue6);
                s6 = true;
                uiAtalaiState = 0;
                SetData(TYPE_ATALARION, DONE);
            }
            else if(GetData(TYPE_ATALARION) == DONE)
            {
                UseLastStatue(AtalaiStatue6);
                uiAtalaiState = 0;
            }
            break;
         }
     };

     void UseStatue(GameObject* pGo)
     {
         pGo->SummonGameObject(GO_ATALAI_LIGHT1,pGo->GetPositionX(),pGo->GetPositionY(),pGo->GetPositionZ(),0,0,0,0,0,0);
         pGo->SetUInt32Value(GAMEOBJECT_FLAGS, 4);
     }
     void UseLastStatue(GameObject* pGo)
     {
         AtalaiStatue1->SummonGameObject(GO_ATALAI_LIGHT2,AtalaiStatue1->GetPositionX(),AtalaiStatue1->GetPositionY(),AtalaiStatue1->GetPositionZ(),0,0,0,0,0,100000);
         AtalaiStatue2->SummonGameObject(GO_ATALAI_LIGHT2,AtalaiStatue2->GetPositionX(),AtalaiStatue2->GetPositionY(),AtalaiStatue2->GetPositionZ(),0,0,0,0,0,100000);
         AtalaiStatue3->SummonGameObject(GO_ATALAI_LIGHT2,AtalaiStatue3->GetPositionX(),AtalaiStatue3->GetPositionY(),AtalaiStatue3->GetPositionZ(),0,0,0,0,0,100000);
         AtalaiStatue4->SummonGameObject(GO_ATALAI_LIGHT2,AtalaiStatue4->GetPositionX(),AtalaiStatue4->GetPositionY(),AtalaiStatue4->GetPositionZ(),0,0,0,0,0,100000);
         AtalaiStatue5->SummonGameObject(GO_ATALAI_LIGHT2,AtalaiStatue5->GetPositionX(),AtalaiStatue5->GetPositionY(),AtalaiStatue5->GetPositionZ(),0,0,0,0,0,100000);
         AtalaiStatue6->SummonGameObject(GO_ATALAI_LIGHT2,AtalaiStatue6->GetPositionX(),AtalaiStatue6->GetPositionY(),AtalaiStatue6->GetPositionZ(),0,0,0,0,0,100000);
         pGo->SummonGameObject(148838,-488.997,96.61,-189.019,-1.52,0,0,0,0,100000);

        Creature* pFetchAtal = instance->GetCreature(AtalalarionGUID);
        if(pFetchAtal)
        {
            pFetchAtal->SetVisibility(VISIBILITY_ON);
            pFetchAtal->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
            pFetchAtal->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            pFetchAtal->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            pFetchAtal->SetReactState(REACT_AGGRESSIVE);
        }
     }

     void SetData(uint32 type, uint32 data)
     {
        switch(type)
        {
            case EVENT_ATALAI_STATE:
                uiAtalaiState = data;
                return; //dont save now
            case EVENT_HAKKAR_STATE:
                 uiHakkarPhase = data;
                return; //dont save now
            case TYPE_ATALARION:
                m_auiEncounter[0] = data;
                break;
            case TYPE_MALFURION:
                m_auiEncounter[1] = data;
                break;
            case TYPE_HAKKAR:
                m_auiEncounter[2] = data;
                break;
        }

        outstring_log("SUNKEN DATA: t(%u) d(%u)", type, data);

        if (data == DONE)
        {
            OUT_SAVE_INST_DATA;

            std::ostringstream saveStream;
            saveStream << m_auiEncounter[0] << " " << m_auiEncounter[1] << " " << m_auiEncounter[2];

            strInstData = saveStream.str();

            SaveToDB();
            OUT_SAVE_INST_DATA_COMPLETE;
        }

    }

     uint32 GetData(uint32 id)
     {
        switch(id)
        {
            case EVENT_ATALAI_STATE: return uiAtalaiState;
            case EVENT_HAKKAR_STATE: return uiHakkarPhase;
            case TYPE_ATALARION: return m_auiEncounter[0];
            case TYPE_MALFURION: return m_auiEncounter[1];
            case TYPE_HAKKAR: return m_auiEncounter[2];
        }
        return 0;
     }

    uint64 GetData64 (uint32 identifier)
    {
        if (identifier == 0) return whoLightsOutGUID;
        return 0;
    }


    std::string GetSaveData()
    {
       return strInstData;
    }

    void Load(const char* chrIn)
    {
        if (!chrIn)
        {
            OUT_LOAD_INST_DATA_FAIL;
            return;
        }

        OUT_LOAD_INST_DATA(chrIn);

        std::istringstream loadStream(chrIn);
        loadStream >> m_auiEncounter[0] >> m_auiEncounter[1] >> m_auiEncounter[2];

        for(uint8 i = 0; i < MAX_ENCOUNTER; ++i)
        {
            if (m_auiEncounter[i] == IN_PROGRESS)
                m_auiEncounter[i] = NOT_STARTED;
        }

        OUT_LOAD_INST_DATA_COMPLETE;
    }

};

InstanceData* GetInstanceData_instance_sunken_temple(Map* pMap)
{
    return new instance_sunken_temple(pMap);
}

void AddSC_instance_sunken_temple()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "instance_sunken_temple";
    newscript->GetInstanceData = &GetInstanceData_instance_sunken_temple;
    newscript->RegisterSelf();
}
