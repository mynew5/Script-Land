/*#####
## for Private_core
#####*/

#include "ScriptedPch.h"

/*#####
##Blighted Last Rites
#####*/

enum
{
// trow kill credit
QUEST_BLIGHTED_LAST_RITES	= 12206,
NPC_SCARLET_ONSLAGHT_PRISONER = 27349,
NPC_KILL_CREDIT = 27253,
SPELL_FLASK_OF_BLIGHT	= 48188,
// distanse kill kredit
QUEST_UNCOVERING_THE_TUNNELS = 12003,
NPC_KILL_26468	= 26468,
NPC_KILL_26469	= 26469,
NPC_KILL_26470	= 26470,

};
/*#####
## Q 12206 Blighted Last Rites
#####*/

struct npc_scarlet_onslaght_prisonerAI : public ScriptedAI
{
    npc_scarlet_onslaght_prisonerAI(Creature* c) : ScriptedAI(c) {}
    
      uint64 casterGuid;
      uint32 uiTimer;
      bool Phase;

void Reset()
    {
      Phase = false;
      uiTimer = 1000;
      casterGuid = 0;
    }
    
void SpellHit(Unit *caster, const SpellEntry *spell)
    {
    if (spell->Id == SPELL_FLASK_OF_BLIGHT && caster->GetTypeId() == TYPEID_PLAYER && 
        CAST_PLR(caster)->GetQuestStatus(QUEST_BLIGHTED_LAST_RITES) == QUEST_STATUS_INCOMPLETE)
	 {
	     casterGuid = caster->GetGUID();
	     Phase = true;
	 }
    }
    
void UpdateAI(const uint32 diff) 
    {
      if (!Phase)
          return;
    
	if (Phase && uiTimer <= diff)
	  {
	  if(Player *caster = Unit::GetPlayer(casterGuid))
	     caster->KilledMonsterCredit(NPC_KILL_CREDIT,0);
	  uiTimer = 1000;
	  } else uiTimer -= diff;
    }
};

/*#####
## Q 12659 Scalps
#####*/

enum
{
QUETS_SCALPS = 12659,
NPC_HERBDRAKKAR_STRIKER = 28465,
SPELL_AHUNAES_KNIFE = 52083,
SPELL_AHUNAES_KNIFE_TRIGER = 52090,
};

struct npc_hebdrakkartrollsAI : public ScriptedAI
{
    npc_hebdrakkartrollsAI(Creature* c) : ScriptedAI(c) {}
    
      uint64 casterGuid;
      uint32 uiTimer;
      bool Phase;

void Reset()
    {
      Phase = false;
      uiTimer = 1000;
      casterGuid = 0;
    }
    
void SpellHit(Unit *caster, const SpellEntry *spell)
    {
    if (spell->Id == SPELL_AHUNAES_KNIFE_TRIGER && caster->GetTypeId() == TYPEID_PLAYER && 
        CAST_PLR(caster)->GetQuestStatus(QUETS_SCALPS) == QUEST_STATUS_INCOMPLETE)
	 {
	     casterGuid = caster->GetGUID();
	     Phase = true;
	 }
    }
    
void JustDied(Unit* Killer)
    {
    if (Phase)
    {
        if(Player *caster = Unit::GetPlayer(casterGuid))
	  {
	      caster->CastSpell(me,SPELL_AHUNAES_KNIFE,true);
	      CAST_PLR(caster)->KilledMonsterCredit(NPC_HERBDRAKKAR_STRIKER, 0);
	      me->RemoveFromWorld();
	    }
	}
    }
    
};

/*#####
## Q 12659 Scalps
#####*/

enum
{
QUETS_TAILS_UP = 13549,
NPC_FROST_LEOPARD = 29327,
NPC_ICEPAW_BEAR = 29319,
SPELL_TOKINIS_BLOWGUN = 62105,
};

struct npc_frost_icepawAI : public ScriptedAI
{
    npc_frost_icepawAI(Creature* c) : ScriptedAI(c) {}
    
