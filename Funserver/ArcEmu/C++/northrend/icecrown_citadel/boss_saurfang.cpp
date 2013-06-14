#include "ScriptedPch.h"
#include "instance_icecrown_citadel.h"


enum
{
// TODO need Spell Dificalty
// NPC_SAURFANF = 37813
SPELL_BLOOD_LINK		= 72178,
SPELL_BLOOD_POWER		= 72371,
SPELL_MARK_FALLEN_CHAMPION	= 72256,
SPELL_MARK_FALLEN_CHAMPION_H	= 72278,  // health
SPELL_FRENZY			= 72737,
SPELL_BOILING_BLOOD		= 72441,
SPELL_BLOOD_HEALTH		= 72447,  // health
SPELL_BLOOD_NOVA		= 72378, // 72380
SPELL_BLOOD_NOVA_P		= 72379,
SPELL_BLOOD_NOVA_EFECT		= 72439,
SPELL_RUNE_BLOOD		= 72410,
SPELL_RUNE_BLOOD_EFFECT		= 72409,
SPELL_CALL_BLOOD1		= 72173,
SPELL_CALL_BLOOD2		= 72172,
SPELL_CALL_BLOOD3		= 72356,
SPELL_CALL_BLOOD4		= 72357,
SPELL_CALL_BLOOD5		= 72358,
SPELL_REGISTANT_SKIN		= 72723,
NPC_BLOOD_BEAST			= 38508,
// HEROIK
SPELL_SCENT_BLLOD		= 72769,
SAY_INTROS			= -1000000 // TODO ned scipt text's
};

struct boss_deathbringer_saurfangAI : public BossAI
{
    boss_deathbringer_saurfangAI(Creature* pCreature) : BossAI(pCreature, DATA_SAURFANG_EVENT)
    {
        pInstance = pCreature->GetInstanceData(); 
	
	me->ApplyModUInt32Value(UNIT_MOD_RUNE,100, true);
	me->SetMaxPower(POWER_MANA,100);
	me->SetPower(POWER_MANA,0);
	me->CastSpell(me,SPELL_BLOOD_LINK,true);
	me->CastSpell(me,SPELL_BLOOD_POWER,true);
    }
    
    ScriptedInstance* pInstance;
      
    uint32 BloodLinkTimer;
    uint32 BloodPowerTimer;
    uint32 MakrFallenChampionTimer;
    uint32 FrenzyTimer;
    uint32 BoilingBloodTimer;
    uint32 BloodNovaTimer;
    uint32 RuneBloodTimer;
    uint32 CallBloodBeastTimer;
    uint32 RegistantSkinTimer;
    uint64 AggroTargetGUID;
    uint32 AggroTimer;
    uint32 m_uiPower;
    bool Intro;
    bool Done;
    
    void Reset()
    {
    BloodLinkTimer = 10000;
    BloodPowerTimer = 14000;
    MakrFallenChampionTimer = 1000; //cast for gethelthpower 100%
    FrenzyTimer = 5000;
    BoilingBloodTimer = 22000;
    BloodNovaTimer = 12000;
    RuneBloodTimer = 7000;
    CallBloodBeastTimer = 32000;
    RegistantSkinTimer = 1000;
    AggroTargetGUID = 0;
    AggroTimer = 15000;
    Intro = false;
    Done = false;
    
   /* float val = 0.0f;
    val  = GetModifierValue(UNIT_MOD_RUNIC_POWER, 100);
    val *= GetModifierValue(UNIT_MOD_RUNIC_POWER, 100);
    val += GetModifierValue(UNIT_MOD_RUNIC_POWER, 100);
    val *= GetModifierValue(UNIT_MOD_RUNIC_POWER, 100);
    SetStatFloatValue(UNIT_MOD_RUNIC_POWER,val);
    me->GetPowerTypeByAuraGroup(UNIT_MOD_RUNIC_POWER);
   */
    }
    
