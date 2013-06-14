/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>>
* Copyright (C) 2006 - 20010 TrinityCore <http://www.trinitycore.org/>
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
SDName: GO_Scripts
SD%Complete: 100
SDComment: Quest support: 4285,4287,4288(crystal pylons), 4296, 6481, 10990, 10991, 10992, Field_Repair_Bot->Teaches spell 22704. Barov_journal->Teaches spell 26089,12843,12982, 2936. Soulwell
Private_core_332: 10097
SDCategory: Game Objects
EndScriptData */

/* ContentData
go_cat_figurine (the "trap" version of GO, two different exist)
go_northern_crystal_pylon
go_eastern_crystal_pylon
go_western_crystal_pylon
go_barov_journal
go_ethereum_prison
go_ethereum_stasis
go_sacred_fire_of_life
go_shrine_of_the_birds
go_southfury_moonstone
go_field_repair_bot_74A
go_orb_of_command
go_resonite_cask
go_tablet_of_madness
go_tablet_of_the_seven
go_tele_to_dalaran_crystal
go_tele_to_violet_stand
go_rusty_cage
go_scourge_cage
go_jotunheim_cage
go_table_theka
go_soulwell
EndContentData */

#include "ScriptedPch.h"

/*######
## go_cat_figurine
######*/

enum eCatFigurine
{
    SPELL_SUMMON_GHOST_SABER    = 5968,
};

bool GOHello_go_cat_figurine(Player *pPlayer, GameObject *pGO)
{
    pPlayer->CastSpell(pPlayer,SPELL_SUMMON_GHOST_SABER,true);
    return false;
}

/*######
## go_crystal_pylons (3x)
######*/

bool GOHello_go_northern_crystal_pylon(Player *pPlayer, GameObject *pGO)
{
    if (pGO->GetGoType() == GAMEOBJECT_TYPE_QUESTGIVER)
    {
        pPlayer->PrepareQuestMenu(pGO->GetGUID());
        pPlayer->SendPreparedQuest(pGO->GetGUID());
    }

    if (pPlayer->GetQuestStatus(4285) == QUEST_STATUS_INCOMPLETE)
        pPlayer->AreaExploredOrEventHappens(4285);

    return true;
}

bool GOHello_go_eastern_crystal_pylon(Player *pPlayer, GameObject *pGO)
{
    if (pGO->GetGoType() == GAMEOBJECT_TYPE_QUESTGIVER)
    {
        pPlayer->PrepareQuestMenu(pGO->GetGUID());
        pPlayer->SendPreparedQuest(pGO->GetGUID());
    }

    if (pPlayer->GetQuestStatus(4287) == QUEST_STATUS_INCOMPLETE)
        pPlayer->AreaExploredOrEventHappens(4287);

    return true;
}

bool GOHello_go_western_crystal_pylon(Player *pPlayer, GameObject *pGO)
{
    if (pGO->GetGoType() == GAMEOBJECT_TYPE_QUESTGIVER)
    {
        pPlayer->PrepareQuestMenu(pGO->GetGUID());
        pPlayer->SendPreparedQuest(pGO->GetGUID());
    }

    if (pPlayer->GetQuestStatus(4288) == QUEST_STATUS_INCOMPLETE)
        pPlayer->AreaExploredOrEventHappens(4288);

    return true;
}

/*######
## go_barov_journal
######*/

bool GOHello_go_barov_journal(Player *pPlayer, GameObject *pGO)
{
    if (pPlayer->HasSkill(SKILL_TAILORING) && pPlayer->GetBaseSkillValue(SKILL_TAILORING) >= 280 && !pPlayer->HasSpell(26086))
    {
        pPlayer->CastSpell(pPlayer,26095,false);
    }
    return true;
}

/*######
## go_field_repair_bot_74A
######*/

bool GOHello_go_field_repair_bot_74A(Player *pPlayer, GameObject *pGO)
{
    if (pPlayer->HasSkill(SKILL_ENGINERING) && pPlayer->GetBaseSkillValue(SKILL_ENGINERING) >= 300 && !pPlayer->HasSpell(22704))
    {
        pPlayer->CastSpell(pPlayer,22864,false);
    }
    return true;
}

/*######
## go_gilded_brazier
######*/

enum eGildedBrazier
{
    NPC_STILLBLADE  = 17716,
};

bool GOHello_go_gilded_brazier(Player *pPlayer, GameObject *pGO)
{
    if (pGO->GetGoType() == GAMEOBJECT_TYPE_GOOBER)
        if (Creature* pCreature = pPlayer->SummonCreature(NPC_STILLBLADE, 8087.632, -7542.740, 151.568, 0.122, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000))
            pCreature->AI()->AttackStart(pPlayer);

    return true;
}

/*######
## go_orb_of_command
######*/

bool GOHello_go_orb_of_command(Player *pPlayer, GameObject *pGO)
{
    if (pPlayer->GetQuestRewardStatus(7761))
        pPlayer->CastSpell(pPlayer,23460,true);

    return true;
}

/*######
## go_tablet_of_madness
######*/

bool GOHello_go_tablet_of_madness(Player *pPlayer, GameObject *pGO)
{
    if (pPlayer->HasSkill(SKILL_ALCHEMY) && pPlayer->GetSkillValue(SKILL_ALCHEMY) >= 300 && !pPlayer->HasSpell(24266))
    {
        pPlayer->CastSpell(pPlayer,24267,false);
    }
    return true;
}

/*######
## go_tablet_of_the_seven
######*/

//TODO: use gossip option ("Transcript the Tablet") instead, if Trinity adds support.
bool GOHello_go_tablet_of_the_seven(Player *pPlayer, GameObject *pGO)
{
    if (pGO->GetGoType() != GAMEOBJECT_TYPE_QUESTGIVER)
        return true;

    if (pPlayer->GetQuestStatus(4296) == QUEST_STATUS_INCOMPLETE)
        pPlayer->CastSpell(pPlayer,15065,false);

    return true;
}

/*#####
## go_jump_a_tron
######*/

bool GOHello_go_jump_a_tron(Player *pPlayer, GameObject *pGO)
{
    if (pPlayer->GetQuestStatus(10111) == QUEST_STATUS_INCOMPLETE)
     pPlayer->CastSpell(pPlayer,33382,true);

    return true;
}

/*######
## go_ethereum_prison
######*/

enum eEthereumPrison
{
    SPELL_REP_LC        = 39456,
    SPELL_REP_SHAT      = 39457,
    SPELL_REP_CE        = 39460,
    SPELL_REP_CON       = 39474,
    SPELL_REP_KT        = 39475,
    SPELL_REP_SPOR      = 39476
};

