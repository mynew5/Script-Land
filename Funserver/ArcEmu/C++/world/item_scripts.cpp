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
SDName: Item_Scripts
SD%Complete: 100
SDComment: Items for a range of different items. See content below (in script)
SDCategory: Items
EndScriptData */

/* ContentData
item_draenei_fishing_net(i23654)    Hacklike implements chance to spawn item or creature
item_nether_wraith_beacon(i31742)   Summons creatures for quest Becoming a Spellfire Tailor (q10832)
item_flying_machine(i34060,i34061)  Engineering crafted flying machines
item_gor_dreks_ointment(i30175)     Protecting Our Own(q10488)
item_only_for_flight                Items which should only useable while flying
item_dehta_trap_smasher             Support For Quest 11876

Private_core_332 (for Quest): 11626, 11794
item_Gnomish_Army_Knife
item_blood_gem
item_frost_gem
item_unholy_gem
EndContentData */

#include "ScriptedPch.h"
#include "Spell.h"

/*#####
# item_only_for_flight
#####*/

enum eOnlyForFlight
{
    SPELL_ARCANE_CHARGES    = 45072
};

bool ItemUse_item_only_for_flight(Player* pPlayer, Item* pItem, SpellCastTargets const& targets)
{
    uint32 itemId = pItem->GetEntry();
    bool disabled = false;

    //for special scripts
    switch(itemId)
    {
       case 24538:
            if (pPlayer->GetAreaId() != 3628)
                disabled = true;
                break;
       case 34489:
            if (pPlayer->GetZoneId() != 4080)
                disabled = true;
                break;
       case 34475:
            if (const SpellEntry* pSpellInfo = GetSpellStore()->LookupEntry(SPELL_ARCANE_CHARGES))
                Spell::SendCastResult(pPlayer, pSpellInfo, 1, SPELL_FAILED_NOT_ON_GROUND);
                break;
    }

    // allow use in flight only
    if (pPlayer->isInFlight() && !disabled)
        return false;

    // error
    pPlayer->SendEquipError(EQUIP_ERR_CANT_DO_RIGHT_NOW,pItem,NULL);
    return true;
}

/*#####
# item_draenei_fishing_net
#####*/

//This is just a hack and should be removed from here.
//Creature/Item are in fact created before spell are sucessfully casted, without any checks at all to ensure proper/expected behavior.
bool ItemUse_item_draenei_fishing_net(Player* pPlayer, Item* pItem, SpellCastTargets const& targets)
{
    //if (targets.getGOTarget() && targets.getGOTarget()->GetTypeId() == TYPEID_GAMEOBJECT &&
    //targets.getGOTarget()->GetGOInfo()->type == GAMEOBJECT_TYPE_SPELL_FOCUS && targets.getGOTarget()->GetEntry() == 181616)
    //{
    if (pPlayer->GetQuestStatus(9452) == QUEST_STATUS_INCOMPLETE)
    {
        if (urand(0,99) < 35)
        {
            Creature *Murloc = pPlayer->SummonCreature(17102, pPlayer->GetPositionX(), pPlayer->GetPositionY()+20, pPlayer->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000);
            if (Murloc)
                Murloc->AI()->AttackStart(pPlayer);
        }
        else
        {
            ItemPosCountVec dest;
            uint8 msg = pPlayer->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, 23614, 1);
            if (msg == EQUIP_ERR_OK)
            {
                if (Item* item = pPlayer->StoreNewItem(dest,23614,true))
                    pPlayer->SendNewItem(item,1,false,true);
            } else
                pPlayer->SendEquipError(msg,NULL,NULL);
        }
    }
    //}
    return false;
}

/*#####
# item_nether_wraith_beacon
#####*/

