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
SDName: boss_devourer_of_souls
SD%Complete: 100%
SDComment:
SDCategory: The Forge of Souls
EndScriptData */

#include "ScriptedPch.h"
#include "def_forge_of_the_souls.h"

enum
{
   /*Speach*/
   SAY_DEVOURER_AGGRO_MALE_01      = -1594520,
   SAY_DEVOURER_SLAY_01_MALE_01    = -1594522,
   SAY_DEVOURER_SLAY_02_MALE_01    = -1594523,
   SAY_DEVOURER_DEATH_MALE_01      = -1594525,
   SAY_DEVOURER_SUMMON_MALE_01     = -1594521,
   SAY_DEVOURER_DARK_MALE_01       = -1594524,

   /*Spell And Visual Effects*/
   SPELL_PHANTOM_BLAST_N         = 68982,
   SPELL_PHANTOM_BLAST_H         = 70322,
   SPELL_MIRRORED_SOUL           = 69051,
   SPELL_WELL_OF_SOULS           = 68820,
   SPELL_UNLEASHED_SOULS         = 68939,
   SPELL_WAILING_SOULS           = 68873,   //68912
   SPELL_WELL_OF_SOULS_VIS       = 68854,
   SPELL_WELL_OF_SOUL_DM_N       = 68863,
   SPELL_WELL_OF_SOUL_DM_H       = 70323,

   /*Units*/
   NPC_WELL_OF_SOUL              = 36536,
   NPC_UNLEASHED_SOUL            = 36595,
   
   /*Others*/
   MODEL_FAT                     = 30149,
   MODEL_WOMAN                   = 30150,

   /*Music*/
   Battle01                              = 6077,
   Battle02                              = 6078,
   Battle03                              = 6079 
};

struct boss_devourer_of_soulsAI : public ScriptedAI
{
    boss_devourer_of_soulsAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

        Reset();
   }

ScriptedInstance* m_pInstance;
bool m_bIsRegularMode;

