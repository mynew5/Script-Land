/*Private_core_332*/

#include "ScriptedPch.h"
#include "ulduar.h"

#define SPELL_CHAIN_LIGHTING	RAID_MODE(62131,64390)
enum
{
SPELL_STORY_KILL_CREDIT		= 56940,
// PHASE 1 INACTIVE
SPELL_SHEATH_OF_LIGHTING	= 62276,
SPELL_STORMHAMMER		= 62042,
SPELL_DEAFENING_THUNDER		= 62470,
SPELL_CHARGE_ORB		= 62016,
SPELL_LIGHTING_SHOCK		= 62017,
SPELL_BERSERK			= 62560,
SPELL_SUMMON_LIGHTING_ORB	= 62391,
//PHASE 2 
SPELL_TOUCH_OF_DOMINION		= 62562,
SPELL_LIGHTING_CHANGE		= 62279,
SPELL_UNBALANSING_STRIKE	= 62130,
NPC_ZMIY			= 12000 /// ??????
};

#define SAY_INTRO -1
#define SAY_SLAY -1


struct boss_thorimAI : public BossAI
{
    boss_thorimAI(Creature* pCreature) : BossAI(pCreature, TYPE_THORIM)
    {
        m_pInstance = pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    
    uint8 uiPhase;
    uint32 AggroTimer;
    uint64 AggroTargetGUID;
    uint32 SheathofLightningTimer;
    uint32 StormhammerTimer;
    uint32 DeafeningThunderTimer;
    uint32 ChargeOrbTimer;
    uint32 BerserkTimer;
    uint32 SummonLightningOrTimer;
    uint32 TouchofDominionTimer;
    uint32 ChainLightningTimer;
    uint32 LightningChargeTimer;
    uint32 UnbalancingStrikeTimer;
    
    bool uiDone;
    bool Intro;

    void Reset()
    {
    uiPhase = 0;
    AggroTimer = 10000;
    AggroTargetGUID = 0;
    SheathofLightningTimer = 25000;
    StormhammerTimer = 35000;
    DeafeningThunderTimer = 7000;
    ChargeOrbTimer = 13000;
    BerserkTimer = 300000;
    SummonLightningOrTimer = 43000;
    TouchofDominionTimer = 5000;
    ChainLightningTimer = 25000;
    LightningChargeTimer = 32000;
    UnbalancingStrikeTimer = 12000;
    uiDone = false;
    Intro = false;
    }
    
    void MoveInLineOfSight(Unit* pWho)
    {
    	if (!Intro && pWho->GetTypeId() == TYPEID_PLAYER && pWho->isTargetableForAttack() && me->IsHostileTo(pWho) && pWho->isInAccessiblePlaceFor(me))
        {
            if (me->IsWithinDistInMap(pWho, VISIBLE_RANGE) && me->IsWithinLOSInMap(pWho))
            {
		me->GetMotionMaster()->Clear(false);
                DoScriptText(SAY_INTRO, me);
                me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_TALK);
                AggroTargetGUID = pWho->GetGUID();
		me->SetInCombatWithZone();
		if (m_pInstance)
            m_pInstance->SetData(TYPE_THORIM, IN_PROGRESS);
		Intro = true;
	    }
	if (uiDone)
            ScriptedAI::MoveInLineOfSight(pWho);
	}
    }

    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if (damage >= me->GetHealth())
        {
            damage = 0;
            EnterEvadeMode();
            me->SetReactState(REACT_PASSIVE);
            DoCast(SPELL_STORY_KILL_CREDIT); 
	    if (m_pInstance)
            m_pInstance->SetData(TYPE_THORIM, DONE);
	}
    }

    void UpdateAI(const uint32 diff)
    {
	    
	if (Intro && !uiDone)
        {
            if (AggroTimer <= diff)
            {
	    me->SetReactState(REACT_PASSIVE);
	    me->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE);
	    me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_NONE);
	    uiDone = true;
	    if (!AggroTargetGUID)
                {
                    EnterEvadeMode();
                    return;
                }
	    } else AggroTimer -= diff;
	}
	
	if (!UpdateVictim() || !uiDone)
            return;
	    
	Map::PlayerList const& players = me->GetMap()->GetPlayers();
            if (me->GetMap()->IsDungeon() && !players.isEmpty())
            {
                for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                {
                    Player* pPlayer = itr->getSource();
		    if (me->IsWithinDistInMap(pPlayer, 1.0f) && me->IsWithinLOSInMap(pPlayer))
		    {
		    uiPhase = 2;
		    }
		}
	    }

	if (uiDone && uiPhase == 0)
	 {
	  if (Creature* pZmiy = GetClosestCreatureWithEntry(me, NPC_ZMIY, 3000.0f))
	   {
	    if (!pZmiy)
	        uiPhase = 1;
	   }
	 }
	
	if (uiPhase == 1)
	{
	me->GetMotionMaster()->Clear(false);
	if (me->hasUnitState(UNIT_STAT_CASTING))
	return;
	
	 if (SheathofLightningTimer <= diff)
	 {
	  if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0,200,true))
	   {
	     me->CastSpell(pTarget,SPELL_SHEATH_OF_LIGHTING,true);
	     SheathofLightningTimer = 28000;
	   }
	 } else SheathofLightningTimer -= diff;
	 
	 if (StormhammerTimer <= diff)
	  {
	   if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0,500,true))
	    {
	    DoCast(pTarget,SPELL_STORMHAMMER);
	    if (me->IsWithinDistInMap(pTarget, 5.0f))
	     {
	      me->CastSpell(pTarget,SPELL_DEAFENING_THUNDER,true);
	     }
	    }
	   StormhammerTimer = 33000;
	  } else StormhammerTimer -= diff;
	  
	  if (ChargeOrbTimer <= diff)
	  {
	  if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0,500,true))
	  {
	  if (pTarget->GetTypeId() == TYPEID_UNIT)
	  me->CastSpell(pTarget,SPELL_CHARGE_ORB,true);
	  
	  if (me->IsWithinDistInMap(pTarget, 3.0f))
		    me->CastSpell(pTarget,SPELL_LIGHTING_SHOCK,true);
	  }
	  ChargeOrbTimer = 43000;
	  } else ChargeOrbTimer -= diff;
	  
	  if (BerserkTimer <= diff)
	  {
	  DoCast(me,SPELL_BERSERK,true);
	  BerserkTimer = 30000;
	  } else BerserkTimer -= diff;
	  
	 /* if (SummonLightningOrTimer <= diff)
	  {
	  DoCast(SPELL_SUMMON_LIGHTING_ORB);
	  SummonLightningOrTimer = 30000;
	  } else SummonLightningOrTimer -= diff;*/
	
	}
	
	if (uiPhase == 2)
	{
	me->GetMotionMaster()->MovePoint(0,11.11,11.11,11.11);
	me->SendMovementFlagUpdate();
	
	//TODO Spell try againe
	
        DoMeleeAttackIfReady();
	
	}

    }

};

CreatureAI* GetAI_boss_thorim(Creature* pCreature)
{
    return new boss_thorimAI(pCreature);
}

void AddSC_boss_thorim()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_thorim";
    newscript->GetAI = &GetAI_boss_thorim;
    newscript->RegisterSelf();

}