bool ItemUse_item_nether_wraith_beacon(Player* pPlayer, Item* pItem, SpellCastTargets const& targets)
{
    if (pPlayer->GetQuestStatus(10832) == QUEST_STATUS_INCOMPLETE)
    {
        Creature *Nether;
        Nether = pPlayer->SummonCreature(22408, pPlayer->GetPositionX(), pPlayer->GetPositionY()+20, pPlayer->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 180000);
        Nether = pPlayer->SummonCreature(22408, pPlayer->GetPositionX(), pPlayer->GetPositionY()-20, pPlayer->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 180000);
        if (Nether)
            Nether->AI()->AttackStart(pPlayer);
    }
    return false;
}

/*#####
# item_flying_machine
#####*/

bool ItemUse_item_flying_machine(Player* pPlayer, Item* pItem, SpellCastTargets const& targets)
{
    uint32 itemId = pItem->GetEntry();
    if (itemId == 34060)
        if (pPlayer->GetBaseSkillValue(SKILL_RIDING) >= 225)
            return false;

    if (itemId == 34061)
        if (pPlayer->GetBaseSkillValue(SKILL_RIDING) == 300)
            return false;

    debug_log("TSCR: Player attempt to use item %u, but did not meet riding requirement",itemId);
    pPlayer->SendEquipError(EQUIP_ERR_ERR_CANT_EQUIP_SKILL,pItem,NULL);
    return true;
}

/*#####
# item_gor_dreks_ointment
#####*/

bool ItemUse_item_gor_dreks_ointment(Player *pPlayer, Item *pItem, SpellCastTargets const& targets)
{
    if (targets.getUnitTarget() && targets.getUnitTarget()->GetTypeId() == TYPEID_UNIT &&
        targets.getUnitTarget()->GetEntry() == 20748 && !targets.getUnitTarget()->HasAura(32578))
        return false;

    pPlayer->SendEquipError(EQUIP_ERR_CANT_DO_RIGHT_NOW,pItem,NULL);
    return true;
}

/*#####
# item_incendiary_explosives
#####*/

bool ItemUse_item_incendiary_explosives(Player *pPlayer, Item *pItem, SpellCastTargets const &targets)
{
    if (pPlayer->FindNearestCreature(26248,15) || pPlayer->FindNearestCreature(26249,15))
        return false;
    else
    {
        pPlayer->SendEquipError(EQUIP_ERR_OUT_OF_RANGE,pItem,NULL);
        return true;
    }
}

/*#####
# item_mysterious_egg
#####*/

bool ItemExpire_item_mysterious_egg(Player *pPlayer, ItemPrototype const *pItemProto)
{
    ItemPosCountVec dest;
    uint8 msg = pPlayer->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, 39883, 1); // Cracked Egg
    if (msg == EQUIP_ERR_OK)
        pPlayer->StoreNewItem(dest, 39883, true, Item::GenerateItemRandomPropertyId(39883));

    return true;
}

/*#####
# item_disgusting_jar
#####*/

bool ItemExpire_item_disgusting_jar(Player *pPlayer, ItemPrototype const *pItemProto)
{
    ItemPosCountVec dest;
    uint8 msg = pPlayer->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, 44718, 1); // Ripe Disgusting Jar
    if (msg == EQUIP_ERR_OK)
        pPlayer->StoreNewItem(dest, 44718, true, Item::GenerateItemRandomPropertyId(44718));

    return true;
}

/*#####
# item_harvesters_gift
#####*/
#define GHOULS 28845
bool ItemUse_item_harvesters_gift(Player* pPlayer, Item* pItem, SpellCastTargets const& targets)
{
    std::list<Creature*> MinionList;
    pPlayer->GetAllMinionsByEntry(MinionList,GHOULS);

    if (pPlayer->GetQuestStatus(12698) == QUEST_STATUS_INCOMPLETE)
    {
        if (!MinionList.empty())
        {
            if (MinionList.size() < 5)
                return false;
            else
            {
                //This should be sent to the player as red text.
                pPlayer->Say("You have created enough ghouls. Return to Gothik the Harvester at Death's Breach.",LANG_UNIVERSAL);
                return true;
            }
        }
        else
            return false;
    }
    return true;
}

/*#####
# item_pile_fake_furs
#####*/