uint32 BattleMusicTimer;
uint32 PhantomBlastTimer;
uint32 SummonTimer;
uint32 WellOfSoulTimer;
uint32 MirroredTimer;
uint32 SoulBeamTimer;
uint32 Step;
uint32 StepTimer;
bool Summon;

    void Reset()
    {
      DespawnAllSummons();
      Summon = false;
      Step = 0;
      StepTimer = 100;
      PhantomBlastTimer = 5000;
      WellOfSoulTimer = 10000;
      SummonTimer = 20000;
      MirroredTimer = 28000;
      SoulBeamTimer = 33000;
      me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    }

    void Aggro(Unit *who)
    {
       me->PlayDirectSound(Battle01);
       BattleMusicTimer = 48000;
            
       DoScriptText(SAY_DEVOURER_AGGRO_MALE_01, me);
       me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    }

    void AttackStart(Unit* who)
    {
        if (!m_pInstance) return;

        if(m_pInstance->GetData(TYPE_INTRO) != DONE) return;

        if (!who || who == me)
            return;

        ScriptedAI::AttackStart(who);
    }

    void DespawnAllSummons()
    {
        std::list<Creature*> m_pSouls;
        GetCreatureListWithEntryInGrid(m_pSouls, me, NPC_UNLEASHED_SOUL, DEFAULT_VISIBILITY_INSTANCE);

        if (!m_pSouls.empty())
            for(std::list<Creature*>::iterator itr = m_pSouls.begin(); itr != m_pSouls.end(); ++itr)
            {
                (*itr)->ForcedDespawn();
            }

        std::list<Creature*> m_pWells;
        GetCreatureListWithEntryInGrid(m_pWells, me, NPC_WELL_OF_SOUL, DEFAULT_VISIBILITY_INSTANCE);

        if (!m_pWells.empty())
            for(std::list<Creature*>::iterator iter = m_pWells.begin(); iter != m_pWells.end(); ++iter)
            {
                (*iter)->ForcedDespawn();
            }
    }

    void DamageTaken(Unit* pDoneBy, uint32 &uiDamage)
    {
      if(!m_pInstance) return;

      Map *map = me->GetMap();
      if (map->IsDungeon())
      {
        Map::PlayerList const &PlayerList = map->GetPlayers();

        if (PlayerList.isEmpty())
        return;

        for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
        {
          if (i->getSource()->isAlive() && i->getSource()->HasAura(SPELL_MIRRORED_SOUL))
              me->DealDamage(i->getSource(), uiDamage*45,NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        }
      }
      return;
    }

    void JustDied(Unit* pKiller)
    {
            DespawnAllSummons();
            DoScriptText(SAY_DEVOURER_DEATH_MALE_01, me);
            if (m_pInstance)
                m_pInstance->SetData(TYPE_DEVOURER, DONE);
    }

    void KilledUnit(Unit* victim)
    {
        switch (rand()%2)
        {
            case 0: DoScriptText(SAY_DEVOURER_SLAY_01_MALE_01, me); break;
            case 1: DoScriptText(SAY_DEVOURER_SLAY_02_MALE_01, me); break;
        }
    }

   void UpdateAI(const uint32 diff)
    {
        if(!UpdateVictim())
            return;

      if(Summon != true)
      {
        if (PhantomBlastTimer < diff)
        {
                if (Unit* Target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(Target, m_bIsRegularMode ? SPELL_PHANTOM_BLAST_N : SPELL_PHANTOM_BLAST_H);
                PhantomBlastTimer = 8000;
        }
        else
            PhantomBlastTimer -= diff;

        if (WellOfSoulTimer < diff)
        {
                if (Unit* Target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(Target, SPELL_WELL_OF_SOULS);
                WellOfSoulTimer = 12000;
        }
        else
            WellOfSoulTimer -= diff;

        if (SummonTimer < diff)
        {
                me->InterruptNonMeleeSpells(false);
                DoScriptText(SAY_DEVOURER_SUMMON_MALE_01, me);
                DoCast(me, SPELL_UNLEASHED_SOULS);
                SummonTimer = 50000;
                Summon = true;
        }
        else
            SummonTimer -= diff;

        if (MirroredTimer < diff)
        {
                DoScriptText(SAY_DEVOURER_DARK_MALE_01, me);
                if (Unit* Target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(Target, SPELL_MIRRORED_SOUL);
                MirroredTimer = 25000;
        }
        else
            MirroredTimer -= diff;

        if (SoulBeamTimer < diff)
        {
                DoCast(me->getVictim(), SPELL_WAILING_SOULS);
                SoulBeamTimer = (urand(35000, 45000));
        }
        else
            SoulBeamTimer -= diff;

      }
      
      if(Summon == true)
      {
        if (StepTimer < diff)
        {
           switch(Step)
           {
             case 0:
               StepTimer = 900;
               ++Step;
               break;
             case 1:
               me->SetDisplayId(MODEL_FAT); //this is huck, because this spell (SPELL_UNLEASHED_SOULS) morphed boss into PIG :D
               StepTimer = 2000;
               ++Step;
               break;
             case 2:
               Summon = false;
               Step = 0;
               StepTimer = 100;
               break;
           }
        } else StepTimer -= diff;

      }

         DoMeleeAttackIfReady();

        if (BattleMusicTimer < diff && me->isAlive())
        {
            me->PlayDirectSound(Battle01);
            BattleMusicTimer = 49000;
        }
        else
            BattleMusicTimer -= diff;

      return;
    }
};

struct npc_well_of_soulAI : public ScriptedAI
{
    npc_well_of_soulAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();


        Reset();
   }

ScriptedInstance* m_pInstance;
bool m_bIsRegularMode;

uint32 DamageTimer;
uint32 DeathTimer;

    void Reset()
    { 
      me->SetLevel(80);
      me->setFaction(14);
      me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
      DeathTimer = 900000;
      DoCast(me, SPELL_WELL_OF_SOULS_VIS);
      DamageTimer = 1000;
    }

    void AttackStart(Unit* who)
    {
        return;
    }

   void UpdateAI(const uint32 diff)
    {
      if(!m_pInstance) return;

        if (DeathTimer < diff)
        {
                me->ForcedDespawn();
        }
        else
            DeathTimer -= diff;

        if (DamageTimer < diff)
        {
                DoCast(me, m_bIsRegularMode ? SPELL_WELL_OF_SOUL_DM_N : SPELL_WELL_OF_SOUL_DM_H);
                DamageTimer = 1000;
        }
        else
            DamageTimer -= diff;

    return;
    }
};

struct npc_unleashed_soulAI : public ScriptedAI
{
    npc_unleashed_soulAI(Creature *pCreature) : ScriptedAI(pCreature)
   {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

        Reset();
   }

ScriptedInstance* m_pInstance;

    void Reset()
    { 
        if (m_pInstance)
        {
            if (Creature* pDevourer = ((Creature*)Unit::GetUnit((*me), m_pInstance->GetData64(DATA_DEVOURER))))
                if (pDevourer->isAlive())
                    AttackStart(pDevourer->getVictim());
        }

    }

   void UpdateAI(const uint32 diff)
    {
      if(!m_pInstance) return;

        if(!UpdateVictim())
            return;

       DoMeleeAttackIfReady();

    return;
    }
};

CreatureAI* GetAI_boss_devourer_of_souls(Creature* pCreature)
{
    return new boss_devourer_of_soulsAI(pCreature);
}

CreatureAI* GetAI_npc_well_of_soul(Creature* pCreature)
{
    return new npc_well_of_soulAI(pCreature);
}

CreatureAI* GetAI_npc_unleashed_soul(Creature* pCreature)
{
    return new npc_unleashed_soulAI(pCreature);
}

void AddSC_boss_devourer_of_souls()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_devourer_of_souls";
    newscript->GetAI = &GetAI_boss_devourer_of_souls;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_well_of_soul";
    newscript->GetAI = &GetAI_npc_well_of_soul;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_unleashed_soul";
    newscript->GetAI = &GetAI_npc_unleashed_soul;
    newscript->RegisterSelf();
}
