--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
logcol(10)
logcol(7)

function Teleport_TeleportOnViewAllIcc(pUnit, event, player)
	pUnit:GossipObjectCreateMenu(4259, player, 0)
	pUnit:GossipMenuAddItem(0, "The Lower Citadel", 3, 0)
	pUnit:GossipMenuAddItem(0, "The Spire", 6, 0)
	pUnit:GossipMenuAddItem(0, "Rampart of Skulls", 4, 0)
	pUnit:GossipMenuAddItem(0, "The Frost Queen' Lair", 7, 0)
	pUnit:GossipMenuAddItem(0, "Deathbringer' Rise", 5, 0)
	pUnit:GossipMenuAddItem(0, "The Upper Reaches", 2 ,0)
	pUnit:GossipMenuAddItem(0, "Royal Quaters", 8, 0)
	pUnit:GossipMenuAddItem(0, "The Frozen Throne", 9, 0)
	pUnit:GossipSendMenu(player)
end

function GossipOnSelectAllIcc(Unit, Event, player, id, intid, code, pMisc)
	if(intid == 1) then
		player:Teleport(631, 4356.93, 2769.41, 355.955)
	elseif(intid == 2) then
		player:Teleport(631, 4199.35, 2769.42, 350.977)
	elseif(intid == 3) then
		player:Teleport(631, -17.0711, 2211.47, 30.0546)
	elseif(intid == 4) then
		player:Teleport(631, -615.146, 2211.47, 199.909)
	elseif(intid == 5) then
		player:Teleport(631, -549.073, 2211.29, 539.223)
	elseif(intid == 6) then
		player:Teleport(631, -503.593, 2211.47, 62.7621)
	elseif(intid == 7) then
		player:Teleport(631, 4356.58, 2565.75, 220.402)
	elseif(intid == 8) then
		player:Teleport(631, 4582.67, 2769.32, 400.14)
	elseif(intid == 9) then
		player:Teleport(631, 541.037537, -2080.644775, 1064.325439)
	elseif(intid == 10) then
		player:Teleport(631, 4356.58, 2565.75, 220.402)
	end
	player:GossipComplete()
end

RegisterGameObjectEvent(202223, 4, "Teleport_TeleportOnViewAllIcc")
RegisterGOGossipEvent(202223, 2, "GossipOnSelectAllIcc")
RegisterGameObjectEvent(202235, 4, "Teleport_TeleportOnViewAllIcc")
RegisterGOGossipEvent(202235, 2, "GossipOnSelectAllIcc")
RegisterGameObjectEvent(202242, 4, "Teleport_TeleportOnViewAllIcc")
RegisterGOGossipEvent(202242, 2, "GossipOnSelectAllIcc")
RegisterGameObjectEvent(202243, 4, "Teleport_TeleportOnViewAllIcc")
RegisterGOGossipEvent(202243, 2, "GossipOnSelectAllIcc")
RegisterGameObjectEvent(202244, 4, "Teleport_TeleportOnViewAllIcc")
RegisterGOGossipEvent(202244, 2, "GossipOnSelectAllIcc")
RegisterGameObjectEvent(202245, 4, "Teleport_TeleportOnViewAllIcc")
RegisterGOGossipEvent(202245, 2, "GossipOnSelectAllIcc")
RegisterGameObjectEvent(202246, 4, "Teleport_TeleportOnViewAllIcc")
RegisterGOGossipEvent(202246, 2, "GossipOnSelectAllIcc")