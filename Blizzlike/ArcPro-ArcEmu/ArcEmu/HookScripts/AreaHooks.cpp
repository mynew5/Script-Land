/*
 * ArcScripts2 Scripts for Arcemu MMORPG Server
 * Copyright (C) 2011-2012 ArcScripts2 team
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


#include "Setup.h"

/*************************************************************************************
**************************************************************************************
							   ON AREATRIGGER
**************************************************************************************
**************************************************************************************/


void InvasionPointCataclysm(Player* pPlayer, uint32 AreaTrigger)
{
	QuestLogEntry* en = pPlayer->GetQuestLogForEntry(10766);
	if(en == NULL)
		return;
	pPlayer->SafeTeleport(530, 0, -2723.674561f, 1952.664673f, 146.939743f, 3.185559f);
}

void Scratches(Player* pPlayer, uint32 AreaTrigger)
{
	QuestLogEntry* qle = pPlayer->GetQuestLogForEntry(10556);
	if(qle == NULL)
		return;

	Creature*  Kaliri = pPlayer->GetMapMgr()->GetInterface()->GetCreatureNearestCoords(pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(), 21468);
	if(Kaliri == NULL)
		return;

	Kaliri->Despawn(0, 0);
	qle->SetMobCount(0, qle->GetMobCount(0) + 1);
	qle->SendUpdateAddKill(0);
	qle->UpdatePlayerFields();
}

//=========================================================================================

void scriptOnAreaTrigger(Player* pPlayer, uint32 AreaTrigger)
{
	switch(AreaTrigger)
	{
		case 4546:
			{
				Scratches(pPlayer, 4546);
			}
			break;
		case 4560:
			{
				InvasionPointCataclysm(pPlayer, 4560);
			}
			break;
	}
}

//=========================================================================================

void SetupOnAreaHooks(ScriptMgr* mgr)
{
	mgr->register_hook(SERVER_HOOK_EVENT_ON_AREATRIGGER, (void*)&scriptOnAreaTrigger);
}
