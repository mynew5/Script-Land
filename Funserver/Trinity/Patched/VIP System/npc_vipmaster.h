#include "World.h"
#include "Mail.h"
#include "ObjectMgr.h"
#include "ScriptedEscortAI.h"
#include <cstring>
enum Says
{
    SAY_CONTACT_1    = -1999998,
    SAY_CONTACT_2    = -1999997,
    SAY_REPAIR_1     = -1999996,
    SAY_REPAIR_2     = -1999995,
    SAY_REPAIR_3     = -1999994
};

enum Texts
{
	SAY_INSTA_DEL    = 900000,
    SAY_HELLO_1      = 900001,
    SAY_HELLO_2      = 900002,
    SAY_HELLO_3      = 900003,
	SAY_HELLO_4      = 900011,
	SAY_REPAIR       = 900004,
	SAY_WHISP_OFF    = 900005,
	SAY_WHISP_ON     = 900006,
	SAY_SAVE         = 900007,
	SAY_NOGM_HELLO   = 900008,
	SAY_NEED_MONEY   = 900009,
	SAY_LOOK_THE_WEB = 900010,
	SAY_GET_PACKET_1 = 900012,
    SAY_GET_PACKET_2 = 900013
};

enum ePoints
{
    POINT_HOME          = 0xFFFFFE
};

#define GOSSIP_ITEM_1   "Instance mentes feloldasa"
#define GOSSIP_ITEM_2   "Felszereles javitasa"
#define GOSSIP_ITEM_3   "Whisperek tiltasa"
#define GOSSIP_ITEM_4   "Whisperek engedelyezese"
#define GOSSIP_ITEM_5   "Igenybevenni a szolgaltatasaidat"
#define GOSSIP_ITEM_6   "Vissza"
#define GOSSIP_ITEM_7   "Karakter mentese"
#define GOSSIP_ITEM_8   "Hogyan fizethetek?"
#define GOSSIP_ITEM_9   "Semmit, csak bekoszontem"
#define GOSSIP_ITEM_10  "Atveszem koszi"

#define REPAIR_POINT    100

QueryResult_AutoPtr result;
Player* GossipPlayer;
Player* null;
bool HasOpenMenu;
std::list<Escort_Waypoint> WL;
std::list<Escort_Waypoint>::iterator CWP;