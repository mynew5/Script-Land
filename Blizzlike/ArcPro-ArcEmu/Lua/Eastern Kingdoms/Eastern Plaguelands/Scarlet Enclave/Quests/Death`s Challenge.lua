--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function initiand_gossipMenu(Unit, Event, pPlayer)
	Unit:GossipCreateMenu(100, pPlayer, 0)
	Unit:GossipMenuAddItem(9, "I urge you to fight!", 1, 0)
	Unit:GossipSendMenu(pPlayer)
end

function initiand_gossipMenu_Selection(Unit, Event, pPlayer, ID, intID)
	if(intid == 1) then
		Unit:SetFaction(14)
		pPlayer:GossipComplete()
		Unit:SendChatMessage(12, 0, "As you wish. Fight me! C'mon!")
	end
end

function initiand_getsAngry(Unit, Event, pPlayer)
	Unit:SetFaction(14)
end

function initiand_coolsDown(Unit, Event, pPlayer)
	Unit:SetFaction(2084)
end

RegisterUnitGossipEvent(28390, 1, "initiand_gossipMenu")
RegisterUnitGossipEvent(28390, 2, "initiand_gossipMenu_Selection")
RegisterUnitEvent(28390, 18, "initiand_coolsDown")
RegisterUnitEvent(28390, 2, "initiand_coolsDown")
RegisterUnitEvent(28390, 3, "initiand_coolsDown")
RegisterUnitEvent(28390, 4, "initiand_coolsDown")

RegisterUnitGossipEvent(28391, 1, "initiand_gossipMenu")
RegisterUnitGossipEvent(28391, 2, "initiand_gossipMenu_Selection")
RegisterUnitEvent(28391, 18, "initiand_coolsDown")
RegisterUnitEvent(28391, 2, "initiand_coolsDown")
RegisterUnitEvent(28391, 3, "initiand_coolsDown")
RegisterUnitEvent(28391, 4, "initiand_coolsDown")

RegisterUnitGossipEvent(28392, 1, "initiand_gossipMenu")
RegisterUnitGossipEvent(28392, 2, "initiand_gossipMenu_Selection")
RegisterUnitEvent(28392, 18, "initiand_coolsDown")
RegisterUnitEvent(28392, 2, "initiand_coolsDown")
RegisterUnitEvent(28392, 3, "initiand_coolsDown")
RegisterUnitEvent(28392, 4, "initiand_coolsDown")

RegisterUnitGossipEvent(28393, 1, "initiand_gossipMenu")
RegisterUnitGossipEvent(28393, 2, "initiand_gossipMenu_Selection")
RegisterUnitEvent(28393, 18, "initiand_coolsDown")
RegisterUnitEvent(28393, 2, "initiand_coolsDown")
RegisterUnitEvent(28393, 3, "initiand_coolsDown")
RegisterUnitEvent(28393, 4, "initiand_coolsDown")

RegisterUnitGossipEvent(28394, 1, "initiand_gossipMenu")
RegisterUnitGossipEvent(28394, 2, "initiand_gossipMenu_Selection")
RegisterUnitEvent(28394, 18, "initiand_coolsDown")
RegisterUnitEvent(28394, 2, "initiand_coolsDown")
RegisterUnitEvent(28394, 3, "initiand_coolsDown")
RegisterUnitEvent(28394, 4, "initiand_coolsDown")

RegisterUnitGossipEvent(28406, 1, "initiand_gossipMenu")
RegisterUnitGossipEvent(28406, 2, "initiand_gossipMenu_Selection")
RegisterUnitEvent(28406, 18, "initiand_coolsDown")
RegisterUnitEvent(28406, 2, "initiand_coolsDown")
RegisterUnitEvent(28406, 3, "initiand_coolsDown")
RegisterUnitEvent(28406, 4, "initiand_coolsDown")