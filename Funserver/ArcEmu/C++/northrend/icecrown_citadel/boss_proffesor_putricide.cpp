#include "ScriptedPch.h"
#include "instance_icecrown_citadel.h"

enum BossSpells
{
    SPELL_SLIME_PUDDLE = 70346,
    SPELL_UNSTABLE_EXPERIMENT = 71968,
    SPELL_TEAR_GAS = 71617,
    SPELL_TEAR_GAS_1 = 71618,
    SPELL_CREATE_CONCOCTION = 71621,
    SPELL_CHOKING_GAS = 71278,
    SPELL_CHOKING_GAS_EXPLODE = 71279,
    SPELL_MALLEABLE_GOO = 72296,
    SPELL_GUZZLE_POTIONS = 73122,
    SPELL_MUTATED_STRENGTH = 71603,
    SPELL_MUTATED_PLAGUE = 72672,
//
    NPC_GAS_CLOUD = 37562,
    SPELL_GASEOUS_BLOAT = 70672,
    SPELL_EXPUNGED_GAS = 70701,
    SPELL_SOUL_FEAST = 71203,
//
    NPC_VOLATILE_OOZE = 37697,
    SPELL_OOZE_ADHESIVE = 70447,
    SPELL_OOZE_ERUPTION = 70492,
//
    NPC_MUTATED_ABOMINATION = 37672,
    SPELL_MUTATED_TRANSFORMATION = 70311,
    SPELL_EAT_OOZE = 72527,
    SPELL_REGURGITATED_OOZE = 70539,
    SPELL_MUTATED_SLASH = 70542,
    SPELL_MUTATED_AURA = 70405,
};

struct boss_proffesor_putricideAI : public ScriptedAI
{
    boss_proffesor_putricideAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance *pInstance;
    
    uint32 ChokingTimer;
    uint32 MalleableTimer;
    uint32 SummonTimer;
    uint32 TearGasTimer;
    uint32 CreateConcoctionTimer;
    uint32 SlimePuddleTimer;
    uint32 GuzzleTimer;
    uint32 StrengthTimer;
    uint32 PlagueTimer;

    uint8 uiPhase;

    void Reset()
    {
	ChokingTimer = 6000;
	MalleableTimer = 9000;
	SummonTimer = 30000;
	TearGasTimer = urand(12000,14000);
	CreateConcoctionTimer = irand(4000,15000);
	SlimePuddleTimer = urand(70000, 14000);
	GuzzleTimer = urand(8000,12000);
	StrengthTimer = irand(5000,15000);
	PlagueTimer = urand(7000,20000);
    }

    void Aggro(Unit *who)
    {
        if(pInstance) pInstance->SetData(DATA_PUTRICIDE_EVENT, IN_PROGRESS);
    }

