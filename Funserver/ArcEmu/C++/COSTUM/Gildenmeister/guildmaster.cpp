
#include "ScriptPCH.h"
#include "ScriptMgr.h"

extern WorldDatabaseWorkerPool WorldDatabase;

#define MSG_GOSSIP_TELE          "Teleport zum Gildenhaus."
#define MSG_GOSSIP_BUY           "Gildenhaus kaufen (Kostet 150000 Gold)."
#define MSG_GOSSIP_SELL          "Gildenhaus f\303\274r 50000 Gold) verkaufen."
#define MSG_GOSSIP_NEXTPAGE      "Weiter."
#define MSG_INCOMBAT             "Du kannst dich nicht teleportieren, solange du dich im Kampf befindest."
#define MSG_NOGUILDHOUSE         "Deine Gilde besitzt momentan kein Gildenhaus."
#define MSG_NOFREEGH             "Momentan gibt es keine freien Gildenh\303\244user mehr."
#define MSG_ALREADYHAVEGH        "Eure Gilde besitzt bereits ein Gildenhaus (%s)."
#define MSG_NOTENOUGHMONEY       "Du besitzt nicht genug Gold um dir ein Gildenhaus zu kaufen."
#define MSG_GHOCCUPIED           "Dieses Gildenhaus kann nicht gekauft werden, da es momentan schon benutzt wird."
#define MSG_CONGRATULATIONS      "Gl\303\274ckwunsch! Du hast soeben ein Gildenhaus erworben."
#define MSG_SOLD                 "Du hast dein Gildenhaus erfolgreich verkauft. Hier ist dein Gold."
#define MSG_NOTINGUILD           "Du musst einer Gilde angeh\303\266ren um ein Gildenhaus kaufen zu k\303\266nnen."

#define CODE_SELL                "VERKAUFEN"
#define MSG_CODEBOX_SELL         "Tippe \"" CODE_SELL "\" in das Feld, um dein Gildenhaus zu verkaufen."

#define OFFSET_GH_ID_TO_ACTION   1500
#define OFFSET_SHOWBUY_FROM      10000

#define ACTION_TELE              1001
#define ACTION_SHOW_BUYLIST      1002  
#define ACTION_SELL_GUILDHOUSE   1003

#define ICON_GOSSIP_BALOON       0
#define ICON_GOSSIP_WING         2
#define ICON_GOSSIP_BOOK         3
#define ICON_GOSSIP_WHEEL1       4
#define ICON_GOSSIP_WHEEL2       5
#define ICON_GOSSIP_GOLD         6
#define ICON_GOSSIP_BALOONDOTS   7
#define ICON_GOSSIP_TABARD       8
#define ICON_GOSSIP_XSWORDS      9

#define GHBUY_COST 150000 * GOLD  //150000 g.
#define GHSELL_COST 50000 * GOLD  //50000 g.

#define GOSSIP_COUNT_MAX         10


class guildmaster : public CreatureScript
{
    public:

        guildmaster()
            : CreatureScript("guildmaster")
        {
        }

        struct guildmasterAI : public ScriptedAI
        {
            guildmasterAI(Creature *c) : ScriptedAI(c) {}   
        }; 


bool isPlayerGuildLeader(Player *player)
{
	return (player->GetRank() == 0) && (player->GetGuildId() != 0);
}

bool getGuildHouseCoords(uint32 guildId, float &x, float &y, float &z, uint32 &map)
{
	if (guildId == 0)
	{
		return false;
	}

	QueryResult result;
	result = WorldDatabase.PQuery("SELECT `x`, `y`, `z`, `map` FROM `guildhouses` WHERE `guildId` = %u", guildId);
	if (result)
	{
		Field *fields = result->Fetch();
		x = fields[0].GetFloat();
		y = fields[1].GetFloat();
		z = fields[2].GetFloat();
		map = fields[3].GetUInt32();
		return true;
	}
	return false;
}

void teleportPlayerToGuildHouse(Player *player, Creature* pCreature)
{
	if (player->GetGuildId() == 0)
	{
		pCreature->MonsterWhisper(MSG_NOTINGUILD, player->GetGUID());
		return;
	}

	if (!player->getAttackers().empty())
	{
		pCreature->MonsterSay(MSG_INCOMBAT, LANG_UNIVERSAL, player->GetGUID());
		return;
	}

	float x, y, z;
	uint32 map;

	if (getGuildHouseCoords(player->GetGuildId(), x, y, z, map))
	{
		player->TeleportTo(map, x, y, z, 0.0f);
	}
	else
		pCreature->MonsterWhisper(MSG_NOGUILDHOUSE, player->GetGUID());

}

bool showBuyList(Player *player, Creature* pCreature, uint32 showFromId = 0)
{

	QueryResult result;
	result = WorldDatabase.PQuery("SELECT `id`, `comment` FROM `guildhouses` WHERE `guildId` = 0 AND `id` > %u ORDER BY `id` ASC LIMIT %u",
		showFromId, GOSSIP_COUNT_MAX);

	if (result)
	{
		uint32 guildhouseId = 0;
		std::string comment = "";
		do
		{

			Field *fields = result->Fetch();

			guildhouseId = fields[0].GetInt32();
			comment = fields[1].GetString();
			
			player->ADD_GOSSIP_ITEM(ICON_GOSSIP_TABARD, comment, GOSSIP_SENDER_MAIN,
				guildhouseId + OFFSET_GH_ID_TO_ACTION);

		} while (result->NextRow());

		if (result->GetRowCount() == GOSSIP_COUNT_MAX)
		{
			player->ADD_GOSSIP_ITEM(ICON_GOSSIP_BALOONDOTS, MSG_GOSSIP_NEXTPAGE, GOSSIP_SENDER_MAIN, 
				guildhouseId + OFFSET_SHOWBUY_FROM);
		}

		
		player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, pCreature->GetGUID());

		return true;
	} else
	{
		if (showFromId = 0)
		{
			pCreature->MonsterWhisper(MSG_NOFREEGH, player->GetGUID());
			player->CLOSE_GOSSIP_MENU();
		} else
		{
			showBuyList(player, pCreature, 0);
		}
	}