enum ePileFakeFur
{
    GO_CARIBOU_TRAP_1                                      = 187982,
    GO_CARIBOU_TRAP_2                                      = 187995,
    GO_CARIBOU_TRAP_3                                      = 187996,
    GO_CARIBOU_TRAP_4                                      = 187997,
    GO_CARIBOU_TRAP_5                                      = 187998,
    GO_CARIBOU_TRAP_6                                      = 187999,
    GO_CARIBOU_TRAP_7                                      = 188000,
    GO_CARIBOU_TRAP_8                                      = 188001,
    GO_CARIBOU_TRAP_9                                      = 188002,
    GO_CARIBOU_TRAP_10                                     = 188003,
    GO_CARIBOU_TRAP_11                                     = 188004,
    GO_CARIBOU_TRAP_12                                     = 188005,
    GO_CARIBOU_TRAP_13                                     = 188006,
    GO_CARIBOU_TRAP_14                                     = 188007,
    GO_CARIBOU_TRAP_15                                     = 188008,
    GO_HIGH_QUALITY_FUR                                    = 187983,
    NPC_NESINGWARY_TRAPPER                                 = 25835
};
bool ItemUse_item_pile_fake_furs(Player *pPlayer, Item *pItem, SpellCastTargets const &targets)
{
    GameObject *pGo;
    if ((pGo = pPlayer->FindNearestGameObject(GO_CARIBOU_TRAP_1, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_CARIBOU_TRAP_2, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_CARIBOU_TRAP_3, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_CARIBOU_TRAP_4, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_CARIBOU_TRAP_5, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_CARIBOU_TRAP_6, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_CARIBOU_TRAP_7, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_CARIBOU_TRAP_8, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_CARIBOU_TRAP_9, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_CARIBOU_TRAP_10, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_CARIBOU_TRAP_11, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_CARIBOU_TRAP_12, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_CARIBOU_TRAP_13, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_CARIBOU_TRAP_14, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_CARIBOU_TRAP_15, 5.0f)))
    {
        if (pGo->FindNearestCreature(NPC_NESINGWARY_TRAPPER, 10.0f, true) || pGo->FindNearestCreature(NPC_NESINGWARY_TRAPPER, 10.0f, false) || pGo->FindNearestGameObject(GO_HIGH_QUALITY_FUR, 2.0f))
            return true;
        float x, y, z;
        pGo->GetClosePoint(x, y, z, pGo->GetObjectSize() / 3, 7.0f);
        pGo->SummonGameObject(GO_HIGH_QUALITY_FUR, pGo->GetPositionX(), pGo->GetPositionY(), pGo->GetPositionZ(), 0, 0, 0, 0, 0, 1000);
        if (TempSummon* summon = pPlayer->SummonCreature(NPC_NESINGWARY_TRAPPER, x, y, z, pGo->GetOrientation(), TEMPSUMMON_DEAD_DESPAWN, 1000))
        {
            summon->SetVisibility(VISIBILITY_OFF);
            summon->SetReactState(REACT_PASSIVE);
            summon->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);
        }
    }
    return false;
}

/*#####
# item_petrov_cluster_bombs
#####*/

enum ePetrovClusterBombs
{
    SPELL_PETROV_BOMB           = 42406,
    AREA_ID_SHATTERED_STRAITS   = 4064,
    ZONE_ID_HOWLING             = 495
};

bool ItemUse_item_petrov_cluster_bombs(Player* pPlayer, Item* pItem, const SpellCastTargets &pTargets)
{
    if (pPlayer->GetZoneId() != ZONE_ID_HOWLING)
        return false;

    if (!pPlayer->GetTransport() || pPlayer->GetAreaId() != AREA_ID_SHATTERED_STRAITS)
    {
        pPlayer->SendEquipError(EQUIP_ERR_NONE, pItem, NULL);

        if (const SpellEntry* pSpellInfo = GetSpellStore()->LookupEntry(SPELL_PETROV_BOMB))
            Spell::SendCastResult(pPlayer, pSpellInfo, 1, SPELL_FAILED_NOT_HERE);

        return true;
    }

    return false;
}