      uint64 casterGuid;
      uint32 uiTimer;
      bool Phase;

void Reset()
    {
      Phase = false;
      uiTimer = 15000;
      casterGuid = 0;
    }
    
void SpellHit(Unit *caster, const SpellEntry *spell)
    {
    if (spell->Id == SPELL_TOKINIS_BLOWGUN && caster->GetTypeId() == TYPEID_PLAYER && 
        CAST_PLR(caster)->GetQuestStatus(QUETS_TAILS_UP) == QUEST_STATUS_INCOMPLETE)
	 {
	     casterGuid = caster->GetGUID();
	     Phase = true;
	 }
    }
    
void UpdateAI(const uint32 diff) 
    {
    
       if (Phase && uiTimer <= diff)
         {
	  switch (me->GetEntry())
	    {
	    case NPC_FROST_LEOPARD:
	      if(Player *caster = Unit::GetPlayer(casterGuid))
	         caster->KilledMonsterCredit(NPC_FROST_LEOPARD,0);
		uiTimer = 15000;
		break;
	    case NPC_ICEPAW_BEAR:
	      if(Player *caster = Unit::GetPlayer(casterGuid))
		caster->KilledMonsterCredit(NPC_ICEPAW_BEAR,0);
		uiTimer = 15000;
		break;
	    }
	  } else uiTimer -= diff;
        DoMeleeAttackIfReady();
    }
};

/*#######
### for Quest - distanse kill kredit
#######*/

/*#####
## Q 12203
#####

struct npc_investigate_buildingAI : public ScriptedAI
{
    npc_investigate_buildingAI(Creature *c) : ScriptedAI(c) {}

    void MoveInLineOfSight(Unit *who)
    {
        ScriptedAI::MoveInLineOfSight(who);

    if (who->GetTypeId() == TYPEID_PLAYER && CAST_PLR(who)->GetQuestStatus(QUEST_UNCOVERING_THE_TUNNELS) == QUEST_STATUS_INCOMPLETE)
	 {
      if (me->IsWithinDistInMap(who, 2.0f))
       {
	    switch (me->GetEntry())
		{
		case 26468:
		  {
		    CAST_PLR(who)->KilledMonsterCredit(NPC_KILL_26468,0);
		    me->ForcedDespawn();
		  }
		case 26469:
		  {
		    CAST_PLR(who)->KilledMonsterCredit(NPC_KILL_26469,0);
		    me->ForcedDespawn();
		  }
		case 26470:
		  {
		    CAST_PLR(who)->KilledMonsterCredit(NPC_KILL_26470,0);
		    me->ForcedDespawn();
		  }
		}
	}
}
}

};*/

enum SG
{
    NPC_DRAKOS = 26175,
    QUEST_DRAKOS1 = 11919,
    QUEST_DRAKOS2 = 11940,
    NPC_RELOZAZ = 26117
};

struct npc_relozazAI : public ScriptedAI
{
    npc_relozazAI(Creature *c) : ScriptedAI(c) {}

    void MoveInLineOfSight(Unit *who)
    {
        ScriptedAI::MoveInLineOfSight(who);

        if (who->GetEntry() == NPC_DRAKOS && me->IsWithinDistInMap(who, 10.0f))
        {
            if (Unit *owner = who->GetOwner())
            {
                if (owner->GetTypeId() == TYPEID_PLAYER)
                {
                    if ((CAST_PLR(owner)->GetQuestStatus(QUEST_DRAKOS1) == QUEST_STATUS_INCOMPLETE) || (CAST_PLR(owner)->GetQuestStatus(QUEST_DRAKOS2) == QUEST_STATUS_INCOMPLETE))
                    {
                        CAST_PLR(owner)->KilledMonsterCredit(NPC_DRAKOS, me->GetGUID());
                    }
                    CAST_CRE(who)->ForcedDespawn();

                    if ((CAST_PLR(owner)->GetQuestStatus(QUEST_DRAKOS1) == QUEST_STATUS_COMPLETE) && (CAST_PLR(owner)->GetQuestStatus(QUEST_DRAKOS2) == QUEST_STATUS_INCOMPLETE))
                        owner->RemoveAllMinionsByEntry(NPC_DRAKOS);
                }
            }
        }
    }
};

enum
{
QUETS_IT_WAS_THE_ORCS_HONEST = 11670,
NPC_MAGMOTHREGAR = 25430,
NPC_KREDIT_MAGMOTHREGAR = 25581,
SPELL_PLANT_WARSONG_BANER = 45742
};

struct npc_magmothregarAI : public ScriptedAI
{
    npc_magmothregarAI(Creature* c) : ScriptedAI(c) {}
    
