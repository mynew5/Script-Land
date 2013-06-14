#include "ScriptedPch.h"
#include "instance_icecrown_citadel.h"


enum
{
    SAY_INTRO1                             = -1999926,
    SAY_INTRO2                             = -1999927,
    SAY_INTRO3                             = -1999928,
    SAY_INTRO4                             = -1999929,
    SAY_INTRO5                             = -1999930,
    SAY_AGGRO                              = -1999931,
    SAY_CASTING_WINTER                     = -1999932,
    SAY_SHATTERING                         = -1999933,
    SAY_SUMMON_V                           = -1999934,
    SAY_CASTING_HARV                       = -1999935,
    SAY_ESC_FROSTM                         = -1999936,
    SAY_DEVOURED_FROSTM                    = -1999937,
    SAY_SPECIAL1                           = -1999938,
    SAY_SPECIAL2                           = -1999939,
    SAY_LOW_HEALTH                         = -1999940,
    SAY_RANDOM1                            = -1999941,
    SAY_RANDOM2                            = -1999942,
    SAY_ENRAGE                             = -1999943,
    SAY_BATTLE1                            = -1999944,
    SAY_BATTLE2                            = -1999944,
    SAY_BATTLE3                            = -1999937,
    SAY_BATTLE4                            = -1999938,
    SAY_BATTLE5                            = -1999939,
    SAY_BATTLE6                            = -1999940,
    SAY_BATTLE7                            = -1999941,
    SAY_BATTLE8                            = -1999942,
    SAY_BATTLE9                            = -1999943,
    SAY_BATTLE10                           = -1999944,
    SAY_DEATH                              = -1999945,

    SPELL_SUMMON_HORROR                    = 70372,
    SPELL_SUMMON_GHOULS                    = 70358,
    SPELL_SUMMON_VALKYR                    = 69037,
    
    SPELL_INFEST                           = 70541,
    SPELL_NECROTIC_PLAGUE                  = 70337,
    SPELL_PLAGUE_SIPHON                    = 74074,
    SPELL_GRAB                             = 62712,
    SPELL_WINGS                            = 74352,
    SPELL_SOUL_REAPER                      = 69409,
    SPELL_DEFILE                           = 72754,
    SPELL_HARVEST_SOUL                     = 68980,
    SPELL_VILE_SPIRITS                     = 70498,
    SPELL_SPIRIT_BURST                     = 70503,
    SPELL_SOUL_RIP                         = 69397,
    SPELL_DARK_HUNGER                      = 69383,
    SPELL_HARVESTED_SOUL                   = 74322,
    SPELL_REMORSELESS_WINTER               = 68981,
    SPELL_PAIN_AND_SUFFERING               = 72133,
    SPELL_SUMMON_ICE_SPHERE                = 69103,
    SPELL_ICE_PULSE                        = 69099,
    SPELL_ICE_BURST                        = 69108,
    SPELL_RAGING_SPIRIT                    = 69200, 
    SPELL_SOUL_SHRIEK                      = 69242,
    SPELL_QUAKE				   = 72262,  // hea drop platform
    SPELL_FURY_FROSTMOURNE                 = 70063,
    SPELL_RISE_TELEPORT                    = 70858,
        
    NPC_SHAMNLING_HORROR                   = 37698,
    SPELL_SHOCKWAVE                        = 72149,
    SPELL_HORROR_ENRAGE                    = 72143,
    
    // Fase Lich King
    NPC_TERENAS_MENERIL			   = 36823,
    SPELL_RESTORE_SOUL                     = 72595,
    SPELL_LIGHTS_FAVOR                     = 69382,
    //GO_FLOOR				   = 10,  // ?????

