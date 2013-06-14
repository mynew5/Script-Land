#include "ScriptedPch.h"
#include "instance_icecrown_citadel.h"

enum eSpells
{
/*

http://ru.wowhead.com/?spell=70117
ето притягивание

после него сразу же каст http://ru.wowhead.com/?spell=71047

ну и ето тспелл поидее должен всех убить кроме того кто 1 в аггро листе если он ближе 25 метров

http://ru.wowhead.com/?spell=71053 ето бомбы со 2 фазы

http://ru.wowhead.com/?spell=70157 ето глыба

http://ru.wowhead.com/?spell=71665 ето дебафф на тех кто в глыбе


creature id = 36853
UPDATE `creature_template` SET `ScriptName` = 'boss_sindragosa' WHERE `entry` =36853;
Глупцы, зачем вы сюда явились! Ледяные ветра Нордскола унесут ваши души! -- агро?
Трепещите, смертные, ибо ваша жалкая магия теперь бессильна! -- какой то каст
Вы чувствуете как ледяная ладонь смерти сжимает сердце? -- притягивает к себе
Здесь ваше вторжение и окончится! Никто не уцелеет. -- кил плеера? или постановление в ледяную глыбу
А теперь почувствуйте всю мощь господина и погрузитесь в отчаяние!  -- хз
Наконец-то... свободна... -- финиш
insert into `script_texts` (`entry`,`content_default`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
# Sindragosa
(-4000001, 'need eng lang', 'Глупцы, зачем вы сюда явились! Ледяные ветра Нордскола унесут ваши души!', 0,0,0,1, 'Sindragosa-agro'),
(-4000002, 'need eng lang', 'Трепещите, смертные, ибо ваша жалкая магия теперь бессильна!', 0,0,0,1, 'Sindragosa-need info'),
(-4000003, 'need eng lang', 'Вы чувствуете как ледяная ладонь смерти сжимает сердце?', 0,0,0,1, 'Sindragosa-need info'),
(-4000004, 'need eng lang', 'Здесь ваше вторжение и окончится! Никто не уцелеет.', 0,0,0,1, 'Sindragosa-need info'),
(-4000005, 'need eng lang', 'А теперь почувствуйте всю мощь господина и погрузитесь в отчаяние!', 0,0,0,1, 'Sindragosa-need info'),
(-4000006, 'need eng lang', 'Наконец-то... свободна...', 0,0,0,1, 'Sindragosa-died');

INSERT INTO `spelldifficulty_dbc` (`id` ,`spellid0` ,`spellid1` ,`spellid2` ,`spellid3` )VALUES ('9000', '69649', '71056', '71057', '71058');
INSERT INTO `spelldifficulty_dbc` (`id`, `spellid0`, `spellid1`, `spellid2`, `spellid3` )VALUES ('9001', '70127', '72528', '72529', '72530');
INSERT INTO `spelldifficulty_dbc` (`id` ,`spellid0` ,`spellid1` ,`spellid2` ,`spellid3` )VALUES ('9002', '70123', '71047', '71048', '71049');

TO DO:
спеллы, таймеры основной фазы
реализовать бомбежку зоны.
*/
    SAY_BREATH              = -4000004, 
    SAY_ENRAGE              = -1, // ??
    SPELL_BESERK              = 26662,
    SPELL_FROST_BREATH        = 69649,  // Frost Breath							spelldifficulty_dbc 9000
	SPELL_MYSTIC_BUFFET		  = 70127,  // Mystic Buffet (phase 3 - everyone)	spelldifficulty_dbc 9001
	SPELL_UNCHAINED_MAGIC	  = 69762,
    SPELL_BLISTERING_COLD     = 70123,	 //spelldifficulty_dbc 9002
    SPELL_PERMEATING_CHILL    = 70109,
    SPELL_FROST_AURA          = 71050,
    SPELL_FROST_BOMB          = 71053, // бомба
	SPELL_HOVER				  = 11010,
	SPELL_SKLEP = 70157,
	SPELL_MARK = 70126


};
enum FlyBombEvent
{
/*GAUNTLENT EVENT SPELL, UNITS AND VISUAL EFFECTS*/
  SPELL_ICICLE_AOE_AURA        = 69426,
  SPELL_ICICLE_FALL            = 69428,
  SPELL_ICICLE_TARGET_VISUAL   = 54111, //This is not true. This is huck! I'am not find true spell.
  
  NPC_ICICLE                   = 36847,
  NPC_DAMAGE_TRIGGER           = 33174,
  MODEL_ID_ICICLE              = 28470,
  MODEL_ID_INVIS               = 11686
};

enum Creatures
{
    MOB_SKLEP                = 36980,
//    MOB_SPELL_TARGET              = 0,
};

