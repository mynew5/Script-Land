/* Copyright (C) 2006 - 2010 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
SDName: boss_bronjahm
SD%Complete: 100%
SDComment:
SDCategory: The Forge of Souls
EndScriptData */

#include "ScriptedPch.h"
#include "def_forge_of_the_souls.h"

enum
{
   /*Speech*/
   SAY_BRONJAHM_AGGRO                    = -1594514,
   SAY_BRONJAHM_CORUPT                   = -1594515,
   SAY_BRONJAHM_DEATH                    = -1594516,
   SAY_BRONJAHM_SLAY_01                  = -1594517,
   SAY_BRONJAHM_SLAY_02                  = -1594518,
   SAY_BRONJAHM_SOUL_STORM               = -1594519,

   /*Spells And Visual Effects*/
   SPELL_CORRUPT_SOUL                    = 68839,
   SPELL_MAGICSBANE_N                    = 68793,
   SPELL_MAGICSBANE_H                    = 69050,
   SPELL_SHADOW_BOLT_N                   = 70043,
   SPELL_SHADOW_BOLT_H                   = 72960,
   SPELL_FEAR                            = 68950,
   SPELL_SOULSTORM                       = 68872,
   SPELL_TELEPORT                        = 68988,
   SPELL_SOULSTORM_EFFECT                = 68925,

   /*Others*/
   TELEPORT_X                            = 5297,
   TELEPORT_Y                            = 2506,
   TELEPORT_Z                            = 686,
   
   /*Music*/
   Battle01                              = 6077,
   Battle02                              = 6078,
   Battle03                              = 6079 
};

struct boss_bronjahmAI : public ScriptedAI
{
    boss_bronjahmAI(Creature *pCreature) : ScriptedAI(pCreature)
   {

        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

        Reset();
   }

ScriptedInstance* m_pInstance;
bool m_bIsRegularMode;

uint32 BattleMusicTimer;
uint32 CoruptSoulTimer;
uint32 ShadowBoltTimer;
uint32 MagicBaneTimer;
uint32 FearTimer;
uint32 SoulTimer;
uint32 Phase;
uint32 StepTimer;
uint32 Step;
uint32 Phase3SpellTimer;
uint32 RandSpell;
uint32 Music;
Unit* CoruptSoul;
bool Damage;
uint32 SoulStormTimer;


    void Reset()
    {
      SoulStormTimer = 0;
      SoulTimer = 0;
      Damage = false;
      Music = 0;
      BattleMusicTimer = 0;
      Step = 0;
      StepTimer = 100;
      Phase = 1;
      Phase3SpellTimer = 0;
      CoruptSoulTimer = 15000;
      ShadowBoltTimer = 2000;
      MagicBaneTimer = 10000;
      FearTimer = 5000;
      DoCast(me, SPELL_SOULSTORM_EFFECT);
    }

    void Aggro(Unit *who)
    {
       Music = (urand(0, 2));
       switch(Music)
       {
         case 0:
            me->PlayDirectSound(Battle01);
            BattleMusicTimer = 48000;
            break;
         case 1:
            me->PlayDirectSound(Battle02);
            BattleMusicTimer = 27000;
            break;
         case 2:
            me->PlayDirectSound(Battle03);
            BattleMusicTimer = 36000;
            break; 
        }
            
       DoScriptText(SAY_BRONJAHM_AGGRO, me);
       if(me->HasAura(SPELL_SOULSTORM_EFFECT))
          me->RemoveAurasDueToSpell(SPELL_SOULSTORM_EFFECT);
    }

    void AttackStart(Unit* who)
    {
        if (Phase > 1)
            return;

        if (!who || who == me)
            return;

        ScriptedAI::AttackStart(who);
    }

    void KilledUnit(Unit* victim)
    {
        switch (rand()%2)
        {
            case 0: DoScriptText(SAY_BRONJAHM_SLAY_01, me); break;
            case 1: DoScriptText(SAY_BRONJAHM_SLAY_02, me); break;
        }
    }

    void JustDied(Unit* pKiller)
    {
      DoScriptText(SAY_BRONJAHM_DEATH, me);
    }

