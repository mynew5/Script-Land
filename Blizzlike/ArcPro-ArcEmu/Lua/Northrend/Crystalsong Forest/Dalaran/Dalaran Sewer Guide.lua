--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function On_GuideSewer(unit, event, player)
	Unit:GossipCreateMenu(1, player, 0)
	Unit:GossipMenuAddItem(0, "Arena", 2, 0)
	Unit:GossipMenuAddItem(0, "Bank", 3, 0)
	Unit:GossipMenuAddItem(0, "Inn", 4,  0)
	Unit:GossipMenuAddItem(0, "Sewer Exits", 5,  0)
	Unit:GossipMenuAddItem(0, "Vendors", 6, 0)
	Unit:GossipSendMenu(player)
end

function GuideSewer_Submenu(unit, event, player, id, intid, code)
	if(intid == 1) then
		Unit:GossipCreateMenu(16, player, 0)
		Unit:GossipMenuAddItem(0, "Arena", 2, 0)
		Unit:GossipMenuAddItem(0, "Bank", 3, 0)
		Unit:GossipMenuAddItem(0, "Inn", 4,  0)
		Unit:GossipMenuAddItem(0, "Sewer Exits", 5,  0)
		Unit:GossipMenuAddItem(0, "Vendors", 6, 0)
		Unit:GossipSendMenu(player)
	end
		if(intid == 2) then
			player:Teleport(571, 5774.95, 620.42, 565.40)
		end
		if(intid == 3) then
			player:Teleport(571, 5766.31, 731.66, 618.58)
		end
		if(intid == 4) then
			player:Teleport(571, 5761.06, 714.45, 618.54)
		end
	if(intid == 5) then
		Unit:GossipCreateMenu(7, player, 0)
		Unit:GossipMenuAddItem(3, "There are three ways out of the Underbelly: Ramps leading up to the east and west, and the tunnel that drops out of the bottom of dalaran.", 5, 0)
		Unit:GossipMenuAddItem(3, "       ", 5, 0)
		Unit:GossipMenuAddItem(3, "Be sure you can fly before you take that tunnel, of course.", 5, 0)
		Unit:GossipMenuAddItem(3, "       ", 5, 0)
		Unit:GossipMenuAddItem(0, "Eastern Sewer Entrance", 8, 0)
		Unit:GossipMenuAddItem(0, "Western Sewer Entrance", 9, 0)
		Unit:GossipMenuAddItem(0, "Sewer Tunnel", 10, 0)
		Unit:GossipMenuAddItem(0, "[Back]", 1, 0)
		Unit:GossipSendMenu(player)
	end
		if(intid == 6) then
			player:Teleport(571, 5922.34, 567.34, 609.86)
		end
		if(intid == 8) then
			player:Teleport(571, 5801.77, 551.07, 649.27)
		end
		if(intid == 9) then
			player:Teleport(571, 5815.21, 762.65, 640.30)
		end
	if(intid == 10) then
		player:Teleport(571, 5673.50, 838.33, 583.68)
	end
end

RegisterUnitGossipEvent(32726, 2, "GuideSewer_Submenu")
RegisterUnitGossipEvent(32726, 1, "On_GuideSewer")
RegisterUnitGossipEvent(32727, 2, "GuideSewer_Submenu")
RegisterUnitGossipEvent(32727, 1, "On_GuideSewer")
RegisterUnitGossipEvent(32728, 2, "GuideSewer_Submenu")
RegisterUnitGossipEvent(32728, 1, "On_GuideSewer")
RegisterUnitGossipEvent(32729, 2, "GuideSewer_Submenu")
RegisterUnitGossipEvent(32729, 1, "On_GuideSewer")
RegisterUnitGossipEvent(32730, 2, "GuideSewer_Submenu")
RegisterUnitGossipEvent(32730, 1, "On_GuideSewer")
RegisterUnitGossipEvent(32731, 2, "GuideSewer_Submenu")
RegisterUnitGossipEvent(32731, 1, "On_GuideSewer")
RegisterUnitGossipEvent(32732, 2, "GuideSewer_Submenu")
RegisterUnitGossipEvent(32732, 1, "On_GuideSewer")
RegisterUnitGossipEvent(32733, 2, "GuideSewer_Submenu")
RegisterUnitGossipEvent(32733, 1, "On_GuideSewer")