struct boss_sindragosaAI : public ScriptedAI
{
    boss_sindragosaAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }
 
    ScriptedInstance *pInstance;

    uint32 PermeatingChill_Count;
    uint32 PermeatingChill_Timer;
    uint32 FrostBreath_Timer;
    uint32 FrostAura_Timer;
    uint32 FrostBomb_Timer;
    uint32 BlisteringCold_Timer;
    uint32 Fly_Timer;
    uint32 Beserk_Timer;
    uint32 phase;
	uint32 FlyEvent_Timer;
	uint32 Spell_Sklep_Timer;
	uint32 FlyEvent;
	uint32 FlyEvent_timer;
	uint32 FlyPhase_Timer;
	bool EventC;
	int count;
	Unit *pUnit;
		 
    void Reset()
    {
		FlyEvent_timer = 47000;
        FrostAura_Timer = 2000;
        FrostBreath_Timer = 2500;
        FrostBomb_Timer = 24000;
        BlisteringCold_Timer = 20000;
        Fly_Timer = 45000;
		FlyPhase_Timer = 100;
        PermeatingChill_Timer = 4000;
        Beserk_Timer = 0;
        phase = 1;
        PermeatingChill_Count = 0;
		Spell_Sklep_Timer = 15000;
		EventC = true;
    }

	void MarkPlayers()
	{
		Map::PlayerList const &players = pInstance->instance->GetPlayers();
		Difficulty diffic = getDifficulty();
		if(diffic==RAID_DIFFICULTY_10MAN_NORMAL || diffic==RAID_DIFFICULTY_10MAN_HEROIC)
			count = 2;
		else if(diffic==RAID_DIFFICULTY_25MAN_NORMAL || diffic==RAID_DIFFICULTY_25MAN_HEROIC)
			count = 5;
			Player* playerlist[5];
		for(int i=0; i<count; i++)
		{
			DoCast(playerlist[i], SPELL_MARK);
		}
	}
	void ApplySklep()
	{
		if (pUnit->HasAura(SPELL_MARK))
		{
			DoCast(pUnit, SPELL_SKLEP);
			if (Creature *Sklep = me->SummonCreature(MOB_SKLEP, pUnit->GetPositionX(), pUnit->GetPositionY(), pUnit->GetPositionZ(), 0, TEMPSUMMON_CORPSE_DESPAWN))
				Sklep->AI()->SetGUID(pUnit->GetGUID());
		}
	}
 
    void Aggro(Unit *who) 
    {
        if(pInstance) 
			pInstance->SetData(DATA_SINDRAGOSA_EVENT, IN_PROGRESS);
		EventC = true;
    }
 
    void JustDied(Unit *killer)
    {
        if(pInstance) 
			pInstance->SetData(DATA_SINDRAGOSA_EVENT, DONE);
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;

		if (EventC == true)
		{
            if (FrostAura_Timer < diff)
            {
                DoCast(me->getVictim(),SPELL_FROST_AURA);
                FrostAura_Timer = 5000;
            }else FrostAura_Timer -= diff;

            if (FrostBomb_Timer < diff)
            {
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target,SPELL_FROST_BOMB);

                FrostBomb_Timer = 24000;
            }else FrostBomb_Timer -= diff;

            if (BlisteringCold_Timer < diff)
            {
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target,SPELL_BLISTERING_COLD);

                BlisteringCold_Timer = 20000;
            }else BlisteringCold_Timer -= diff;

            if (PermeatingChill_Timer < diff && PermeatingChill_Count < 5)
            {
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target,SPELL_PERMEATING_CHILL);

                ++PermeatingChill_Count;
                PermeatingChill_Timer = 4000;
            }else PermeatingChill_Timer -= diff;

            if (PermeatingChill_Count == 5)
            {
                if (FrostBreath_Timer < diff)
                {
                    DoScriptText(SAY_BREATH, me);
                    DoCast(me->getVictim(),SPELL_FROST_BREATH);
                    FrostBreath_Timer = 6000;
                }else FrostBreath_Timer -= diff;
            }
            if (FlyEvent_timer < diff)
            {
				EventC = false;
                FlyEvent_timer = 45000;
            }else FlyEvent_timer -= diff;
		}
			// fly phase
	if (EventC != true)
	{
		if (FlyPhase_Timer < diff)
		{		
			switch(FlyEvent)
			{
				case 0:
					me->AttackStop();
                    me->HandleEmoteCommand(EMOTE_ONESHOT_LIFTOFF);
                    DoCast(me, SPELL_HOVER);
					FlyPhase_Timer = 100;
					FlyEvent++;
					break;
				case 1:
					me->GetMotionMaster()->MovePoint(0, 4456.437, 2484.392, 230.155);
					MarkPlayers();
					FlyPhase_Timer = 6000;
					FlyEvent++;
					break;
				case 2:
					me->StopMoving();
					ApplySklep();
					FlyPhase_Timer = 10000;
					FlyEvent++;
					break;
				case 3:
					// to do: frost bomb, spell target
					FlyPhase_Timer = 35000;
					FlyEvent++;
					break;
				case 4:
					if (Unit *pUnit = SelectTarget(SELECT_TARGET_RANDOM))
						me->GetMotionMaster()->MovePoint(0, pUnit->GetPositionX(), pUnit->GetPositionY(), pUnit->GetPositionZ());
					FlyPhase_Timer = 8000;
					FlyEvent++;				
				case 5:
                    me->HandleEmoteCommand(EMOTE_ONESHOT_LAND);
                    me->SetHover(false);
                    me->GetMotionMaster()->Clear(false);
                    EventC = true;
			}
		}
	}

	if ((me->GetHealth()*100) / me->GetMaxHealth() <= 10)
    {
        if (Beserk_Timer < diff)
         {
             DoScriptText(SAY_ENRAGE, me);
             DoCast(me,SPELL_BESERK);
             Beserk_Timer = 300000;
          }else Beserk_Timer -= diff;
     }
          DoMeleeAttackIfReady();
	}
};