/*#####
# item_dehta_trap_smasher 
#####*/

enum eDehtaTrapSmasher
{
    GO_MAMMOOTH_TRAP_1                                      = 188022,
    GO_MAMMOOTH_TRAP_2                                      = 188024,
    GO_MAMMOOTH_TRAP_3                                      = 188025,
    GO_MAMMOOTH_TRAP_4                                      = 188026,
    GO_MAMMOOTH_TRAP_5                                      = 188027,
    GO_MAMMOOTH_TRAP_6                                      = 188030,
    GO_MAMMOOTH_TRAP_7                                      = 188031,
    GO_MAMMOOTH_TRAP_8                                      = 188032,
    GO_MAMMOOTH_TRAP_9                                      = 188033,
    GO_MAMMOOTH_TRAP_10                                     = 188034,
    GO_MAMMOOTH_TRAP_11                                     = 188035,
    GO_MAMMOOTH_TRAP_12                                     = 188036,
    GO_MAMMOOTH_TRAP_13                                     = 188038,
    GO_MAMMOOTH_TRAP_14                                     = 188039,
    GO_MAMMOOTH_TRAP_15                                     = 188040,
    GO_MAMMOOTH_TRAP_16                                     = 188041,
    GO_MAMMOOTH_TRAP_17                                     = 188042,
    GO_MAMMOOTH_TRAP_18                                     = 188043,
    GO_MAMMOOTH_TRAP_19                                     = 188044,
    GO_MAMMOOTH_TRAP_20                                     = 188028,
    GO_MAMMOOTH_TRAP_21                                     = 188029,
    GO_MAMMOOTH_TRAP_22                                     = 188037,
    NPC_TRAPPED_MAMMOOTH                                    = 25850,
    NPC_MAMMOOTH                                            = 24613,
    HELP_THOSE_ID                                           = 11876,
    SPELL_CALF_CREDIT                                       = 46200
};

bool ItemUse_item_dehta_trap_smasher(Player* pPlayer, Item* _Item, SpellCastTargets const& targets)
{
    GameObject* pGo;
    if ((pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_1, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_2, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_3, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_4, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_5, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_6, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_7, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_8, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_9, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_10, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_11, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_12, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_13, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_14, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_15, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_16, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_17, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_18, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_19, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_20, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_21, 5.0f)) ||
        (pGo = pPlayer->FindNearestGameObject(GO_MAMMOOTH_TRAP_22, 5.0f)))
    {
        if(!pGo->FindNearestCreature(NPC_TRAPPED_MAMMOOTH,10.0f,true))
            return false;
        float x, y, z;
        x = pPlayer->GetPositionX();
        y = pPlayer->GetPositionY();
        z = pPlayer->GetPositionZ();
        Creature* pCr;
        if(pCr = (pGo->FindNearestCreature(NPC_TRAPPED_MAMMOOTH,5.0f,true)))
            pCr->ForcedDespawn();
        if (TempSummon* summon = pPlayer->SummonCreature(NPC_MAMMOOTH, x, y, z, pGo->GetOrientation(), TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000))
        {
            summon->SetReactState(REACT_PASSIVE);
            summon->AddUnitMovementFlag(MOVEMENTFLAG_WALK_MODE);
        }

        if (pPlayer->GetQuestStatus(HELP_THOSE_ID) == QUEST_STATUS_INCOMPLETE)
            pPlayer->CastSpell(pPlayer,SPELL_CALF_CREDIT,true);

    }
    return false;
}

enum Eluna
{
NPC_OMEN	= 15467,
ZONE_ELUNA	= 493
};

