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
SDName: Trash Mobs
SD%Complete: 100%
SDComment:
SDCategory: The Forge of Souls
EndScriptData */

#include "ScriptedPch.h"
#include "def_forge_of_the_souls.h"

enum
{
    //Spiteful Apparition
    SPELL_SPITE_N               = 68895,
    SPELL_SPITE_H               = 70212,

    //Spectral Warden
    SPELL_VEIL_OF_SHADOWS       = 69633,
    SPELL_WAIL_OF_SOULS_N       = 69148,
    SPELL_WAIL_OF_SOULS_H       = 70210,

    //Soulguard Watchman
    SPELL_SHROUD_OF_RUNES       = 69056,
    SPELL_UNHOLY_RAGE           = 69053,

    //Soulguard Reaper
    SPELL_FROST_NOVA_N          = 69060,
    SPELL_FROST_NOVA_H          = 70209,
    SPELL_SHADOW_LANCE          = 69058,

    //Soulguard Bonecaster
    SPELL_BONE_VOLLEY_N         = 69080,
    SPELL_BONE_VOLLEY_H         = 70206,
    SPELL_RAISE_DEAD            = 69562,
    SPELL_SHIELD_OF_BONES_N     = 69069,
    SPELL_SHIELD_OF_BONES_H     = 70207,

    //Soulguard Animator
    // Raise dead 69562
    SPELL_SHADOW_BOLT_N         = 69068,
    SPELL_SHADOW_BOLT_H         = 70208,
    SPELL_SOUL_SICKNESS         = 69131,
    SPELL_SOUL_SIPHON           = 69128,

    //Soulguard Adept
    //Raise dead 69562
    //Shadow Bolt 69068/70208
    SPELL_DRAIN_LIFE_N          = 69066,
    SPELL_DRAIN_LIFE_H          = 70213,
    SPELL_SHADOW_MEND_N         = 69564,
    SPELL_SHADOW_MEND_H         = 70205,

    //Soul Horror
    SPELL_SOUL_STRIKE_N         = 69088,
    SPELL_SOUL_STRIKE_H         = 70211,

    NPC_SOULGUARD_ADEPT         = 36620
};

struct npc_soulguard_watchmanAI : public ScriptedAI
{
    npc_soulguard_watchmanAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

        Reset();
   }

ScriptedInstance* m_pInstance;
bool m_bIsRegularMode;

uint32 ShieldTimer;

    void Reset()
    {
      ShieldTimer = (urand(2000, 15000));
    }

    void Aggro(Unit *who)
    {
       DoCast(me, SPELL_UNHOLY_RAGE);
    }

   void UpdateAI(const uint32 diff)
    {
      if(!m_pInstance) return;

        if(!UpdateVictim())
            return;

        if (ShieldTimer < diff)
        {
                DoCast(me, SPELL_SHROUD_OF_RUNES);
                ShieldTimer = (urand(15000, 25000));
        }
        else
            ShieldTimer -= diff;

       DoMeleeAttackIfReady();

    return;
    }
};

struct npc_soulguard_reaperAI : public ScriptedAI
{
    npc_soulguard_reaperAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

        Reset();
   }

ScriptedInstance* m_pInstance;
bool m_bIsRegularMode;

uint32 ShadowBoltTimer;
uint32 IceNovaTimer;
uint32 AdeptHealTimer;

    void Reset()
    {
      AdeptHealTimer = (urand(2000, 4000));
      ShadowBoltTimer = (urand(2000, 20000));
      IceNovaTimer = (urand(15000, 20000));
    }

   void UpdateAI(const uint32 diff)
    {
      if(!m_pInstance) return;

        if(!UpdateVictim())
            return;

        if (ShadowBoltTimer < diff)
        {
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target, SPELL_SHADOW_LANCE);
                ShadowBoltTimer = (urand(2000, 15000));
        }
        else
            ShadowBoltTimer -= diff;

        if (IceNovaTimer < diff)
        {
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target, m_bIsRegularMode ? SPELL_FROST_NOVA_N : SPELL_FROST_NOVA_H);
                IceNovaTimer = (urand(15000, 20000));
        }
        else
            IceNovaTimer -= diff;

       if(me->GetHealth()*100 < me->GetMaxHealth()*45)
       {
        if (AdeptHealTimer < diff)
        {
                if (Creature* pAdept = GetClosestCreatureWithEntry(me, NPC_SOULGUARD_ADEPT, 25.0f))
                {
                  if(pAdept->GetHealth()*100 > pAdept->GetMaxHealth()*45)
                  {
                     pAdept->InterruptNonMeleeSpells(false);
                     pAdept->CastSpell(me, m_bIsRegularMode ? SPELL_SHADOW_MEND_N : SPELL_SHADOW_MEND_H, false);
                  }
                }

                AdeptHealTimer = (urand(9000, 20000));
        }
        else
            AdeptHealTimer -= diff;
       }


       DoMeleeAttackIfReady();

    return;
    }
};