   void UpdateAI(const uint32 diff)
    {
        if(!UpdateVictim())
            return;

      if(Phase == 1)
      {
        if (CoruptSoulTimer < diff)
        {
                me->InterruptNonMeleeSpells(false);
                if (CoruptSoul = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(CoruptSoul, SPELL_CORRUPT_SOUL);
                Damage = true;
                SoulTimer = 3500;
                DoScriptText(SAY_BRONJAHM_CORUPT, me);

            CoruptSoulTimer = 25000;
        }
        else
            CoruptSoulTimer -= diff;

        if(Damage != false)
        {
          if (SoulTimer < diff)
          {
            if(CoruptSoul && CoruptSoul->HasAura(SPELL_CORRUPT_SOUL))
               me->DealDamage(CoruptSoul, CoruptSoul->GetMaxHealth(),NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            Damage = false;
          }
          else
              SoulTimer -= diff;
        }

        if (ShadowBoltTimer < diff)
        {
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target, m_bIsRegularMode ? SPELL_SHADOW_BOLT_N : SPELL_SHADOW_BOLT_H);

            ShadowBoltTimer = (urand(5000, 15000));
        }
        else
            ShadowBoltTimer -= diff;

        if (MagicBaneTimer < diff)
        {
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target, m_bIsRegularMode ? SPELL_MAGICSBANE_N : SPELL_MAGICSBANE_H);

            MagicBaneTimer = (urand(10000, 15000));
        }
        else
            MagicBaneTimer -= diff;

        if (Phase == 1 && me->GetHealth()*100 < me->GetMaxHealth()*30)
            Phase = 2;

        DoMeleeAttackIfReady();
      }

      if(Phase == 2)
      {
         if(StepTimer < diff)
           {
             switch(Step)
               {
                case 0: 
                  me->InterruptNonMeleeSpells(false);
                  me->StopMoving();
                  me->GetMotionMaster()->Clear(false);
                  me->GetMotionMaster()->MoveIdle();
                  me->CastSpell(me, SPELL_TELEPORT, false);
                  StepTimer = 1000;
                  ++Step;
                  break;
                case 1:
                  me->GetMap()->CreatureRelocation(me, TELEPORT_X, TELEPORT_Y, TELEPORT_Z, 0);
                  me->SendMonsterMove(TELEPORT_X, TELEPORT_Y, TELEPORT_Z/*, SPLINETYPE_NORMAL, SPLINEFLAG_NONE*/, 0);
                  StepTimer = 1000;
                  ++Step;
                  break;
                case 2:
                  DoScriptText(SAY_BRONJAHM_SOUL_STORM, me);
                  me->CastSpell(me, SPELL_SOULSTORM, false);
                  StepTimer = 3000;
                  ++Step;
                  break;
                case 3:
                  Phase = 3;
                  Phase3SpellTimer = 2000;
                  SoulStormTimer = 20000;
                  me->SetHealth(me->GetHealth() + me->GetHealth());
                  ++Step;
                  break;
               }
            } else StepTimer -= diff;
         }

      if(Phase == 3)
      {
        if (Phase3SpellTimer < diff)
        {
           RandSpell = (urand(0, 1));
           switch(RandSpell)
           {
              case 0:
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target, SPELL_FEAR);
                break;
              case 1:
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target, SPELL_SHADOW_BOLT_N);
                break;
           }
           Phase3SpellTimer = 2000;
        }
        else
            Phase3SpellTimer -= diff;

        if (SoulStormTimer < diff)
        {
                  me->InterruptNonMeleeSpells(false);
                  DoScriptText(SAY_BRONJAHM_SOUL_STORM, me);
                  me->CastSpell(me, SPELL_SOULSTORM, false);
                  SoulStormTimer = 20000;
        }
        else
            SoulStormTimer -= diff;
      }

        if (BattleMusicTimer < diff && me->isAlive())
        {
           switch(Music)
           {
             case 0:
                me->PlayDirectSound(Battle01);
                BattleMusicTimer = 49000;
                break;
             case 1:
                me->PlayDirectSound(Battle02);
                BattleMusicTimer = 28000;
                break;
             case 2:
                me->PlayDirectSound(Battle03);
                BattleMusicTimer = 37000;
                break; 
            }
        }
        else
            BattleMusicTimer -= diff;

         return;
    }
};

CreatureAI* GetAI_boss_bronjahm(Creature* pCreature)
{
    return new boss_bronjahmAI(pCreature);
}

void AddSC_boss_bronjahm()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_bronjahm";
    newscript->GetAI = &GetAI_boss_bronjahm;
    newscript->RegisterSelf();
}