bool ItemUse_item_elune_cundle(Player* pPlayer, Item* pItem, SpellCastTargets const& targets)
{
  uint32 itemId = pItem->GetEntry();
  if (itemId == 21713)
  {
    if ((pPlayer->GetQuestStatus(8868) == QUEST_STATUS_INCOMPLETE) && (pPlayer->GetZoneId() == ZONE_ELUNA))
    {
    Creature *Omen;
    Omen = pPlayer->SummonCreature(NPC_OMEN,pPlayer->GetPositionX(), pPlayer->GetPositionY()+20, pPlayer->GetPositionZ(), 0, TEMPSUMMON_CORPSE_DESPAWN, 60000);
    if (Omen)
		Omen->AI()->AttackStart(pPlayer);
    }
    else
    pPlayer->CastSpell(pPlayer,26636,true);
    return true;
  }
  return false;  
}

bool ItemUse_small_rocket(Player* pPlayer, Item* pItem, SpellCastTargets const& targets)
{

  uint32 itemId = pItem->GetEntry();

  if (itemId == 21557 || itemId ==21559 || itemId ==21558)
  {
    if (pPlayer->GetQuestStatus(8867) == QUEST_STATUS_INCOMPLETE)
    {
    Creature *Credit;
    Credit = pPlayer->SummonCreature(15893,pPlayer->GetPositionX(), pPlayer->GetPositionY()+10, pPlayer->GetPositionZ(), 0, TEMPSUMMON_CORPSE_DESPAWN, 10000);
    if (Credit)
    {
    Credit->CastSpell(pPlayer,26286,true);
    //Credit->DisappearAndDie();
    }
    CAST_PLR(pPlayer)->KilledMonsterCredit(15893,0);
    }
    
    else
    {
    switch(itemId)
    {
    case 21557:
    pPlayer->CastSpell(pPlayer,26286,true);
    break;
    case 21559:
    pPlayer->CastSpell(pPlayer,26292,true);
    break;
    case 21558:
    pPlayer->CastSpell(pPlayer,26291,true);
    break;
    }
  }
  }
  return false;  
}

bool ItemUse_rocket_cluster(Player* pPlayer, Item* pItem, SpellCastTargets const& targets)
{

  uint32 itemId = pItem->GetEntry();

  if (itemId == 21576 || itemId ==21574 || itemId ==21571)
  {
    if (pPlayer->GetQuestStatus(8867) == QUEST_STATUS_INCOMPLETE)
    {
    Creature *Credit;
    Credit = pPlayer->SummonCreature(15894,pPlayer->GetPositionX(), pPlayer->GetPositionY()+10, pPlayer->GetPositionZ(), 0, TEMPSUMMON_CORPSE_DESPAWN, 10000);
    if (Credit)
    {
    Credit->CastSpell(pPlayer,26327,true);
    }
    CAST_PLR(pPlayer)->KilledMonsterCredit(15894,0);
    }
    
    else
    {
    switch(itemId)
    {
    case 21576:
    pPlayer->CastSpell(pPlayer,26327,true);
    break;
    case 21574:
    pPlayer->CastSpell(pPlayer,26325,true);
    break;
    case 21571:
    pPlayer->CastSpell(pPlayer,26304,true);
    break;
    }
    }
  }
  return false;  
}

/*#####
# item_Trident_of_Nazjan
#####*/
enum TheEmissary
{   
    QUEST_THE_EMISSARY      =   11626,
    NPC_LEVIROTH            =   26452,
    HP_LEVIROTH             =   96100,
    SPELL_IMPALE_LEVIROTH   =   47170
};

bool ItemUse_item_Trident_of_Nazjan(Player* pPlayer, Item* pItem, const SpellCastTargets &pTargets)
{
    Creature* pLeviroth;

    if (pPlayer->GetQuestStatus(QUEST_THE_EMISSARY) == QUEST_STATUS_INCOMPLETE)
    {
        if(pLeviroth = pPlayer->FindNearestCreature(NPC_LEVIROTH, 20.0f)) 
        {
            if(pLeviroth->isAlive())
            {
                uint32 dmg = 0;
                if(pLeviroth->GetHealth() >= (HP_LEVIROTH * 0.90)) // deal 92% damege to creature if HP >= 90% (to left ~6k HP to creature)
                {
                    dmg = pLeviroth->GetHealth() * 0.92;
                    pPlayer->CastSpell(pLeviroth, SPELL_IMPALE_LEVIROTH, true);
                    pPlayer->DealDamage(pLeviroth, dmg);
                    pLeviroth->AI()->AttackStart(pPlayer);
                    return false;
                } else
                    return true; 
            } else
                pPlayer->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND2, pItem,NULL);
        } else
            pPlayer->SendEquipError(EQUIP_ERR_OUT_OF_RANGE, pItem, NULL);
    } else
        pPlayer->SendEquipError(EQUIP_ERR_ITEM_LOCKED ,pItem, NULL);
    return true;
 }

