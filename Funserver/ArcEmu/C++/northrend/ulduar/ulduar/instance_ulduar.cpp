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
/*
const Position GOPositions [4] =
{
{607.613, -134.207, 391.297, 4.10138},
{590.204, -131.516, 391.517, 4.64723},
{573.41, -133.956, 391.517, 4.69042},
{559.232, -138.104, 391.517, 5.12239}
};
*/
struct instance_ulduar : public ScriptedInstance
{
    instance_ulduar(Map* pMap) : ScriptedInstance(pMap), pLeviathanDoor(NULL),pXt002Door(NULL), KologarnChest(NULL), ThorimChest(NULL), AlgalonChest(NULL), HodirChest(NULL), HodirSChest(NULL), FreyaChest(NULL), MimironChest(NULL) { Initialize(); };

    uint32 m_auiEncounter[MAX_ENCOUNTER];
    std::string m_strInstData;

    uint64 m_uiLeviathanGUID;
    uint64 m_uiIgnisGUID;
    uint64 m_uiRazorscaleGUID;
    uint64 m_uiXT002GUID;
    uint64 m_auiAssemblyGUIDs[3];
    uint64 m_uiKologarnGUID;
    uint64 m_uiAuriayaGUID;
    uint64 m_uiMimironGUID;
    uint64 m_uiHodirGUID;
    uint64 m_uiThorimGUID;
    uint64 m_uiFreyaGUID;
    uint64 m_uiVezaxGUID;
    uint64 m_uiYoggSaronGUID;
    uint64 m_uiAlgalonGUID;
    uint64 m_uiMimiFloor;
    uint64 m_uiMimiDoor1;
    uint64 m_uiMimiDoor2;
    uint64 m_uiMimiDoor3;
    uint64 m_uiHarpoonCreatorGUID;
    uint8 uiMimiFloor;
    uint8 uiHarpoon;
    uint8 uiMimiDoor;



    GameObject* KologarnChest, *HodirChest, *pLeviathanDoor, *pXt002Door, *HodirSChest, *FreyaChest, *ThorimChest, *AlgalonChest, *MimironChest;
	uint8 auiEncounter[MAX_ENCOUNTER];