    void JustDied(Unit *killer)
    {
        if(pInstance) pInstance->SetData(DATA_PUTRICIDE_EVENT, DONE);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

        switch(uiPhase)
        {
            case 0:
		
                    if (SlimePuddleTimer <= uiDiff)
		   {
                    DoCast(SPELL_SLIME_PUDDLE);
		    SlimePuddleTimer = urand(22000,24000);
		   } else SlimePuddleTimer -= uiDiff;

                    if (SummonTimer <= uiDiff)
		    {
                        switch(urand(0,1))
                          {
                          case 0:
			      if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
			      {
                                 if (Creature* pSummon = me->SummonCreature(NPC_VOLATILE_OOZE, me->GetPositionX()+15,me->GetPositionY()-15,me->GetPositionZ(),0,TEMPSUMMON_CORPSE_DESPAWN,20000))
				     pSummon->AI()->AttackStart(pTarget);
			      }
                                 break;
                          case 1:
			      if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
			      {
                                 if (Creature* pSummon2 = me->SummonCreature(NPC_GAS_CLOUD, me->GetPositionX()+15,me->GetPositionY()-15,me->GetPositionZ(),0,TEMPSUMMON_CORPSE_DESPAWN,20000))
				 pSummon2->AI()->AttackStart(pTarget);
			      }
                                 break;
                          }
			  SummonTimer = 40000;
		    } else SummonTimer -= uiDiff;

                    break;
            case 1:
	           if (TearGasTimer <= uiDiff)
		   {
                   DoCast(SPELL_TEAR_GAS);
		   TearGasTimer = urand(14000,17000);
		   } else TearGasTimer -= uiDiff;
		   
		   if (CreateConcoctionTimer <= uiDiff)
		   {
                   DoCast(SPELL_CREATE_CONCOCTION);
		   CreateConcoctionTimer = irand(4000,15000);
		   } else CreateConcoctionTimer -= uiDiff;
                    uiPhase = 2;
                    break;
            case 2:
		   if (SlimePuddleTimer <= uiDiff)
		   {
                    DoCast(SPELL_SLIME_PUDDLE);
		    SlimePuddleTimer = urand(22000,24000);
		   } else SlimePuddleTimer -= uiDiff;

                     if (SummonTimer <= uiDiff)
		    {
                        switch(urand(0,1))
                          {
                          case 0:
			      if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
			      {
                                 if (Creature* pSummon = me->SummonCreature(NPC_VOLATILE_OOZE, me->GetPositionX()+15,me->GetPositionY()-15,me->GetPositionZ(),0,TEMPSUMMON_CORPSE_DESPAWN,20000))
				     pSummon->AI()->AttackStart(pTarget);
			      }
                                 break;
                          case 1:
			      if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
			      {
                                 if (Creature* pSummon2 = me->SummonCreature(NPC_GAS_CLOUD, me->GetPositionX()+15,me->GetPositionY()-15,me->GetPositionZ(),0,TEMPSUMMON_CORPSE_DESPAWN,20000))
				 pSummon2->AI()->AttackStart(pTarget);
			      }
                                 break;
                          }
			  SummonTimer = 40000;
		    } else SummonTimer -= uiDiff;


                   if (ChokingTimer <= uiDiff)
		    {
                    DoCast(SPELL_CHOKING_GAS);
		    ChokingTimer = urand(16000,20000);
		    } else ChokingTimer -= uiDiff;

                    if (MalleableTimer <= uiDiff)
		    {
                    DoCast(SPELL_MALLEABLE_GOO);
		    MalleableTimer = urand(12000, 15000);
		    } else MalleableTimer -= uiDiff;

                    break;
            case 3:
                    if (TearGasTimer <= uiDiff)
		   {
                   DoCast(SPELL_TEAR_GAS);
		   TearGasTimer = urand(14000,17000);
		   } else TearGasTimer -= uiDiff;
		   
		   if (GuzzleTimer <= uiDiff)
		   {
                    DoCast(SPELL_GUZZLE_POTIONS);
		    GuzzleTimer = urand(8000, 11000);
		   } else GuzzleTimer -= uiDiff;
		   
		   if (StrengthTimer <= uiDiff)
		   {
                    DoCast(SPELL_MUTATED_STRENGTH);
		    StrengthTimer = irand(6000,15000);
		   } else StrengthTimer -= uiDiff;
		   
		   if (PlagueTimer <= uiDiff)
		   {
                    DoCast(SPELL_MUTATED_PLAGUE);
		    PlagueTimer = 24000;
		   } else PlagueTimer -= uiDiff;
                    uiPhase = 4;
                    break;
            case 4:
                    if (SummonTimer <= uiDiff)
		    {
                        switch(urand(0,1))
                          {
                          case 0:
			      if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
			      {
                                 if (Creature* pSummon = me->SummonCreature(NPC_VOLATILE_OOZE, me->GetPositionX()+15,me->GetPositionY()-15,me->GetPositionZ(),0,TEMPSUMMON_CORPSE_DESPAWN,20000))
				     pSummon->AI()->AttackStart(pTarget);
			      }
                                 break;
                          case 1:
			      if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
			      {
                                 if (Creature* pSummon2 = me->SummonCreature(NPC_GAS_CLOUD, me->GetPositionX()+15,me->GetPositionY()-15,me->GetPositionZ(),0,TEMPSUMMON_CORPSE_DESPAWN,20000))
				 pSummon2->AI()->AttackStart(pTarget);
			      }
                                 break;
                          }
			  SummonTimer = 40000;
		    } else SummonTimer -= uiDiff;
		    
		    if (ChokingTimer <= uiDiff)
		    {
                    DoCast(SPELL_CHOKING_GAS);
		    ChokingTimer = urand(16000,20000);
		    } else ChokingTimer -= uiDiff;
		    
		    if (MalleableTimer <= uiDiff)
		    {
                    DoCast(SPELL_MALLEABLE_GOO);
		    MalleableTimer = urand(12000, 15000);
		    } else MalleableTimer -= uiDiff;

                    break;
        }

        if ( uiPhase ==0 && me->GetHealthPercent() < 80.0f ) uiPhase = 1;
        if ( uiPhase ==2 && me->GetHealthPercent() < 35.0f ) uiPhase = 3;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_proffesor_putricide(Creature* pCreature)
{
    return new boss_proffesor_putricideAI(pCreature);
}

struct  npc_icc_gas_cloudAI : public ScriptedAI
{
    npc_icc_gas_cloudAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    
    uint32 GaseosTimer;
    uint32 SoulTimer;

    void Reset()
    {
        me->SetInCombatWithZone();
	GaseosTimer = 3000;
	SoulTimer = 7000;
    }

    void Aggro(Unit *who)
    {
    }

    void JustReachedHome()
    {
            me->ForcedDespawn();
    }

    void UpdateAI(const uint32 uiDiff)
    {

       if (!UpdateVictim())
            return;
       
       if (GaseosTimer <= uiDiff)
       {
       DoCast(SPELL_GASEOUS_BLOAT);
       GaseosTimer = 12000;
       } else GaseosTimer -= uiDiff;
       
       if (SoulTimer <= uiDiff)
       {
        DoCast(SPELL_SOUL_FEAST);
        if (me->getVictim()->IsWithinDistInMap(me, 1.0f)
            && me->HasAura(SPELL_GASEOUS_BLOAT))
            {
               DoCast(SPELL_EXPUNGED_GAS);
               me->ForcedDespawn();
            }
	SoulTimer = 12000;
       } else SoulTimer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_icc_gas_cloud(Creature* pCreature)
{
    return new npc_icc_gas_cloudAI(pCreature);
}

struct npc_icc_volatile_oozeAI : public ScriptedAI
{
    npc_icc_volatile_oozeAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    
    uint32 SoulTimer;
    uint32 OozeTimer;

    void Reset()
    {
	SoulTimer = 8000;
	OozeTimer = 4000;
        me->SetInCombatWithZone();
    }

    void Aggro(Unit *who)
    {
    }

    void JustReachedHome()
    {
            me->ForcedDespawn();
    }

    void UpdateAI(const uint32 uiDiff)
    {

        if (!UpdateVictim())
            return;
	
	if (OozeTimer <= uiDiff)
	{
        DoCast(SPELL_OOZE_ADHESIVE);
	OozeTimer = 20000;
	} else OozeTimer -= uiDiff;
	
	if (SoulTimer <= uiDiff)
	{
        DoCast(SPELL_SOUL_FEAST);
        if (me->getVictim()->IsWithinDistInMap(me, 1.0f))
            {
               DoCast(SPELL_OOZE_ERUPTION);
               me->ForcedDespawn();
            }
	SoulTimer = 13000;
	} else SoulTimer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_icc_volatile_ooze(Creature* pCreature)
{
    return new npc_icc_volatile_oozeAI(pCreature);
}

void AddSC_boss_proffesor_putricide()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_proffesor_putricide";  //36678
    newscript->GetAI = &GetAI_boss_proffesor_putricide;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_icc_volatile_ooze";  //37697
    newscript->GetAI = &GetAI_npc_icc_volatile_ooze;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_icc_gas_cloud";  // 37562
    newscript->GetAI = &GetAI_npc_icc_gas_cloud;
    newscript->RegisterSelf();
}

