#include "npc_vipmaster.h"   // Add the header file

//##############################################################
//                   .:: ESCORT AI SECTION::.
//##############################################################
struct npc_vipmasterAI : public npc_escortAI
{
    npc_vipmasterAI(Creature* pCreature) : npc_escortAI(pCreature)    {}

    uint32 ChatTimer;
    uint32 PrivateTimer;
    uint32 RepairTimer;
    bool   GoRepair;

    void WaypointReached(uint32 uiWP)
    {}

    void MovementInform(uint32 uiMoveType, uint32 uiPointId)    //Called, when the npc reach a waypoint (I use intentionally this instead WaypointReached)
    {
        switch(uiPointId)
        {
        case 6:
            if (me->GetGUIDLow() == sWorld.getConfig(CONFIG_VIP_H_GUID) && urand(0,4))
                GoRepair = true;                                // Go to the repair point
            else
            {
                npc_escortAI::MovementInform(uiMoveType, uiPointId);
                ++CWP;
            }
            break;

         case 7:
            if (me->GetGUIDLow() == sWorld.getConfig(CONFIG_VIP_A_GUID) && urand(0,4))
                GoRepair = true;                                // Go to the repair point
            else
            {
                npc_escortAI::MovementInform(uiMoveType, uiPointId);
                ++CWP;
            }
            break;
        case REPAIR_POINT:                                      // When the npc arrive to the repair point
            RepairTimer = 30000;
            ChatTimer = urand(10000,20000);
            me->SetUInt32Value(UNIT_NPC_EMOTESTATE,233);
            break;
        case POINT_HOME:
            CWP = WL.begin();
            npc_escortAI::MovementInform(uiMoveType, uiPointId);
            break;
        default:                                                // Any other point
            npc_escortAI::MovementInform(uiMoveType, uiPointId);
            ++CWP;
            break;
        }
    }