    void Initialize()
    {
        m_uiLeviathanGUID       = 0;
        m_uiIgnisGUID           = 0;
        m_uiRazorscaleGUID      = 0;
        m_uiXT002GUID           = 0;
        m_uiKologarnGUID        = 0;
        m_uiAuriayaGUID         = 0;
        m_uiMimironGUID         = 0;
        m_uiHodirGUID           = 0;
        m_uiThorimGUID          = 0;
        m_uiFreyaGUID           = 0;
        m_uiVezaxGUID           = 0;
        m_uiYoggSaronGUID       = 0;
        m_uiAlgalonGUID         = 0;
	m_uiMimiFloor		= 0;
	m_uiMimiDoor1		= 0;
	m_uiMimiDoor2		= 0;
	m_uiMimiDoor3		= 0;
	m_uiHarpoonCreatorGUID	= 0;
        uiMimiFloor		= 0;
	uiHarpoon		= 0;
        uiMimiDoor		= 0;
	KologarnChest           = 0;
        ThorimChest             = 0;
        HodirChest              = 0;
	HodirSChest		= 0;
        FreyaChest              = 0;
	MimironChest		= 0;
	AlgalonChest		= 0;

        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));
        memset(&m_auiAssemblyGUIDs, 0, sizeof(m_auiAssemblyGUIDs));
    }

    bool IsEncounterInProgress() const
    {
        for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
        {
            if (m_auiEncounter[i] == IN_PROGRESS)
                return true;
        }

        return false;
    }

    void OnCreatureCreate(Creature* pCreature, bool /*add*/)
    {
        switch(pCreature->GetEntry())
        {
            case NPC_LEVIATHAN:
                m_uiLeviathanGUID = pCreature->GetGUID();
                break;
            case NPC_IGNIS:
                m_uiIgnisGUID = pCreature->GetGUID();
                break;
            case NPC_RAZORSCALE:
                m_uiRazorscaleGUID = pCreature->GetGUID();
                break;
            case NPC_XT002:
                m_uiXT002GUID = pCreature->GetGUID();
                break;

            // Assembly of Iron
            case NPC_STEELBREAKER:
                m_auiAssemblyGUIDs[0] = pCreature->GetGUID();
                break;
            case NPC_MOLGEIM:
                m_auiAssemblyGUIDs[1] = pCreature->GetGUID();
                break;
            case NPC_BRUNDIR:
                m_auiAssemblyGUIDs[2] = pCreature->GetGUID();
                break;

            case NPC_KOLOGARN:
                m_uiKologarnGUID = pCreature->GetGUID();
                break;
            case NPC_AURIAYA:
                m_uiAuriayaGUID = pCreature->GetGUID();
                break;
            case NPC_MIMIRON:
                m_uiMimironGUID = pCreature->GetGUID();
                break;
            case NPC_HODIR:
                m_uiHodirGUID = pCreature->GetGUID();
                break;
            case NPC_THORIM:
                m_uiThorimGUID = pCreature->GetGUID();
                break;
            case NPC_FREYA:
                m_uiFreyaGUID = pCreature->GetGUID();
                break;
            case NPC_VEZAX:
                m_uiVezaxGUID = pCreature->GetGUID();
                break;
            case NPC_YOGGSARON:
                m_uiYoggSaronGUID = pCreature->GetGUID();
                break;
            case NPC_ALGALON:
                m_uiAlgalonGUID = pCreature->GetGUID();
                break;
	    case NPC_HARPOON_CREATOR:
		m_uiHarpoonCreatorGUID = pCreature->GetGUID();
		break;
        }

     }

    void OnGameObjectCreate(GameObject* pGo, bool add)
    {
        switch(pGo->GetEntry())
        {
            case GO_Kologarn_CHEST_HERO: KologarnChest = add ? pGo : NULL; break;
            case GO_Kologarn_CHEST: KologarnChest = add ? pGo : NULL; break;
            case GO_Thorim_CHEST: ThorimChest = add ? pGo : NULL; break;
	    case GO_Thorim_CHEST_HERO: ThorimChest = add ? pGo : NULL; break;
            case GO_Hodir_CHEST_HERO: HodirChest = add ? pGo : NULL; break;
            case GO_Hodir_CHEST: HodirChest = add ? pGo : NULL; break;
	    case GO_Hodir_CHEST_SH: HodirSChest = add ? pGo : NULL; break;
            case GO_Hodir_CHEST_S: HodirSChest = add ? pGo : NULL; break;
            case GO_Freya_CHEST_HERO: FreyaChest = add ? pGo : NULL; break;
            case GO_Freya_CHEST: FreyaChest = add ? pGo : NULL; break;
	    case GO_Mimiron_CHEST: MimironChest = add ? pGo : NULL; break;
	    case GO_Mimiron_CHEST_H: MimironChest = add ? pGo : NULL; break;
	    case GO_Algalon_CHEST: AlgalonChest = add ? pGo : NULL; break;
	    case GO_Algalon_CHEST_H: AlgalonChest = add ? pGo : NULL; break;
	    case GO_LEVIATHAN_DOOR: pLeviathanDoor = add ? pGo : NULL; break;
	    case GO_XT002_DOOR: pXt002Door = add ? pGo : NULL; break;
	    case GO_MIMI_FLOOR: m_uiMimiFloor = pGo->GetGUID(); break;
	    case GO_MIMI_DOOR1: m_uiMimiDoor1 = pGo->GetGUID(); break;
	    case GO_MIMI_DOOR2: m_uiMimiDoor2 = pGo->GetGUID(); break;
	    case GO_MIMI_DOOR3: m_uiMimiDoor3 = pGo->GetGUID(); break;
	    
        }
    }

    void SetData(uint32 type, uint32 data)
    {
        switch(type)
        {
            case TYPE_LEVIATHAN: m_auiEncounter[TYPE_LEVIATHAN] = data; 
	    if ((data == NOT_STARTED || data == IN_PROGRESS) && pLeviathanDoor)
	    pLeviathanDoor->SetGoState(GO_STATE_READY);
	    if (data == DONE && pLeviathanDoor)
	    pLeviathanDoor->SetGoState(GO_STATE_ACTIVE);
	    break;
            case TYPE_IGNIS: m_auiEncounter[TYPE_IGNIS] = data; break;
            case TYPE_RAZORSCALE: m_auiEncounter[TYPE_RAZORSCALE] = data; break;
            case TYPE_XT002: m_auiEncounter[TYPE_XT002] = data; 
	    if (data == IN_PROGRESS && pXt002Door)
	    pXt002Door->SetGoState(GO_STATE_READY);
	    if (data == DONE && pLeviathanDoor)
	    pXt002Door->SetGoState(GO_STATE_ACTIVE);
	    break;
            case TYPE_ASSEMBLY: m_auiEncounter[TYPE_ASSEMBLY] = data; break;
            case TYPE_KOLOGARN:
                m_auiEncounter[TYPE_KOLOGARN] = data;
                if (data == DONE && KologarnChest)
                KologarnChest->SetRespawnTime(KologarnChest->GetRespawnDelay());
	        break;
            case TYPE_AURIAYA: m_auiEncounter[TYPE_AURIAYA] = data; break;
            case TYPE_MIMIRON: 
	       m_auiEncounter[TYPE_MIMIRON] = data;
	       if (data == DONE && MimironChest)
	       MimironChest->SetRespawnTime(MimironChest->GetRespawnDelay());
	       break;
            case TYPE_HODIR:
	       m_auiEncounter[TYPE_HODIR] = data;
	       if (data == DONE && HodirChest)
	       HodirChest->SetRespawnTime(HodirChest->GetRespawnDelay());
	       break;
	    case TYPE_HODIR_HARD:			
	       m_auiEncounter[TYPE_HODIR_HARD]= data;
	       if (data == DONE && HodirChest && HodirSChest)
	       {
	       HodirChest->SetRespawnTime(HodirChest->GetRespawnDelay());
	       HodirSChest->SetRespawnTime(HodirSChest->GetRespawnDelay());
	       }
	       break;
            case TYPE_THORIM:
                m_auiEncounter[TYPE_THORIM] = data;
                if (data == DONE && ThorimChest)
		ThorimChest->SetRespawnTime(ThorimChest->GetRespawnDelay());
		break;
            case TYPE_FREYA:
                m_auiEncounter[TYPE_FREYA] = data;
                if (data == DONE && FreyaChest)
                FreyaChest->SetRespawnTime(FreyaChest->GetRespawnDelay());
		break;
            case TYPE_VEZAX: m_auiEncounter[TYPE_VEZAX] = data; break;
            case TYPE_YOGGSARON: m_auiEncounter[TYPE_YOGGSARON] = data; break;
            case TYPE_ALGALON:
                m_auiEncounter[TYPE_ALGALON] = data;
		if (data == DONE && AlgalonChest)
		AlgalonChest->SetRespawnTime(AlgalonChest->GetRespawnDelay());
                break;
	    case DATA_HARPOON:
		uiHarpoon = data;
		if (uiHarpoon == 1 || uiHarpoon == 2 || uiHarpoon == 3 || uiHarpoon == 4 || uiHarpoon == 5)
		{
		if (Creature* HarpoonCreator = instance->GetCreature(m_uiHarpoonCreatorGUID))
		HarpoonCreator->SummonGameObject(GO_HARPOON, 590.204, -131.516, 391.517, 4.64723, 0, 0, 0, 0,122000);
		}
	break;
        }

        if (data == DONE)
        {
            OUT_SAVE_INST_DATA;

            std::ostringstream saveStream;

            for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                saveStream << m_auiEncounter[i] << " ";

            m_strInstData = saveStream.str();

            SaveToDB();
            OUT_SAVE_INST_DATA_COMPLETE;
        }
    }

    uint64 GetData64(uint32 data)
    {
        switch(data)
        {
            case TYPE_LEVIATHAN:
                return m_uiLeviathanGUID;
            case TYPE_IGNIS:
                return m_uiIgnisGUID;
            case TYPE_RAZORSCALE:
                return m_uiRazorscaleGUID;
            case TYPE_XT002:
                return m_uiXT002GUID;
            case TYPE_KOLOGARN:
                return m_uiKologarnGUID;
            case TYPE_AURIAYA:
                return m_uiAuriayaGUID;
            case TYPE_MIMIRON:
                return m_uiMimironGUID;
            case TYPE_HODIR:
                return m_uiMimironGUID;
            case TYPE_THORIM:
                return m_uiThorimGUID;
            case TYPE_FREYA:
                return m_uiFreyaGUID;
            case TYPE_VEZAX:
                return m_uiVezaxGUID;
            case TYPE_YOGGSARON:
                return m_uiYoggSaronGUID;
            case TYPE_ALGALON:
                return m_uiAlgalonGUID;

            // Assembly of Iron
            case DATA_STEELBREAKER:
                return m_auiAssemblyGUIDs[0];
            case DATA_MOLGEIM:
                return m_auiAssemblyGUIDs[1];
            case DATA_BRUNDIR:
                return m_auiAssemblyGUIDs[2];
        }

        return 0;
    }
    
    void SetData64(uint32 uiType, uint64 uiData)
    {
	switch (uiType)
	{
	case DATA_MIMI_FLOOR:
	 uiMimiFloor = uiData;
	 if (uiMimiFloor == 1)
	     {
	     if (GameObject* pMimiFloor = instance->GetGameObject(m_uiMimiFloor))
	     pMimiFloor->SetGoState(GO_STATE_READY);
	     }
	     if (uiMimiFloor == 2)
	     {
	     if (GameObject* pMimiFloor = instance->GetGameObject(m_uiMimiFloor))
	     pMimiFloor->SetGoState(GO_STATE_ACTIVE);
	     }
	break;
	case DATA_MIMI_DOOR:
	uiMimiDoor = uiData;
	 if (uiMimiDoor == 1)
	     {
	     if (GameObject* pMimiDoor = instance->GetGameObject(m_uiMimiDoor1))
	     pMimiDoor->SetGoState(GO_STATE_READY);
	     if (GameObject* pMimiDoor = instance->GetGameObject(m_uiMimiDoor2))
	     pMimiDoor->SetGoState(GO_STATE_READY);
	     if (GameObject* pMimiDoor = instance->GetGameObject(m_uiMimiDoor3))
	     pMimiDoor->SetGoState(GO_STATE_READY);
	     }
	     if (uiMimiDoor == 2)
	     {
	     if (GameObject* pMimiDoor = instance->GetGameObject(m_uiMimiDoor1))
	     pMimiDoor->SetGoState(GO_STATE_ACTIVE);
	     if (GameObject* pMimiDoor = instance->GetGameObject(m_uiMimiDoor2))
	     pMimiDoor->SetGoState(GO_STATE_ACTIVE);
	     if (GameObject* pMimiDoor = instance->GetGameObject(m_uiMimiDoor3))
	     pMimiDoor->SetGoState(GO_STATE_ACTIVE);
	     }
	break;
	
	}
    }

    uint32 GetData(uint32 type)
    {
        switch(type)
        {
            case TYPE_LEVIATHAN: return m_auiEncounter[TYPE_LEVIATHAN];
            case TYPE_IGNIS: return m_auiEncounter[TYPE_IGNIS];
            case TYPE_RAZORSCALE: return m_auiEncounter[TYPE_RAZORSCALE];
            case TYPE_XT002: return m_auiEncounter[TYPE_XT002];
            case TYPE_ASSEMBLY: return m_auiEncounter[TYPE_ASSEMBLY];
            case TYPE_KOLOGARN: return m_auiEncounter[TYPE_KOLOGARN];
            case TYPE_AURIAYA: return m_auiEncounter[TYPE_AURIAYA];
            case TYPE_MIMIRON: return m_auiEncounter[TYPE_MIMIRON];
            case TYPE_HODIR: return m_auiEncounter[TYPE_HODIR];
            case TYPE_THORIM: return m_auiEncounter[TYPE_THORIM];
            case TYPE_FREYA: return m_auiEncounter[TYPE_FREYA];
            case TYPE_VEZAX: return m_auiEncounter[TYPE_VEZAX];
            case TYPE_YOGGSARON: return m_auiEncounter[TYPE_YOGGSARON];
            case TYPE_ALGALON: return m_auiEncounter[TYPE_ALGALON];
	    case DATA_HARPOON: return uiHarpoon;
        }

        return 0;
    }

    std::string GetSaveData()
    {
        OUT_SAVE_INST_DATA;

        std::ostringstream saveStream;
        saveStream << "U U " << m_auiEncounter[0] << " " << m_auiEncounter[1] << " " << m_auiEncounter[2] << " " << m_auiEncounter[3]
                   << m_auiEncounter[4] << " " << m_auiEncounter[5] << " " << m_auiEncounter[6] << " " << m_auiEncounter[7]
                   << m_auiEncounter[8] << " " << m_auiEncounter[9] << " " << m_auiEncounter[10] << " " << m_auiEncounter[11]
                   << m_auiEncounter[12] << " " << m_auiEncounter[13];

        m_strInstData = saveStream.str();

        OUT_SAVE_INST_DATA_COMPLETE;
        return m_strInstData;
    }

    void Load(const char* strIn)
    {
        if (!strIn)
        {
            OUT_LOAD_INST_DATA_FAIL;
            return;
        }

        OUT_LOAD_INST_DATA(strIn);

        char dataHead1, dataHead2;
        uint32 data0, data1, data2, data3, data4, data5, data6,
            data7, data8, data9, data10, data11, data12, data13;

        std::istringstream loadStream(strIn);
        loadStream >> dataHead1 >> dataHead2 >> data0 >> data1 >> data2 >> data3 >> data4 >> data5 >> data6
            >> data7 >> data8 >> data9 >> data10 >> data11 >> data12 >> data13;

        if (dataHead1 == 'U' && dataHead2 == 'U')
        {
            for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
            {
                loadStream >> m_auiEncounter[i];

                if (m_auiEncounter[i] == IN_PROGRESS)
                    m_auiEncounter[i] = NOT_STARTED;
            }
        }
        OUT_LOAD_INST_DATA_COMPLETE;
    }
};

InstanceData* GetInstanceData_instance_ulduar(Map* pMap)
{
    return new instance_ulduar(pMap);
}

void AddSC_instance_ulduar()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "instance_ulduar";
    newscript->GetInstanceData = &GetInstanceData_instance_ulduar;
    newscript->RegisterSelf();
}
