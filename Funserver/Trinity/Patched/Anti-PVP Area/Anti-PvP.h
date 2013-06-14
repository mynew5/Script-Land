// Anti-PvP script for the malls


#include "StdAfx.h"
#include "Setup.h"

#define MALL_ZONES 2

static uint32 MallZones[MALL_ZONES] = {394, 0};

void EventKillHandler(PlayerPointer pPlr, PlayerPointer pVictim)
{
    AreaTable * at = dbcArea.LookupEntry(pPlr->GetMapMgr()->GetAreaID(pPlr->GetPositionX(), pPlr->GetPositionY()));
    for(uint32 i = 0; i < MALL_ZONES; i++)
    {
        if( at && at->ZoneId == MallZones[i] )
        {
            char onkick[1024];
            snprintf((char*)onkick, 1024, "%s was kicked from the server for PvPing in the mall.", pPlr->GetName());
            sWorld.SendWorldText(onkick);
            pPlr->BroadcastMessage("You were kicked for PvPing in the mall.");
            pPlr->Kick(5000);
            return;
        }
    }
}
void SetupAntiPvPAtMall(ScriptMgr * mgr)
{
    mgr->register_hook(SERVER_HOOK_EVENT_ON_KILL_PLAYER, &EventKillHandler);
}