    PHASE_ONE		= 1,
    PHASE_TWO		= 2,
    PHASE_THREE		= 3,
    PHASE_FINAL		= 4,
    PHASE_TRANSITION_1	= 5,
    PHASE_TRANSITION_2	= 6
};
/*
 ***************************************
******** boss lich king **************
****************************************
*/
struct boss_the_lich_kingAI : public ScriptedAI
{
    boss_the_lich_kingAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
	me->SetReactState(REACT_PASSIVE);
    }

    ScriptedInstance* pInstance;

	uint32 Summon_Horror_Timer;
        uint32 Infest_Timer;
        uint32 Summon_Ghouls_Timer;
        uint32 Soul_Reaper_Timer;
        uint32 Defile_Timer;
        uint32 Summon_Valkyr_Timer;
        uint32 Harvest_Soul_Timer;
        uint32 Vile_Spirits_Timer;
        uint32 Remorseless_Winter_Timer;
        uint32 Pain_And_Suffering_Timer;
        uint32 Summon_Ice_Sphere_Timer;
        uint32 Raging_Spirit_Timer;
        uint32 Necrotic_Plague_Timer;
        uint32 Phase_Timer;
	uint32 uiTextTimer;
        uint8 Phase;
	uint8 uiTextPase;
	
    bool IntroText;
    bool PhaseDone;

    void Reset()
    {
                Phase_Timer			= 60000;
                Summon_Horror_Timer		= 50000;
                Infest_Timer			= 2000;
                Summon_Ghouls_Timer		= 20000;
                Soul_Reaper_Timer		= 1000;
                Defile_Timer			= 1000;
                Summon_Valkyr_Timer		= 1000;
                Harvest_Soul_Timer		= 6000;
                Vile_Spirits_Timer		= 500;
                Remorseless_Winter_Timer	= 2500;
                Pain_And_Suffering_Timer	= 500;
                Summon_Ice_Sphere_Timer		= 1000;
                Raging_Spirit_Timer		= 1000;
                Necrotic_Plague_Timer		= 1000;
		uiTextTimer			= 0;
		uiTextPase = 0;
                Phase = 0;
                PhaseDone = false;
		IntroText = false;
    }

    void Aggro(Unit* pWho)
    {
	if(Phase == 0)
	return;
	
        DoScriptText(SAY_AGGRO, me);
	if (pInstance)
	    pInstance->SetData(DATA_LICHKING_EVENT, IN_PROGRESS);
    }
    
    void SetData(uint32 uiId, uint32 uiValue)
    {
      if (uiId == 1)
       {
        if (Creature* pFordring = me->FindNearestCreature(NPC_TIRIONS_FORDRING, 200.0f))
         {
	   me->RemoveUnitMovementFlag(MOVEMENTFLAG_WALK_MODE);
	   float x = pFordring->GetPositionX() - 5;
	   float y = pFordring->GetPositionY();
	   float z = pFordring->GetPositionZ();
	   me->GetMotionMaster()->MovePoint(0,x,y,z);
	    IntroText = true;
	    uiTextTimer = 10000;
	    uiTextPase = 1;
       }
    }
    }
      
    void JustReachedHome()
    {
        if (pInstance)
            pInstance->SetData(DATA_LICHKING_EVENT, FAIL);
    }

    void KilledUnit(Unit* pVictim)
    {
        switch(urand(0, 1))
        {
            case 0: DoScriptText(SAY_RANDOM1, me); break;
            case 1: DoScriptText(SAY_RANDOM2, me); break;
        }
    }

    void JustDied(Unit* pKiller)
    {
        DoScriptText(SAY_DEATH, me);

        if (pInstance)
            pInstance->SetData(DATA_LICHKING_EVENT, DONE);
    }

    void DespawnAdds(std::list<uint64>& List)
    {
        if (!List.empty())
        {
            for (std::list<uint64>::iterator itr = List.begin(); itr != List.end(); ++itr)
            {
                if (Creature* pSummon = (Creature*)Unit::GetUnit((*me), *itr))
                    pSummon->ForcedDespawn();
            }
            List.clear();
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
	 if (IntroText)
	  {
	  if(uiTextTimer <= uiDiff)
	  {
	    switch (uiTextPase)
	    {
	    case 1:
	     DoScriptText(SAY_INTRO1, me);
	     me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_TALK);
	     uiTextTimer = 30000;
	     uiTextPase++;
	     break;
	    case 2:
	     DoScriptText(SAY_INTRO2, me);
	     uiTextTimer = 5000;
	     uiTextPase++;
	     break;
	    case 3:
	     DoScriptText(SAY_INTRO3, me);
	     uiTextTimer = 3000;
	     uiTextPase++;
	     break;
	    case 4:
	     DoScriptText(SAY_INTRO4, me);
	     uiTextTimer = 7000;
	     uiTextPase++;
	     break;
	    case 5:
	     DoScriptText(SAY_INTRO5, me);
	     uiTextTimer = 3000;
	     uiTextPase++;
	     break;
	    case 6:
	     me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_NONE);
	     IntroText = false;
	     uiTextTimer = 0;
	     Phase = 1;
	     me->SetReactState(REACT_AGGRESSIVE);
	     break;
	  }
	 } else uiTextTimer -= uiDiff;
	}
    
	if (!UpdateVictim())
	return;
      
        switch (Phase)
        {
            case PHASE_ONE:
                if (!PhaseDone)
                {
		 if (me->GetHealthPercent() < 70.0f)
		     Phase = 5;
                }              
		if (Summon_Horror_Timer <= uiDiff)               
		  {
		    DoCast(SPELL_SUMMON_HORROR);
		    Summon_Horror_Timer = 60000;
		  } else Summon_Horror_Timer -= uiDiff;
                                
		if (Summon_Ghouls_Timer <= uiDiff)
		  {
		    DoCast(SPELL_SUMMON_GHOULS);
		    Summon_Ghouls_Timer = 50000;
		  } else Summon_Ghouls_Timer -= uiDiff;

		  if (Infest_Timer <= uiDiff)
		    {
		      DoCast(SPELL_INFEST);
		      Infest_Timer = 20000;
		    } else Infest_Timer -= uiDiff;
                                
		  if (Necrotic_Plague_Timer <= uiDiff)
		    {
		      DoCast(SPELL_NECROTIC_PLAGUE);
		      Necrotic_Plague_Timer = 30000;
		      } else Necrotic_Plague_Timer -= uiDiff;
		    break;                  

            case PHASE_TWO:
                if (!PhaseDone)
                {
		 if (me->GetHealthPercent() < 40.0f)
		     Phase = 6;
                }
                                
		if (Summon_Valkyr_Timer < uiDiff)
		 {
		   DoCast(SPELL_SUMMON_VALKYR);
		   DoScriptText(SAY_SUMMON_V,me);
		   Summon_Valkyr_Timer = 50000;
		 } else Summon_Valkyr_Timer -= uiDiff;
                                
		if (Infest_Timer < uiDiff)
		 {
		   DoCast(SPELL_INFEST);
		   Infest_Timer = 20000;
		 } else Infest_Timer -= uiDiff;
                                
		 if (Soul_Reaper_Timer < uiDiff)         
		   {
		     DoCast(SPELL_SOUL_REAPER);
		     Soul_Reaper_Timer = 30000;
		   } else Soul_Reaper_Timer -= uiDiff;
                                
		 if (Defile_Timer < uiDiff)
		   {
		     DoCast(SPELL_DEFILE);
		     Defile_Timer = 35000;
		   } else Defile_Timer -= uiDiff;
		break;

                                
            case PHASE_THREE:  
	         if (Defile_Timer < uiDiff)
		   {
		     DoCast(SPELL_DEFILE);
		     Defile_Timer = 35000;
		   } else Defile_Timer -= uiDiff;
                                
		 if (Soul_Reaper_Timer < uiDiff)         
		   {
		     DoCast(SPELL_SOUL_REAPER);
		     Soul_Reaper_Timer = 30000;
		   } else Soul_Reaper_Timer -= uiDiff;
                                
		 if (Harvest_Soul_Timer < uiDiff)                
		   {
		     DoCast(SPELL_HARVEST_SOUL);
		     Harvest_Soul_Timer = 60000;
		   } else Harvest_Soul_Timer -= uiDiff;
                                
		 if (Vile_Spirits_Timer < uiDiff)                
		   {
		     DoCast(SPELL_VILE_SPIRITS);
		     Vile_Spirits_Timer = 30000;
		   } else Vile_Spirits_Timer -= uiDiff;
	     break;
                                
            case PHASE_TRANSITION_1:
                if (!PhaseDone)
                {
                    if (Phase_Timer <= uiDiff)
                    {
                        DoCast(me, SPELL_QUAKE);
                        Phase = 3;
                        Phase_Timer = 60000;
                        break;
                    } else Phase_Timer -= uiDiff;
                }
                                
		if (Remorseless_Winter_Timer < uiDiff)          
		  {
		    DoCast(SPELL_REMORSELESS_WINTER);
		    Remorseless_Winter_Timer = 60000;
		  } else Remorseless_Winter_Timer -= uiDiff;                              
                                
		if (Pain_And_Suffering_Timer < uiDiff)          
		  {
		    if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
		      DoCast(pTarget, SPELL_PAIN_AND_SUFFERING);
		      Pain_And_Suffering_Timer = 3000;
		  } else Pain_And_Suffering_Timer -= uiDiff;
                                
		if (Summon_Ice_Sphere_Timer < uiDiff)           
		{
		  DoCast(SPELL_SUMMON_ICE_SPHERE);
		  Summon_Ice_Sphere_Timer = 5000;
		} else Summon_Ice_Sphere_Timer -= uiDiff;

		if (Raging_Spirit_Timer < uiDiff)               
		  {
		    DoCast(SPELL_RAGING_SPIRIT);
		    Raging_Spirit_Timer = 20000;
		  } else Raging_Spirit_Timer -= uiDiff;                        
	    break;

            case PHASE_TRANSITION_2:
                if (!PhaseDone)
                {
                    if (Phase_Timer <= uiDiff)
                    {
                        DoCast(me, SPELL_QUAKE);
                        Phase = 4;
                        Phase_Timer = 60000;
                        break;
                    } else Phase_Timer -= uiDiff;
                }
                                
		if (Remorseless_Winter_Timer < uiDiff)          
		  {
		    DoCast(SPELL_REMORSELESS_WINTER);
		    Remorseless_Winter_Timer = 60000;
		  } else Remorseless_Winter_Timer -= uiDiff;                              
                                
		if (Pain_And_Suffering_Timer < uiDiff)          
		  {
		    if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 10))
		      DoCast(pTarget, SPELL_PAIN_AND_SUFFERING);
		      Pain_And_Suffering_Timer = 3000;
		  } else Pain_And_Suffering_Timer -= uiDiff;
                                
		if (Summon_Ice_Sphere_Timer < uiDiff)           
		  {
		    DoCast(SPELL_SUMMON_ICE_SPHERE);
		    Summon_Ice_Sphere_Timer = 5000;
		  } else Summon_Ice_Sphere_Timer -= uiDiff;

		if (Raging_Spirit_Timer < uiDiff)               
		  {
		    DoCast(SPELL_RAGING_SPIRIT);
		    Raging_Spirit_Timer = 20000;
		  } else Raging_Spirit_Timer -= uiDiff;                         
	    break;
	}
    DoMeleeAttackIfReady();
    }
};