    void Reset()
    {
        PrivateTimer = 40000;
        RepairTimer  = 30001;
        ChatTimer    = urand(10000,20000);
        GoRepair     = false;
        if (me->GetGUIDLow() == sWorld.getConfig(CONFIG_VIP_H_GUID))
        {
            
            AddWaypoint(1,  1571.1, -4416.2,  7.1);   // If the escorting is enabled the npc uses these coords, so
            AddWaypoint(2,  1566.6, -4416.5,  7.5);   // if you don't like this path, you can modify it
            AddWaypoint(3,  1560.1, -4406.7,  7.2);
            AddWaypoint(4,  1560.7, -4387.8,  3.9);
            AddWaypoint(5,  1584.7, -4349.8,  1.0);
            AddWaypoint(6,  1605.6, -4334.7,  1.7);
            AddWaypoint(7,  1624.0, -4330.3,  2.2);
            AddWaypoint(8,  1630.0, -4327.2,  1.5);
            AddWaypoint(9,  1639.5, -4319.0,  0.8);
            AddWaypoint(10, 1650.6, -4308.0,  0.9);   // ############################
            AddWaypoint(11, 1659.6, -4302.4,  1.2);   //         IN ORGRIMMAR
            AddWaypoint(12, 1676.3, -4298.2,  3.3);   // ############################
            AddWaypoint(13, 1687.1, -4298.6,  6.5);
            AddWaypoint(14, 1700.6, -4309.2, 12.5);
            AddWaypoint(15, 1712.5, -4324.4, 20.0);
            AddWaypoint(16, 1718.6, -4338.2, 25.4);
            AddWaypoint(17, 1718.6, -4360.3, 27.8);
            AddWaypoint(18, 1717.3, -4362.8, 27.7);
            AddWaypoint(19, 1694.0, -4379.1, 24.6);
            AddWaypoint(20, 1686.4, -4386.6, 24.1);
            AddWaypoint(21, 1678.9, -4391.6, 21.0);
            AddWaypoint(22, 1664.0, -4403.5, 18.4);
            AddWaypoint(23, 1651.4, -4407.1, 17.6);
            AddWaypoint(24, 1649.3, -4406.6, 17.6);
            AddWaypoint(25, 1636.2, -4400.5, 16.5);
            AddWaypoint(26, 1627.1, -4399.6, 12.8);
            AddWaypoint(27, 1615.5, -4395.3, 10.5);
            AddWaypoint(28, 1605.4, -4391.8, 10.1);   
            AddWaypoint(29, 1595.9, -4398.8,  7.3);
            AddWaypoint(30, 1587.1, -4402.0,  5.4);
            AddWaypoint(31, 1579.8, -4406.3,  5.8);
            AddWaypoint(32, 1578.4, -4417.2,  8.0, 60000);  // The last value (60000 sec) shows the waiting time at home location
        }
        
        if (me->GetGUIDLow() == sWorld.getConfig(CONFIG_VIP_A_GUID))
        {
            AddWaypoint(1 , -8867.0, 650.5,  96.0);
            AddWaypoint(2 , -8867.6, 639.8,  95.8);
            AddWaypoint(3 , -8872.5, 632.7,  95.7);
            AddWaypoint(4 , -8862.3, 603.5,  92.2);
            AddWaypoint(5 , -8849.6, 597.2,  92.5);   // ############################
            AddWaypoint(6 , -8829.9, 619.5,  94.0);   //         IN STORMWIND
            AddWaypoint(7 , -8795.4, 591.4,  97.5);   // ############################
            AddWaypoint(8 , -8767.3, 611.1,  97.2);
            AddWaypoint(9 , -8758.8, 629.6, 102.3);
            AddWaypoint(10, -8763.5, 654.5, 103.7);
            AddWaypoint(11, -8785.5, 682.5, 102.7);
            AddWaypoint(12, -8800.7, 687.0, 101.6);
            AddWaypoint(13, -8853.9, 661.6,  97.0, 60000);  // The last value (60000 sec) shows the waiting time at home location
        }
        Start(false, false, 0, 0, true, true);
        CWP = WL.begin();
        me->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP+UNIT_NPC_FLAG_VENDOR);  // Reenable gossip function after start
    }
    
    void UpdateAI(const uint32 uiDiff)
    {
        npc_escortAI::UpdateAI(uiDiff);
        if (HasOpenMenu && RepairTimer == 30001 && CWP != WL.end())    // The npc must stop when a player makes contact with it
        {
            me->GetMotionMaster()->MovementExpired();
        }

        if (GossipPlayer &&
            !me->IsWithinDist2d(GossipPlayer->GetPositionX(),GossipPlayer->GetPositionY(),3.5f) &&
            HasOpenMenu &&
            RepairTimer == 30001)
        {
            HasOpenMenu = false;                    // After the player leaves this place the npc starts move again
            if (CWP != WL.end())
                me->GetMotionMaster()->MovePoint(CWP->id, CWP->x, CWP->y, CWP->z);
        }
        
        if (GoRepair)
        {
            me->GetMotionMaster()->MovementExpired();
            if (me->GetGUIDLow() == sWorld.getConfig(CONFIG_VIP_H_GUID))
                me->GetMotionMaster()->MovePoint(REPAIR_POINT, 1616.7, -4324.2, 2.7);
            if (me->GetGUIDLow() == sWorld.getConfig(CONFIG_VIP_A_GUID))
                me->GetMotionMaster()->MovePoint(REPAIR_POINT, -8820.1, 566.5, 94.5);
            GoRepair = false;
        }

        if (RepairTimer <= uiDiff)
        {
            me->SetUInt32Value(UNIT_NPC_EMOTESTATE,0);
            npc_escortAI::MovementInform(POINT_MOTION_TYPE, CWP->id);
            ++CWP;
            RepairTimer = 30001;
            HasOpenMenu = false;
            sWorld.SendWorldText(90000, 3);
        }
        else if (RepairTimer <= 30000)
        {
            RepairTimer -= uiDiff;
            if (ChatTimer <= uiDiff)
            {
                ChatTimer = 20001;
                if (me->GetGUIDLow() == sWorld.getConfig(CONFIG_VIP_H_GUID))
                    urand(0,1) ? DoScriptText(SAY_REPAIR_1,me) : DoScriptText(SAY_REPAIR_2,me);
                if (me->GetGUIDLow() == sWorld.getConfig(CONFIG_VIP_A_GUID))
                    urand(0,1) ? DoScriptText(SAY_REPAIR_1,me) : DoScriptText(SAY_REPAIR_3,me);
            }
            else if (ChatTimer <= 20000)
                ChatTimer -= uiDiff;
        }

        if (sWorld.getConfig(CONFIG_VIP_VENDOR))
        {
            if (PrivateTimer <= uiDiff)
            {
                Map::PlayerList const &PlayerList = me->GetMap()->GetPlayers();
                if (!PlayerList.isEmpty())
                    for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                        if (Player *pPlayer = i->getSource())
                            if (me->IsWithinDist2d(pPlayer->GetPositionX(), pPlayer->GetPositionY(), 30.0f))
                            {
                                result = CharacterDatabase.PQuery("SELECT `id` FROM `vip_items` WHERE `charname` = '%s'",pPlayer->GetName());
                                if (result)
                                {
                                    srand (time(NULL));
                                    DoScriptText(RAND(SAY_CONTACT_1,SAY_CONTACT_2),me,pPlayer);
                                }
                            }
                PrivateTimer = 40000;
            }
            else
                PrivateTimer -= uiDiff;
        }
    }

    void AddWaypoint(uint32 id, float x, float y, float z, uint32 WaitTimeMs = 0)  // We must inherit this function from
    {                                                                              // npc_escortAI::AddWaypoint that the npc
        npc_escortAI::AddWaypoint(id, x, y, z, WaitTimeMs);                        // can start to go again after contact
        Escort_Waypoint t(id, x, y, z, WaitTimeMs);
        WL.push_back(t);
    }
};