struct npc_soulguard_adeptAI : public ScriptedAI
{
    npc_soulguard_adeptAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

        Reset();
   }

ScriptedInstance* m_pInstance;
bool m_bIsRegularMode;

bool Summon;
uint32 ShadowBoltTimer;
uint32 ShadowMendTimer;
uint32 DrainLifeTimer;
uint32 SummonTimer;
uint32 Say;

    void Reset()
    {
      Summon = false;
      ShadowBoltTimer = (urand(2000, 20000));
      ShadowMendTimer = (urand(1000, 5000));
      DrainLifeTimer = (urand(1000, 2000));
      SummonTimer = (urand(1000, 10000));
    }

   void UpdateAI(const uint32 diff)
    {
      if(!m_pInstance) return;

        if(!UpdateVictim())
            return;

        if (ShadowBoltTimer < diff)
        {
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target, m_bIsRegularMode ? SPELL_SHADOW_BOLT_N : SPELL_SHADOW_BOLT_H);
                ShadowBoltTimer = (urand(2000, 15000));
        }
        else
            ShadowBoltTimer -= diff;

       if(me->GetHealth()*100 < me->GetMaxHealth()*45)
       {
        if (ShadowMendTimer < diff)
        {
                me->InterruptNonMeleeSpells(false);
                DoCast(me, m_bIsRegularMode ? SPELL_SHADOW_MEND_N : SPELL_SHADOW_MEND_H);
                ShadowMendTimer = (urand(6000, 10000));
        }
        else
            ShadowMendTimer -= diff;
       }

       if(me->GetHealth()*100 < me->GetMaxHealth()*75)
       {
        if (DrainLifeTimer < diff)
        {
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                   DoCast(target, m_bIsRegularMode ? SPELL_DRAIN_LIFE_N : SPELL_DRAIN_LIFE_H);
                DrainLifeTimer = (urand(5000, 15000));
        }
        else
            DrainLifeTimer -= diff;
       }

       if(Summon != true)
       {
        if (SummonTimer < diff)
        {
                Summon = true;
                Say = (urand(0, 3));
                switch(Say)
                {
                  case 0:
                    me->MonsterSay("Wake up deads!",LANG_UNIVERSAL,NULL);
                    break;
                  case 1:
                    me->MonsterSay("Dead hear my call!",LANG_UNIVERSAL,NULL);
                    break;
                  case 2:
                    me->MonsterSay("I command power of Dead!",LANG_UNIVERSAL,NULL);
                    break;
                  case 3:
                    me->MonsterSay("A raise my servant!",LANG_UNIVERSAL,NULL);
                    break;
                }
                DoCast(me, SPELL_RAISE_DEAD);
        }
        else
            SummonTimer -= diff;
       }

       DoMeleeAttackIfReady();

    return;
    }
};

struct npc_soulguard_bonecasterAI : public ScriptedAI
{
    npc_soulguard_bonecasterAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

        Reset();
   }

ScriptedInstance* m_pInstance;
bool m_bIsRegularMode;

uint32 BoneTimer;
uint32 ShieldTimer;

    void Reset()
    {
      BoneTimer = (urand(2000, 20000));
      ShieldTimer = (urand(15000, 20000));
    }

   void UpdateAI(const uint32 diff)
    {
      if(!m_pInstance) return;

        if(!UpdateVictim())
            return;

        if (BoneTimer < diff)
        {
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target, m_bIsRegularMode ? SPELL_BONE_VOLLEY_N : SPELL_BONE_VOLLEY_H);
                BoneTimer = (urand(2000, 15000));
        }
        else
            BoneTimer -= diff;

        if (ShieldTimer < diff)
        {
                DoCast(me, m_bIsRegularMode ? SPELL_SHIELD_OF_BONES_N : SPELL_SHIELD_OF_BONES_H);
                ShieldTimer = (urand(15000, 20000));
        }
        else
            ShieldTimer -= diff;

       DoMeleeAttackIfReady();

    return;
    }
};

struct npc_soulguard_animatorAI : public ScriptedAI
{
    npc_soulguard_animatorAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

        Reset();
   }

ScriptedInstance* m_pInstance;
bool m_bIsRegularMode;