const uint32 NpcPrisonEntry[] =
{
    22810, 22811, 22812, 22813, 22814, 22815,               //good guys
    20783, 20784, 20785, 20786, 20788, 20789, 20790         //bad guys
};

bool GOHello_go_ethereum_prison(Player *pPlayer, GameObject *pGO)
{
    int Random = rand() % (sizeof(NpcPrisonEntry) / sizeof(uint32));

    if (Creature* pCreature = pPlayer->SummonCreature(NpcPrisonEntry[Random],
        pGO->GetPositionX(), pGO->GetPositionY(), pGO->GetPositionZ(), pGO->GetAngle(pPlayer),
        TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
    {
        if (!pCreature->IsHostileTo(pPlayer))
        {
            uint32 Spell = 0;

            if (FactionTemplateEntry const* pFaction = pCreature->getFactionTemplateEntry())
            {
                switch(pFaction->faction)
                {
                    case 1011: Spell = SPELL_REP_LC; break;
                    case 935: Spell = SPELL_REP_SHAT; break;
                    case 942: Spell = SPELL_REP_CE; break;
                    case 933: Spell = SPELL_REP_CON; break;
                    case 989: Spell = SPELL_REP_KT; break;
                    case 970: Spell = SPELL_REP_SPOR; break;
                }

                if (Spell)
                    pCreature->CastSpell(pPlayer, Spell, false);
                else
                    error_log("TSCR: go_ethereum_prison summoned Creature (entry %u) but faction (%u) are not expected by script.", pCreature->GetEntry(), pCreature->getFaction());
            }
        }
    }

    return false;
}

/*######
## go_ethereum_stasis
######*/

const uint32 NpcStasisEntry[] =
{
    22825, 20888, 22827, 22826, 22828
};

bool GOHello_go_ethereum_stasis(Player *pPlayer, GameObject *pGO)
{
    int Random = rand() % (sizeof(NpcStasisEntry) / sizeof(uint32));

    pPlayer->SummonCreature(NpcStasisEntry[Random],
        pGO->GetPositionX(), pGO->GetPositionY(), pGO->GetPositionZ(), pGO->GetAngle(pPlayer),
        TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);

    return false;
}

/*######
## go_resonite_cask
######*/

enum eResoniteCask
{
    NPC_GOGGEROC    = 11920
};

bool GOHello_go_resonite_cask(Player *pPlayer, GameObject *pGO)
{
    if (pGO->GetGoType() == GAMEOBJECT_TYPE_GOOBER)
        pGO->SummonCreature(NPC_GOGGEROC, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 300000);

    return false;
}

/*######
## go_sacred_fire_of_life
######*/

#define NPC_ARIKARA  10882

bool GOHello_go_sacred_fire_of_life(Player *pPlayer, GameObject *pGO)
{
    if (pGO->GetGoType() == GAMEOBJECT_TYPE_GOOBER)
        pPlayer->SummonCreature(NPC_ARIKARA, -5008.338, -2118.894, 83.657, 0.874, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);

    return true;
}

/*######
## go_shrine_of_the_birds
######*/

enum eShrineOfTheBirds
{
    NPC_HAWK_GUARD      = 22992,
    NPC_EAGLE_GUARD     = 22993,
    NPC_FALCON_GUARD    = 22994,
    GO_SHRINE_HAWK      = 185551,
    GO_SHRINE_EAGLE     = 185547,
    GO_SHRINE_FALCON    = 185553
};

bool GOHello_go_shrine_of_the_birds(Player *pPlayer, GameObject *pGO)
{
    uint32 BirdEntry = 0;

    float fX, fY, fZ;
    pGO->GetClosePoint(fX, fY, fZ, pGO->GetObjectSize(), INTERACTION_DISTANCE);

    switch(pGO->GetEntry())
    {
        case GO_SHRINE_HAWK:
            BirdEntry = NPC_HAWK_GUARD;
            break;
        case GO_SHRINE_EAGLE:
            BirdEntry = NPC_EAGLE_GUARD;
            break;
        case GO_SHRINE_FALCON:
            BirdEntry = NPC_FALCON_GUARD;
            break;
    }

    if (BirdEntry)
        pPlayer->SummonCreature(BirdEntry, fX, fY, fZ, pGO->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);

    return false;
}

/*######
## go_southfury_moonstone
######*/

enum eSouthfury
{
    NPC_RIZZLE                  = 23002,
    SPELL_BLACKJACK             = 39865, //stuns player
    SPELL_SUMMON_RIZZLE         = 39866

};

bool GOHello_go_southfury_moonstone(Player *pPlayer, GameObject *pGO)
{
    //implicitTarget=48 not implemented as of writing this code, and manual summon may be just ok for our purpose
    //pPlayer->CastSpell(pPlayer,SPELL_SUMMON_RIZZLE,false);

    if (Creature* pCreature = pPlayer->SummonCreature(NPC_RIZZLE, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_DEAD_DESPAWN, 0))
        pCreature->CastSpell(pPlayer,SPELL_BLACKJACK,false);

    return false;
}

/*######
## go_tele_to_dalaran_crystal
######*/

enum eDalaranCrystal
{
    QUEST_LEARN_LEAVE_RETURN    = 12790,
    QUEST_TELE_CRYSTAL_FLAG     = 12845
};

#define GO_TELE_TO_DALARAN_CRYSTAL_FAILED   "This teleport crystal cannot be used until the teleport crystal in Dalaran has been used at least once."

bool GOHello_go_tele_to_dalaran_crystal(Player *pPlayer, GameObject *pGO)
{
    if (pPlayer->GetQuestRewardStatus(QUEST_TELE_CRYSTAL_FLAG))
    {
        return false;
    }
    else
        pPlayer->GetSession()->SendNotification(GO_TELE_TO_DALARAN_CRYSTAL_FAILED);

    return true;
}

/*######
## go_tele_to_violet_stand
######*/

bool GOHello_go_tele_to_violet_stand(Player *pPlayer, GameObject *pGO)
{
    if (pPlayer->GetQuestRewardStatus(QUEST_LEARN_LEAVE_RETURN) || pPlayer->GetQuestStatus(QUEST_LEARN_LEAVE_RETURN) == QUEST_STATUS_INCOMPLETE)
        return false;

    return true;
}

/*######
## go_fel_crystalforge
######*/

#define GOSSIP_FEL_CRYSTALFORGE_TEXT 31000
#define GOSSIP_FEL_CRYSTALFORGE_ITEM_TEXT_RETURN 31001
#define GOSSIP_FEL_CRYSTALFORGE_ITEM_1 "Purchase 1 Unstable Flask of the Beast for the cost of 10 Apexis Shards"
#define GOSSIP_FEL_CRYSTALFORGE_ITEM_5 "Purchase 5 Unstable Flask of the Beast for the cost of 50 Apexis Shards"
#define GOSSIP_FEL_CRYSTALFORGE_ITEM_RETURN "Use the fel crystalforge to make another purchase."

enum eFelCrystalforge
{
    SPELL_CREATE_1_FLASK_OF_BEAST   = 40964,
    SPELL_CREATE_5_FLASK_OF_BEAST   = 40965,
};

bool GOHello_go_fel_crystalforge(Player *pPlayer, GameObject *pGO)
{
    if (pGO->GetGoType() == GAMEOBJECT_TYPE_QUESTGIVER) /* != GAMEOBJECT_TYPE_QUESTGIVER) */
        pPlayer->PrepareQuestMenu(pGO->GetGUID()); /* return true*/

    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_FEL_CRYSTALFORGE_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_FEL_CRYSTALFORGE_ITEM_5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(GOSSIP_FEL_CRYSTALFORGE_TEXT, pGO->GetGUID());

    return true;
}

bool GOSelect_go_fel_crystalforge(Player *pPlayer, GameObject *pGO, uint32 uiSender, uint32 uiAction)
{
    switch(uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF:
            pPlayer->CastSpell(pPlayer,SPELL_CREATE_1_FLASK_OF_BEAST,false);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_FEL_CRYSTALFORGE_ITEM_RETURN, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_FEL_CRYSTALFORGE_ITEM_TEXT_RETURN, pGO->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF + 1:
            pPlayer->CastSpell(pPlayer,SPELL_CREATE_5_FLASK_OF_BEAST,false);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_FEL_CRYSTALFORGE_ITEM_RETURN, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_FEL_CRYSTALFORGE_ITEM_TEXT_RETURN, pGO->GetGUID());
            break;
    case GOSSIP_ACTION_INFO_DEF + 2:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_FEL_CRYSTALFORGE_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_FEL_CRYSTALFORGE_ITEM_5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_FEL_CRYSTALFORGE_TEXT, pGO->GetGUID());
            break;
    }
    return true;
}

