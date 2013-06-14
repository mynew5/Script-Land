/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

/* ScriptData
SDName: Areatrigger_Scripts
SD%Complete: 100
SDComment: Scripts for areatriggers
SDCategory: Areatrigger
Private_core: Quest 13315, 13351, 12741, 12003, 11633, 24851, 24849
EndScriptData */

/* ContentData
at_aldurthar_gate               5284,5285,5286,5287
at_coilfang_waterfall           4591
at_legion_teleporter            4560 Teleporter TO Invasion Point: Cataclysm
at_ravenholdt
at_the_warsong_farms
at_uncovering_the_tunnels
at_blending_in
at_stormwright_shelf          5108
EndContentData */

#include "ScriptedPch.h"

/*######
## Quest 13315/13351
######*/

enum
{
    TRIGGER_SOUTH               = 5284,
    TRIGGER_CENTRAL             = 5285,
    TRIGGER_NORTH               = 5286,
    TRIGGER_NORTHWEST           = 5287,

    NPC_SOUTH_GATE              = 32195,
    NPC_CENTRAL_GATE            = 32196,
    NPC_NORTH_GATE              = 32197,
    NPC_NORTHWEST_GATE          = 32199
};

bool AreaTrigger_at_aldurthar_gate(Player* pPlayer, const AreaTriggerEntry *pAt)
{
    switch(pAt->id)
    {
        case TRIGGER_SOUTH: pPlayer->KilledMonsterCredit(NPC_SOUTH_GATE, 0); break;
        case TRIGGER_CENTRAL: pPlayer->KilledMonsterCredit(NPC_CENTRAL_GATE, 0); break;
        case TRIGGER_NORTH: pPlayer->KilledMonsterCredit(NPC_NORTH_GATE, 0); break;
        case TRIGGER_NORTHWEST: pPlayer->KilledMonsterCredit(NPC_NORTHWEST_GATE, 0); break;
    }

    return true;
}

/*######
## at_coilfang_waterfall
######*/

enum eCoilfangGOs
{
    GO_COILFANG_WATERFALL   = 184212
};

bool AreaTrigger_at_coilfang_waterfall(Player *pPlayer, const AreaTriggerEntry *pAt)
{
    if (GameObject* pGo = GetClosestGameObjectWithEntry(pPlayer, GO_COILFANG_WATERFALL, 35.0f))
        if (pGo->getLootState() == GO_READY)
            pGo->UseDoorOrButton();

    return false;
}

/*#####
## at_legion_teleporter
#####*/

enum eLegionTeleporter
{
    SPELL_TELE_A_TO         = 37387,
    QUEST_GAINING_ACCESS_A  = 10589,

    SPELL_TELE_H_TO         = 37389,
    QUEST_GAINING_ACCESS_H  = 10604
};

bool AreaTrigger_at_legion_teleporter(Player *pPlayer, const AreaTriggerEntry *pAt)
{
    if (pPlayer->isAlive() && !pPlayer->isInCombat())
    {
        if (pPlayer->GetTeam() == ALLIANCE && pPlayer->GetQuestRewardStatus(QUEST_GAINING_ACCESS_A))
        {
            pPlayer->CastSpell(pPlayer, SPELL_TELE_A_TO, false);
            return true;
        }

        if (pPlayer->GetTeam() == HORDE && pPlayer->GetQuestRewardStatus(QUEST_GAINING_ACCESS_H))
        {
            pPlayer->CastSpell(pPlayer, SPELL_TELE_H_TO, false);
            return true;
        }

        return false;
    }
    return false;
}

enum eRavenholdt
{
    QUEST_MANOR_RAVENHOLDT  = 6681,
    NPC_RAVENHOLDT          = 13936
};

bool AreaTrigger_at_ravenholdt(Player* pPlayer, const AreaTriggerEntry* pAt)
{
    if (pPlayer->GetQuestStatus(QUEST_MANOR_RAVENHOLDT) == QUEST_STATUS_INCOMPLETE)
        pPlayer->KilledMonsterCredit(NPC_RAVENHOLDT, 0);

    return false;
}

