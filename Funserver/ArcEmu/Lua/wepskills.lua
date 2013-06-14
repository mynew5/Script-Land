--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: InfinityWoW; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local ID = 8 --Replace with NPC's entry ID

function Skills_GossipTalk(pUnit, event, player)
  pUnit:GossipCreateMenu(100, player, 0)
  pUnit:GossipMenuAddItem(10, "Hello there "..player:GetName()..". Im InfinityWoW's epic trainer guy. If you need some skills to train, ask me!",0, 0)
  pUnit:GossipMenuAddItem(10, "|cFF0000A0Max out my weapon skills!",1, 0)
  pUnit:GossipMenuAddItem(10, "|cFF0000A0Learn me Dual-Wield!",3, 0)
  pUnit:GossipMenuAddItem(10, "|cFF0000A0No Thanks!",2, 0)
  pUnit:GossipSendMenu(player)
end

function Skills_GossipSelect(pUnit, event, player, id, intid, code)  
  if(intid == 2) then
    player:GossipComplete()
  end
  if(intid == 1) then
    player:GossipComplete()
    player:SendAreaTriggerMessage("All skills at max Have fun!")
    player:AdvanceSkill(43,1275)
    player:AdvanceSkill(44,1275)
    player:AdvanceSkill(45,1275)
    player:AdvanceSkill(46,1275)
    player:AdvanceSkill(54,1275)
    player:AdvanceSkill(55,1275)
    player:AdvanceSkill(95,1275)
    player:AdvanceSkill(136,1275)
    player:AdvanceSkill(160,1275)
    player:AdvanceSkill(162,1275)
    player:AdvanceSkill(172,1275)
    player:AdvanceSkill(173,1275)
    player:AdvanceSkill(176,1275)
    player:AdvanceSkill(226,1275)
    player:AdvanceSkill(228,1275)
    player:AdvanceSkill(229,1275)
    player:AdvanceSkill(473,1275)
    pUnit:CastSpell(25465)
    pUnit:CastSpell(25465)
  end
  if(intid == 3) then
    if (player:HasSpell(674) == true) then
      player:SendAreaTriggerMessage("You already have Dual-Wield, if it doesnt work try to relog!")
    else
      player:GossipComplete()
      player:UnlearnSpell(674)
      player:LearnSpell(674)
      player:SendAreaTriggerMessage("You Have Learned DUAL-WIELD!")
    end
  end
end

RegisterUnitGossipEvent(ID, 1, "Skills_GossipTalk")
RegisterUnitGossipEvent(ID, 2, "Skills_GossipSelect")