	return false;
}

bool isPlayerHasGuildhouse(Player *player, Creature* pCreature, bool whisper = false)
{

	QueryResult result;

	result = WorldDatabase.PQuery("SELECT `comment` FROM `guildhouses` WHERE `guildId` = %u",
		player->GetGuildId());

	if (result)
	{
		if (whisper)
		{
			Field *fields = result->Fetch();
			char msg[100];
			sprintf(msg, MSG_ALREADYHAVEGH, fields[0].GetString());
			pCreature->MonsterWhisper(msg, player->GetGUID());
		}

		return true;
	}
	return false;

}

void buyGuildhouse(Player *player, Creature* pCreature, uint32 guildhouseId)
{
	if (!player->HasEnoughMoney(GHBUY_COST))
	{
		char msg[100];
		sprintf(msg, MSG_NOTENOUGHMONEY, GHBUY_COST / 10000);
		pCreature->MonsterWhisper(msg, player->GetGUID());
		return;
	}

	if (isPlayerHasGuildhouse(player, pCreature, true))
	{
		char msg[100];
		sprintf(msg, MSG_ALREADYHAVEGH);
		pCreature->MonsterWhisper(msg, player->GetGUID());
		return;
	}

	QueryResult result;

	result = WorldDatabase.PQuery("SELECT `id` FROM `guildhouses` WHERE `id` = %u AND `guildId` <> 0",
		guildhouseId);

	if (result)
	{
		pCreature->MonsterWhisper(MSG_GHOCCUPIED, player->GetGUID());
		return;
	}

	result = WorldDatabase.PQuery("UPDATE `guildhouses` SET `guildId` = %u WHERE `id` = %u",
		player->GetGuildId(), guildhouseId);

	if (result)
		
	/*player->ModifyMoney(-int32(GHBUY_COST));*/
	pCreature->MonsterSay(MSG_CONGRATULATIONS, LANG_UNIVERSAL, player->GetGUID());
	player->ModifyMoney(-1500000000);
	
}

void sellGuildhouse(Player *player, Creature* pCreature)
{
	if (isPlayerHasGuildhouse(player, pCreature))
	{
		QueryResult result;

		result = WorldDatabase.PQuery("UPDATE `guildhouses` SET `guildId` = 0 WHERE `guildId` = %u",
		player->GetGuildId());
		
		if (result)
			
		pCreature->MonsterSay(MSG_SOLD, LANG_UNIVERSAL, player->GetGUID());
		player->ModifyMoney(500000000);
	}
}

CreatureAI* GetAI(Creature* pCreature) const
        {
            return new guildmasterAI(pCreature);
        }

bool OnGossipHello(Player *player, Creature* pCreature)
{
	player->ADD_GOSSIP_ITEM(ICON_GOSSIP_BALOON, MSG_GOSSIP_TELE, 
		GOSSIP_SENDER_MAIN, ACTION_TELE);

	if (isPlayerGuildLeader(player))
	{
		player->ADD_GOSSIP_ITEM(ICON_GOSSIP_GOLD, MSG_GOSSIP_BUY,
			GOSSIP_SENDER_MAIN, ACTION_SHOW_BUYLIST);
		if (isPlayerHasGuildhouse(player, pCreature))
		{
			player->PlayerTalkClass->GetGossipMenu().AddMenuItem(ICON_GOSSIP_GOLD, MSG_GOSSIP_SELL, GOSSIP_SENDER_MAIN, ACTION_SELL_GUILDHOUSE, MSG_CODEBOX_SELL, 0, true);
		}
	}
	player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, pCreature->GetGUID());
	return true;
}


bool OnGossipSelect(Player *player, Creature* pCreature, uint32 sender, uint32 action)
{
	if (sender != GOSSIP_SENDER_MAIN)
		return false;

	switch (action)
	{
		case ACTION_TELE:
			player->CLOSE_GOSSIP_MENU();
			teleportPlayerToGuildHouse(player, pCreature);
			break;
		case ACTION_SHOW_BUYLIST:
			showBuyList(player, pCreature);
			break;
		default:
			if (action > OFFSET_SHOWBUY_FROM)
			{
				showBuyList(player, pCreature, action - OFFSET_SHOWBUY_FROM);
			} else if (action > OFFSET_GH_ID_TO_ACTION)
			{
				player->CLOSE_GOSSIP_MENU();
				buyGuildhouse(player, pCreature, action - OFFSET_GH_ID_TO_ACTION);
			}
			break;
	}
	
	return true;
}

bool OnGossipSelectCode(Player *player, Creature* pCreature,
									  uint32 sender, uint32 action, const char* sCode)
{
    if (sender == GOSSIP_SENDER_MAIN)
    {
        if (action == ACTION_SELL_GUILDHOUSE)
        {
			int i = -1;
			try
			{
				if (strlen(sCode) + 1 == sizeof CODE_SELL)
					i = strcmp(CODE_SELL, sCode);

			} catch(char *str) {sLog->outError(str);}

			if (i == 0)
			{
				sellGuildhouse(player, pCreature);
			}
			player->CLOSE_GOSSIP_MENU();
			return true;
		}
	}
	return false;
}

};

void AddSC_guildmaster()
{
	new guildmaster();
}