/*######
## Quest 11686
## at_warsong_farms
######*/

enum eWarsong
{
    QUEST_THE_WARSONG_FARMS     = 11686,
    NPC_CREDIT_SLAUGHTERHOUSE   = 25672,
    NPC_CREDIT_GRAINERY         = 25669,
    NPC_CREDIT_TORP_FARM        = 25671,
    AT_SLAUGHTERHOUSE           = 4873,
    AT_GRAINERY                 = 4871,
    AT_TORP_FARM                = 4872
};

bool AreaTrigger_at_the_warsong_farms(Player* pPlayer, const AreaTriggerEntry *pAt)
{
    if (!pPlayer->isDead() && pPlayer->GetQuestStatus(QUEST_THE_WARSONG_FARMS) == QUEST_STATUS_INCOMPLETE)
    {
        switch(pAt->id)
        {
            case AT_SLAUGHTERHOUSE:
                pPlayer->KilledMonsterCredit(NPC_CREDIT_SLAUGHTERHOUSE, 0);
                break;
            case AT_GRAINERY:
                pPlayer->KilledMonsterCredit(NPC_CREDIT_GRAINERY, 0);
                break;
            case AT_TORP_FARM:
                pPlayer->KilledMonsterCredit(NPC_CREDIT_TORP_FARM, 0);
                break;
        }
    }

     return true;
 }

/*######
## Quest 12741
## at_stormwright_shelf
######*/

enum
{
    QUEST_STRENGTH_OF_THE_TEMPEST            = 12741,
    SPELL_CREATE_TRUE_POWER_OF_THE_TEMPEST   = 53067
};
 
bool AreaTrigger_at_stormwright_shelf(Player* pPlayer, const AreaTriggerEntry *pAt)
{
    if (!pPlayer->isDead() && pPlayer->GetQuestStatus(QUEST_STRENGTH_OF_THE_TEMPEST) == QUEST_STATUS_INCOMPLETE)
        pPlayer->CastSpell(pPlayer,SPELL_CREATE_TRUE_POWER_OF_THE_TEMPEST,false);

    return true;
}

/*######
## at_uncovering_the_tunnels
######*/

enum
{
    QUEST_UNCOVERING_THE_TUNNELS = 12003,
    NPC_CREDIT_NORTH_BUILDING    = 26468,
    NPC_CREDIT_SOUTH_BUILDING    = 26469,
    NPC_CREDIT_EAST_BUILDING     = 26470,
    AT_SOUTH_BUILDING            = 4948,
    AT_NORTH_BUILDING            = 4946,
    AT_EAST_BUILDING             = 4947
};

bool AreaTrigger_at_uncovering_the_tunnels(Player* pPlayer, const AreaTriggerEntry *pAt)
{
    if (!pPlayer->isDead() && pPlayer->GetQuestStatus(QUEST_UNCOVERING_THE_TUNNELS) == QUEST_STATUS_INCOMPLETE)
    {
        switch(pAt->id)
        {
            case AT_SOUTH_BUILDING:
                pPlayer->KilledMonsterCredit(NPC_CREDIT_SOUTH_BUILDING, 0);
                break;
            case AT_NORTH_BUILDING:
                pPlayer->KilledMonsterCredit(NPC_CREDIT_NORTH_BUILDING, 0);
                break;
            case AT_EAST_BUILDING:
                pPlayer->KilledMonsterCredit(NPC_CREDIT_EAST_BUILDING, 0);
                break;
        }
    }

     return true;
 }

/*######
## at_blending_in
######*/