/*######
## go_bashir_crystalforge
######*/

enum eBashirCrystalforge
{
    SPELL_CREATE_1_FLASK_OF_SORCERER   = 40968,
    SPELL_CREATE_5_FLASK_OF_SORCERER   = 40970,
};

bool GOHello_go_bashir_crystalforge(Player *pPlayer, GameObject *pGO)
{
    pPlayer->CastSpell(pPlayer,SPELL_CREATE_1_FLASK_OF_SORCERER,false);
    return false;
}

/*######
## matrix_punchograph
######*/

enum eMatrixPunchograph
{
    ITEM_WHITE_PUNCH_CARD = 9279,
    ITEM_YELLOW_PUNCH_CARD = 9280,
    ITEM_BLUE_PUNCH_CARD = 9282,
    ITEM_RED_PUNCH_CARD = 9281,
    ITEM_PRISMATIC_PUNCH_CARD = 9316,
    SPELL_YELLOW_PUNCH_CARD = 11512,
    SPELL_BLUE_PUNCH_CARD = 11525,
    SPELL_RED_PUNCH_CARD = 11528,
    SPELL_PRISMATIC_PUNCH_CARD = 11545,
    MATRIX_PUNCHOGRAPH_3005_A = 142345,
    MATRIX_PUNCHOGRAPH_3005_B = 142475,
    MATRIX_PUNCHOGRAPH_3005_C = 142476,
    MATRIX_PUNCHOGRAPH_3005_D = 142696,
};

bool GOHello_go_matrix_punchograph(Player *pPlayer, GameObject *pGO)
{
    switch(pGO->GetEntry())
    {
        case MATRIX_PUNCHOGRAPH_3005_A:
            if (pPlayer->HasItemCount(ITEM_WHITE_PUNCH_CARD, 1))
            {
                pPlayer->DestroyItemCount(ITEM_WHITE_PUNCH_CARD, 1, true);
                pPlayer->CastSpell(pPlayer,SPELL_YELLOW_PUNCH_CARD,true);
            }
            break;
        case MATRIX_PUNCHOGRAPH_3005_B:
            if (pPlayer->HasItemCount(ITEM_YELLOW_PUNCH_CARD, 1))
            {
                pPlayer->DestroyItemCount(ITEM_YELLOW_PUNCH_CARD, 1, true);
                pPlayer->CastSpell(pPlayer,SPELL_BLUE_PUNCH_CARD,true);
            }
            break;
        case MATRIX_PUNCHOGRAPH_3005_C:
            if (pPlayer->HasItemCount(ITEM_BLUE_PUNCH_CARD, 1))
            {
                pPlayer->DestroyItemCount(ITEM_BLUE_PUNCH_CARD, 1, true);
                pPlayer->CastSpell(pPlayer,SPELL_RED_PUNCH_CARD,true);
            }
            break;
        case MATRIX_PUNCHOGRAPH_3005_D:
            if (pPlayer->HasItemCount(ITEM_RED_PUNCH_CARD, 1))
            {
                pPlayer->DestroyItemCount(ITEM_RED_PUNCH_CARD, 1, true);
                pPlayer->CastSpell(pPlayer, SPELL_PRISMATIC_PUNCH_CARD, true);
            }
            break;
        default:
            break;
    }
    return false;
}

/*######
## go_rusty_cage
######*/

enum eRustyCage
{
    NPC_GOBLIN_PRISIONER    = 29466
};

bool GOHello_go_rusty_cage(Player *pPlayer, GameObject *pGO)
{
    if (Creature *pGoblinPrisoner = pGO->FindNearestCreature(NPC_GOBLIN_PRISIONER, 5.0f, true))
    {
        pGO->SetGoState(GO_STATE_ACTIVE);
        pPlayer->KilledMonsterCredit(NPC_GOBLIN_PRISIONER, pGoblinPrisoner->GetGUID());
        pGoblinPrisoner->DisappearAndDie();
    }

    return true;
}

/*######
## go_scourge_cage
######*/

enum eScourgeCage
{
    NPC_SCOURGE_PRISONER = 25610
};

bool GOHello_go_scourge_cage(Player *pPlayer, GameObject *pGO)
{
    if (Creature *pNearestPrisoner = pGO->FindNearestCreature(NPC_SCOURGE_PRISONER, 5.0f, true))
    {
        pGO->SetGoState(GO_STATE_ACTIVE);
        pPlayer->KilledMonsterCredit(NPC_SCOURGE_PRISONER, pNearestPrisoner->GetGUID());
        pNearestPrisoner->DisappearAndDie();
    }

    return true;
}