/*#####
# item_Oculus_of_the_Exorcist
#####*/
enum the_hunt_is_on
{
    QUEST_THE_HUNT_IS_ON                = 11794,
    //SPELL_AURA_RIGHTEOUS_VISION         = 46078,
    SPELL_FORM                          = 29406,
    NPC_TOM_HEGGER                      = 25827,
    NPC_GUARD_MITCHELLS                 = 25828,
    NPC_JOHN_THORPE                     = 25248
};

bool ItemUse_item_Oculus_of_the_Exorcist(Player* pPlayer, Item* pItem, const SpellCastTargets &pTargets)
{
    Creature* pCreature;

    if ((pPlayer->GetQuestStatus(QUEST_THE_HUNT_IS_ON) == QUEST_STATUS_INCOMPLETE)/* && pPlayer->HasAura(SPELL_AURA_RIGHTEOUS_VISION)*/)
    {
        if (pCreature = pPlayer->FindNearestCreature(NPC_TOM_HEGGER, 15.0))
        {
            pCreature->setFaction(7);
            pCreature->CastSpell(pCreature, SPELL_FORM, true);
        }
        else if (pCreature = pPlayer->FindNearestCreature(NPC_GUARD_MITCHELLS, 15.0))
        {
            pCreature->setFaction(7);
            pCreature->CastSpell(pCreature, SPELL_FORM, true);
        }
        else if (pCreature = pPlayer->FindNearestCreature(NPC_JOHN_THORPE, 15.0))
        {
            pCreature->setFaction(7);
            pCreature->CastSpell(pCreature, SPELL_FORM, true);
        }
        return false;
    }
    
    return true;
}

/*#####
# item_Gnomish_Army_Knife
#####*/

bool ItemUse_item_gnomish_knife(Player* pPlayer, Item* pItem, SpellCastTargets const& targets)
{
    uint32 itemId = pItem->GetEntry();
    if (itemId == 40772)
        if (pPlayer->GetBaseSkillValue(SKILL_ENGINERING) >= 350)
            return false;

    debug_log("TSCR: Player attempt to use item %u, but did not meet engineering requirement",itemId);
    pPlayer->SendEquipError(EQUIP_ERR_ERR_CANT_EQUIP_SKILL,pItem,NULL);
    return true;
}

/*#####
# item_blood_gem
#####*/

bool ItemUse_item_blood_gem(Player* pPlayer, Item* pItem, SpellCastTargets const& targets)
{
    if (targets.getUnitTarget() && targets.getUnitTarget()->GetTypeId()==TYPEID_UNIT && (targets.getUnitTarget()->GetMaxHealth() < 35) && targets.getUnitTarget()->GetEntry() == 26411)
        return false;

    pPlayer->SendEquipError(EQUIP_ERR_YOU_CAN_NEVER_USE_THAT_ITEM,pItem,NULL);
    return true;
}

/*#####
# item_frost_gem
#####*/

bool ItemUse_item_frost_gem(Player* pPlayer, Item* pItem, SpellCastTargets const& targets)
{
    if (targets.getUnitTarget() && targets.getUnitTarget()->GetTypeId()==TYPEID_UNIT && (targets.getUnitTarget()->GetMaxHealth() < 35) && targets.getUnitTarget()->GetEntry() == 26283)
        return false;

    pPlayer->SendEquipError(EQUIP_ERR_YOU_CAN_NEVER_USE_THAT_ITEM,pItem,NULL);
    return true;
}

