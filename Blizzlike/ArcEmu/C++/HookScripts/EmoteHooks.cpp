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
							   ON EMOTE
**************************************************************************************
**************************************************************************************/


void InnkeeperFlex(Player* pPlayer, Unit* pUnit)
{
	if(pUnit->GetEntry() == 6740)
	{
		QuestLogEntry* qle = pPlayer->GetQuestLogForEntry(8356);
		if(qle == NULL)
			return;

		qle->SetMobCount(0, qle->GetMobCount(0) + 1);
		qle->SendUpdateAddKill(0);
		qle->UpdatePlayerFields();
	}
	else if(pUnit->GetEntry() == 6929)
	{
		QuestLogEntry* qle = pPlayer->GetQuestLogForEntry(8359);
		if(qle == NULL)
			return;

		qle->SetMobCount(0, qle->GetMobCount(0) + 1);
		qle->SendUpdateAddKill(0);
		qle->UpdatePlayerFields();
	}
}

void InnkeeperDance(Player* pPlayer, Unit* pUnit)
{
	if(pUnit->GetEntry() == 6735)
	{
		QuestLogEntry* qle = pPlayer->GetQuestLogForEntry(8357);
		if(qle == NULL)
			return;

		qle->SetMobCount(0, qle->GetMobCount(0) + 1);
		qle->SendUpdateAddKill(0);
		qle->UpdatePlayerFields();
	}
	else if(pUnit->GetEntry() == 6746)
	{
		QuestLogEntry* qle = pPlayer->GetQuestLogForEntry(8360);
		if(qle == NULL)
			return;

		qle->SetMobCount(0, qle->GetMobCount(0) + 1);
		qle->SendUpdateAddKill(0);
		qle->UpdatePlayerFields();
	}
}

void InnkeeperTrain(Player* pPlayer, Unit* pUnit)
{
	if(pUnit->GetEntry() == 6826)
	{
		QuestLogEntry* qle = pPlayer->GetQuestLogForEntry(8355);
		if(qle == NULL)
			return;

		qle->SetMobCount(0, qle->GetMobCount(0) + 1);
		qle->SendUpdateAddKill(0);
		qle->UpdatePlayerFields();
	}
	else if(pUnit->GetEntry() == 11814)
	{
		QuestLogEntry* qle = pPlayer->GetQuestLogForEntry(8358);
		if(qle == NULL)
			return;

		qle->SetMobCount(0, qle->GetMobCount(0) + 1);
		qle->SendUpdateAddKill(0);
		qle->UpdatePlayerFields();
	}
}

void InnkeeperChicken(Player* pPlayer, Unit* pUnit)
{
	if(pUnit->GetEntry() == 5111)
	{
		QuestLogEntry* qle = pPlayer->GetQuestLogForEntry(8353);
		if(qle == NULL)
			return;

		qle->SetMobCount(0, qle->GetMobCount(0) + 1);
		qle->SendUpdateAddKill(0);
		qle->UpdatePlayerFields();
	}
	else if(pUnit->GetEntry() == 6741)
	{
		QuestLogEntry* qle = pPlayer->GetQuestLogForEntry(8354);
		if(qle == NULL)
			return;

		qle->SetMobCount(0, qle->GetMobCount(0) + 1);
		qle->SendUpdateAddKill(0);
		qle->UpdatePlayerFields();
	}
}

void CatrinaDance(Player* pPlayer, Unit* pUnit)
{
	if(pUnit->GetEntry() == 34383)
	{
		if(!pPlayer->HasAura(65386))
			pUnit->CastSpell(pPlayer, 65386, true);

		if(!pPlayer->GetAchievementMgr().HasCompleted(3456))
			pPlayer->GetAchievementMgr().GMCompleteAchievement(NULL, achievementID);
	}
}

//=========================================================================================

void scriptOnEmote(Player* pPlayer, uint32 Emote, Unit* pUnit)
{
	pUnit = pPlayer->GetMapMgr()->GetUnit(pPlayer->GetSelection());
	if(!pUnit || !pUnit->isAlive() || pUnit->GetAIInterface()->getNextTarget())
		return;

	switch(Emote)
	{
		case EMOTE_ONESHOT_FLEX: InnkeeperFlex(pPlayer, pUnit); break;
		case EMOTE_STATE_DANCE:
			InnkeeperDance(pPlayer, pUnit);
			CatrinaDance(pPlayer, pUnit);
			break;
		case EMOTE_ONESHOT_TRAIN: InnkeeperTrain(pPlayer, pUnit); break;
		case EMOTE_ONESHOT_CHICKEN: InnkeeperChicken(pPlayer, pUnit); break;
	}
}

void mOnEmote(Player *pPlayer, uint32 Emote, Unit *pUnit)
{
	if(!pUnit || pUnit->IsDead() || pUnit->CombatStatus.IsInCombat() || !pUnit->GetAIInterface())
		return;

	switch(Emote)
	{
		case EMOTE_ONESHOT_SALUTE:
		case EMOTE_ONESHOT_WAVE:
		case EMOTE_ONESHOT_KISS:
			if(pUnit->GetAIInterface()->m_isGuard)
			{
				if(Emote == EMOTE_ONESHOT_KISS)
					Emote = EMOTE_ONESHOT_BOW;

				if(RandomUInt(100) <= 33 && pPlayer->GetStandingRank( pUnit->m_factionDBC->ID ) >= STANDING_FRIENDLY)
					pUnit->Emote(static_cast<EmoteType>(Emote));
			}
			break;
	}
}

void SetupOnEmoteHooks(ScriptMgr* mgr)
{
	mgr->register_hook(SERVER_HOOK_EVENT_ON_EMOTE, &scriptOnEmote);
	mgr->register_hook(SERVER_HOOK_EVENT_ON_EMOTE, &mOnEmote);
}