CreatureAI* GetAI_npc_vipmaster(Creature* pCreature)
{
    return new npc_vipmasterAI(pCreature);
}

//##############################################################
//                 .:: GOSSIP MENU SECTION ::.
//##############################################################

void SendMainMenu(Player* pPlayer, Creature* pCreature)   // The npc sends this, when the Character is VIP
{
    // Add main menu choices
    if (sWorld.getConfig(CONFIG_VIP_VENDOR) && pCreature->isVendor())
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

    if (sWorld.getConfig(CONFIG_VIP_INSTA_DEL))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

    if (sWorld.getConfig(CONFIG_VIP_REPAIR))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);

    if (sWorld.getConfig(CONFIG_VIP_WHISP))
    {
        if (pPlayer->isAcceptWhispers())
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);

        else
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);
    }

    if (sWorld.getConfig(CONFIG_VIP_CHAR_SAVE))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_7, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+4);

    
    time_t now;
    now =  time (NULL)+7200;              // Set the current time (We must add 2 hours - 7200 sec -, to
    uint32 day = now / 86400;             // get the correct time but I don't no why... :)
    uint32 hour = now-(day*24*60*60);
    
    if (hour <= 28800)                    // Before 8 o'clock in the morning
        pPlayer->SEND_GOSSIP_MENU(SAY_HELLO_1, pCreature->GetGUID());
    if (hour > 28800 && hour <= 57600)    // Between 8 o'clock and 16 o'clock (Working time)
        pPlayer->SEND_GOSSIP_MENU(SAY_HELLO_2, pCreature->GetGUID());
    if (hour > 57600 && hour <= 72000)    // Between 16 o'clock and 20 o'clock (Afternoon siesta)
        pPlayer->SEND_GOSSIP_MENU(SAY_HELLO_4, pCreature->GetGUID());
    if (hour > 72000)                    // After 20 o'clock (Prepare to the sleeping)
        pPlayer->SEND_GOSSIP_MENU(SAY_HELLO_3, pCreature->GetGUID());
}

void NoGmMenu(Player* pPlayer, Creature* pCreature)   // If the Character isn't VIP, we send this function
{
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_9, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+9);
    pPlayer->SEND_GOSSIP_MENU(SAY_NOGM_HELLO, pCreature->GetGUID());
}

bool GossipHello_npc_vipmaster(Player* pPlayer, Creature* pCreature)   // Called when the Player makes contact with npc
{
    if (sWorld.getConfig(CONFIG_VIP_ESCORT))
    {
        HasOpenMenu = true;                 // These two variables are only needed if EscortAI is enabled
        GossipPlayer = pPlayer;
    }

    if (pPlayer->GetSession()->GetSecurity() > SEC_PLAYER)
    {
        if (sWorld.getConfig(CONFIG_VIP_ITEM))
            result = CharacterDatabase.PQuery("SELECT `vip_items`.`id` FROM `vip_items` WHERE `charname` = '%s' LIMIT 1", pPlayer->GetName());
        if (result)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_10, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+10);
            pPlayer->SEND_GOSSIP_MENU(RAND(SAY_GET_PACKET_1,SAY_GET_PACKET_2), pCreature->GetGUID());
        }
        else
        {
            SendMainMenu(pPlayer, pCreature);
        }
    }
    else
    {
        NoGmMenu(pPlayer, pCreature);
    }
    return true;
}