      uint64 casterGuid;
      uint32 uiTimer;
      bool Phase;

void Reset()
    {
      Phase = false;
      uiTimer = 1000;
      casterGuid = 0;
    }
    
void SpellHit(Unit *caster, const SpellEntry *spell)
    {
    if (spell->Id == SPELL_PLANT_WARSONG_BANER && caster->GetTypeId() == TYPEID_PLAYER && 
        CAST_PLR(caster)->GetQuestStatus(QUETS_IT_WAS_THE_ORCS_HONEST) == QUEST_STATUS_INCOMPLETE)
	 {
	     casterGuid = caster->GetGUID();
	     Phase = true;
	 }
    }
    
void JustDied(Unit* Killer)
    {
    if (Phase)
    {
        if(Player *caster = Unit::GetPlayer(casterGuid))
	  {
	      caster->CastSpell(me,SPELL_PLANT_WARSONG_BANER,true);
	      CAST_PLR(caster)->KilledMonsterCredit(NPC_KREDIT_MAGMOTHREGAR, 0);
	      me->RemoveFromWorld();
	    }
	}
    }
    
};

enum
{
QUETS_MASTER_AND_SERVANT = 11730,
NPC_SENTRY_BOT = 25753,
NPC_KREDIT_SENRY_BOT = 25815,
SPELL_THE_ULTRASONIC_SCREWDRIVER = 46023
};

struct npc_sentry_botAI : public ScriptedAI
{
    npc_sentry_botAI(Creature* c) : ScriptedAI(c) {}
    
      uint64 casterGuid;
      uint32 uiTimer;
      bool Phase;

void Reset()
    {
      Phase = false;
      uiTimer = 1000;
      casterGuid = 0;
    }
    
void SpellHit(Unit *caster, const SpellEntry *spell)
    {
    if (spell->Id == SPELL_THE_ULTRASONIC_SCREWDRIVER && caster->GetTypeId() == TYPEID_PLAYER && 
        CAST_PLR(caster)->GetQuestStatus(QUETS_MASTER_AND_SERVANT) == QUEST_STATUS_INCOMPLETE)
	 {
	     casterGuid = caster->GetGUID();
	     Phase = true;
	 }
    }
    
void JustDied(Unit* Killer)
    {
    if (Phase)
    {
        if(Player *caster = Unit::GetPlayer(casterGuid))
	  {
	      caster->CastSpell(me,SPELL_THE_ULTRASONIC_SCREWDRIVER,true);
	      CAST_PLR(caster)->KilledMonsterCredit(NPC_KREDIT_SENRY_BOT, 0);
	      me->RemoveFromWorld();
	    }
	}
    }
    
};

CreatureAI* GetAI_npc_sentry_bot(Creature* pCreature)
{
    return new npc_sentry_botAI(pCreature);
}

CreatureAI* GetAI_npc_magmothregar(Creature* pCreature)
{
    return new npc_magmothregarAI(pCreature);
}

CreatureAI* GetAI_npc_relozaz(Creature* pCreature)
{
    return new npc_relozazAI(pCreature);
}

CreatureAI* GetAI_npc_frost_icepaw(Creature* pCreature)
{
    return new npc_frost_icepawAI(pCreature);
}

CreatureAI* GetAI_npc_hebdrakkartrolls(Creature* pCreature)
{
    return new npc_hebdrakkartrollsAI(pCreature);
}

CreatureAI* GetAI_npc_scarlet_onslaght_prisoner(Creature* pCreature)
{
    return new npc_scarlet_onslaght_prisonerAI(pCreature);
}

/*CreatureAI* GetAI_npc_investigate_building(Creature* pCreature)
{
    return new npc_investigate_buildingAI(pCreature);
}*/

void AddSC_credit()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_scarlet_onslaght_prisoner";
    newscript->GetAI = &GetAI_npc_scarlet_onslaght_prisoner;
    newscript->RegisterSelf();
    
    /*newscript = new Script;
    newscript->Name = "npc_investigate_building";
    newscript->GetAI = &GetAI_npc_investigate_building;
    newscript->RegisterSelf();*/
    
    newscript = new Script;
    newscript->Name = "npc_hebdrakkartrolls";
    newscript->GetAI = &GetAI_npc_hebdrakkartrolls;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_frost_icepaw";
    newscript->GetAI = &GetAI_npc_frost_icepaw;
    newscript->RegisterSelf();
    
     newscript = new Script;
    newscript->Name = "npc_relozaz";
    newscript->GetAI = &GetAI_npc_relozaz;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_magmothregar";
    newscript->GetAI = &GetAI_npc_magmothregar;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_sentry_bot";
    newscript->GetAI = &GetAI_npc_sentry_bot;
    newscript->RegisterSelf();
}
