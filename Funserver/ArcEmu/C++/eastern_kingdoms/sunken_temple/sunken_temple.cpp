/* ScriptData
SDName: Sunken_Temple
SD%Complete: 100
SDComment: Area Trigger + Puzzle event support
Support for Quest: 8733
SDCategory: Sunken Temple
EndScriptData */

/* ContentData
at_malfurion_Stormrage_trigger
EndContentData */

#include "ScriptedPch.h"
#include "sunken_temple.h"

/*#####
# at_malfurion_Stormrage_trigger
#####*/
/*
bool AreaTrigger_at_malfurion_stormrage(Player* pPlayer, const AreaTriggerEntry *at)
{
    if (ScriptedInstance* pInstance = pPlayer->GetInstanceData())
    {
        if (!pPlayer->FindNearestCreature(15362,15))
            pPlayer->SummonCreature(15362, pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(), -1.52, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 100000);
        return false;
    }
return false;
}
*/

enum iSunkenQuests
{
    QUEST_THE_CHARGE_OF_DRAGONFLIGHTS = 8555,
    QUEST_ERANIKUS_TYRANT_OF_DREAMS   = 8733
};

bool AreaTrigger_at_malfurion_stormrage(Player* pPlayer, const AreaTriggerEntry *at)
{
    if (ScriptedInstance* pInstance = pPlayer->GetInstanceData())
    {
        //Only do stuff, if the player has finished the PreQuest
        if (pPlayer->GetQuestRewardStatus(QUEST_THE_CHARGE_OF_DRAGONFLIGHTS) &&
            !pPlayer->GetQuestRewardStatus(QUEST_ERANIKUS_TYRANT_OF_DREAMS) &&
            pPlayer->GetQuestStatus(QUEST_ERANIKUS_TYRANT_OF_DREAMS) != QUEST_STATUS_COMPLETE)
        {
            if (pInstance->GetData(TYPE_MALFURION) != DONE)
            {
                pPlayer->SummonCreature(NPC_MALFURION, -639.378723, -4.238533, -90.835098, 2.724664, TEMPSUMMON_DEAD_DESPAWN, 0);
                pInstance->SetData(TYPE_MALFURION, DONE);
            }
        }
    }
    return false;
}

enum eMalfurion
{
    EMOTE_MALFURION1              = -1109000,
    SAY_MALFURION1                = -1109001,
    SAY_MALFURION2                = -1109002,
    SAY_MALFURION3                = -1109003,
    SAY_MALFURION4                = -1109004,

    MAX_MALFURION_TEMPLE_SPEECHES = 6
};

struct npc_malfurionAI : public ScriptedAI
{
    npc_malfurionAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_uiSpeech   = 0;
        m_uiSayTimer = 0;
        me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
    }

    uint32 m_uiSayTimer;
    uint32 m_uiSpeech;

    void Reset() {}
    void UpdateAI(const uint32 uiDiff)
    {
        // we are in Sunken Temple
        if (me->GetMap()->IsDungeon())
        {
            if (m_uiSpeech < MAX_MALFURION_TEMPLE_SPEECHES)
            {
                if (m_uiSayTimer <= uiDiff)
                {
                    switch (m_uiSpeech)
                    {
                        case 0:
                            DoScriptText(EMOTE_MALFURION1, me);
                            m_uiSayTimer = 1500;
                            break;
                        case 1:
                            me->HandleEmoteCommand(EMOTE_ONESHOT_BOW);
                            m_uiSayTimer = 2000;
                            break;
                        case 2:
                            DoScriptText(SAY_MALFURION1, me);
                            m_uiSayTimer = 1000;
                            break;
                        case 3:
                            DoScriptText(SAY_MALFURION2, me);
                            m_uiSayTimer = 1000;
                            break;
                        case 4:
                            DoScriptText(SAY_MALFURION3, me);
                            m_uiSayTimer = 2000;
                            break;
                        case 5:
                            DoScriptText(SAY_MALFURION4, me);
                            me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                            break;
                    }

                    ++m_uiSpeech;
                }
                else
                    m_uiSayTimer -= uiDiff;
            }
        }
    }
};

CreatureAI* GetAI_npc_malfurion(Creature* pCreature)
{
    return new npc_malfurionAI(pCreature);
}

/*#####
# go_atalai_statue
#####*/

bool GOHello_go_atalai_statue(Player* pPlayer, GameObject* pGo)
{
    ScriptedInstance* pInstance = pPlayer->GetInstanceData();
    if (!pInstance)
        return false;
    pInstance->SetData(EVENT_ATALAI_STATE,pGo->GetEntry());

    return false;
}

void AddSC_sunken_temple()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "at_malfurion_stormrage";
    newscript->pAreaTrigger = &AreaTrigger_at_malfurion_stormrage;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_malfurion_stormrage";
    newscript->GetAI = &GetAI_npc_malfurion;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_atalai_statue";
    newscript->pGOHello = &GOHello_go_atalai_statue;
    newscript->RegisterSelf();
}
