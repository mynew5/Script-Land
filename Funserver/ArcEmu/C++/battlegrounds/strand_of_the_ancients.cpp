#include "ScriptedPch.h"
#define GOSSIP_HELLO_DEMO2  "Build demolisher."
#define GOSSIP_HELLO_DEMO3  "Build siege engine."
#define GOSSIP_HELLO_DEMO4  "I cannot build more!"
struct npc_demolisher_salesmanAI : public ScriptedAI
{
    npc_demolisher_salesmanAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        me->SetReactState(REACT_PASSIVE);
		Reset();
    }
	uint32 DemolisherCount;
	uint32 ZaryadCount;
	void Reset()
	{
		DemolisherCount = 0;
		ZaryadCount = 0;
	}
};
CreatureAI* GetAI_npc_demolisher_salesman(Creature* pCreature)
{
    return new npc_demolisher_salesmanAI (pCreature);
}
bool GossipHello_npc_demolisher_salesman(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());
	if(pPlayer->isGameMaster() || pPlayer->GetTeam() == ALLIANCE)
    {
		if(CAST_AI(npc_demolisher_salesmanAI, pCreature->AI())->DemolisherCount<3)
			pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_DEMO2, GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF);
		if(CAST_AI(npc_demolisher_salesmanAI, pCreature->AI())->ZaryadCount<5)
			pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_DEMO3, GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF+1);
    }
    else
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_DEMO4, GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF+9);
    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}
bool GossipSelect_npc_demolisher_salesman(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    pPlayer->CLOSE_GOSSIP_MENU();
    if(pPlayer->isGameMaster() || pPlayer->GetTeam() == ALLIANCE)
    {
        switch(uiAction - GOSSIP_ACTION_INFO_DEF)
        {
            case 0:
				if(pCreature->GetPositionY()<0)
					pCreature->SummonCreature(28781, 1360.81, -322.17, 36.83, 0.32);
				else
					pCreature->SummonCreature(28781, 1353.42, 223.94, 35.24, 4.21);
				CAST_AI(npc_demolisher_salesmanAI, pCreature->AI())->DemolisherCount++;
			break;
            case 1:
				pCreature->SummonGameObject(190753, pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(), 0, 0, 0, 0, 0, 10*MINUTE*IN_MILISECONDS);
				CAST_AI(npc_demolisher_salesmanAI, pCreature->AI())->ZaryadCount++;
			break;
        }
    }
    return true;
}
void AddSC_strand_of_the_ancients()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "npc_demolisher_salesman";
    newscript->GetAI = &GetAI_npc_demolisher_salesman;
    newscript->pGossipHello = &GossipHello_npc_demolisher_salesman;
    newscript->pGossipSelect = &GossipSelect_npc_demolisher_salesman;
    newscript->RegisterSelf();
}
