/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

/* ScriptData
SDName: Zulfarrak
SD%Complete: 80
SDComment: 
SDCategory: Zul'Farrak
EndScriptData */

/* ContentData
npc_sergeant_bly
npc_weegli_blastfuse
EndContentData */

#include "ScriptedPch.h"
#include "def_zulfarrak.h"

/*######
## npc_sergeant_bly
######*/

enum blyAndCrewFactions
{
    FACTION_HOSTILE           = 14,
    FACTION_FRIENDLY          = 35, //while in cages (so the trolls won't attack them while they're caged)
    FACTION_FREED            = 250  //after release (so they'll be hostile towards trolls)
};


#define GOSSIP_BLY                  "[PH] In that case, I will take my reward!"

struct npc_sergeant_blyAI : public ScriptedAI
{
    enum blySays
    {
        SAY_1 = -1209002,
        SAY_2 = -1209003
    };

    enum blySpells
    {
        SPELL_SHIELD_BASH          = 11972,
        SPELL_REVENGE              = 12170
    };

    npc_sergeant_blyAI(Creature *c) : ScriptedAI(c)
    {
        m_pInstance = c->GetInstanceData();
        postGossipStep = 0;
    }

    uint32 postGossipStep;
    uint32 Text_Timer;

    ScriptedInstance* m_pInstance;

    uint32 ShieldBash_Timer;
    uint32 Revenge_Timer;                                   //this is wrong, spell should never be used unless me->getVictim() dodge, parry or block attack. Trinity support required.
    uint64 gossipPlayerGUID;

    void Reset()
    {
        ShieldBash_Timer = 5000;
        Revenge_Timer = 8000;

        me->setFaction(FACTION_FRIENDLY);
    }

    void EnterCombat(Unit *who){}

    void JustDied(Unit *victim){}

    void UpdateAI(const uint32 diff)
    {
        if (postGossipStep>0 && postGossipStep<4){
            if (Text_Timer<diff){
                switch (postGossipStep)
                {
                    case 1:
                        //weegli doesn't fight - he goes & blows up the door
                        if (Creature* weegli = m_pInstance->instance->GetCreature(m_pInstance->GetData64(ENTRY_WEEGLI)))
                        {
                            weegli->AI()->DoAction();
                        }
                        DoScriptText(SAY_1,me);
                        Text_Timer = 5000;
                        break;
                    case 2:
                        DoScriptText(SAY_2,me);
                        Text_Timer = 5000;
                        break;
                    case 3:
                        me->setFaction(FACTION_HOSTILE);
                        if (Player* target = Player::GetPlayer(gossipPlayerGUID)){
                            AttackStart(target);
                        }
                        
                        if (m_pInstance)
                        {
                            switchFactionIfAlive(m_pInstance, ENTRY_RAVEN);
                            switchFactionIfAlive(m_pInstance, ENTRY_ORO);
                            switchFactionIfAlive(m_pInstance, ENTRY_MURTA);
                        }
                }
                postGossipStep++;
            } else Text_Timer -= diff;
        }

        if (!UpdateVictim())
            return;

        if (ShieldBash_Timer < diff)
        {
            DoCast(me->getVictim(), SPELL_SHIELD_BASH);
            ShieldBash_Timer = 15000;
        }else ShieldBash_Timer -= diff;

        if (Revenge_Timer < diff)
        {
            DoCast(me->getVictim(), SPELL_REVENGE);
            Revenge_Timer = 10000;
        }else Revenge_Timer -= diff;

        DoMeleeAttackIfReady();
    }

    void DoAction(const int32 param) {
        postGossipStep=1;
        Text_Timer = 0;
    }

    void switchFactionIfAlive(ScriptedInstance* pInstance,uint32 entry){
       if (Creature* crew = pInstance->instance->GetCreature(pInstance->GetData64(entry)))
       {
           if (crew->isAlive()){
                crew->setFaction(FACTION_HOSTILE);
           }
       }
    }

};

CreatureAI* GetAI_npc_sergeant_bly(Creature* pCreature)
{
    return new npc_sergeant_blyAI (pCreature);
}