struct npc_ternas_menerilAI : public ScriptedAI
{
    npc_ternas_menerilAI(Creature* me) : ScriptedAI(me)
    {
        pInstance = me->GetInstanceData();
        Reset();
    }

    ScriptedInstance* pInstance;
    
    uint32 RestoreSoulTimer;
    uint32 LightsFavorTimer;

    void Reset() 
    {
    RestoreSoulTimer = 1000;
    LightsFavorTimer = 20000;
    }
    void AttackStart(Unit* pWho) { }

    void UpdateAI(const uint32 diff) 
    {
    if (!UpdateVictim())
	return;
	
    if (me->hasUnitState(UNIT_STAT_CASTING))
            return;
	    
    Map::PlayerList const& players = me->GetMap()->GetPlayers();
            if (me->GetMap()->IsDungeon() && !players.isEmpty())
            {
                for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                {
                    Player* pPlayer = itr->getSource();
                    if (pPlayer && !pPlayer->isGameMaster() && me->IsInRange(pPlayer,1.0f,55.0f,false))
                    {
		    if (!pPlayer->isAlive())
		    me->CastSpell(pPlayer,SPELL_RESTORE_SOUL,false);
		    if (LightsFavorTimer <= diff)
		    {
		    me->CastSpell(pPlayer,SPELL_LIGHTS_FAVOR,true);
		    LightsFavorTimer = 40000;
		    }else LightsFavorTimer -= diff;
		}
	    }
	}
    }
};

