#include "Setup.h"
#include "PvPMgr.h"

PvPStorage *Storage;

void OnKillPlayer(Player * attacker, Player * victim)
{
	bool canRecieve = true;
	PvPMgr *aMgr = Storage->GetMgr(attacker->GetLowGUID(), true);
	PvPMgr *vMgr = Storage->GetMgr(victim->GetLowGUID(), true);
												   
	if(aMgr == NULL || vMgr == NULL)
		return;

	if(vMgr->getHowManyTimesKilled(attacker) == 3)
		canRecieve = false;

	if(aMgr->ChecksPassed(attacker, victim) == false)
	{
		vMgr->CurrentKills = 0;
		return;
	}

	if ( attacker->GetTeam() == victim->GetTeam() )
		return;
	
		aMgr->CurrentKills++;
		vMgr->Killed(attacker);

		switch ( aMgr->CurrentKills )
		{
			case 10 :
			{
				char msg[100];
				sprintf(msg, "|cff00ff00[PvP]|r |cffff0000 10 Kills - %s is on a 10 kill streak!|r", attacker->GetName());
				sWorld.SendWorldWideScreenText(msg);

				if(canRecieve)
				{
					Item * badge = objmgr.CreateItem(29434,attacker); 
					attacker->GetItemInterface()->AddItemToFreeSlot(badge); 
				}

			}
			break;
			case 20 :
			{
				char msg[100];
				sprintf(msg, "|cff00ff00[PvP]|r |cffff0000 20 Kills - %s is on a 20 kill streak!|r", attacker->GetName());
				sWorld.SendWorldWideScreenText(msg);

				if(canRecieve)
				{
					Item * badge = objmgr.CreateItem(29434,attacker); 
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				}
			}
			break;
			case 30:
			{
				char msg[100];
				sprintf(msg, "|cff00ff00[PvP]|r |cffff0000 30 Kills - %s is on a 30 kill streak!|r", attacker->GetName());
				sWorld.SendWorldWideScreenText(msg);

				if(canRecieve)
				{
					Item * badge = objmgr.CreateItem(29434,attacker); 
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				}
				
			}
			break;
			case 40:
			{
				char msg[100];
				sprintf(msg, "|cff00ff00[PvP]|r |cffff0000 40 Kills - %s is on a 40 kill streak!|r", attacker->GetName());
				sWorld.SendWorldWideScreenText(msg);

				if(canRecieve)
				{
					Item * badge = objmgr.CreateItem(29434,attacker); 
					attacker->GetItemInterface()->AddItemToFreeSlot(badge); 
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				}
			}
			break;
			case 50:
			{
				char msg[100];
				sprintf(msg, "|cff00ff00[PvP]|r |cffff0000 50 Kills - %s is on a 50 kill streak!|r", attacker->GetName());
				sWorld.SendWorldWideScreenText(msg);

				if(canRecieve)
				{
					Item * badge = objmgr.CreateItem(29434,attacker); 
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				}

			}
			break;
			case 60:
			{
				char msg[100];
				sprintf(msg, "|cff00ff00[PvP]|r |cffff0000 60 Kills - %s is on a 60 kill streak!|r", attacker->GetName());
				sWorld.SendWorldWideScreenText(msg);

				if(canRecieve)
				{
					Item * badge = objmgr.CreateItem(29434,attacker); 
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				}
			}
			break;
			case 70:
			{
				char msg[100];
				sprintf(msg, "|cff00ff00[PvP]|r |cffff0000 70 Kills - %s is on a 70 kill streak!", attacker->GetName());
				sWorld.SendWorldWideScreenText(msg);

				if(canRecieve)
				{
					Item * badge = objmgr.CreateItem(29434,attacker); 
					attacker->GetItemInterface()->AddItemToFreeSlot(badge); 
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				}
			} 
			break;
			case 80:
			{
				char msg[100];
				sprintf(msg, "|cff00ff00[PvP]|r |cffff0000 80 Kills - %s is on a 80 kill streak!", attacker->GetName());
				sWorld.SendWorldWideScreenText(msg);

				if(canRecieve)
				{
					Item * badge = objmgr.CreateItem(29434,attacker); 
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				}
			}
			break;
			case 90:
			{
				char msg[100];
				sprintf(msg, "|cff00ff00[PvP]|r |cffff0000 90 Kills - %s is on a 90 kill streak!", attacker->GetName());
				sWorld.SendWorldWideScreenText(msg);

				if(canRecieve)
				{
					Item * badge = objmgr.CreateItem(29434,attacker); 
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				}

			}
			break;
			case 100:
			{
				char msg[100];
				sprintf(msg, "|cff00ff00[PvP]|r |cffff0000 100 Kills - %s is on a 100 kill streak!", attacker->GetName());
				sWorld.SendWorldWideScreenText(msg);

				if(canRecieve)
				{
					Item * badge = objmgr.CreateItem(29434,attacker); 
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
					attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				}
			}
			break;
		}

		if(aMgr->CurrentKills > 100 && aMgr->CurrentKills % 10 == 0)
		{

			char msg[100];
			sprintf(msg, "|cff00ff00[PvP]|r |cffff0000 %u Kills - %s is on a %u kill streak!", aMgr->CurrentKills, attacker->GetName(), aMgr->CurrentKills);
			sWorld.SendWorldWideScreenText(msg);

			if(canRecieve)
			{
				Item * badge = objmgr.CreateItem(29434,attacker); 
				attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				attacker->GetItemInterface()->AddItemToFreeSlot(badge);
				attacker->GetItemInterface()->AddItemToFreeSlot(badge);
			}
		}

		Item * soulstone = objmgr.CreateItem(22116,attacker); 
		attacker->GetItemInterface()->AddItemToFreeSlot(soulstone); 
		
}

void SetupPvPSystem(ScriptMgr *mgr)
{
	Storage = PvPStorage::GetInstance();
	mgr->register_hook(SERVER_HOOK_EVENT_ON_KILL_PLAYER, (void*)OnKillPlayer);
}