bool GossipSelect_npc_vipmaster(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiAction)
    {
        case GOSSIP_ACTION_TRADE: pPlayer->SEND_VENDORLIST(pCreature->GetGUID()); break;

        case GOSSIP_ACTION_INFO_DEF+1:
            for (uint8 i = 0; i < MAX_DIFFICULTY; ++i)
            {
                Player::BoundInstancesMap &binds = pPlayer->GetBoundInstances(Difficulty(i));
                for (Player::BoundInstancesMap::iterator itr = binds.begin(); itr != binds.end();)
                {
                    if(itr->first != pPlayer->GetMapId())
                    {
                        pPlayer->UnbindInstance(itr, Difficulty(i));
                    }
                    else
                        ++itr;
                }
            }
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_6, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+6);
            pPlayer->SEND_GOSSIP_MENU(SAY_INSTA_DEL, pCreature->GetGUID());
        break;

        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->DurabilityRepairAll(false, 0, false);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_6, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+6);
            pPlayer->SEND_GOSSIP_MENU(SAY_REPAIR, pCreature->GetGUID());
        break;

        case GOSSIP_ACTION_INFO_DEF+3:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_6, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+6);
            if (pPlayer->isAcceptWhispers())
            {
                pPlayer->SetAcceptWhispers(false);
                pPlayer->SEND_GOSSIP_MENU(SAY_WHISP_OFF, pCreature->GetGUID());
            }
            else
            {
                pPlayer->SetAcceptWhispers(true);
                pPlayer->SEND_GOSSIP_MENU(SAY_WHISP_ON, pCreature->GetGUID());
            }            
        break;

        case GOSSIP_ACTION_INFO_DEF+4:
            pPlayer->SaveToDB();
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_6, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+6);
            pPlayer->SEND_GOSSIP_MENU(SAY_SAVE, pCreature->GetGUID());
        break;

        case GOSSIP_ACTION_INFO_DEF+5:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_8, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+8);
            pPlayer->SEND_GOSSIP_MENU(SAY_NEED_MONEY, pCreature->GetGUID());
        break;
        
        case GOSSIP_ACTION_INFO_DEF+6: SendMainMenu(pPlayer, pCreature); break;

        case GOSSIP_ACTION_INFO_DEF+8: pPlayer->SEND_GOSSIP_MENU(SAY_LOOK_THE_WEB, pCreature->GetGUID()); break;

        case GOSSIP_ACTION_INFO_DEF+9: pPlayer->CLOSE_GOSSIP_MENU(); break;

        case GOSSIP_ACTION_INFO_DEF+10:
            Field *fields = result->Fetch();
            uint16 id = fields[0].GetUInt16();
            result = CharacterDatabase.PQuery("SELECT itemid FROM vip_items WHERE id = '%u'",id);
            if (result)
            {
                fields = result->Fetch();
                ItemPosCountVec sDest;
                uint32 noSpaceForCount = 0;
                int32 count = 1;
                uint8 msg = pPlayer->CanStoreNewItem( NULL_BAG, NULL_SLOT, sDest,fields[0].GetUInt32(), count, &noSpaceForCount);
                if (msg != EQUIP_ERR_OK)
                    count -= noSpaceForCount;

                if( count == 0 || sDest.empty()) 
                {
                    pPlayer->SendEquipError(EQUIP_ERR_INVENTORY_FULL,0,0);
                    pPlayer->CLOSE_GOSSIP_MENU();
                    break;
                }
                Item* item = pPlayer->StoreNewItem(sDest, fields[0].GetUInt32(), true,
                                                   Item::GenerateItemRandomPropertyId(fields[0].GetUInt32()));
                pPlayer->SendNewItem(item,1,true,false);
            }
            CharacterDatabase.PExecute("DELETE FROM `vip_items` WHERE `id` = '%i'",id);
            pPlayer->CLOSE_GOSSIP_MENU();
        break;
    }
    return true;
}

void AddSC_npc_vipmaster()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_vipmaster";
    newscript->pGossipHello = &GossipHello_npc_vipmaster;
    newscript->pGossipSelect = &GossipSelect_npc_vipmaster;

    if (sWorld.getConfig(CONFIG_VIP_ESCORT))        // We only need to use CreatureAI, when the EscortAI is enabled,
        newscript->GetAI = &GetAI_npc_vipmaster;    // because we only use the EscortAI from CreatureAI :)
    newscript->RegisterSelf();
}