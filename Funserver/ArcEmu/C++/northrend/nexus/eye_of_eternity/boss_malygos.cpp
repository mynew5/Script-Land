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
SDName: Boss_Malygos
SD%Complete: 60%
SDComment: 
SDAuthor: Tassadar
SDCategory: Nexus, Eye of Eternity
EndScriptData */

#include "ScriptedPch.h"
#include "eye_of_eternity.h"
#include "Vehicle.h"

#define NEXUS_LORD_COUNT                RAID_MODE(2,4)
#define SCION_OF_ETERNITY_COUNT         RAID_MODE(6,8)
#define SPELL_ARCANE_BREATH             RAID_MODE(56272,60072)
#define SPELL_ARCANE_STORM              RAID_MODE(61693,61694) // AOE


enum
{
    SPELL_BERSERK                  = 64238, // Maybe wrong but enought :)
    SPELL_PORTAL_BEAM              = 56046,
    SPELL_VORTEX_DUMMY             = 56105, // This is for addons, actualy does nothing
    SPELL_VORTEX                   = 56266, // Cast on trigger in middle of the room, this interrupt their cast and deal dmg
    SPELL_VORTEX_AOE_VISUAL        = 55873,    // visual effect around platform
    SPELL_POWER_SPARK              = 56152, // If spark reach malygos then buff him, if killed then to players
    SPELL_POWER_SPARK_PLAYERS      = 55852, // This one is propably for players
    SPELL_POWER_SPARK_VISUAL       = 55845,
    //  SPELL_ARCANE_PULSE             = 57432, // Malygos takes a deep breath... cast on trigger
    SPELL_ARCANE_OVERLOAD          = 56432, // Cast this on arcane overload NPCs
    SPELL_DEEP_BREATH              = 60071,
    SPELL_DESTROY_PLATFORM_PRE     = 58842, // lights all over the platform
    SPELL_DESTROY_PLATFROM_BOOM    = 59084, // Big Blue boom
    //NPCs spells
    SPELL_ARCANE_SHOCK             = 57058,
    SPELL_ARCANE_SHOCK_H           = 60073,
    SPELL_ARCANE_BARRAGE           = 63934,
    SPELL_STATIC_FIELD             = 57428, // Summon trigger and cast this on them should be enought
    SPELL_SURGE_OF_POWER           = 56548, // Summon triggers and cast to random targets
    SPELL_SURGE_OF_POWER_H         = 57407,
    SPELL_ARCANE_PULSE             = 57432,
    //Dragons spells
    SPELL_FLAME_SPIKE              = 56091,
    SPELL_ENGULF_IN_FLAMES         = 56092,
    SPELL_REVIVIFY                 = 57090,
    SPELL_LIFE_BURST               = 57143,
    SPELL_FLAME_SHIELD             = 57108,
    SPELL_BLAZING_SPEED            = 57092,
    NPC_TRIGER			   = 3208,
 
    SHELL_MIN_X                    = 722,
    SHELL_MAX_X                    = 768,
    SHELL_MIN_Y                    = 1290,
    SHELL_MAX_Y                    = 1339,
 
    PHASE_NOSTART                  = 0,
	SUBPHASE_FLY_UP            = 01,
        SUBPHASE_UP                = 03,
        SUBPHASE_FLY_DOWN1         = 04,
        SUBPHASE_FLY_DOWN2         = 05,
    PHASE_FLOOR                    = 1,
        SUBPHASE_VORTEX            = 11,
    PHASE_ADDS                     = 2,
        SUBPHASE_TALK              = 21,
    PHASE_DRAGONS                  = 3,
        SUBPHASE_DESTROY_PLATFORM1 = 31,
        SUBPHASE_DESTROY_PLATFORM2 = 32,
        SUBPHASE_DESTROY_PLATFORM3 = 33,
    PHASE_OUTRO                    = 4,
        SUBPHASE_DIE               = 41,
	SEAT_ID			   = 0
};
struct Locations
{
    float x, y, z, o;
    uint32 id;
};
struct LocationsXY
{
    float x, y;
    uint32 id;
};
static Locations GOPositions[]=
{
    {754.346, 1300.87, 256.249, 3.14159},   // Raid Platform position
    {754.731, 1300.12, 266.171, 5.01343},   // Focusing iris
    {724.684, 1332.92, 267.234, -0.802851}, // Exit Portal
};
static LocationsXY SparkLoc[]=
{
    {652.417, 1200.52},
    {847.67, 1408.05},
    {647.675, 1403.8},
    {843.182, 1215.42},
};
 
static LocationsXY VortexLoc[]=
{
    {754, 1311},
    {734, 1334},
    {756, 1339},
    {781, 1329},
    {791, 1311},
    {790, 1283},
    {768, 1264},
    {739, 1261},
    {720, 1280},
    {714, 1299},
    {716, 1318},
    {734, 1334},
    {756, 1339},
    {781, 1329},
    {791, 1311},
    {790, 1283},
    {768, 1264},
    {739, 1261},
    {720, 1280},
    {714, 1299},
    {716, 1318},
};

static Locations OtherLoc[]=
{
    {808, 1301, 268, 0},   
    {749, 1244, 343, 1.544},
};

enum Ach
{
    ACHIEV_TIMED_START_EVENT                      = 20387,
};

#define MAX_VORTEX              21
#define VORTEX_Z                268
 
#define FLOOR_Z                 268.17
#define AIR_Z                   297.24   
/*######
## boss_malygos
######*/
 