uint32 ShadowBoltTimer;
uint32 SoulSickTimer;
uint32 SoulSiphTimer;
uint32 AdeptHealTimer;

    void Reset()
    {
      AdeptHealTimer = (urand(1000, 6000));
      ShadowBoltTimer = (urand(2000, 20000));
      SoulSickTimer = (urand(15000, 20000));
      SoulSiphTimer = (urand(7500, 30000));
    }

   void UpdateAI(const uint32 diff)
    {
      if(!m_pInstance) return;

        if(!UpdateVictim())
            return;

        if (ShadowBoltTimer < diff)
        {
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target, m_bIsRegularMode ? SPELL_SHADOW_BOLT_N : SPELL_SHADOW_BOLT_H);
                ShadowBoltTimer = (urand(2000, 15000));
        }
        else
            ShadowBoltTimer -= diff;

        if (SoulSickTimer < diff)
        {
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target, SPELL_SOUL_SICKNESS);
                SoulSickTimer = (urand(15000, 20000));
        }
        else
            SoulSickTimer -= diff;

        if (SoulSiphTimer < diff)
        {
                DoCast(me->getVictim(), SPELL_SOUL_SIPHON);
                SoulSiphTimer = (urand(7500, 30000));
        }
        else
            SoulSiphTimer -= diff;

       if(me->GetHealth()*100 < me->GetMaxHealth()*45)
       {
        if (AdeptHealTimer < diff)
        {
                if (Creature* pAdept = GetClosestCreatureWithEntry(me, NPC_SOULGUARD_ADEPT, 25.0f))
                {
                  if(pAdept->GetHealth()*100 > pAdept->GetMaxHealth()*45)
                  {
                     pAdept->InterruptNonMeleeSpells(false);
                     pAdept->CastSpell(me, m_bIsRegularMode ? SPELL_SHADOW_MEND_N : SPELL_SHADOW_MEND_H, false);
                  }
                }

                AdeptHealTimer = (urand(9000, 20000));
        }
        else
            AdeptHealTimer -= diff;
       }

       DoMeleeAttackIfReady();

    return;
    }
};

struct npc_soul_horrorAI : public ScriptedAI
{
    npc_soul_horrorAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

        Reset();
   }

ScriptedInstance* m_pInstance;
bool m_bIsRegularMode;

uint32 SoulStrikeTimer;

    void Reset()
    {
      SoulStrikeTimer = (urand(2000, 5000));
    }

   void UpdateAI(const uint32 diff)
    {
      if(!m_pInstance) return;

        if(!UpdateVictim())
            return;

        if (SoulStrikeTimer < diff)
        {
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target, m_bIsRegularMode ? SPELL_SOUL_STRIKE_N : SPELL_SOUL_STRIKE_H);
                SoulStrikeTimer = (urand(2000, 10000));
        }
        else
            SoulStrikeTimer -= diff;

       DoMeleeAttackIfReady();

    return;
    }
};

struct npc_spectral_wardenAI : public ScriptedAI
{
    npc_spectral_wardenAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

        Reset();
   }

ScriptedInstance* m_pInstance;
bool m_bIsRegularMode;

uint32 ShadowsTimer;
uint32 SoulsTimer;

    void Reset()
    {
      ShadowsTimer = (urand(2000, 5000));
      SoulsTimer = (urand(10000, 15000));
    }

   void UpdateAI(const uint32 diff)
    {
      if(!m_pInstance) return;

        if(!UpdateVictim())
            return;

        if (ShadowsTimer < diff)
        {
                DoCast(me->getVictim(), SPELL_VEIL_OF_SHADOWS);
                ShadowsTimer = (urand(10000, 15000));
        }
        else
            ShadowsTimer -= diff;

        if (SoulsTimer < diff)
        {
                DoCast(me, m_bIsRegularMode ? SPELL_WAIL_OF_SOULS_N : SPELL_WAIL_OF_SOULS_H);
                SoulsTimer = (urand(7000, 20000));
        }
        else
            SoulsTimer -= diff;

       DoMeleeAttackIfReady();

    return;
    }
};

CreatureAI* GetAI_npc_soulguard_watchman(Creature* pCreature)
{
    return new npc_soulguard_watchmanAI(pCreature);
}

CreatureAI* GetAI_npc_soulguard_reaper(Creature* pCreature)
{
    return new npc_soulguard_reaperAI(pCreature);
}

CreatureAI* GetAI_npc_soulguard_adept(Creature* pCreature)
{
    return new npc_soulguard_adeptAI(pCreature);
}

CreatureAI* GetAI_npc_soulguard_bonecaster(Creature* pCreature)
{
    return new npc_soulguard_bonecasterAI(pCreature);
}

CreatureAI* GetAI_npc_soulguard_animator(Creature* pCreature)
{
    return new npc_soulguard_animatorAI(pCreature);
}

CreatureAI* GetAI_npc_soul_horror(Creature* pCreature)
{
    return new npc_soul_horrorAI(pCreature);
}

CreatureAI* GetAI_npc_spectral_warden(Creature* pCreature)
{
    return new npc_spectral_wardenAI(pCreature);
}

void AddSC_trash_forge_of_the_souls()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_soulguard_watchman";
    newscript->GetAI = &GetAI_npc_soulguard_watchman;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_soulguard_reaper";
    newscript->GetAI = &GetAI_npc_soulguard_reaper;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_soulguard_adept";
    newscript->GetAI = &GetAI_npc_soulguard_adept;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_soulguard_bonecaster";
    newscript->GetAI = &GetAI_npc_soulguard_bonecaster;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_soulguard_animator";
    newscript->GetAI = &GetAI_npc_soulguard_animator;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_soul_horror";
    newscript->GetAI = &GetAI_npc_soul_horror;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_npc_spectral_warden";
    newscript->GetAI = &GetAI_npc_spectral_warden;
    newscript->RegisterSelf();
}