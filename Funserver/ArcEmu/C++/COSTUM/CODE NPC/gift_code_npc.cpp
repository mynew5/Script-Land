/*
made by Hanfer
for IDK? god? education? your mom? this guy from wow studio?
*/

#include "ScriptPCH.h"
#include <cstring>

std::string sqlcode;
int used;
int id;
bool gotit = true;

#define ITEM_GIFT 44050 //item id of gift


//the crapy code:
class gift_code_npc : public CreatureScript
{
public:
            gift_code_npc()
            : CreatureScript("gift_code_npc")
        {
        }

        bool OnGossipHello(Player* player, Creature* creature)
        {
                                player->PlayerTalkClass->GetGossipMenu().AddMenuItem(5,"Bitte gib jetzt deinen Code ein!",GOSSIP_SENDER_MAIN, 10, "", 0, true);
                                player->ADD_GOSSIP_ITEM(0, "Bye Bye!", GOSSIP_SENDER_MAIN, 99);
                                player->PlayerTalkClass->SendGossipMenu(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
        return true;
        }
		
        bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action)
        {
                if (sender == GOSSIP_SENDER_MAIN)
                {
                player->PlayerTalkClass->ClearMenus();

                        switch(action)
                        {

                        case 99:
                            player->CLOSE_GOSSIP_MENU();
                            player->GetSession()->SendNotification("Bye Bye!");
                        break;


                        }
                    }

        return true;
        }

        bool OnGossipSelectCode(Player* player, Creature* /*creature*/, uint32 sender, uint32 action, const char* code)
        {
            player->PlayerTalkClass->ClearMenus();
            if (sender == GOSSIP_SENDER_MAIN)
            {
                switch (action)
                {
                case 10:

                    QueryResult result;

                    result = WorldDatabase.Query("SELECT `code`, `used`, `id` FROM `codes`"); //get codes from sql

                    if(result)
                    {
                        do
                        {

                                Field *fields = result->Fetch();
                                sqlcode = fields[0].GetString();
                                used = fields[1].GetInt32();
                                id = fields[2].GetInt32();

                                if(sqlcode == code){
                                    //gotit = false; has to be in if (?!? donno)
                                    if(used == 0)
                                    {
                                        gotit = false;
                                        QueryResult exec;
                                        exec = WorldDatabase.PQuery("UPDATE codes SET used = '1' WHERE id = %u", id); //set code to used
                                        player->AddItem(ITEM_GIFT, 1);                                                //get your present
                                        player->GetSession()->SendNotification("Glückwunsch!");
                                        player->CLOSE_GOSSIP_MENU();

                                    }else{
                                        gotit = false;
                                        player->GetSession()->SendNotification("Dieser Code wurde schon einmal verwendet.!");//ha! got you! don't use it twice!
                                        player->CLOSE_GOSSIP_MENU();

                                    }

                                }

                        } while (result->NextRow());
                        if(gotit){
                            player->GetSession()->SendNotification("Code nicht gefunden!");                            //Are you kidding me?
                            player->CLOSE_GOSSIP_MENU();                                                               // Sometimes i want to punch people over TCP!
                        }

                        return true;

                    }



                    player->CLOSE_GOSSIP_MENU();

                    return true;
                }
            }

            return false;
        }


};

void AddSC_gift_code_npc()
{
        new gift_code_npc();
}