/*######
## go_arcane_prison
######*/

enum eArcanePrison
{
    QUEST_PRISON_BREAK                  = 11587,
    SPELL_ARCANE_PRISONER_KILL_CREDIT   = 45456
};

bool GOHello_go_arcane_prison(Player *pPlayer, GameObject *pGO)
{
    if (pPlayer->GetQuestStatus(QUEST_PRISON_BREAK) == QUEST_STATUS_INCOMPLETE)
    {
        pGO->SummonCreature(25318, 3485.089844, 6115.7422188, 70.966812, 0, TEMPSUMMON_TIMED_DESPAWN, 60000);
        pPlayer->CastSpell(pPlayer, SPELL_ARCANE_PRISONER_KILL_CREDIT, true);
        return true;
    } else
        return false;
}

/*######
## go_blood_filled_orb
######*/

#define NPC_ZELEMAR  17830

bool GOHello_go_blood_filled_orb(Player *pPlayer, GameObject *pGO)
{
    if (pGO->GetGoType() == GAMEOBJECT_TYPE_GOOBER)
        pPlayer->SummonCreature(NPC_ZELEMAR, -369.746, 166.759, -21.50, 5.235, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);

    return true;
}

/*######
## go_jotunheim_cage
######*/

enum eJotunheimCage
{
    NPC_EBON_BLADE_PRISONER_HUMAN   = 30186,
    NPC_EBON_BLADE_PRISONER_NE      = 30194,
    NPC_EBON_BLADE_PRISONER_TROLL   = 30196,
    NPC_EBON_BLADE_PRISONER_ORC     = 30195,

    SPELL_SUMMON_BLADE_KNIGHT_H     = 56207,
    SPELL_SUMMON_BLADE_KNIGHT_NE    = 56209,
    SPELL_SUMMON_BLADE_KNIGHT_ORC   = 56212,
    SPELL_SUMMON_BLADE_KNIGHT_TROLL = 56214
};

bool GOHello_go_jotunheim_cage(Player* pPlayer, GameObject* pGO)
{
    Creature* pPrisoner;
    pPrisoner = NULL;

    if ((pPrisoner = pGO->FindNearestCreature(NPC_EBON_BLADE_PRISONER_HUMAN, 5.0f, true)) ||
        (pPrisoner = pGO->FindNearestCreature(NPC_EBON_BLADE_PRISONER_TROLL, 5.0f, true)) ||
        (pPrisoner = pGO->FindNearestCreature(NPC_EBON_BLADE_PRISONER_ORC, 5.0f, true))   ||
        (pPrisoner = pGO->FindNearestCreature(NPC_EBON_BLADE_PRISONER_NE, 5.0f, true)))
    {
        if (pPrisoner && pPrisoner->isAlive())
        {
            pPrisoner->DisappearAndDie();
            pPlayer->KilledMonsterCredit(NPC_EBON_BLADE_PRISONER_HUMAN, 0);
            switch(pPrisoner->GetEntry())
            {
                case NPC_EBON_BLADE_PRISONER_HUMAN:
                    pPlayer->CastSpell(pPlayer,SPELL_SUMMON_BLADE_KNIGHT_H,true);
                    break;
                case NPC_EBON_BLADE_PRISONER_NE:
                    pPlayer->CastSpell(pPlayer,SPELL_SUMMON_BLADE_KNIGHT_NE,true);
                    break;
                case NPC_EBON_BLADE_PRISONER_TROLL:
                    pPlayer->CastSpell(pPlayer,SPELL_SUMMON_BLADE_KNIGHT_TROLL,true);
                    break;
                case NPC_EBON_BLADE_PRISONER_ORC:
                    pPlayer->CastSpell(pPlayer,SPELL_SUMMON_BLADE_KNIGHT_ORC,true);
                    break;
            }
        }
    }
    return true;
}
enum eTableTheka
{
    GOSSIP_TABLE_THEKA = 1653,

    QUEST_SPIDER_GOLD = 2936
};

bool GOHello_go_table_theka(Player* pPlayer, GameObject* pGO)
{
    if (pPlayer->GetQuestStatus(QUEST_SPIDER_GOLD) == QUEST_STATUS_INCOMPLETE)
        pPlayer->AreaExploredOrEventHappens(QUEST_SPIDER_GOLD);

    pPlayer->SEND_GOSSIP_MENU(GOSSIP_TABLE_THEKA, pGO->GetGUID());

    return true;
}

/*######
## go_inconspicuous_landmark
######*/

/*enum eInconspicuousLandmark
{
    SPELL_SUMMON_PIRATES_TREASURE_AND_TRIGGER_MOB    = 11462,
    ITEM_CUERGOS_KEY                                 = 9275,
};

bool GOHello_go_inconspicuous_landmark(Player *pPlayer, GameObject* pGO)
{
    if (pPlayer->HasItemCount(ITEM_CUERGOS_KEY,1))
        return false;

    pPlayer->CastSpell(pPlayer,SPELL_SUMMON_PIRATES_TREASURE_AND_TRIGGER_MOB,true);

    return true;
}*/

/*######
## go_soulwell
######*/

bool GOHello_go_soulwell(Player *pPlayer, GameObject* pGO)
{
    Unit *caster = pGO->GetOwner(false);
    if (!caster || caster->GetTypeId() != TYPEID_PLAYER)
        return true;

    if (!pPlayer->IsInSameRaidWith(static_cast<Player *>(caster)))
        return true;

    // Repeating this at every use is ugly and inefficient. But as long as we don't have proper
    // GO scripting with at least On Create and On Update events, the other options are no less
    // ugly and hacky.
    uint32 newSpell = 0;
    if (pGO->GetEntry() == 193169)                                  // Soulwell for rank 2
    {
        if (caster->HasAura(18693))      // Improved Healthstone rank 2
            newSpell = 58898;
        else if (caster->HasAura(18692)) // Improved Healthstone rank 1
            newSpell = 58896;
        else newSpell = 58890;
    }
    else if (pGO->GetEntry() == 181621)                             // Soulwell for rank 1
    {
        if (caster->HasAura(18693))      // Improved Healthstone rank 2
            newSpell = 34150;
        else if (caster->HasAura(18692)) // Improved Healthstone rank 1
            newSpell = 34149;
        else newSpell = 34130;
    }

    pGO->AddUse();
    pPlayer->CastSpell(pPlayer, newSpell, true);
    return true;
}



