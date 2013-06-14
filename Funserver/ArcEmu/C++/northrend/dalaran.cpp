/*
 * Copyright (C) 2009 Trinity <http://www.trinitycore.org/>
 *
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

/* Script Data Start
SDName: Dalaran
SDAuthor: WarHead, MaXiMiUS
SD%Complete: 99%
SDComment: For what is 63990+63991? Same function but don't work correct...
SDCategory: Dalaran
Private_332:
npc_zidormi
Script Data End */

#include "ScriptedPch.h"

/*******************************************************
 * npc_mageguard_dalaran
 *******************************************************/

enum Spells
{
    SPELL_TRESPASSER_A = 54028,
    SPELL_TRESPASSER_H = 54029,
    SPELL_TABARD       = 73326
};

enum NPCs // All outdoor guards are within 35.0f of these NPCs
{
    NPC_APPLEBOUGH_A = 29547,
    NPC_SWEETBERRY_H = 29715,
};

struct npc_mageguard_dalaranAI : public Scripted_NoMovementAI
{
    npc_mageguard_dalaranAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature)
    {
        pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        pCreature->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_NORMAL, true);
        pCreature->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_MASK_MAGIC, true);
    }

    void Reset(){}

    void Aggro(Unit* /*pWho*/){}

    void AttackStart(Unit* /*pWho*/){}

    void MoveInLineOfSight(Unit *pWho)
    {
        if (!pWho || !pWho->IsInWorld() || pWho->GetZoneId() != 4395)
            return;

        if (!me->IsWithinDist(pWho, 7.0f, false))
            return;

        Player *pPlayer = pWho->GetCharmerOrOwnerPlayerOrPlayerItself();

        if (!pPlayer || pPlayer->isGameMaster() || pPlayer->IsBeingTeleported())
            return;
	if (pPlayer->HasAura(SPELL_TABARD))
	return;

        switch (me->GetEntry())
        {
            case 29254:
                if (pPlayer->GetTeam() == HORDE)              // Horde unit found in Alliance area
                    if (GetClosestCreatureWithEntry(me, NPC_APPLEBOUGH_A, 32.0f))
                    {
                        if (me->isInBackInMap(pWho, 12.0f))   // In my line of sight, "outdoors", and behind me
                            DoCast(pWho, SPELL_TRESPASSER_A); // Teleport the Horde unit out
                    }
                    else                                      // In my line of sight, and "indoors"
                        DoCast(pWho, SPELL_TRESPASSER_A);     // Teleport the Horde unit out
                break;
            case 29255:
                if (pPlayer->GetTeam() == ALLIANCE)           // Alliance unit found in Horde area
                    if (GetClosestCreatureWithEntry(me, NPC_SWEETBERRY_H, 32.0f))
                    {
                        if (me->isInBackInMap(pWho, 12.0f))   // In my line of sight, "outdoors", and behind me
                            DoCast(pWho, SPELL_TRESPASSER_H); // Teleport the Alliance unit out
                    }
                    else                                      // In my line of sight, and "indoors"
                        DoCast(pWho, SPELL_TRESPASSER_H);     // Teleport the Alliance unit out
                break;
        }
        me->SetOrientation(me->GetHomePosition().GetOrientation());
        return;
    }

    void UpdateAI(const uint32 /*diff*/){}
};

CreatureAI* GetAI_npc_mageguard_dalaran(Creature* pCreature)
{
    return new npc_mageguard_dalaranAI(pCreature);
}

/*######
## npc_hira_snowdawn
######*/

enum eHiraSnowdawn
{
    SPELL_COLD_WEATHER_FLYING                   = 54197
};

#define GOSSIP_TEXT_TRAIN_HIRA "I seek training to ride a steed."

bool GossipHello_npc_hira_snowdawn(Player* pPlayer, Creature* pCreature)
{
    if (!pCreature->isVendor() || !pCreature->isTrainer())
        return false;

    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_TRAIN_HIRA, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRAIN);

    if (pPlayer->getLevel() >= 80 && pPlayer->HasSpell(SPELL_COLD_WEATHER_FLYING))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_hira_snowdawn(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_TRAIN)
        pPlayer->SEND_TRAINERLIST(pCreature->GetGUID());

    if (uiAction == GOSSIP_ACTION_TRADE)
        pPlayer->SEND_VENDORLIST(pCreature->GetGUID());

    return true;
}

/*######
## npc_zidormi
######*/

#define GOSSIP_ITEM_ZIDORMI1    "Take me to the Caverns of Time."

enum
{
    SPELL_TELEPORT_COT          = 46343,
    GOSSIP_TEXTID_ZIDORMI1      = 14066
};

bool GossipHello_npc_zidormi(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->getLevel() >= 65)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_ZIDORMI1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    }
    else
        pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ZIDORMI1, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_zidormi(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
        pPlayer->CastSpell(pPlayer,SPELL_TELEPORT_COT,false);

    return true;
}

#define GOSSIP_ITEM_PORTAL    "Take me to the Dalaran."

enum
{
    SPELL_TELEPORT_DALARAN          = 54406,
    QUEST_PORTAL1		    = 12794,
    QUEST_PORTAL2		    = 12791,
    QUEST_PORTAL3		    = 12796
};

bool GossipHello_npc_teleportation_dalaran(Player* pPlayer, Creature* pCreature)
{
    if ((pPlayer->GetQuestStatus(QUEST_PORTAL1) == QUEST_STATUS_INCOMPLETE) || (pPlayer->GetQuestStatus(QUEST_PORTAL2) == QUEST_STATUS_INCOMPLETE) || (pPlayer->GetQuestStatus(QUEST_PORTAL3) == QUEST_STATUS_INCOMPLETE))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_PORTAL, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    }

    return true;
}

bool GossipSelect_npc_teleportation_dalaran(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
        pPlayer->CastSpell(pPlayer,SPELL_TELEPORT_DALARAN,false);

    return true;
}

void AddSC_dalaran()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_mageguard_dalaran";
    newscript->GetAI = &GetAI_npc_mageguard_dalaran;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_hira_snowdawn";
    newscript->pGossipHello = &GossipHello_npc_hira_snowdawn;
    newscript->pGossipSelect = &GossipSelect_npc_hira_snowdawn;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_zidormi";
    newscript->pGossipHello = &GossipHello_npc_zidormi;
    newscript->pGossipSelect = &GossipSelect_npc_zidormi;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_teleportation_dalaran";
    newscript->pGossipHello = &GossipHello_npc_teleportation_dalaran;
    newscript->pGossipSelect = &GossipSelect_npc_teleportation_dalaran;
    newscript->RegisterSelf();
}