    void Aggro(Unit* pWho)
    {
        if (pInstance)
            pInstance->SetData(DATA_SAURFANG_EVENT, IN_PROGRESS);
    }
    
    
    void MoveInLineOfSight(Unit* pWho)
    {
    	if (!Intro && pWho->GetTypeId() == TYPEID_PLAYER && pWho->isTargetableForAttack() && me->IsHostileTo(pWho) && pWho->isInAccessiblePlaceFor(me))
        {
            if (me->IsWithinDistInMap(pWho, VISIBLE_RANGE) && me->IsWithinLOSInMap(pWho))
            {
		me->GetMotionMaster()->Clear(false);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                DoScriptText(SAY_INTROS, me);
                me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_TALK);
                AggroTargetGUID = pWho->GetGUID();
                Intro = true;
	    }
	if (Done)
            ScriptedAI::MoveInLineOfSight(pWho);
	}
    }
    
    
    void UpdateAI(const uint32 diff)
    {
    
    if (Intro && !Done)
        {
            if (AggroTimer <= diff)
            {
	    me->SetReactState(REACT_PASSIVE);
	    me->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE);
	    me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_NONE);
	    Done = true;

	    if (AggroTargetGUID)
                {
		DoZoneInCombat();
		}
	    else
                {
                    EnterEvadeMode();
                    return;
                }
	    } else AggroTimer -= diff;
	}
	
    if (!UpdateVictim() && !Done)
            return;
	 if (Done)
	   {   
		me->SetReactState(REACT_AGGRESSIVE);
		me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
		me->RemoveFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE);
	   }
	
	Map::PlayerList const& players = me->GetMap()->GetPlayers();
            if (me->GetMap()->IsDungeon() && !players.isEmpty())
            {
                for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                {
                    Player* pPlayer = itr->getSource();
                    if (pPlayer)
                    {
		      if (pPlayer->getDeathState() == JUST_DIED && pPlayer->HasAura(SPELL_MARK_FALLEN_CHAMPION))
		      {
			me->CastSpell(me,SPELL_MARK_FALLEN_CHAMPION_H,false);
		      }
		      
		      if(pPlayer->HasAura(SPELL_MARK_FALLEN_CHAMPION))
		         {
		           m_uiPower = me->GetPower(POWER_MANA);
			   m_uiPower = m_uiPower + 3;
			   me->SetPower(POWER_MANA,m_uiPower);
			   me->CastSpell(me,SPELL_BLOOD_POWER,false);
			 }
		      
		      if (pPlayer->HasAura(SPELL_BLOOD_NOVA))
		        {
			   m_uiPower = me->GetPower(POWER_MANA);
			   m_uiPower = m_uiPower + 1;
			   me->SetPower(POWER_MANA,m_uiPower);
			   me->CastSpell(me,SPELL_BLOOD_POWER,false);
			}
			break;
                    }
                }
            }
    
    if (BloodNovaTimer <= diff)
      {
         if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
	 {
            DoCast(pTarget,SPELL_BLOOD_NOVA);
	    pTarget->CastSpell(pTarget,SPELL_BLOOD_NOVA_P,true);
	    DoCast(pTarget,SPELL_BLOOD_NOVA_EFECT);
	    BloodNovaTimer = 12000;
	 }
      } else BloodNovaTimer -= diff;
      
    if (MakrFallenChampionTimer <= diff)
    {
      m_uiPower = me->GetPower(POWER_MANA);
        
	if(m_uiPower == 100)
	 {
	   if(Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
	      DoCast(pTarget,SPELL_MARK_FALLEN_CHAMPION);
	 }
	MakrFallenChampionTimer = 3000;
    } else MakrFallenChampionTimer -= diff;
    
    if (CallBloodBeastTimer <= diff)
    {
	DoCast(53708);
	 DoCast(SPELL_CALL_BLOOD1);
	 DoCast(SPELL_CALL_BLOOD2);
	 DoCast(SPELL_CALL_BLOOD3);
	 DoCast(SPELL_CALL_BLOOD4);
	 DoCast(SPELL_CALL_BLOOD5);
       CallBloodBeastTimer = 40000;
    } else CallBloodBeastTimer -= diff;
    
    if (FrenzyTimer <= diff)
    { 
       if ((me->GetHealth()*100 / me->GetMaxHealth()) < 30)
           me->CastSpell(me,SPELL_FRENZY, true);
	   FrenzyTimer = 0;
    } else FrenzyTimer -= diff;
      
    if (RuneBloodTimer <= diff)
     {
            DoCast(SPELL_RUNE_BLOOD);
	    DoCast(SPELL_RUNE_BLOOD_EFFECT);
	    me->CastSpell(me,SPELL_BLOOD_HEALTH,false);
	RuneBloodTimer = 20000;
     } else RuneBloodTimer -= diff;
     
    if (BoilingBloodTimer <= diff)
      {
         if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
	   DoCast(pTarget,SPELL_BOILING_BLOOD);
	 BoilingBloodTimer = 25000;
      } else BoilingBloodTimer -= diff;
     
     DoMeleeAttackIfReady();
    }
    
    void KilledUnit(Unit *victim)
    {
    }
    
    void JustDied(Unit *victim)
    {
        if (pInstance)
            pInstance->SetData(DATA_SAURFANG_EVENT, DONE);
    }
};

CreatureAI* GetAI_boss_deathbringer_saurfang(Creature* pCreature)
{
    return new boss_deathbringer_saurfangAI (pCreature);
}

void AddSC_boss_deathbringer_saurfang()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="boss_deathbringer_saurfang";
    newscript->GetAI = &GetAI_boss_deathbringer_saurfang;
    newscript->RegisterSelf();
}