/*######
## Quest 11255: Prisoners of Wyrmskull
## go_dragonflayer_cage
######*/

enum ePrisonersOfWyrmskull
{
    QUEST_PRISONERS_OF_WYRMSKULL                  = 11255,
    NPC_PRISONER_PRIEST                           = 24086,
    NPC_PRISONER_MAGE                             = 24088,
    NPC_PRISONER_WARRIOR                          = 24089,
    NPC_PRISONER_PALADIN                          = 24090
};

bool GOHello_go_dragonflayer_cage(Player *pPlayer, GameObject *pGO)
{
    Creature *pPrisoner = NULL;
    Quest const* qInfo = objmgr.GetQuestTemplate(QUEST_PRISONERS_OF_WYRMSKULL);

    if (pPlayer && pPlayer->GetQuestStatus(QUEST_PRISONERS_OF_WYRMSKULL) == QUEST_STATUS_INCOMPLETE &&
        ((pPrisoner = pGO->FindNearestCreature(NPC_PRISONER_PRIEST,2.0f)) ||
        (pPrisoner = pGO->FindNearestCreature(NPC_PRISONER_MAGE,2.0f)) ||
        (pPrisoner = pGO->FindNearestCreature(NPC_PRISONER_WARRIOR,2.0f)) ||
        (pPrisoner = pGO->FindNearestCreature(NPC_PRISONER_PALADIN,2.0f))) && pPrisoner->isAlive())
    {
        //TODO: prisoner should help player for a short period of time
        pPlayer->KilledMonsterCredit(qInfo->ReqCreatureOrGOId[0],0);
		if (pPrisoner)
        pPrisoner->DisappearAndDie();
    }
    return true;
}

/*######

/*######


/*######
## go_lesser_wind_stone
## go_wind_stone
## go_greater_wind_stone
######*/
enum {
    ITM_TWILIGHT_CULTIST_MANTLE = 20406,
    ITM_TWILIGHT_CULTIST_ROBE = 20407,
    ITM_TWILIGHT_CULTIST_COWL = 20408,
    ITM_MEDALLION_OF_STATION = 20422,
    ITM_RING_OF_LORDSHIP = 20451,
    ITM_CREST_OF_BECKONING_WATER = 20420,
    ITM_CREST_OF_BECKONING_FIRE = 20416,
    ITM_CREST_OF_BECKONING_EARTH = 20419,
    ITM_CREST_OF_BECKONING_THUNDER = 20418,
    ITM_SIGNET_OF_BECKONING_WATER = 20436,
    ITM_SIGNET_OF_BECKONING_FIRE = 20432,
    ITM_SIGNET_OF_BECKONING_STONE = 20435,
    ITM_SIGNET_OF_BECKONING_THUNDER = 20433,
    ITM_SCEPTER_OF_BECKONING_WATER = 20450,
    ITM_SCEPTER_OF_BECKONING_FIRE = 20447,
    ITM_SCEPTER_OF_BECKONING_STONE = 20449,
    ITM_SCEPTER_OF_BECKONING_THUNDER = 20448
};

const uint32 summonTemplarEntry[] =
{
    //24760, 24744, 24758, 24756
    15211,15209,15307,15212
};

const uint32 summonDukeEntry[] =
{
    //24772, 24765, 24770, 24768
    15206,15207,15208,15220
};

const uint32 summonLordEntry[] =
{
    //24790, 24786, 24789, 24788
    15203,15204,15205,15305
};

bool GOHello_go_lesser_wind_stone(Player* pPlayer, GameObject* pGo)
{
    float fX,fY,fZ;
    pGo->GetClosePoint(fX,fY,fZ,pGo->GetObjectSize(),INTERACTION_DISTANCE);

    int iRandom = rand() % (sizeof(summonTemplarEntry) / sizeof(uint32));

    // Check whether Player has aura provided by set "Twilight Trappings" (24746)
    if(pPlayer->HasAura(24746)) {
        debug_log("TC: player %s has Twilight Trappings Set equipped.",pPlayer->GetName());

        if(pPlayer->HasItemCount(ITM_CREST_OF_BECKONING_WATER,1,false)) {
            //pPlayer->CastSpell(pPlayer,24760,false); //Summon Templar Water
            //pPlayer->CastSpell(pPlayer,24761,false); //Summon Templar Water, Trigger
            pPlayer->SummonCreature(15211,fX,fY,fZ,pGo->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,60000);
            pPlayer->DestroyItemCount(ITM_CREST_OF_BECKONING_WATER,1,true,false);
        } else if(pPlayer->HasItemCount(ITM_CREST_OF_BECKONING_FIRE,1,false)) {
            //pPlayer->CastSpell(pPlayer,24744,false); //Summon Templar Fire
            //pPlayer->CastSpell(pPlayer,24747,false); //Summon Templar Fire, Trigger
            pPlayer->SummonCreature(15209,fX,fY,fZ,pGo->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,60000);
            pPlayer->DestroyItemCount(ITM_CREST_OF_BECKONING_FIRE,1,true,false);
        } else if(pPlayer->HasItemCount(ITM_CREST_OF_BECKONING_EARTH,1,false)) {
            //pPlayer->CastSpell(pPlayer,24758,false); //Summon Templar Earth
            //pPlayer->CastSpell(pPlayer,24759,false); //Summon Templar Earth, Trigger
            pPlayer->SummonCreature(15307,fX,fY,fZ,pGo->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,60000);
            pPlayer->DestroyItemCount(ITM_CREST_OF_BECKONING_EARTH,1,true,false);
        } else if(pPlayer->HasItemCount(ITM_CREST_OF_BECKONING_THUNDER,1,false)) {
            //pPlayer->CastSpell(pPlayer,24756,false); //Summon Templar Thunder
            //pPlayer->CastSpell(pPlayer,24757,false); //Summon Templar Air, Trigger
            pPlayer->SummonCreature(15212,fX,fY,fZ,pGo->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,60000);
            pPlayer->DestroyItemCount(ITM_CREST_OF_BECKONING_THUNDER,1,true,false);
        } else {
            //pPlayer->CastSpell(pPlayer,summonTemplarEntry[iRandom],true);
            //pPlayer->CastSpell(pPlayer,24734,true); //Summon Templar Random
            //pPlayer->CastSpell(pPlayer,24745,true); //Summon Templar Random, Trigger
            pPlayer->SummonCreature(summonTemplarEntry[iRandom],fX,fY,fZ,pGo->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,60000);
        }

        // destroy Twilight cultist items
        Item *pItem;

        pItem = pPlayer->GetItemByPos( INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_CHEST);
        if(pItem && pItem->GetEntry() == ITM_TWILIGHT_CULTIST_ROBE)
            pPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_CHEST, true);


        pItem = pPlayer->GetItemByPos( INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_HEAD);
        if(pItem && pItem->GetEntry() == ITM_TWILIGHT_CULTIST_COWL)
            pPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_HEAD, true);


        pItem = pPlayer->GetItemByPos( INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_SHOULDERS);
        if(pItem && pItem->GetEntry() == ITM_TWILIGHT_CULTIST_MANTLE)
            pPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_SHOULDERS, true);


        // Destroy GO
        pGo->Delete();

    } else {
        debug_log("TC: player %s has not Twilight Trappings Set equipped.",pPlayer->GetName());
        //Dummy cast, cause summoning does not work, but does correct damage in case of use
        pPlayer->CastSpell(pPlayer,24734,true); //Summon Templar Random
        //pPlayer->CastSpell(pPlayer,24745,true); //Summon Templar Random, Trigger
        //pPlayer->CastSpell(pPlayer,summonTemplarEntry[iRandom],true);
    }
    return true;
}