enum
 {
    QUEST_BLENDING_IN           = 11633,
    SPELL_SPIRE_OF_DECAY_CREDIT = 45627,
    SPELL_SPIRE_OF_BLOOD_CREDIT = 45628,
    SPELL_SPIRE_OF_PAIN_CREDIT  = 45629,
    AURA_SHROUD_OF_THE_SCOURGE  = 45614,
    AT_SPIRE_OF_DECAY           = 4857,
    AT_SPIRE_OF_BLOOD           = 4858,
    AT_SPIRE_OF_PAIN            = 4860
};
 
bool AreaTrigger_at_blending_in(Player* pPlayer, const AreaTriggerEntry *pAt)
{
    if (pPlayer->HasAura(AURA_SHROUD_OF_THE_SCOURGE) && !pPlayer->isDead() && pPlayer->GetQuestStatus(QUEST_BLENDING_IN) == QUEST_STATUS_INCOMPLETE)
    {
        switch(pAt->id)
        {
            case AT_SPIRE_OF_DECAY:
                pPlayer->CastSpell(pPlayer,SPELL_SPIRE_OF_DECAY_CREDIT,false);
                break;
            case AT_SPIRE_OF_BLOOD:
                pPlayer->CastSpell(pPlayer,SPELL_SPIRE_OF_BLOOD_CREDIT,false);
                break;
            case AT_SPIRE_OF_PAIN:
                pPlayer->CastSpell(pPlayer,SPELL_SPIRE_OF_PAIN_CREDIT,false);
                break;
        }
    }

     return true;
 }

/*######
## Quest 24849
######*/

enum
{
    QUEST_HOT_ON_THE_TRAIL_ALI           = 24849,
    NPC_CREDIT_STORMWIND_COUNTING_HOUSE  = 45672,
    NPC_CREDIT_STORMWIND_AUCTION_HOUSE   = 45669,
    NPC_CREDIT_STORMWIND_BARBER_SHOP     = 45671
};

bool AreaTrigger_at_stormwind_counting_house(Player* pPlayer, const AreaTriggerEntry *pAt)
{
       if (!pPlayer->isDead() && pPlayer->GetQuestStatus(QUEST_HOT_ON_THE_TRAIL_ALI) == QUEST_STATUS_INCOMPLETE)
               pPlayer->KilledMonsterCredit(NPC_CREDIT_STORMWIND_COUNTING_HOUSE, 0);

    return true;
}

bool AreaTrigger_at_stomrwind_auction_house(Player* pPlayer, const AreaTriggerEntry *pAt)
{
    if (!pPlayer->isDead() && pPlayer->GetQuestStatus(QUEST_HOT_ON_THE_TRAIL_ALI) == QUEST_STATUS_INCOMPLETE)
        pPlayer->KilledMonsterCredit(NPC_CREDIT_STORMWIND_AUCTION_HOUSE, 0);

    return true;
}

bool AreaTrigger_at_stormwind_barber_shop(Player* pPlayer, const AreaTriggerEntry *pAt)
{
    if (!pPlayer->isDead() && pPlayer->GetQuestStatus(QUEST_HOT_ON_THE_TRAIL_ALI) == QUEST_STATUS_INCOMPLETE)
        pPlayer->KilledMonsterCredit(NPC_CREDIT_STORMWIND_BARBER_SHOP, 0);

    return true;
}

/*######
## Quest 24851
######*/

enum
{
    QUEST_HOT_ON_THE_TRAIL_HORDE        = 24851,
    NPC_CREDIT_ORGRIMMAR_BANK           = 45673,
    NPC_CREDIT_ORGRIMMAR_AUCTION_HOUSE  = 45674,
    NPC_CREDIT_ORGRIMMAR_BARBER_SHOP    = 45675
};

bool AreaTrigger_at_orgrimmar_bank(Player* pPlayer, const AreaTriggerEntry *pAt)
{
       if (!pPlayer->isDead() && pPlayer->GetQuestStatus(QUEST_HOT_ON_THE_TRAIL_HORDE) == QUEST_STATUS_INCOMPLETE)
               pPlayer->KilledMonsterCredit(NPC_CREDIT_ORGRIMMAR_BANK, 0);

    return true;
}