struct npc_gauntlent_spellAI : public ScriptedAI
{
    npc_gauntlent_spellAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
   }

ScriptedInstance* pInstance;

uint32 FallTimer;
uint32 StepTimer;
uint32 Step;
bool StartFall;
Creature* pTarget;

    void Reset()
    { 
      StartFall = false;
      Step = 0;
      StepTimer = 100;
      me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
      FallTimer = (urand(1000, 15000));
      me->SetDisplayId(MODEL_ID_INVIS);
    }

    void AttackStart(Unit* who)
    {
        return;
    }

   void UpdateAI(const uint32 diff)
    {
      if(!pInstance) return;
    
      if(StartFall != true)
      {
        if (FallTimer < diff)
        {
                StartFall = true;
                pTarget = me->SummonCreature(NPC_DAMAGE_TRIGGER, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(),1.37f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 7000);
                me->SetDisplayId(MODEL_ID_ICICLE);
                Step = 0;
                StepTimer = 1000;
        }
        else
            FallTimer -= diff;
      }

      if(StartFall != false)
      {
         if(StepTimer < diff)
           {
             switch(Step)
               {
                case 0:
                  DoCast(me, SPELL_ICICLE_FALL);
                  if(pTarget && pTarget->isAlive())
                     pTarget->CastSpell(pTarget, SPELL_ICICLE_AOE_AURA, false);
                  StepTimer = 5500;
                  ++Step;
                  break;
                case 1:
                  StartFall = false;
                  me->SetDisplayId(MODEL_ID_INVIS);
                  FallTimer = (urand(5000, 10000));
                  StepTimer = 100;
                  ++Step;
                  break;
               }
           } else StepTimer -= diff;
        }

	  return;
    }
};

struct npc_gauntlent_spell_targetAI : public ScriptedAI
{
    npc_gauntlent_spell_targetAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
   }

uint32 DeathTimer;
ScriptedInstance* pInstance;

    void Reset()
    { 
      DeathTimer = 7000;
      me->SetLevel(80);
      me->setFaction(14);
      DoCast(me, SPELL_ICICLE_TARGET_VISUAL);
      me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
      me->SetDisplayId(MODEL_ID_INVIS);
    }

    void AttackStart(Unit* who)
    {
        return;
    }

   void UpdateAI(const uint32 diff)
    {
        if(!pInstance) return;

        if (DeathTimer < diff)
        {
                me->ForcedDespawn();
        }
        else
            DeathTimer -= diff;

    }
};
 
 
CreatureAI* GetAI_boss_sindragosa(Creature* pCreature)
{
    return new boss_sindragosaAI(pCreature);
}
CreatureAI* GetAI_npc_gauntlent_spell(Creature* pCreature)
{
    return new npc_gauntlent_spellAI(pCreature);
}

CreatureAI* GetAI_npc_gauntlent_spell_target(Creature* pCreature)
{
    return new npc_gauntlent_spell_targetAI(pCreature);
}

void AddSC_boss_sindragosa()
{
    Script *newscript;
    
    newscript = new Script;
    newscript->Name = "boss_sindragosa";
    newscript->GetAI = &GetAI_boss_sindragosa;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_gauntlent_spell";
    newscript->GetAI = &GetAI_npc_gauntlent_spell;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_gauntlent_spell_target";
    newscript->GetAI = &GetAI_npc_gauntlent_spell_target;
    newscript->RegisterSelf();
}