bool GOHello_go_wind_stone(Player* pPlayer, GameObject* pGo)
{
    float fX,fY,fZ;
    pGo->GetClosePoint(fX,fY,fZ,pGo->GetObjectSize(),INTERACTION_DISTANCE);

    int iRandom = rand() % (sizeof(summonDukeEntry) / sizeof(uint32));

    // Check whether player has auras from set "Twilight Trappings" (24746) and "Twilight Medallion of Station" (24748)
    if(pPlayer->HasAura(24746) && pPlayer->HasAura(24748))
    {
        debug_log("TC: player %s has Twilight Trappings Set and Twilight Medallion of Station equipped.",pPlayer->GetName());

        if(pPlayer->HasItemCount(ITM_SIGNET_OF_BECKONING_WATER,1,false)) {
            //pPlayer->CastSpell(pPlayer,24772,true);  //Summon Duke Water
            //pPlayer->CastSpell(pPlayer,24773,false); //Summon Duke Water, Trigger
            pPlayer->SummonCreature(15207,fX,fY,fZ,pGo->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,60000);
            pPlayer->DestroyItemCount(ITM_SIGNET_OF_BECKONING_WATER,1,true,false);
        } else if(pPlayer->HasItemCount(ITM_SIGNET_OF_BECKONING_FIRE,1,false)) {
            //pPlayer->CastSpell(pPlayer,24765,true);  //Summon Duke Fire
            //pPlayer->CastSpell(pPlayer,24766,false); //Summon Duke Fire, Trigger
            pPlayer->SummonCreature(15206,fX,fY,fZ,pGo->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,60000);
            pPlayer->DestroyItemCount(ITM_SIGNET_OF_BECKONING_FIRE,1,true,false);
        } else if(pPlayer->HasItemCount(ITM_SIGNET_OF_BECKONING_STONE,1,false)) {
            //pPlayer->CastSpell(pPlayer,24770,true);  //Summon Duke Stone
            //pPlayer->CastSpell(pPlayer,24771,false); //Summon Duke Stone, Trigger
            pPlayer->SummonCreature(15208,fX,fY,fZ,pGo->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,60000);
            pPlayer->DestroyItemCount(ITM_SIGNET_OF_BECKONING_STONE,1,true,false);
        } else if(pPlayer->HasItemCount(ITM_SIGNET_OF_BECKONING_THUNDER,1,false)) {
            //pPlayer->CastSpell(pPlayer,24768,true);  //Summon Duke Thunder
            //pPlayer->CastSpell(pPlayer,24769,false); //Summon Duke Thunder, Trigger
            pPlayer->SummonCreature(15220,fX,fY,fZ,pGo->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,60000);
            pPlayer->DestroyItemCount(ITM_SIGNET_OF_BECKONING_THUNDER,1,true,false);
        } else {

            //pPlayer->CastSpell(pPlayer,summonDukeEntry[iRandom],true);
            //pPlayer->CastSpell(pPlayer,24763,false); //Summon Duke Random
            //pPlayer->CastSpell(pPlayer,24762,false); //Summon Duke Random, Trigger
            pPlayer->SummonCreature(summonDukeEntry[iRandom],fX,fY,fZ,pGo->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,60000);
        }

        // destroy Twilight cultist items
        Item *pItem;

        pItem = pPlayer->GetItemByPos( INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_CHEST);
        if(pItem && pItem->GetEntry() == ITM_TWILIGHT_CULTIST_ROBE)
            pPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_CHEST, true);


        pItem = pPlayer->GetItemByPos( INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_HEAD);
        if(pItem && pItem->GetEntry() == ITM_TWILIGHT_CULTIST_COWL)
            pPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_HEAD, true);


        pItem = pPlayer->GetItemByPos( INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_SHOULDERS);
        if(pItem && pItem->GetEntry() == ITM_TWILIGHT_CULTIST_MANTLE)
            pPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_SHOULDERS, true);


        pItem = pPlayer->GetItemByPos( INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_NECK);
        if(pItem && pItem->GetEntry() == ITM_MEDALLION_OF_STATION)
            pPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_NECK, true);


        // Destroy GO
        pGo->Delete();

    } else {
        debug_log("TC: player %s has not Twilight Trappings Set equipped.",pPlayer->GetName());
        //Dummy cast, cause summoning does not work, but does correct damage in case of use
        pPlayer->CastSpell(pPlayer,24763,false); //Summon Duke Random
        //pPlayer->CastSpell(pPlayer,24762,false); //Summon Duke Random, Trigger
        //pPlayer->CastSpell(pPlayer,summonDukeEntry[iRandom],true);
    }
    return true;
}