struct boss_malygosAI : public ScriptedAI
{
    boss_malygosAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
        pAlexstrasza = NULL;
    }
 
    ScriptedInstance* m_pInstance;
 
    Creature *pAlexstrasza;
    Vehicle *vehicle;
    
    uint8 m_uiPhase;
    uint8 m_uiSubPhase;
    uint8 m_uiSpeechCount;
    uint8 m_uiVortexPhase;
    std::list<uint64> m_lSparkGUIDList;
    std::list<uint64> m_lDiscGUIDList;
 
    uint32 m_uiEnrageTimer;
    uint32 m_uiSpeechTimer[5];
    uint32 m_uiTimer;
    uint32 m_uiVortexTimer;
    uint32 m_uiArcaneBreathTimer;
    uint32 m_uiPowerSparkTimer;
    uint32 m_uiDeepBreathTimer;
    uint32 m_uiShellTimer;
    uint32 m_uiArcaneStormTimer;
    uint32 m_uiStaticFieldTimer;
    uint32 m_uiArcanePulseTimer;
    uint64 uiScionGUID;
    uint64 uiDiscGUID;
    
    void Reset()
    {
        if(m_pInstance)
            m_pInstance->SetData(TYPE_MALYGOS, NOT_STARTED);
            //m_pInstance->SetData((TYPE_MALYGOS, NOT_STARTED) && DoStopTimedAchievement(ACHIEVEMENT_TIMED_TYPE_EVENT, ACHIEV_TIMED_START_EVENT));
        else
            me->ForcedDespawn();
        m_uiPhase = PHASE_NOSTART;
        m_uiSubPhase = 0;
        m_uiSpeechCount = 0;
        m_uiVortexPhase = 0;
	uiScionGUID = 0;
	uiDiscGUID = 0;
 
        m_uiEnrageTimer = 600000;
        m_uiSpeechTimer[0] = 2000;
        m_uiSpeechTimer[1] = 10000;
        m_uiSpeechTimer[2] = 11000;
        m_uiSpeechTimer[3] = 13000;
        m_uiSpeechTimer[4] = 10000;
        m_uiSpeechTimer[5] = 7000;
        m_uiTimer = 7000;
        m_uiVortexTimer = 60000;
        m_uiArcaneBreathTimer = 15000;
        m_uiPowerSparkTimer = 20000;
        m_uiDeepBreathTimer = 60000;
        m_uiShellTimer = 0;
        m_uiArcaneStormTimer = 15000;
        m_uiStaticFieldTimer = 15000;
        m_uiArcanePulseTimer = 1000;
        
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        me->SetUInt32Value(UNIT_FIELD_BYTES_0, 50331648);
        me->SetUInt32Value(UNIT_FIELD_BYTES_1, 50331648);
        me->SetSpeed(MOVE_FLIGHT, 3.5f, true);
 
        if(Creature *pPortal = GetClosestCreatureWithEntry(me, NPC_SPARK_PORTAL, 200.0f))
            DoCast(pPortal, SPELL_PORTAL_BEAM);
    }
 
    void JustReachedHome()
    {
        Reset();
        if(!GetClosestGameObjectWithEntry(me, GO_PLATFORM, 200.0f))
            me->SummonGameObject(GO_PLATFORM, GOPositions[0].x, GOPositions[0].y, GOPositions[0].z, GOPositions[0].o, 0, 0, 0, 0, 0);
 
        if(!GetClosestGameObjectWithEntry(me, GO_FOCUSING_IRIS, 200.0f))
            me->SummonGameObject(GO_FOCUSING_IRIS, GOPositions[1].x, GOPositions[1].y, GOPositions[1].z, GOPositions[1].o, 0, 0, 0, 0, 0);
 
        if(!GetClosestGameObjectWithEntry(me, GO_EXIT_PORTAL, 200.0f))
            me->SummonGameObject(GO_EXIT_PORTAL, GOPositions[2].x, GOPositions[2].y, GOPositions[2].z, GOPositions[2].o, 0, 0, 0, 0, 0);
        
    }
 
    void AttackStart(Unit* pWho)
    {
        if(m_uiPhase != PHASE_FLOOR && m_uiPhase != PHASE_DRAGONS && !me->HasAura(SPELL_BERSERK))
            return;
 
        if (me->Attack(pWho, true))
        {
            me->AddThreat(pWho, 0.0f);
            me->SetInCombatWith(pWho);
            pWho->SetInCombatWith(me);
            if(m_uiPhase != PHASE_DRAGONS && !me->HasAura(SPELL_BERSERK))
                me->GetMotionMaster()->MoveChase(pWho);
	    if (m_uiSubPhase == SUBPHASE_DESTROY_PLATFORM2 || m_uiSubPhase == SUBPHASE_DESTROY_PLATFORM3)
	    {
	    if (me->getThreatManager().isThreatListEmpty() && pWho)
	    me->Attack(pWho, true);
	    me->AddThreat(pWho, 100.0f);
	    me->SetInCombatWith(pWho);
	    pWho->SetInCombatWith(me);
	    if (pWho->isTargetableForAttack() && pWho->GetTypeId() == TYPEID_UNIT && me->GetDistance2d(pWho) <= 90)
		{
           me->AddThreat(pWho, 0.0f);
           me->SetInCombatWith(pWho);
		}
	    }
	    if(Vehicle *pVehicle = me->getVictim()->GetVehicle())
                    {
                        float victim_threat = me->getThreatManager().getThreat(me->getVictim());
                        me->AddThreat((Unit*)pVehicle, victim_threat);
                    }
	      /*if (Unit* pTemp = SelectUnit(SELECT_TARGET_RANDOM,0,200,true))
	      me->AddThreat(pTemp,200.0f);
	      
	    pWho->SetInCombatWith(me);
	    me->SetInCombatWith(pWho);*/
        }
    }
 
    void Aggro(Unit* pWho)
    {
        m_pInstance->SetData(TYPE_MALYGOS, IN_PROGRESS);
        DoScriptText(SAY_AGGRO1, me);
        //Despawn exit portal
        if(GameObject *pPortal = GetClosestGameObjectWithEntry(me, GO_EXIT_PORTAL, 200.0f))
            pPortal->Delete();

    }
 
    void DamageTaken(Unit* pDoneBy, uint32 &uiDamage)
    {
        if (m_uiPhase == PHASE_OUTRO && m_uiSubPhase != SUBPHASE_DIE)
        {
            uiDamage = 0;
            return;
        }
 
        if (uiDamage > me->GetHealth())
        {
            m_uiPhase = PHASE_OUTRO;
            m_pInstance->SetData(TYPE_INSTANCE_ENTER_RULES, DATA_ALLOW_ENTER_VEHICLE);
 
            if (me->IsNonMeleeSpellCasted(false))
                me->InterruptNonMeleeSpells(false);
 
            me->RemoveAllAuras();
            SetCombatMovement(false);
 
            DespawnCreatures(NPC_SURGE_OF_POWER, 120.0f);
            DespawnCreatures(NPC_STATIC_FIELD, 120.0f);
 
            uiDamage = 0;
            me->SetHealth(1);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->GetMotionMaster()->Clear(false);        // No moving!
            me->GetMotionMaster()->MoveIdle();
            m_uiSubPhase = 0;
            m_uiSpeechCount = 0;
            m_uiSpeechTimer[0] = 2000;
            m_uiSpeechTimer[1] = 10000;
            m_uiSpeechTimer[2] = 11000;
            m_uiSpeechTimer[3] = 13000;
            m_uiSpeechTimer[4] = 10000;
            m_uiSpeechTimer[5] = 7000;
            if(Creature *pTemp = me->SummonCreature(NPC_ALEXSTRASZA, me->GetPositionX()+60, me->GetPositionY(), me->GetPositionZ(), 0, TEMPSUMMON_CORPSE_DESPAWN, 0))
            {
                pTemp->SetUInt32Value(UNIT_FIELD_BYTES_0, 50331648);
                pTemp->SetUInt32Value(UNIT_FIELD_BYTES_1, 50331648);
                pTemp->SetFacingToObject(me);
                me->SetFacingToObject(pTemp);
                pAlexstrasza = pTemp;
            }
        }
    }
    void JustDied(Unit* pKiller)
    {
        m_pInstance->SetData(TYPE_MALYGOS, DONE);
    }
    void KilledUnit(Unit* pVictim)
    {
        uint8 text = 0;
        switch(m_uiPhase)
        {
            case PHASE_FLOOR:
                text = urand(0, 2);
                break;
            case PHASE_ADDS:
                text = urand(3, 5);
                break;
            case PHASE_DRAGONS:
                text = urand(6, 8);
                break;
            default:
                return;
        }
        switch(text)
        {
            case 0: DoScriptText(SAY_KILL1_1, me); break;
            case 1: DoScriptText(SAY_KILL1_2, me); break;
            case 2: DoScriptText(SAY_KILL1_3, me); break;
 
            case 3: DoScriptText(SAY_KILL2_1, me); break;
            case 4: DoScriptText(SAY_KILL2_2, me); break;
            case 5: DoScriptText(SAY_KILL2_3, me); break;
 
            case 6: DoScriptText(SAY_KILL3_1, me); break;
            case 7: DoScriptText(SAY_KILL3_2, me); break;
            case 8: DoScriptText(SAY_KILL3_3, me); break;
        }
            
    }
    void SpellHit(Unit* pCaster, const SpellEntry* pSpell)
    {
        if(pSpell->Id == SPELL_POWER_SPARK)
            DoScriptText(SAY_POWER_SPARK, me);
    }
    void SummonedCreatureDespawn(Creature* pDespawned)
    {
	 if(pDespawned->GetEntry() != NPC_SCION_OF_ETERNITY && pDespawned->GetEntry() != NPC_NEXUS_LORD)
            return;
 
        float x,y,z;
        pDespawned->GetPosition(x,y,z);
        z = FLOOR_Z;
        if(Creature *pDisc = me->SummonCreature(NPC_HOVER_DISC, x, y, z, 0))
        {
            pDisc->SetSpeed(MOVE_FLIGHT, 3.5f, true);
            pDisc->SetSpeed(MOVE_RUN, 3.5f, true);
            pDisc->SetSpeed(MOVE_WALK, 3.5f, true);
            pDisc->SetHealth(me->GetMaxHealth());
	    if (pDisc)
	    {
            m_lDiscGUIDList.push_back(pDisc->GetGUID());
	    sLog.outError("Disc in  aggolist add");
	    }else sLog.outError("Disc not found");
		 uiDiscGUID = pDisc->GetGUID();
		 if (Creature* pGrand = Unit::GetCreature(*me, uiDiscGUID))
		me->AddThreat(pGrand,200.0f);
		sLog.outError("uiGrandDisc add thead list");
		}

        
    }
    
    void DoMovement(float x, float y, float z, uint32 time, bool tofly = false, bool movepoint = true)
    {        
        if(tofly){
            me->SetUInt32Value(UNIT_FIELD_BYTES_0, 50331648);
            me->SetUInt32Value(UNIT_FIELD_BYTES_1, 50331648);
        }else{
            me->SetUInt32Value(UNIT_FIELD_BYTES_0, 0);
            me->SetUInt32Value(UNIT_FIELD_BYTES_1, 0);
        }
        WorldPacket heart;
        me->BuildHeartBeatMsg(&heart);
        me->SendMessageToSet(&heart, false);
        if(movepoint)
            me->GetMotionMaster()->MovePoint(0, x,y,z);
        else
        {
            me->GetMap()->CreatureRelocation(me, x, y, z, me->GetOrientation());
            me->SendMonsterMove(x, y, z, /*SPLINETYPE_NORMAL, me->GetSplineFlags(),*/ time);
        }
    }
    void DoVortex(uint8 phase)
    {
        if(phase == 0)
        {
            me->GetMotionMaster()->Clear(false);
            SetCombatMovement(false);
            float x, y, z;
            me->GetPosition(x, y, z);
            z = z + 20;
            DoMovement(x, y, z, 0, true, false);
        }
        else if(phase == 1)
        {
            if(Creature *pTrigger = GetClosestCreatureWithEntry(me, NPC_AOE_TRIGGER, 200.0f))
                pTrigger->CastSpell(pTrigger, SPELL_VORTEX_AOE_VISUAL, false);
 
            Map* pMap = me->GetMap();
            if(!pMap)
                return;
 
            Map::PlayerList const &lPlayers = pMap->GetPlayers();
            for(Map::PlayerList::const_iterator itr = lPlayers.begin(); itr != lPlayers.end(); ++itr)
            {
                if(!itr->getSource()->isAlive())
                    continue;
                //itr->getSource()->NearTeleportTo(VortexLoc[0].x, VortexLoc[0].y, VORTEX_Z, 0); 
                itr->getSource()->CastSpell(itr->getSource(), SPELL_VORTEX, true, NULL, NULL, me->GetGUID());
                if (Creature *pVortex = me->SummonCreature(NPC_VORTEX, OtherLoc[1].x, OtherLoc[1].y, OtherLoc[1].z, OtherLoc[1].o, TEMPSUMMON_TIMED_DESPAWN, 11000))
		{
		if (!pVortex->GetGUID())
		return;
		/*else
                    itr->getSource()->SetSeer(pVortex);
                    itr->getSource()->SetViewpoint(pVortex, true);*/
		    }
            }        
        }
        else if(phase > 1 && phase < 26){
            Map* pMap = me->GetMap();
            if(!pMap)
                return;
            if(Creature *pVortex = me->SummonCreature(NPC_VORTEX, VortexLoc[phase-1].x, VortexLoc[phase-1].y, VORTEX_Z, 0, TEMPSUMMON_TIMED_DESPAWN, 10000))
            {
                pVortex->SetVisibility(VISIBILITY_OFF);
                Map::PlayerList const &lPlayers = pMap->GetPlayers();
                for(Map::PlayerList::const_iterator itr = lPlayers.begin(); itr != lPlayers.end(); ++itr)
                {
                    if(!itr->getSource()->isAlive())
                        continue;
 
                  /*  float z = itr->getSource()->GetPositionZ() - VORTEX_Z;
                    itr->getSource()->KnockbackFrom(pVortex->GetPositionX(), pVortex->GetPositionY(),-float(pVortex->GetDistance2d(itr->getSource())),7);
                    itr->getSource()->SetFacingToObject(me);*/
                }
            }
        }else if (phase == 30 || phase == 31)
        {    
            if(phase == 31)
            {
                if(me->getVictim())
                    me->GetMotionMaster()->MoveChase(me->getVictim());
                
                m_uiSubPhase = 0;
                return;
            }
            Map* pMap = me->GetMap();
            if(!pMap)
                return;
            Map::PlayerList const &lPlayers = pMap->GetPlayers();
            for(Map::PlayerList::const_iterator itr = lPlayers.begin(); itr != lPlayers.end(); ++itr)
               // itr->getSource()->SetViewpoint(NULL, false);
            
            me->GetMotionMaster()->Clear(false);
	    me->SetFlying(false);
            SetCombatMovement(true);
            float x, y, z;
            me->GetPosition(x, y, z);
            z = FLOOR_Z;
            //DoMovement(x, y, z, 0, false, false);
        }
        
    }
    void PowerSpark(uint8 action)
    {
        if(action == 1) //Summon
        {
            uint8 random = urand(0, 3);
            if(Creature *pSpark = me->SummonCreature(NPC_POWER_SPARK, SparkLoc[random].x, SparkLoc[random].y, FLOOR_Z, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 40000))
            {
                pSpark->CastSpell(pSpark, SPELL_POWER_SPARK_VISUAL, false);
                pSpark->GetMotionMaster()->MoveFollow(me, 0, 0);
                //me->AddSplineFlag(SPLINEFLAG_FLYING);
                m_lSparkGUIDList.push_back(pSpark->GetGUID());
            }
        }
        else if(action == 2 || action == 3) // Start/stop movement
        {
            if(action == 3)
                me->RemoveAurasDueToSpell(SPELL_POWER_SPARK);
 
            if (m_lSparkGUIDList.empty())
                return;
 
            for(std::list<uint64>::iterator itr = m_lSparkGUIDList.begin(); itr != m_lSparkGUIDList.end(); ++itr)
            {
                if (Creature* pTemp = (Creature*)Unit::GetUnit(*me, *itr))
                {
                    if (pTemp->isAlive())
                    {
                        if(action == 2)
                            pTemp->GetMotionMaster()->MoveFollow(me, 0, 0);
                        else
                            pTemp->GetMotionMaster()->MovementExpired(false);
                    }
                }
            }
        }
    }
    void DoSpawnAdds()
    {
        //Nexus lords
        int max_lords = (NEXUS_LORD_COUNT);
        for(int i=0; i < max_lords;i++)
        {
            if(Creature *pLord = me->SummonCreature(NPC_NEXUS_LORD, me->getVictim()->GetPositionX()-5+rand()%10, me->getVictim()->GetPositionY()-5+rand()%10, me->getVictim()->GetPositionZ(), 0, TEMPSUMMON_CORPSE_DESPAWN, 0))
                pLord->AI()->AttackStart(me->getVictim());
        }
	
        int max_scions = (SCION_OF_ETERNITY_COUNT);
        for(int i=0; i < max_scions;i++)
        {
            uint32 tmp = urand(3, 10);
	    if(Creature *pScion = me->SummonCreature(NPC_HOVER_DISC, VortexLoc[tmp].x, VortexLoc[tmp].y, me->getVictim()->GetPositionZ(), 0, TEMPSUMMON_CORPSE_DESPAWN, 0))
	    {
	            pScion->SetSpeed(MOVE_FLIGHT, 3.5f, true);
		    pScion->SetSpeed(MOVE_RUN, 3.5f, true);
		    pScion->SetSpeed(MOVE_WALK, 3.5f, true);
		    pScion->SetHealth(me->GetMaxHealth());
		    pScion->setFaction(14);
	     if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
		    pScion->AI()->AttackStart(pTarget);
	    }
        }       
    }
    bool IsThereAnyAdd()
    {
        //Search for Nexus lords
        if(GetClosestCreatureWithEntry(me, NPC_NEXUS_LORD, 80.0f))
            return true;
 
        //Search for Scions of eternity
        if(GetClosestCreatureWithEntry(me, NPC_SCION_OF_ETERNITY, 80.0f))
            return true;
 
        return false;
    }
    void DoSpawnShell()
    {
        uint32 x = urand(SHELL_MIN_X, SHELL_MAX_X);
        uint32 y = urand(SHELL_MIN_Y, SHELL_MAX_Y);
        if(Creature *pShell = me->SummonCreature(NPC_ARCANE_OVERLOAD, x, y, FLOOR_Z, 0, TEMPSUMMON_TIMED_DESPAWN, 45000))
            pShell->CastSpell(pShell, SPELL_ARCANE_OVERLOAD, false);
    }
    void MountPlayers()
    {
        Map *pMap = me->GetMap();
 
        if(!pMap)
            return;
 
        Map::PlayerList const &lPlayers = pMap->GetPlayers();
        if (lPlayers.isEmpty())
            return;
        
        for(Map::PlayerList::const_iterator itr = lPlayers.begin(); itr != lPlayers.end(); ++itr)
        {
            if (Player* pPlayer = itr->getSource())
            {
                if(pPlayer->GetVehicle())
                    pPlayer->ExitVehicle();

               if(Creature *pTemp = me->SummonCreature(NPC_WYRMREST_SKYTALON, pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(), 0))
                {
                    pTemp->SetCreatorGUID(pPlayer->GetGUID());
                    uint32 health = pTemp->GetHealth() + (pPlayer->GetMaxHealth()*2); // may be wrong
                    pTemp->SetMaxHealth(health);
                    pTemp->SetHealth(health);
                    if (pTemp->IsVehicle())
		    {
		    if (pTemp->CheckPlayerCondition(pPlayer))
			pPlayer->EnterVehicle(pTemp);
		    }
                    if(pTemp->GetHealth() != health)
                    {
                        pTemp->SetMaxHealth(health);
                        pTemp->SetHealth(health);
                    }
                    pTemp->SetFacingToObject(me);
		    me->AddThreat(pTemp,0.0f);
		}
            }
        }
    }
    void DespawnCreatures(uint32 entry, float distance)
    {
        std::list<Creature*> m_pCreatures;
        GetCreatureListWithEntryInGrid(m_pCreatures, me, entry, distance);
 
        if (m_pCreatures.empty())
            return;
 
        for(std::list<Creature*>::iterator iter = m_pCreatures.begin(); iter != m_pCreatures.end(); ++iter)
            (*iter)->ForcedDespawn();            
    }
    //Spell not in DBC, but on retail client recieve its opcode, so..
    void SendDeepBreathCast()
    {
        WorldPacket data(SMSG_SPELL_START, (8+8+4+4+2));
        data.append(me->GetPackGUID());
 
        data.append(me->GetPackGUID());
        data << uint8(1);
        data << uint32(SPELL_DEEP_BREATH);
        data << uint32(0x00000002);
        data << uint32(0);
 
        data << uint8(0);
        data << uint8(0);
        me->SendMessageToSet(&data, true);
    }
    
    void SummonTriger()
    {
    if (Creature *pTriger = me->SummonCreature(NPC_TRIGER,724.684, 1332.92, 267.234,3.2,TEMPSUMMON_CORPSE_DESPAWN))
		{
		pTriger->setFaction(1801);
		pTriger->SetMaxHealth(1000000);
		pTriger->SetHealth(1000000);
		pTriger->SetFlying(true);
		pTriger->AI()->AttackStart(me);
		me->AI()->AttackStart(pTriger);
		}
    }
 
    void UpdateAI(const uint32 uiDiff)
    {
        if(m_uiPhase == PHASE_NOSTART)
        {
            if(m_uiSubPhase == SUBPHASE_FLY_UP){
                me->InterruptNonMeleeSpells(false);
                me->RemoveAurasDueToSpell(SPELL_PORTAL_BEAM);
                float x, y, z;
                if(Creature *pTrigger = GetClosestCreatureWithEntry(me, NPC_AOE_TRIGGER, 180.0f))
                {
                    pTrigger->GetPosition(x, y, z);
                    z = me->GetPositionZ();
                    DoMovement(x, y, z, 0, true);
                }
                m_uiSubPhase = SUBPHASE_UP;
            }
            else if(m_uiSubPhase == SUBPHASE_UP){
                if(m_uiSpeechTimer[m_uiSpeechCount] <= uiDiff)
                {
                    DoScriptText(SAY_INTRO1-m_uiSpeechCount, me);
                    m_uiSpeechCount++;
                    if(m_uiSpeechCount == 5){
                        m_uiSubPhase = SUBPHASE_FLY_DOWN1;
                    }
                }else m_uiSpeechTimer[m_uiSpeechCount] -= uiDiff;
            }
            else if(m_uiSubPhase == SUBPHASE_FLY_DOWN1){
                if(m_uiTimer <= uiDiff)
                {
                    float x, y, z;
                    me->GetPosition(x, y, z);
                    DoMovement(x, y, FLOOR_Z, 0, false, false);
                    m_uiSubPhase = SUBPHASE_FLY_DOWN2;
                    m_uiTimer = 1500;
                }else m_uiTimer -= uiDiff;
            }
            else if(m_uiSubPhase == SUBPHASE_FLY_DOWN2){
                if(m_uiTimer <= uiDiff)
                {
                    me->SetSpeed(MOVE_FLIGHT, 1.0f, true);
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    m_uiSubPhase = 0;
                    m_uiPhase = PHASE_FLOOR;
                }else m_uiTimer -= uiDiff;
            }

            else
            {
                if(m_uiTimer <= uiDiff)
                {
                    uint8 tmp = urand(0,3);
                    DoMovement(SparkLoc[tmp].x, SparkLoc[tmp].y, me->GetPositionZ(), 0, true);
                    m_uiTimer = 25000;
                }else m_uiTimer -= uiDiff;
            }
        }
	
	if (!UpdateVictim())
            return;

        if(m_uiEnrageTimer <= uiDiff)
        {
            DoCast(me, SPELL_BERSERK);
            m_uiEnrageTimer = 600000;
            me->SetSpeed(MOVE_FLIGHT, 3.5f, true);
            me->GetMotionMaster()->MoveChase(me->getVictim());
        }else m_uiEnrageTimer -= uiDiff;
 
        if(m_uiPhase == PHASE_FLOOR)
        {
            if(m_uiSubPhase == SUBPHASE_VORTEX)
            {
                if(m_uiTimer <= uiDiff)
                {
                    DoVortex(m_uiVortexPhase);
                    
                    if(m_uiVortexPhase == 1 || m_uiVortexPhase == 11){
                        if(m_uiVortexPhase == 1)
                            DoCast(me, SPELL_VORTEX_DUMMY);
                        m_uiTimer = 300;
                    }else
                        m_uiTimer = 500;
 
                    if(m_uiVortexPhase >= MAX_VORTEX && m_uiVortexPhase < 29)
                    {
                        m_uiVortexPhase = 30;
                        DoVortex(m_uiVortexPhase);
                        PowerSpark(2);
                        m_uiTimer = 1000;
                        return;
                    }
                    m_uiVortexPhase++;
                }else m_uiTimer -= uiDiff;
                return;
            }

            if(m_uiVortexTimer <= uiDiff)
            {
                PowerSpark(3);
                DoVortex(0);
                m_uiVortexPhase = 1;
                m_uiSubPhase = SUBPHASE_VORTEX;
                m_uiVortexTimer = 50000;
                m_uiTimer = 1000;
                DoScriptText(SAY_VORTEX, me);
                return;
            }else m_uiVortexTimer -= uiDiff;

            if(m_uiArcaneBreathTimer <= uiDiff)
            {
	    SummonTriger();
                DoCast(me, SPELL_ARCANE_BREATH);
                m_uiArcaneBreathTimer = 15000 + urand(3000, 8000);
            }else m_uiArcaneBreathTimer -= uiDiff;
 
            if(m_uiPowerSparkTimer<= uiDiff)
            {
                PowerSpark(1);
                m_uiPowerSparkTimer = 20000+rand()%10000;
            }else m_uiPowerSparkTimer -= uiDiff;
 
            if(m_uiTimer<= uiDiff)
            {
                uint8 health = me->GetHealth()*100 / me->GetMaxHealth();                    
                if(health <= 50)
                {
                    me->InterruptNonMeleeSpells(true);
                    SetCombatMovement(false);
                    me->GetMotionMaster()->MovementExpired(false);
                    DoScriptText(SAY_END_PHASE1, me);
                    float x, y, z;
                    if(Creature *pTrigger = GetClosestCreatureWithEntry(me, NPC_AOE_TRIGGER, 200.0f))
                    {
                        pTrigger->GetPosition(x, y, z);
                        DoMovement(x, y, z+40, 0, true);
                    }

                    DespawnCreatures(NPC_POWER_SPARK, 120.0f);
                    m_uiPhase = PHASE_ADDS;
                    m_uiSubPhase = SUBPHASE_TALK;
                    m_uiTimer = 23000;
                    return;
                }
                m_uiTimer = 1500;
            }else m_uiTimer -= uiDiff;  
 
            DoMeleeAttackIfReady();
        }else if(m_uiPhase == PHASE_ADDS)
        {
            if(m_uiSubPhase == SUBPHASE_TALK)
            {
                if(m_uiTimer <= uiDiff)
                {
                    DoScriptText(SAY_AGGRO2, me);
                   // me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    DoSpawnAdds();
                    DoSpawnShell();
                    m_uiShellTimer = 30000;
                    m_uiSubPhase = 0;
                    m_uiTimer = 15000;
                }else m_uiTimer -= uiDiff;
                return;
            }

            if(m_uiShellTimer <= uiDiff)
            {
                DoSpawnShell();
                DoScriptText(SAY_ARCANE_OVERLOAD, me);
                m_uiShellTimer = 30000;
            }else m_uiShellTimer -= uiDiff;

            if(m_uiDeepBreathTimer <= uiDiff)
            {
                DoScriptText(SAY_ARCANE_PULSE, me);
                DoScriptText(SAY_ARCANE_PULSE_WARN, me);
                SendDeepBreathCast();
                if(Creature *pTrigger = GetClosestCreatureWithEntry(me, NPC_AOE_TRIGGER, 200.0f))
                    pTrigger->CastSpell(pTrigger, SPELL_ARCANE_PULSE, false);
 
                m_uiDeepBreathTimer = 60000;
            }else m_uiDeepBreathTimer -= uiDiff;
 
            // Arcane Storm
            if(m_uiArcaneStormTimer <= uiDiff)
            {
                DoCast(me,SPELL_ARCANE_STORM);
                m_uiArcaneStormTimer = 20000;
            }else m_uiArcaneStormTimer -= uiDiff;
 
            if(m_uiTimer <= uiDiff)
            {
                if(!IsThereAnyAdd())
                {
                    m_uiPhase = PHASE_DRAGONS;
                    m_uiSubPhase = SUBPHASE_DESTROY_PLATFORM1;
                    DoScriptText(SAY_END_PHASE2, me);
                    if(Creature *pTrigger = GetClosestCreatureWithEntry(me, NPC_AOE_TRIGGER, 200.0f))
                        pTrigger->CastSpell(pTrigger, SPELL_DESTROY_PLATFORM_PRE, false);
                    m_uiTimer = 6500;
                    return;
                }
                m_uiTimer = 5000;
            }else m_uiTimer -= uiDiff;  
        }
        else if(m_uiPhase == PHASE_DRAGONS)
        {
            if(m_uiSubPhase == SUBPHASE_DESTROY_PLATFORM1)
            {
                if(m_uiTimer<= uiDiff)
                {
                    if(Creature *pTrigger = GetClosestCreatureWithEntry(me, NPC_AOE_TRIGGER, 200.0f))
                        pTrigger->CastSpell(pTrigger, SPELL_DESTROY_PLATFROM_BOOM, false);
                    if(GameObject *pPlatform = GetClosestGameObjectWithEntry(me, GO_PLATFORM, 200.0f))
                        pPlatform->Delete();                
                    
                    MountPlayers();

                    DespawnCreatures(NPC_ARCANE_OVERLOAD, 170.0f);
                    DespawnCreatures(NPC_HOVER_DISC, 170.0f);
 
                    m_pInstance->SetData(TYPE_INSTANCE_ENTER_RULES, DATA_DISABLE_ENTER);
 
                    m_uiTimer = 2000;
                    m_uiSubPhase = SUBPHASE_DESTROY_PLATFORM2;
                }else m_uiTimer -= uiDiff;
                return;
            }
            else if(m_uiSubPhase == SUBPHASE_DESTROY_PLATFORM2)
            {
                if(m_uiTimer<= uiDiff){
                    DoMovement(OtherLoc[0].x, OtherLoc[0].y, OtherLoc[0].z, 0, true);
                    m_uiSubPhase = SUBPHASE_DESTROY_PLATFORM3;
                    DoScriptText(SAY_INTRO_PHASE3, me);
                    m_uiTimer = 14900;
		    if(Vehicle *pVehicle = me->getVictim()->GetVehicle())
                    {
                        float victim_threat = me->getThreatManager().getThreat(me->getVictim());
                        DoResetThreat();
                        me->AI()->AttackStart((Unit*)pVehicle);
                        me->AddThreat((Unit*)pVehicle, victim_threat);
                    }
                }else m_uiTimer -= uiDiff;
                return;
            }
            else if(m_uiSubPhase == SUBPHASE_DESTROY_PLATFORM3)
            {
                if(m_uiTimer<= uiDiff){
                    m_uiSubPhase = 0;
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                   SetCombatMovement(false);
                    me->GetMotionMaster()->Clear(false);
                    me->GetMotionMaster()->MoveIdle();
		    /*std::list<HostilReference*>::iterator i = me->getThreatManager().getThreatList().begin();
		    for (i = me->getThreatManager().getThreatList().begin(); i!= me->getThreatManager().getThreatList().end();i++)
		    {
		     Unit* pUnit = Unit::GetUnit((*me), (*i)->getUnitGuid());
		     if(pUnit && pUnit->GetTypeId() == TYPEID_UNIT || pUnit->GetTypeId() == TYPEID_PLAYER)
		     me->AI()->AttackStart((Unit*)pUnit);*/
		     
                    if(Vehicle *pVehicle = me->getVictim()->GetVehicle())
                    {
                        float victim_threat = me->getThreatManager().getThreat(me->getVictim());
                        DoResetThreat();
                        me->AI()->AttackStart((Unit*)pVehicle);
                        me->AddThreat((Unit*)pVehicle, victim_threat);
                    }
                    DoScriptText(SAY_AGGRO3, me);
                }else m_uiTimer -= uiDiff;
                return;
            }
            if(m_uiArcanePulseTimer <= uiDiff)
            {
                if(!me->IsNonMeleeSpellCasted(false))
                {
                    DoCast(me, SPELL_ARCANE_PULSE);
                }
                m_uiArcanePulseTimer = 1000;
            }else m_uiArcanePulseTimer -= uiDiff;
 
            if(m_uiStaticFieldTimer <= uiDiff)
            {
                if(Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                    if(Creature *pField = me->SummonCreature(NPC_STATIC_FIELD, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 30000))
                        pField->CastSpell(pField, SPELL_STATIC_FIELD, true);
                m_uiStaticFieldTimer = 20000+rand()%15000;
            }else m_uiStaticFieldTimer -= uiDiff;
 
            DoMeleeAttackIfReady();

        }
        //Outro!
        else if(m_uiPhase == PHASE_OUTRO)
        {
            if(m_uiSpeechTimer[m_uiSpeechCount] <= uiDiff)
            {
                Creature *pSpeaker = NULL;
                if(m_uiSpeechCount == 0)
                    pSpeaker = me;
                else
                    pSpeaker = pAlexstrasza;
 
                if(pSpeaker && pSpeaker->isAlive())
                    DoScriptText(SAY_OUTRO1-m_uiSpeechCount, pSpeaker);
 
                switch(m_uiSpeechCount)
                {
                    case 1:
                        me->SetVisibility(VISIBILITY_OFF);
                        break;
                    case 5:
                        m_uiSubPhase = SUBPHASE_DIE;
                        if(pAlexstrasza && pAlexstrasza->isAlive())
                            pAlexstrasza->ForcedDespawn();
                        //Summon exit portal
                        if(!GetClosestGameObjectWithEntry(me, GO_EXIT_PORTAL, 120.0f))
                            me->SummonGameObject(GO_EXIT_PORTAL, GOPositions[2].x, GOPositions[2].y, GOPositions[2].z, GOPositions[2].o, 0, 0, 0, 0, 0);
                        me->DealDamage(me, me->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
                        break;
 
                }
                m_uiSpeechCount++;
            }else m_uiSpeechTimer[m_uiSpeechCount] -= uiDiff;
            
        }
    }
};
/*######
## mob_power_spark
######*/
struct mob_power_sparkAI : public ScriptedAI
{
    mob_power_sparkAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        //m_bRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        Reset();
    }
 
    ScriptedInstance* m_pInstance;
    bool m_bRegularMode;
    bool isDead;
    uint32 m_uiCheckTimer;
    Creature *pMalygos;
 
    void Reset()
    {
        isDead = false;
        pMalygos = GetClosestCreatureWithEntry(me, NPC_MALYGOS, 150.0f);
        me->SetUInt32Value(UNIT_FIELD_BYTES_0, 50331648);
        me->SetUInt32Value(UNIT_FIELD_BYTES_1, 50331648);
        m_uiCheckTimer = 2500;
    }
    void AttackStart(Unit *pWho)
    {
        return;
    }
    void DamageTaken(Unit* pDoneBy, uint32 &uiDamage)
    {
        if (isDead && me->GetVisibility() == VISIBILITY_ON)
        {
            uiDamage = 0;
            return;
        }
 
        if (uiDamage > me->GetHealth() && me->GetVisibility() == VISIBILITY_ON)
        {
            isDead = true;
 
            if (me->IsNonMeleeSpellCasted(false))
                me->InterruptNonMeleeSpells(false);
 
            me->RemoveAllAuras();
            me->AttackStop();
            SetCombatMovement(false);
 
            //if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE)
                me->GetMotionMaster()->MovementExpired(); // TODO
 
            uiDamage = 0;
            me->SetHealth(1);
            me->CastSpell(me, SPELL_POWER_SPARK_PLAYERS, false);
            m_uiCheckTimer = 35000;
            if(pMalygos && pMalygos->isAlive())
                ((boss_malygosAI*)pMalygos->AI())->m_lSparkGUIDList.clear();
        }
    }
    void UpdateAI(const uint32 uiDiff)
    {
        if(m_uiCheckTimer <= uiDiff)
        {
            if(isDead)
            {
                me->ForcedDespawn();
                return;
            }
            if(pMalygos && pMalygos->isAlive() && me->GetVisibility() == VISIBILITY_ON)
            {
                if(me->IsWithinDist(pMalygos, 3.0f, false))
                {
                    ((boss_malygosAI*)pMalygos->AI())->m_lSparkGUIDList.clear();
                    me->CastSpell(pMalygos, SPELL_POWER_SPARK, true);
                    me->SetVisibility(VISIBILITY_OFF);
                }
            }
            m_uiCheckTimer = 2500;
        }else m_uiCheckTimer -= uiDiff;
    }
};
/*######
## mob_scion_of_eternity
######*/