bool GossipHello_npc_sergeant_bly(Player* pPlayer, Creature* pCreature)
{
    if (ScriptedInstance* pInstance = pCreature->GetInstanceData())
    {
        if (pInstance->GetData(EVENT_PYRAMID) == PYRAMID_KILLED_ALL_TROLLS)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_BLY, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            pPlayer->SEND_GOSSIP_MENU(1517, pCreature->GetGUID());
        }
        else if (pInstance->GetData(EVENT_PYRAMID) == PYRAMID_NOT_STARTED)
            pPlayer->SEND_GOSSIP_MENU(1515, pCreature->GetGUID());
        else
            pPlayer->SEND_GOSSIP_MENU(1516, pCreature->GetGUID());
        return true;
    }
    return false;
}

bool GossipSelect_npc_sergeant_bly(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        CAST_AI(npc_sergeant_blyAI,pCreature->AI())->gossipPlayerGUID = pPlayer->GetGUID();
        pCreature->AI()->DoAction();
    }
    return true;
}

/*######
+## go_troll_cage
+######*/

void initBlyCrewMember(ScriptedInstance* pInstance, uint32 entry,float x,float y, float z){
   if (Creature* crew = pInstance->instance->GetCreature(pInstance->GetData64(entry)))   {
        crew->SetReactState(REACT_AGGRESSIVE);
        crew->AddUnitMovementFlag(MOVEMENTFLAG_WALK_MODE);
        crew->SetHomePosition(x,y,z,0);
        crew->GetMotionMaster()->MovePoint(1,x,y,z);
        crew->setFaction(FACTION_FREED);
    }
}

bool GOHello_go_troll_cage(Player* pPlayer, GameObject* pGo)
{
    if (ScriptedInstance* pInstance = pGo->GetInstanceData())
    {
        pInstance->SetData(EVENT_PYRAMID, PYRAMID_CAGES_OPEN);
        //set bly & co to aggressive & start moving to top of stairs
        initBlyCrewMember(pInstance,ENTRY_BLY,1884.99,1263,41.52);
        initBlyCrewMember(pInstance,ENTRY_RAVEN,1882.5,1263,41.52);
        initBlyCrewMember(pInstance,ENTRY_ORO,1886.47,1270.68,41.68);
        initBlyCrewMember(pInstance,ENTRY_WEEGLI,1890,1263,41.52);
        initBlyCrewMember(pInstance,ENTRY_MURTA,1891.19,1272.03,41.60);
    }
    return false;
}


/*######
## npc_weegli_blastfuse
######*/

#define GOSSIP_WEEGLI               "[PH] Please blow up the door."

struct npc_weegli_blastfuseAI : public ScriptedAI
{
    enum weegliSpells
    {
        SPELL_BOMB                 = 8858,
        SPELL_GOBLIN_LAND_MINE     = 21688,
        SPELL_SHOOT                = 6660,
        SPELL_WEEGLIS_BARREL       = 10772
    };

    enum weegliSays
    {
        SAY_WEEGLI_OHNO = -1209000,
        SAY_WEEGLI_OK_I_GO = -1209001
    };

    uint32 Bomb_Timer;
    uint32 LandMine_Timer;
    bool destroyingDoor;
    ScriptedInstance* m_pInstance;

    npc_weegli_blastfuseAI(Creature *c) : ScriptedAI(c)
    {
        m_pInstance = c->GetInstanceData();
        destroyingDoor=false;
        Bomb_Timer = 10000;
        LandMine_Timer = 30000;
    }

    void Reset()
    {
        /*if (pInstance)
            pInstance->SetData(0, NOT_STARTED);*/
    }

    void AttackStart(Unit *victim)
    {
        AttackStartCaster(victim,10);//keep back & toss bombs/shoot
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;

        if (Bomb_Timer < diff )
        {
            DoCast(me->getVictim(),SPELL_BOMB);
            Bomb_Timer = 10000;
        }else Bomb_Timer -= diff;

        if (me->isAttackReady() && !me->IsWithinMeleeRange(me->getVictim()))
        {
            DoCast(me->getVictim(),SPELL_SHOOT);
            me->SetSheath(SHEATH_STATE_RANGED);
        } else {
            me->SetSheath(SHEATH_STATE_MELEE);
            DoMeleeAttackIfReady();
        }
    }

    void MovementInform(uint32 type, uint32 id)
    {
        if (m_pInstance)
        {
            if (m_pInstance->GetData(EVENT_PYRAMID) == PYRAMID_CAGES_OPEN)
            {
                m_pInstance->SetData(EVENT_PYRAMID,PYRAMID_ARRIVED_AT_STAIR);
                DoScriptText(SAY_WEEGLI_OHNO,me);
                me->SetHomePosition(1882.69,1272.28,41.87,0);
            } else if (destroyingDoor)
            {
                m_pInstance->DoUseDoorOrButton(m_pInstance->GetData64(GO_END_DOOR));
                //TODO: leave the area...
                me->ForcedDespawn();
            };
        }
    }