bool GOHello_go_greater_wind_stone(Player* pPlayer, GameObject* pGo)
{
    float fX,fY,fZ;
    pGo->GetClosePoint(fX,fY,fZ,pGo->GetObjectSize(),INTERACTION_DISTANCE);

    int iRandom = rand() % (sizeof(summonLordEntry) / sizeof(uint32));

    // Check whether Player has aura from set "Twilight Trappings" (24746), "Medallion of Station" (24782) and "Ring of Lordship" (24748)
    // Twilight Cultist Disguise http://www.wowhead.com/?spell=24782

    if(pPlayer->HasAura(24746) && pPlayer->HasAura(24748) && pPlayer->HasAura(24782))
    {
        debug_log("TC: player %s has Twilight Trappings Set, Medallion of Station and Ring of Lordship equipped.",pPlayer->GetName());

        if(pPlayer->HasItemCount(ITM_SCEPTER_OF_BECKONING_WATER,1,false)) {
            //pPlayer->CastSpell(pPlayer,24790,true);  //Summon Royal Water
            //pPlayer->CastSpell(pPlayer,24793,false); //Summon Royal Water, Trigger
            pPlayer->SummonCreature(15305,fX,fY,fZ,pGo->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,60000);
            pPlayer->DestroyItemCount(ITM_SCEPTER_OF_BECKONING_WATER,1,true,false);
        } else if(pPlayer->HasItemCount(ITM_SCEPTER_OF_BECKONING_FIRE,1,false)) {
            //pPlayer->CastSpell(pPlayer,24786,true);  //Summon Royal Fire
            //pPlayer->CastSpell(pPlayer,24787,false); //Summon Royal Fire, Trigger
            pPlayer->SummonCreature(15203,fX,fY,fZ,pGo->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,60000);
            pPlayer->DestroyItemCount(ITM_SCEPTER_OF_BECKONING_FIRE,1,true,false);
        } else if(pPlayer->HasItemCount(ITM_SCEPTER_OF_BECKONING_STONE,1,false)) {
            //pPlayer->CastSpell(pPlayer,24789,true);  //Summon Royal Earth
            //pPlayer->CastSpell(pPlayer,24792,false); //Summon Royal Earth, Trigger
            pPlayer->SummonCreature(15205,fX,fY,fZ,pGo->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,60000);
            pPlayer->DestroyItemCount(ITM_SCEPTER_OF_BECKONING_STONE,1,true,false);
        } else if(pPlayer->HasItemCount(ITM_SCEPTER_OF_BECKONING_THUNDER,1,false)) {
            //pPlayer->CastSpell(pPlayer,24788,true);  //Summon Royal Thunder
            //pPlayer->CastSpell(pPlayer,24791,false); //Summon Royal Air, Trigger
            pPlayer->SummonCreature(15204,fX,fY,fZ,pGo->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,60000);
            pPlayer->DestroyItemCount(ITM_SCEPTER_OF_BECKONING_THUNDER,1,true,false);
        } else {
            //pPlayer->CastSpell(pPlayer,summonLordEntry[iRandom],true);
            //pPlayer->CastSpell(pPlayer,24784,false); //Summon Royal Random
            //pPlayer->CastSpell(pPlayer,24785,false); //Summon Royal Random, Trigger
            pPlayer->SummonCreature(summonLordEntry[iRandom],fX,fY,fZ,pGo->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,60000);
        }

        // destroy Twilight cultist items
        Item *pItem;
        pItem = pPlayer->GetItemByPos( INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_CHEST);
        if(pItem && pItem->GetEntry() == ITM_TWILIGHT_CULTIST_ROBE)
            pPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_CHEST, true);


        pItem = pPlayer->GetItemByPos( INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_HEAD);
        if(pItem && pItem->GetEntry() == ITM_TWILIGHT_CULTIST_COWL)
            pPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_HEAD, true);


        pItem = pPlayer->GetItemByPos( INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_SHOULDERS);
        if(pItem && pItem->GetEntry() == ITM_TWILIGHT_CULTIST_MANTLE)
            pPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_SHOULDERS, true);


        pItem = pPlayer->GetItemByPos( INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_NECK);
        if(pItem && pItem->GetEntry() == ITM_MEDALLION_OF_STATION)
            pPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_NECK, true);


        pItem = pPlayer->GetItemByPos( INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_FINGER1);
        if(pItem && pItem->GetEntry() == ITM_RING_OF_LORDSHIP)
            pPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_FINGER1, true);


        pItem = pPlayer->GetItemByPos( INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_FINGER2);
        if(pItem && pItem->GetEntry() == ITM_RING_OF_LORDSHIP)
            pPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_FINGER1, true);


        // Destroy GO
        pGo->Delete();

    } else {
        debug_log("TC: player %s has not Twilight Trappings Set equipped.",pPlayer->GetName());
        //Dummy cast, cause summoning does not work, but does correct damage in case of use
        pPlayer->CastSpell(pPlayer,24784,false); //Summon Duke Random
        //pPlayer->CastSpell(pPlayer,24785,false); //Summon Duke Random, Trigger
        //pPlayer->CastSpell(pPlayer,summonLordEntry[iRandom],true);
    }
    return true;
}

/*######
## Quest 14096 & 14142: You've Really Done It This Time, Kul
## go_black_cage
######*/

enum eReallyDoneItThisTime
{
    QUEST_ALLIANCE_YOU_VE_REALLY_DONE_IT_THIS_TIME_KUL      = 14096,
    QUEST_HORDE_YOU_VE_REALLY_DONE_IT_THIS_TIME_KUL         = 14142,
    NPC_CAPTIVE_ASPIRANT                                    = 34716,
    NPC_KUL                                                 = 34956
};

bool GOHello_go_black_cage(Player *pPlayer, GameObject *pGO)
{
    Creature *pPrisoner;
    if (((pPlayer->GetTeamId() == TEAM_ALLIANCE && pPlayer->GetQuestStatus(QUEST_ALLIANCE_YOU_VE_REALLY_DONE_IT_THIS_TIME_KUL) == QUEST_STATUS_INCOMPLETE) ||
        (pPlayer->GetTeamId() == TEAM_HORDE && pPlayer->GetQuestStatus(QUEST_HORDE_YOU_VE_REALLY_DONE_IT_THIS_TIME_KUL) == QUEST_STATUS_INCOMPLETE)) &&
        ((pPrisoner = pGO->FindNearestCreature(NPC_CAPTIVE_ASPIRANT,1.0f)) || (pPrisoner = pGO->FindNearestCreature(NPC_KUL,1.0f))))
    {
        pGO->UseDoorOrButton();
        pPrisoner->DisappearAndDie();
        pPlayer->KilledMonsterCredit(pPrisoner->GetEntry(),0);
    }
    return true;
}

/*######
## Ulduar Harpoons
#####*/

enum
{
NPC_RASORSCALE = 33186,
NPC_VISUAL = 33233,
SPELL_HARPOON_MORTAL_EFFECT = 63046,
SPELL_RIDE_HARPOON_VISUAL = 44167
};

