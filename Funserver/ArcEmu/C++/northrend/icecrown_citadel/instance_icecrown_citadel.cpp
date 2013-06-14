/* Copyright (C) 2006 - 2010 TrinityCore <https://www.trinitycore.org/>
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
#include "instance_icecrown_citadel.h"

#define MAX_ENCOUNTER     15

struct instance_icecrown_citadel : public ScriptedInstance
{
    instance_icecrown_citadel(Map* pMap) : ScriptedInstance(pMap), m_uiFlyghtGest(NULL), m_uiSaurfangCache(NULL) 
    {
    Initialize();
    }

	std::string str_data;

	uint64 m_uiMarrowgar;
	uint64 m_uiDeathwhisper;
	uint64 m_uiGunship;
	uint64 m_uiDeathbringer;	
	uint64 m_uiFastergut;
	uint64 m_uiRotface;
	uint64 m_uiPutricide;
	uint64 m_uiBloodPrinceValanar;
	uint64 m_uiBloodPrinceKeleseth;
	uint64 m_uiBloodPrinceTaldaram;
	uint64 m_uiBloodQueen;
	uint64 m_uiValithria;
	uint64 m_uiSindragosa;
	uint64 m_uiLichKing;
	
	uint64 m_uiTirionsFordring;
	uint8 Difficulty;
	uint8 mLichStart;

	uint64 uiMarrowgarDoor;
	uint64 uiOratoryDoor;
	uint64 uiExitDoor;
	uint64 uiIceblock1;
	uint64 uiIceblock2;
	uint64 uiSaurfangDoor;
	uint64 uiElevatorDeathwisper;

	uint32 m_auiEncounter[MAX_ENCOUNTER];
	
	GameObject* m_uiFlyghtGest, *m_uiSaurfangCache;

   void Initialize()
   {
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));

	uiMarrowgarDoor = 0;
        uiOratoryDoor = 0;
        uiExitDoor = 0;
	uiIceblock1 = 0;
	uiIceblock2 = 0;
	uiSaurfangDoor = 0;
	uiElevatorDeathwisper = 0;
	
	m_uiFlyghtGest = 0;
	m_uiSaurfangCache = 0;
	
        m_uiMarrowgar = 0;
	m_uiDeathwhisper = 0;
	m_uiGunship = 0;
	m_uiDeathbringer = 0;	
	m_uiFastergut = 0;
	m_uiRotface = 0;
	m_uiPutricide = 0;
	m_uiBloodPrinceValanar = 0;
	m_uiBloodPrinceKeleseth = 0;
	m_uiBloodPrinceTaldaram = 0;
	m_uiBloodQueen = 0;
	m_uiValithria = 0;
	m_uiSindragosa = 0;
	m_uiLichKing = 0;
	
	m_uiTirionsFordring = 0;
	mLichStart = 0;
    }

    bool IsEncounterInProgress() const
    {
        for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
            if (m_auiEncounter[i] == IN_PROGRESS) return true;

        return false;
    }

    void OnCreatureCreate(Creature* pCreature, bool add)
    {
        Map::PlayerList const &players = instance->GetPlayers();
        uint32 TeamInInstance = 0;

        if (!players.isEmpty())
        {
            if (Player* pPlayer = players.begin()->getSource())
                TeamInInstance = pPlayer->GetTeam();
        }

        switch(pCreature->GetEntry())
        {
	case NPC_MARROWGAR: m_uiMarrowgar = pCreature->GetGUID(); break;
	case NPC_DEATHWHISPER: m_uiDeathwhisper = pCreature->GetGUID(); break;
	case NPC_GUNSHIP_H: 
	   if (TeamInInstance == ALLIANCE)
	      pCreature->UpdateEntry(NPC_GUNSHIP_A, ALLIANCE);
	      break;
	case NPC_SAURFANG:
	   if (TeamInInstance == ALLIANCE)
	      pCreature->UpdateEntry(NPC_MURADIN, ALLIANCE);
	      break;
	case NPC_KORKRONGUARD:
	   if (TeamInInstance == ALLIANCE)
	      pCreature->UpdateEntry(NPC_ALLIANCEGUARD, ALLIANCE);
	      break;
	case NPC_KORKRON_SERGEANT_H:
	   if (TeamInInstance == ALLIANCE)
	      pCreature->UpdateEntry(NPC_SKYBREAKER_SERGEANT_A, ALLIANCE);
	      break;
	case NPC_KORKRON_AXETHROWER_H:
	   if (TeamInInstance == ALLIANCE)
	      pCreature->UpdateEntry(NPC_SKYBREAKER_RIFLEMAN_A, ALLIANCE);
	      break;
	case NPC_KORKRON_ROCKETEER_H:
	   if (TeamInInstance == ALLIANCE)
	      pCreature->UpdateEntry(NPC_SKEBREAKER_MORTAL_SOLDIER_A, ALLIANCE);
	      break;
	case NPC_KORKRON_BATTLE_MAGE_H:
	   if (TeamInInstance == ALLIANCE)
	      pCreature->UpdateEntry(NPC_SKYBREAKER_SORCERER_A, ALLIANCE);
	      break;
	case NPC_VENDOR_SHAMAN_H:
	   if (TeamInInstance == ALLIANCE)
	      pCreature->UpdateEntry(NPC_VENDOR_SHAMAN_A, ALLIANCE);
	      break;
	case NPC_VENDOR_MAGE_H:
	   if (TeamInInstance == ALLIANCE)
	      pCreature->UpdateEntry(NPC_VENDOR_MAGE_A, ALLIANCE);
	      break;
	case NPC_VENDOR_DRUID_H:
	   if (TeamInInstance == ALLIANCE)
	      pCreature->UpdateEntry(NPC_VENDOR_DRUID_A, ALLIANCE);
	      break;
	case NPC_VENDOR_ROGUE_H:
	   if (TeamInInstance == ALLIANCE)
	      pCreature->UpdateEntry(NPC_VENDOR_ROGUE_A, ALLIANCE);
	      break;
	case NPC_VENDOR_WARLOCK_H:
	   if (TeamInInstance == ALLIANCE)
	      pCreature->UpdateEntry(NPC_VENDOR_WARLOCK_A, ALLIANCE);
	      break;
	case NPC_VENDOR_HUNTER_H:
	   if (TeamInInstance == ALLIANCE)
	      pCreature->UpdateEntry(NPC_VENDOR_HUNTER_A, ALLIANCE);
	      break;
	case NPC_DEATHBRINGER_SAURFANG: m_uiDeathbringer = pCreature->GetGUID(); break;
	case NPC_FESTERGUT: m_uiFastergut = pCreature->GetGUID(); break;
	case NPC_ROTFACE: m_uiRotface = pCreature->GetGUID(); break;
	case NPC_PUTRICIDE: m_uiPutricide = pCreature->GetGUID(); break;
	case NPC_VALANAR: m_uiBloodPrinceValanar = pCreature->GetGUID(); break;
	case NPC_KELESETH: m_uiBloodPrinceKeleseth = pCreature->GetGUID(); break;
	case NPC_TALADRAM: m_uiBloodPrinceTaldaram = pCreature->GetGUID(); break;
	case NPC_LANATHEL: m_uiBloodQueen = pCreature->GetGUID(); break;
	case NPC_VALITRIHA: m_uiValithria = pCreature->GetGUID(); break;
	case NPC_SINDRAGOSA: m_uiSindragosa = pCreature->GetGUID(); break;
	case NPC_LICHKING: m_uiLichKing = pCreature->GetGUID(); break;
	
	case NPC_TIRIONS_FORDRING: m_uiTirionsFordring = pCreature->GetGUID(); break;

        }
    }

	void OnGameObjectCreate(GameObject* pGo, bool add)
    {
        switch(pGo->GetEntry())
        {
            case GO_ORATORY_ENTRANCE: uiOratoryDoor = pGo->GetGUID(); break;
            case GO_MARROWGAR_DOOR: uiMarrowgarDoor = pGo->GetGUID(); break;
            case GO_ICECROWN_EXIT: uiExitDoor = pGo->GetGUID(); break;
            case GO_ICEBLOCK_1: uiIceblock1 = pGo->GetGUID(); break;
            case GO_ICEBLOCK_2: uiIceblock2 = pGo->GetGUID(); break;
	    case GO_DEATHWHISPER_ELEVATOR : uiElevatorDeathwisper = pGo->GetGUID(); break;
	    case GO_GUNSHIP_ARMORY_10:
	    case GO_GUNSHIP_ARMORY_25:
	    case GO_GUNSHIP_ARMORY_10_H:
	    case GO_GUNSHIP_ARMORY_25_H: m_uiFlyghtGest = add ? pGo : NULL; break;
	    case GO_SAURFANG_DOOR: uiSaurfangDoor = pGo->GetGUID(); break;
	    case GO_SAURFANG_CACHE_10:
	    case GO_SAURFANG_CACHE_25:
	    case GO_SAURFANG_CACHE_10_H:
	    case GO_SAURFANG_CACHE_25_H: m_uiSaurfangCache = add ? pGo : NULL; break;
        }
    }

    void SetData(uint32 type, uint32 data)
    {

        switch(type)
        {
            case DATA_MARROWGAR_EVENT:
                m_auiEncounter[0] = data;
                if (data == DONE)
		{
		  if (GameObject* pIceblock1 = instance->GetGameObject(uiIceblock1))
		      pIceblock1->SetGoState(GO_STATE_ACTIVE);
		  if (GameObject* pIceblock2 = instance->GetGameObject(uiIceblock2))
		      pIceblock2->SetGoState(GO_STATE_ACTIVE);
		}
                if (data == IN_PROGRESS)
                    HandleGameObject(uiMarrowgarDoor,false);
                if ((data == DONE) || (data == FAIL) || (data == NOT_STARTED))
                    HandleGameObject(uiMarrowgarDoor,true);
                break;
            case DATA_DEATHWHISPER_EVENT: m_auiEncounter[1] = data; 
		if (data == DONE)
		{ if (GameObject* pElevator = instance->GetGameObject(uiElevatorDeathwisper))
		      pElevator->SetGoState(GO_STATE_ACTIVE); } break;
            case DATA_GUNSHIP_EVENT: m_auiEncounter[2] = data; break;
            case DATA_SAURFANG_EVENT: m_auiEncounter[3] = data; 
	    if (data == DONE && m_uiSaurfangCache)
	        m_uiSaurfangCache->SetRespawnTime(m_uiSaurfangCache->GetRespawnDelay());
	    if (GameObject* pSaurfangDoor = instance->GetGameObject(uiSaurfangDoor))
	        pSaurfangDoor->SetGoState(GO_STATE_ACTIVE);	
		break;
	    case DATA_FROSTWIRM_COUNT: m_auiEncounter[4] = data; break;
	    case DATA_SKULLS_PLATO: m_auiEncounter[5] = data; break;
	    case DATA_FESTERGUT_EVENT: m_auiEncounter[6] = data; break;
	    case DATA_ROTFACE_EVENT: m_auiEncounter[7] = data; break;
	    case DATA_PUTRICIDE_EVENT: m_auiEncounter[8] = data; break;
	    case DATA_KELESETH_EVENT: m_auiEncounter[9] = data; break;
	    case DATA_TALADRAM_EVENT: m_auiEncounter[10] = data; break;
	    case DATA_VALANAR_EVENT: m_auiEncounter[11] = data; break;
	    case DATA_BLOODPRINCE_EVENT: m_auiEncounter[12] = data; break;
	    case DATA_LANATHEL_EVENT: m_auiEncounter[13] = data; break;
	    case DATA_DREAMWALKER_EVENT: m_auiEncounter[14] = data; break;
	    case DATA_SINDRAGOSA_EVENT: m_auiEncounter[15] = data; break;
	    case DATA_FLIGHT_WAR:
	    if (data == DONE && m_uiFlyghtGest)
		m_uiFlyghtGest->SetRespawnTime(m_uiFlyghtGest->GetRespawnDelay());
		break;
	    case DATA_START_LICH: 
	    mLichStart = data;
	    if (data ==  DONE)
	    {
	    if (Creature* pLichKing =  instance->GetCreature(m_uiLichKing))
		pLichKing->AI()->SetData(1,0);
	    }
	    break;
        }

        if (data == DONE)
        {
            SaveToDB();
        }
    }

    uint32 GetData(uint32 type)
    {
        switch(type)
        {
            case DATA_MARROWGAR_EVENT:		 return m_auiEncounter[0];
            case DATA_DEATHWHISPER_EVENT:        return m_auiEncounter[1];
            case DATA_GUNSHIP_EVENT:             return m_auiEncounter[2];
            case DATA_SAURFANG_EVENT:            return m_auiEncounter[3];
	    case DATA_FROSTWIRM_COUNT:           return m_auiEncounter[4];
	    case DATA_SKULLS_PLATO:		 return m_auiEncounter[5];
	    case DATA_FESTERGUT_EVENT:		 return m_auiEncounter[6];
	    case DATA_PUTRICIDE_EVENT:		 return m_auiEncounter[7];
	    case DATA_ROTFACE_EVENT:		 return m_auiEncounter[8];
	    case DATA_KELESETH_EVENT:		 return m_auiEncounter[9];
	    case DATA_TALADRAM_EVENT:		 return m_auiEncounter[10];
	    case DATA_VALANAR_EVENT:		 return m_auiEncounter[11];
	    case DATA_BLOODPRINCE_EVENT:	 return m_auiEncounter[12];
	    case DATA_LANATHEL_EVENT:		 return m_auiEncounter[13];
	    case DATA_DREAMWALKER_EVENT:	 return m_auiEncounter[14];
	    case DATA_SINDRAGOSA_EVENT:		 return m_auiEncounter[15];
	    case DIFFICULTY:			 return Difficulty;
        }

        return 0;
    }

    uint64 GetData64(uint32 identifier)
    {
        switch(identifier)
        {
            case NPC_MARROWGAR:                    return m_uiMarrowgar;
            case NPC_DEATHWHISPER:                 return m_uiDeathwhisper;
            case NPC_GUNSHIP_A:                    return m_uiGunship;
            case NPC_DEATHBRINGER_SAURFANG:        return m_uiDeathbringer;
	    case NPC_LICHKING:			   return m_uiLichKing;
        }

        return 0;
    }

    std::string GetSaveData()
    {
        OUT_SAVE_INST_DATA;

        std::ostringstream saveStream;
        saveStream << "I C " << m_auiEncounter[0] << " " << m_auiEncounter[1] << " "
	<< m_auiEncounter[2] << " " << m_auiEncounter[3] << " " << m_auiEncounter[4] << " " 
	<< m_auiEncounter[5] << " " << m_auiEncounter[6] << " " << m_auiEncounter[7] << " " 
	<< m_auiEncounter[8] << " " << m_auiEncounter[9] << " " << m_auiEncounter[10] << " "
	<< m_auiEncounter[11] << " " << m_auiEncounter[12] << " " << m_auiEncounter[13] << " "
	<< m_auiEncounter[14] << " " << m_auiEncounter[15];

        str_data = saveStream.str();

        OUT_SAVE_INST_DATA_COMPLETE;
        return str_data;
    }

    void Load(const char* in)
    {
        if (!in)
        {
            OUT_LOAD_INST_DATA_FAIL;
            return;
        }

        OUT_LOAD_INST_DATA(in);

        char dataHead1, dataHead2;
        uint16 data0, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15;

        std::istringstream loadStream(in);
        loadStream >> dataHead1 >> dataHead2 >> data0 >> data1 >> data2 >> data3 >> data4 >> data5 >> data6 >> data7 >> data8 >> data9 >> data10 >> data11 >> data12 >> data13 >> data14 >> data15;

        if (dataHead1 == 'I' && dataHead2 == 'C')
        {
            m_auiEncounter[0] = data0;
            m_auiEncounter[1] = data1;
            m_auiEncounter[2] = data2;
            m_auiEncounter[3] = data3;
	    m_auiEncounter[4] = data4;
	    m_auiEncounter[5] = data5;
	    m_auiEncounter[6] = data6;
	    m_auiEncounter[7] = data7;
	    m_auiEncounter[8] = data8;
	    m_auiEncounter[9] = data9;
	    m_auiEncounter[10] = data10;
	    m_auiEncounter[11] = data11;
	    m_auiEncounter[12] = data12;
	    m_auiEncounter[13] = data13;
	    m_auiEncounter[14] = data14;
	    m_auiEncounter[15] = data15;

            for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                if (m_auiEncounter[i] == IN_PROGRESS)
                    m_auiEncounter[i] = NOT_STARTED;

        } else OUT_LOAD_INST_DATA_FAIL;

        OUT_LOAD_INST_DATA_COMPLETE;
    }
};

InstanceData* GetInstanceData_instance_icecrown_citadel(Map* pMap)
{
   return new instance_icecrown_citadel(pMap);
}

void AddSC_instance_icecrown_citadel()
{
   Script *newscript;
   newscript = new Script;
   newscript->Name = "instance_icecrown_citadel";
   newscript->GetInstanceData = &GetInstanceData_instance_icecrown_citadel;
   newscript->RegisterSelf();
}