bool AreaTrigger_at_orgrimmar_auction_house(Player* pPlayer, const AreaTriggerEntry *pAt)
{
    if (!pPlayer->isDead() && pPlayer->GetQuestStatus(QUEST_HOT_ON_THE_TRAIL_HORDE) == QUEST_STATUS_INCOMPLETE)
        pPlayer->KilledMonsterCredit(NPC_CREDIT_ORGRIMMAR_AUCTION_HOUSE, 0);

    return true;
}

bool AreaTrigger_at_orgrimmar_barber_shop(Player* pPlayer, const AreaTriggerEntry *pAt)
{
    if (!pPlayer->isDead() && pPlayer->GetQuestStatus(QUEST_HOT_ON_THE_TRAIL_HORDE) == QUEST_STATUS_INCOMPLETE)
        pPlayer->KilledMonsterCredit(NPC_CREDIT_ORGRIMMAR_BARBER_SHOP, 0);

    return true;
}

/*#####
## at_last_rites
#####*/

enum eAtLastRites
{
    QUEST_LAST_RITES                          = 12019
};

bool AreaTrigger_at_last_rites(Player* pPlayer, const AreaTriggerEntry* pAt)
{
    if (pPlayer->GetQuestStatus(QUEST_LAST_RITES) != QUEST_STATUS_INCOMPLETE)
        return false;

    WorldLocation pPosition;

    switch(pAt->id)
    {   
        case 5332:
        case 5338:
            pPosition = WorldLocation(571,3733.68,3563.25,290.812,3.665192);
            break;
        case 5334:
            pPosition = WorldLocation(571,3802.38,3585.95,49.5765,0);
            break;
        case 5340:
            pPosition = WorldLocation(571,3687.91,3577.28,473.342,0);
            break;
        default:
            return false;
    }

    pPlayer->TeleportTo(pPosition);

    return false;
}

void AddSC_areatrigger_scripts()
{
    Script *newscript;

     newscript = new Script;
    newscript->Name = "at_aldurthar_gate";
    newscript->pAreaTrigger = &AreaTrigger_at_aldurthar_gate;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_coilfang_waterfall";
    newscript->pAreaTrigger = &AreaTrigger_at_coilfang_waterfall;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_legion_teleporter";
    newscript->pAreaTrigger = &AreaTrigger_at_legion_teleporter;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_ravenholdt";
    newscript->pAreaTrigger = &AreaTrigger_at_ravenholdt;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_the_warsong_farms";
    newscript->pAreaTrigger = &AreaTrigger_at_the_warsong_farms;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_stormwright_shelf";
    newscript->pAreaTrigger = &AreaTrigger_at_stormwright_shelf;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_uncovering_the_tunnels";
    newscript->pAreaTrigger = &AreaTrigger_at_uncovering_the_tunnels;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_blending_in";
    newscript->pAreaTrigger = &AreaTrigger_at_blending_in;
    newscript->RegisterSelf();
    newscript = new Script;
    newscript->Name = "at_stormwind_counting_house";
    newscript->pAreaTrigger = &AreaTrigger_at_stormwind_counting_house;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_stormwind_auction_house";
    newscript->pAreaTrigger = &AreaTrigger_at_stomrwind_auction_house;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_stormwind_barber_shop";
    newscript->pAreaTrigger = &AreaTrigger_at_stormwind_barber_shop;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_orgrimmar_bank";
    newscript->pAreaTrigger = &AreaTrigger_at_orgrimmar_bank;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_orgrimmar_auction_house";
    newscript->pAreaTrigger = &AreaTrigger_at_orgrimmar_auction_house;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_orgrimmar_barber_shop";
    newscript->pAreaTrigger = &AreaTrigger_at_orgrimmar_barber_shop;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_last_rites";
    newscript->pAreaTrigger = &AreaTrigger_at_last_rites;
    newscript->RegisterSelf();
}