bool GOHello_go_rasorscale_broken_harpoon(Player *pPlayer, GameObject* pGO)
{
    float fX,fY,fZ;
    pGO->GetClosePoint(fX,fY,fZ,pGO->GetObjectSize(),INTERACTION_DISTANCE);
    
    Creature *pRazorscale;
    pRazorscale = NULL;
    
    if (pRazorscale = pGO->FindNearestCreature(NPC_RASORSCALE, 50.0f, true))
    {
      if (pRazorscale && pRazorscale->isAlive())
	{
	if (Creature* pVisual = pPlayer->SummonCreature(NPC_VISUAL,fX,fY,fZ,pGO->GetOrientation(),TEMPSUMMON_TIMED_DESPAWN,2000))
	{
	pVisual->SetFlying(true);
	pVisual->SetSpeed(MOVE_FLIGHT, 9, true);
	pVisual->CastSpell(pVisual, SPELL_RIDE_HARPOON_VISUAL, false);
	pVisual->GetMotionMaster()->MovePoint(0,587.54,-174.92,415.51);
	}
	pPlayer->CastSpell(pRazorscale, SPELL_HARPOON_MORTAL_EFFECT, true);
	pGO->Delete();
	} 
	 return true;
    } else
	return false;
}

/*######
## Q10097
#####*/

enum
{
    QUEST_10097                           = 10097,
    NPC_LAKKA                             = 18956
};

bool GOHello_go_sethekk_cage(Player *pPlayer, GameObject *pGO)
{
    Creature *pLakka;
    if (pPlayer->GetQuestStatus(QUEST_10097) == QUEST_STATUS_INCOMPLETE &&
        (pLakka = pGO->FindNearestCreature(NPC_LAKKA,10.0f)))
        {
			pGO->UseDoorOrButton();
			pPlayer->KilledMonsterCredit(pLakka->GetEntry(),pLakka->GetGUID());
			pLakka->DisappearAndDie();            
        }
    return true;
}

/*######
## Quest 9544: The Prophecy of Akida
######*/

enum eProphecy
{
    QUEST_PROPHECY_OF_AKIDA                       = 9544,
    NPC_STILLPINE_CAPTIVE                         = 17375
};

bool GOHello_go_stillpine_cage(Player *pPlayer, GameObject *pGO)
{
    Creature *pPrisoner;
    if (pPlayer->GetQuestStatus(QUEST_PROPHECY_OF_AKIDA) == QUEST_STATUS_INCOMPLETE &&
        (pPrisoner = pGO->FindNearestCreature(NPC_STILLPINE_CAPTIVE,1.0f)))
    {
        pGO->UseDoorOrButton();
        pPrisoner->DisappearAndDie();
        pPlayer->KilledMonsterCredit(pPrisoner->GetEntry(),0);
    }
    return true;
}

void AddSC_go_scripts()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "go_cat_figurine";
    newscript->pGOHello =           &GOHello_go_cat_figurine;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_northern_crystal_pylon";
    newscript->pGOHello =           &GOHello_go_northern_crystal_pylon;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_eastern_crystal_pylon";
    newscript->pGOHello =           &GOHello_go_eastern_crystal_pylon;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_western_crystal_pylon";
    newscript->pGOHello =           &GOHello_go_western_crystal_pylon;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_barov_journal";
    newscript->pGOHello =           &GOHello_go_barov_journal;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_field_repair_bot_74A";
    newscript->pGOHello =           &GOHello_go_field_repair_bot_74A;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_gilded_brazier";
    newscript->pGOHello =           &GOHello_go_gilded_brazier;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_orb_of_command";
    newscript->pGOHello =           &GOHello_go_orb_of_command;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_shrine_of_the_birds";
    newscript->pGOHello =           &GOHello_go_shrine_of_the_birds;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_southfury_moonstone";
    newscript->pGOHello =           &GOHello_go_southfury_moonstone;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_tablet_of_madness";
    newscript->pGOHello =           &GOHello_go_tablet_of_madness;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_tablet_of_the_seven";
    newscript->pGOHello =           &GOHello_go_tablet_of_the_seven;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_jump_a_tron";
    newscript->pGOHello =           &GOHello_go_jump_a_tron;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_ethereum_prison";
    newscript->pGOHello =           &GOHello_go_ethereum_prison;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_ethereum_stasis";
    newscript->pGOHello =           &GOHello_go_ethereum_stasis;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_resonite_cask";
    newscript->pGOHello =           &GOHello_go_resonite_cask;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_sacred_fire_of_life";
    newscript->pGOHello =           &GOHello_go_sacred_fire_of_life;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_tele_to_dalaran_crystal";
    newscript->pGOHello =           &GOHello_go_tele_to_dalaran_crystal;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_tele_to_violet_stand";
    newscript->pGOHello =           &GOHello_go_tele_to_violet_stand;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_fel_crystalforge";
    newscript->pGOHello =           &GOHello_go_fel_crystalforge;
    newscript->pGOSelect =          &GOSelect_go_fel_crystalforge;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_bashir_crystalforge";
    newscript->pGOHello =           &GOHello_go_bashir_crystalforge;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_matrix_punchograph";
    newscript->pGOHello =           &GOHello_go_matrix_punchograph;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_rusty_cage";
    newscript->pGOHello =           &GOHello_go_rusty_cage;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_scourge_cage";
    newscript->pGOHello =           &GOHello_go_scourge_cage;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_arcane_prison";
    newscript->pGOHello =           &GOHello_go_arcane_prison;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_blood_filled_orb";
    newscript->pGOHello =           &GOHello_go_blood_filled_orb;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_jotunheim_cage";
    newscript->pGOHello =           &GOHello_go_jotunheim_cage;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_table_theka";
    newscript->pGOHello =           &GOHello_go_table_theka;
    newscript->RegisterSelf();

    /*newscript = new Script;
    newscript->Name = "go_inconspicuous_landmark";
    newscript->pGOHello =           &GOHello_go_inconspicuous_landmark;
    newscript->RegisterSelf();*/

    newscript = new Script;
    newscript->Name = "go_soulwell";
    newscript->pGOHello =           &GOHello_go_soulwell;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_lesser_wind_stone";
    newscript->pGOHello =           &GOHello_go_lesser_wind_stone;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_wind_stone";
    newscript->pGOHello =           &GOHello_go_wind_stone;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_greater_wind_stone";
    newscript->pGOHello =           &GOHello_go_greater_wind_stone;
    newscript->RegisterSelf();

	newscript = new Script;
    newscript->Name = "go_dragonflayer_cage";
    newscript->pGOHello =           &GOHello_go_dragonflayer_cage;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_black_cage";
    newscript->pGOHello =           &GOHello_go_black_cage;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_stillpine_cage";
    newscript->pGOHello =           &GOHello_go_stillpine_cage;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "go_rasorscale_broken_harpoon";
    newscript->pGOHello =           &GOHello_go_rasorscale_broken_harpoon;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "go_sethekk_cage";
    newscript->pGOHello =           &GOHello_go_sethekk_cage;
    newscript->RegisterSelf();
}