/*
*********************************************************
*************mob summoned honnor*****************
*********************************************************
*/
struct mob_summon_honor_targetAI : public ScriptedAI
{
    mob_summon_honor_targetAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* pInstance;

    void Reset() {}
    void AttackStart(Unit* pWho) {}
    
    void JustSummoned(Creature* pSummoned)
    {
        if (!pInstance)
            return;

        if (Creature* pTheLichKing = ((Creature*)Unit::GetUnit(*me, pInstance->GetData64(NPC_LICHKING))))
        {
            float fPosX, fPosY, fPosZ;
            pTheLichKing->GetPosition(fPosX, fPosY, fPosZ);
            pSummoned->GetMotionMaster()->MovePoint(0, fPosX, fPosY, fPosZ);
        }
    }

    
    void UpdateAI(const uint32 diff) {}
};

#define GOSSIP_ITEM_SATR_LICH		"Go to the Lich King."

bool GossipHello_npc_tirions_fordring(Player* pPlayer, Creature* pCreature)
{    
	ScriptedInstance* pInstance = pCreature->GetInstanceData();
	pCreature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
	if (!pInstance)
	return true;
	pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_SATR_LICH, GOSSIP_SENDER_MAIN, GOSSIP_OPTION_GOSSIP+1);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_tirions_fordring(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    
    ScriptedInstance* pInstance = pCreature->GetInstanceData();

    pPlayer->CLOSE_GOSSIP_MENU();
    
    if (uiAction == GOSSIP_OPTION_GOSSIP+1)
    {
     if (pInstance)
         pInstance->SetData(DATA_START_LICH, DONE);
    }

    return true;
}