    void DoAction(const int32 param) {
        DestroyDoor();
    }

    void DestroyDoor() 
    {
        if (me->isAlive())
        {
            me->setFaction(FACTION_FRIENDLY);
            me->GetMotionMaster()->MovePoint(0, 1858.57,1146.35,14.745);
            me->SetHomePosition(1858.57,1146.35,14.745,3.85); // in case he gets interrupted
            DoScriptText(SAY_WEEGLI_OK_I_GO,me);
            destroyingDoor=true;
        }
    }
};

CreatureAI* GetAI_npc_weegli_blastfuse(Creature* pCreature)
{
    return new npc_weegli_blastfuseAI (pCreature);
}

bool GossipHello_npc_weegli_blastfuse(Player* pPlayer, Creature* pCreature)
{
    if (ScriptedInstance* pInstance = pCreature->GetInstanceData())
    {
        switch (pInstance->GetData(EVENT_PYRAMID))
        {
            case PYRAMID_KILLED_ALL_TROLLS:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_WEEGLI, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                pPlayer->SEND_GOSSIP_MENU(1514, pCreature->GetGUID());  //if event can proceed to end
                break;
            case PYRAMID_NOT_STARTED:
                pPlayer->SEND_GOSSIP_MENU(1511, pCreature->GetGUID());  //if event not started        
                break;
            default:
                pPlayer->SEND_GOSSIP_MENU(1513, pCreature->GetGUID());  //if event are in progress
        }
        return true;
    } 
    return false;
}

bool GossipSelect_npc_weegli_blastfuse(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        //here we make him run to door, set the charge and run away off to nowhere
        pCreature->AI()->DoAction();
    }
    return true;
}

/*######
## go_shallow_grave
######*/

enum {
    ZOMBIE = 7286,
    DEAD_HERO = 7276,
    ZOMBIE_CHANCE = 65,
    DEAD_HERO_CHANCE = 10
};

bool GOHello_go_shallow_grave(Player* pPlayer, GameObject* pGo)
{
    // randomly summon a zombie or dead hero the first time a grave is used
    if (pGo->GetUseCount() == 0)
    {
        uint32 randomchance = urand(0,100);
        if (randomchance < ZOMBIE_CHANCE)
            pGo->SummonCreature(ZOMBIE, pGo->GetPositionX(), pGo->GetPositionY(), pGo->GetPositionZ(), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
        else if ((randomchance-ZOMBIE_CHANCE) < DEAD_HERO_CHANCE)
            pGo->SummonCreature(DEAD_HERO, pGo->GetPositionX(), pGo->GetPositionY(), pGo->GetPositionZ(), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
    }
    pGo->AddUse();
    return false;
}

/*######
## at_zumrah
######*/

enum zumrahConsts
{
    ZUMRAH_ID = 7271,
    ZUMRAH_HOSTILE_FACTION = 37
};

bool AreaTrigger_at_zumrah(Player* pPlayer, const AreaTriggerEntry *at)
{
    Creature* Zumrah = pPlayer->FindNearestCreature(ZUMRAH_ID, 30.0f);

    if (!Zumrah)
        return false;

    Zumrah->setFaction(ZUMRAH_HOSTILE_FACTION);
    Zumrah->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);
    return true;
}

void AddSC_zulfarrak()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="npc_sergeant_bly";
    newscript->GetAI = &GetAI_npc_sergeant_bly;
    newscript->pGossipHello =  &GossipHello_npc_sergeant_bly;
    newscript->pGossipSelect = &GossipSelect_npc_sergeant_bly;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_weegli_blastfuse";
    newscript->GetAI = &GetAI_npc_weegli_blastfuse;
    newscript->pGossipHello =  &GossipHello_npc_weegli_blastfuse;
    newscript->pGossipSelect = &GossipSelect_npc_weegli_blastfuse;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="go_shallow_grave";
    newscript->pGOHello = &GOHello_go_shallow_grave;
    newscript->RegisterSelf();

	newscript = new Script;
    newscript->Name = "at_zumrah";
    newscript->pAreaTrigger = &AreaTrigger_at_zumrah;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_troll_cage";
    newscript->pGOHello = &GOHello_go_troll_cage;
    newscript->RegisterSelf();

}