/*#####
# item_unholy_gem
#####*/

bool ItemUse_item_unholy_gem(Player* pPlayer, Item* pItem, SpellCastTargets const& targets)
{
    if (targets.getUnitTarget() && targets.getUnitTarget()->GetTypeId()==TYPEID_UNIT && (targets.getUnitTarget()->GetMaxHealth() < 35) && targets.getUnitTarget()->GetEntry() == 26926)
        return false;

    pPlayer->SendEquipError(EQUIP_ERR_YOU_CAN_NEVER_USE_THAT_ITEM,pItem,NULL);
    return true;
}
/*################
Anchorite Relic ##
##################
*/
#define ANCHORITE_RELIC  31772
#define QUEST_FIL_SPIRITS 10909
#define NPC_TOTEM_BINARY    22444

bool ItemUse_item_anchorite_relic(Player* pPlayer, Item* pItem, const SpellCastTargets &pTargets)
{
    if ((pPlayer->GetQuestStatus(QUEST_FIL_SPIRITS) == QUEST_STATUS_INCOMPLETE)/* && pPlayer->HasAura(SPELL_AURA_RIGHTEOUS_VISION)*/)
    {
       if (Creature *pTotem = pPlayer->SummonCreature(NPC_TOTEM_BINARY,pPlayer->GetPositionX()+15, pPlayer->GetPositionY()+15, pPlayer->GetPositionZ(), 0, TEMPSUMMON_CORPSE_DESPAWN, 100000))
           pTotem->SetReactState(REACT_PASSIVE);
	   
       return false;
    }
 return true;
}


	
	
	
void AddSC_item_scripts()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "item_only_for_flight";
    newscript->pItemUse = &ItemUse_item_only_for_flight;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_draenei_fishing_net";
    newscript->pItemUse = &ItemUse_item_draenei_fishing_net;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_nether_wraith_beacon";
    newscript->pItemUse = &ItemUse_item_nether_wraith_beacon;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_flying_machine";
    newscript->pItemUse = &ItemUse_item_flying_machine;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_gor_dreks_ointment";
    newscript->pItemUse = &ItemUse_item_gor_dreks_ointment;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_incendiary_explosives";
    newscript->pItemUse = &ItemUse_item_incendiary_explosives;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_mysterious_egg";
    newscript->pItemExpire = &ItemExpire_item_mysterious_egg;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_disgusting_jar";
    newscript->pItemExpire = &ItemExpire_item_disgusting_jar;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_harvesters_gift";
    newscript->pItemUse = &ItemUse_item_harvesters_gift;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_pile_fake_furs";
    newscript->pItemUse = &ItemUse_item_pile_fake_furs;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_petrov_cluster_bombs";
    newscript->pItemUse = &ItemUse_item_petrov_cluster_bombs;
    newscript->RegisterSelf();
	
    newscript = new Script;
    newscript->Name = "item_dehta_trap_smasher";
    newscript->pItemUse = &ItemUse_item_dehta_trap_smasher;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "item_elune_cundle";
    newscript->pItemUse = &ItemUse_item_elune_cundle;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "small_rocket";
    newscript->pItemUse = &ItemUse_small_rocket;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "rocket_cluster";
    newscript->pItemUse = &ItemUse_rocket_cluster;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_trident_of_nazjan";
    newscript->pItemUse = &ItemUse_item_Trident_of_Nazjan;
     newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_oculus_of_the_exorcist";
    newscript->pItemUse = &ItemUse_item_Oculus_of_the_Exorcist;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_gnomish_knife";
    newscript->pItemUse = &ItemUse_item_gnomish_knife;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_blood_gem";
    newscript->pItemUse = &ItemUse_item_blood_gem;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "item_frost_gem";
    newscript->pItemUse = &ItemUse_item_frost_gem;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "item_unholy_gem";
    newscript->pItemUse = &ItemUse_item_unholy_gem;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "item_anchorite_relic";
    newscript->pItemUse = &ItemUse_item_anchorite_relic;
    newscript->RegisterSelf();
}