struct mob_scion_of_eternityAI : public ScriptedAI
{
    mob_scion_of_eternityAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        //m_bRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        Reset();
    }
 
    ScriptedInstance* m_pInstance;
    bool m_bRegularMode;
    uint32 m_uiArcaneBarrageTimer;
    uint8 m_uiMovePoint;
 
    void Reset()
    {
        me->SetSpeed(MOVE_WALK, 3.5f, true);
        me->SetSpeed(MOVE_RUN, 3.5f, true);
        me->SetSpeed(MOVE_FLIGHT, 3.5f, true);
        DoNextMovement();
        m_uiMovePoint = 0;
        m_uiArcaneBarrageTimer = 5000 + rand()%5000;
    }
    void AttackStart(Unit *pWho)
    {
        if(pWho->GetTypeId() != TYPEID_PLAYER)
            return;
 
        if (me->Attack(pWho, true))
        {
            me->AddThreat(pWho, 1.0f);
            me->SetInCombatWith(pWho);
            pWho->SetInCombatWith(me);
            //me->GetMotionMaster()->MoveChase(pWho, 15.0f);
        }
    }
    void DoNextMovement()
    {
        m_uiMovePoint++;
        uint32 x = urand(SHELL_MIN_X, SHELL_MAX_X);
        uint32 y = urand(SHELL_MIN_Y, SHELL_MAX_Y);
        uint32 z = urand(uint32(FLOOR_Z), uint32(FLOOR_Z)+10);
        me->GetMotionMaster()->MoveConfused(); //MovePoint(m_uiMovePoint, x, y, z);
    }
    void MovementInform(uint32 uiType, uint32 uiPointId)
    {
        if(uiType != POINT_MOTION_TYPE)
            return;
 
        if(uiPointId == m_uiMovePoint)
            DoNextMovement();
    }
 
    void UpdateAI(const uint32 uiDiff)
    {     
        if(m_uiArcaneBarrageTimer <= uiDiff)
        {
            me->GetMotionMaster()->MovementExpired(false);
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                DoCast(pTarget, SPELL_ARCANE_BARRAGE);
            m_uiArcaneBarrageTimer = 3000 + rand()%5000;
            DoNextMovement();
        }else m_uiArcaneBarrageTimer -= uiDiff;
	DoMeleeAttackIfReady();
	if (!UpdateVictim())
            return;
    }
};
/*######
## go_focusing_iris
######*/
bool GOHello_go_focusing_iris(Player* pPlayer, GameObject* pGo)
{
    //bool m_bRegularMode = pGo->GetMap()->IsRegularDifficulty();
 
    bool hasItem = false;
    if (((InstanceMap*)(pGo->GetMap()))->GetDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL)
    {
        if(pPlayer->HasItemCount(ITEM_KEY_TO_FOCUSING_IRIS, 1) || pPlayer->HasItemCount(ITEM_KEY_TO_FOCUSING_IRIS_H, 1)) 
            hasItem = true;
    }else
    {
        if(pPlayer->HasItemCount(ITEM_KEY_TO_FOCUSING_IRIS_H, 1))
            hasItem = true;        
    }
    if(!hasItem)        
        return false;
 
    if(Creature *pMalygos = GetClosestCreatureWithEntry(pGo, NPC_MALYGOS, 150.0f))
        ((boss_malygosAI*)pMalygos->AI())->m_uiSubPhase = SUBPHASE_FLY_UP;
 
    pGo->Delete();
    return false;
}
CreatureAI* GetAI_boss_malygos(Creature* pCreature)
{
    return new boss_malygosAI(pCreature);
}
CreatureAI* GetAI_mob_power_spark(Creature* pCreature)
{
    return new mob_power_sparkAI(pCreature);
}

CreatureAI* GetAI_mob_scion_of_eternity(Creature* pCreature)
{
    return new mob_scion_of_eternityAI(pCreature);
}
 
 
void AddSC_boss_malygos()
{
    Script *newscript;
 
    newscript = new Script;
    newscript->Name = "boss_malygos";
    newscript->GetAI = &GetAI_boss_malygos;
    newscript->RegisterSelf();
 
    newscript = new Script;
    newscript->Name = "mob_power_spark";
    newscript->GetAI = &GetAI_mob_power_spark;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_scion_of_eternity";
    newscript->GetAI = &GetAI_mob_scion_of_eternity;
    newscript->RegisterSelf();
 
    newscript = new Script;
    newscript->Name = "go_focusing_iris";
    newscript->pGOHello = &GOHello_go_focusing_iris;
    newscript->RegisterSelf();
}