CreatureAI* GetAI_boss_the_lich_king(Creature* pCreature)
{
    return new boss_the_lich_kingAI(pCreature);
}

CreatureAI* GetAI_npc_ternas_meneril(Creature* pCreature)
{
    return new npc_ternas_menerilAI(pCreature);
}

CreatureAI* GetAI_mob_summon_honor_target(Creature* pCreature)
{
    return new mob_summon_honor_targetAI(pCreature);
}

void AddSC_boss_the_lich_king()
{
    Script* NewScript;
    NewScript = new Script;
    NewScript->Name = "boss_the_lich_king";
    NewScript->GetAI = &GetAI_boss_the_lich_king;
    NewScript->RegisterSelf();
    
    NewScript = new Script;
    NewScript->Name = "npc_ternas_meneril";
    NewScript->GetAI = &GetAI_npc_ternas_meneril;
    NewScript->RegisterSelf();
    
    NewScript = new Script;
    NewScript->Name = "mob_summon_honor_target";
    NewScript->GetAI = &GetAI_mob_summon_honor_target;
    NewScript->RegisterSelf();
    
    NewScript = new Script;
    NewScript->Name = "npc_tirions_fordring";
    NewScript->pGossipHello = &GossipHello_npc_tirions_fordring;
    NewScript->pGossipSelect = &GossipSelect_npc_tirions_fordring;
    NewScript->RegisterSelf();
    
}
