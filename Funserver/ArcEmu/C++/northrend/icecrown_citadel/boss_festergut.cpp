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
SDName: boss_festergut
SD%Complete: 1%
SDComment:
SDCategory: Icecrown Citadel
EndScriptData */

#include "ScriptedPch.h"
#include "instance_icecrown_citadel.h"

#define SPELL_GASEOUS_BLIGHT_0  RAID_MODE(70138, 70140, 70140, 70137)
#define SPELL_GASEOUS_BLIGHT_1  RAID_MODE(69161, 70139, 70139, 70140)
#define SPELL_GASEOUS_BLIGHT_2  RAID_MODE(70468, 69161, 69161, 70139)
#define SPELL_INHALE_BLIGHT     RAID_MODE(69165, 69165, 69165, 69165)
#define SPELL_INHALED_BLIGHT    RAID_MODE(71912, 71912, 71912, 71912)
#define SPELL_PUNGENT_BLIGHT    RAID_MODE(69195, 73031, 71219, 73032)
#define SPELL_GAS_SPORE         RAID_MODE(69279, 69279, 69279, 69279)
#define SPELL_INOCULATE         RAID_MODE(72103, 72103, 72103, 72103)
#define SPELL_GASTRIC_BLOAT     RAID_MODE(72219, 72551, 72551, 72553)
#define SPELL_GASTRIC_EXPLOSION   RAID_MODE(72227, 72227, 72229, 72230)
#define SPELL_VILE_GAS          RAID_MODE(72272, 72273, 72273, 73020)

 
struct boss_festergutAI : public ScriptedAI
{
    boss_festergutAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }
 
    ScriptedInstance *pInstance;
 
    void Reset()
    {
    }
 
    void Aggro(Unit *who) 
    {
        if(pInstance) 
	pInstance->SetData(DATA_FESTERGUT_EVENT, IN_PROGRESS);
    }
 
    void JustDied(Unit *killer)
    {
        if(pInstance) 
	pInstance->SetData(DATA_FESTERGUT_EVENT, DONE);
    }
 
    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
 
        DoMeleeAttackIfReady();
    }
};
 
 
CreatureAI* GetAI_boss_festergut(Creature* pCreature)
{
    return new boss_festergutAI(pCreature);
}
 
 
void AddSC_boss_festergut()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_festergut";
    newscript->GetAI = &GetAI_boss_festergut;
    newscript->RegisterSelf();
}
