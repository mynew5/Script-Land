--By Domicroat of ac-web.org
--TODO: Make requirements for the portals

--[[function On_Gossip(Unit, event, player)
	Unit:GossipCreateMenu(100, player, 0)
	Unit:GossipMenuAddItem(0,"Light's Hammer", 1, 0)
	Unit:GossipMenuAddItem(0,"Oratory of the Damned", 2, 0)
	Unit:GossipMenuAddItem(0,"Rampart of Skulls", 3, 0)
	Unit:GossipMenuAddItem(0,"Deathbringer's Rise", 4, 0)
	Unit:GossipMenuAddItem(0,"The Plagueworks", 5, 0)
	Unit:GossipMenuAddItem(0,"The Crimson Hall", 6, 0)
	Unit:GossipMenuAddItem(0,"The Frostwing Halls", 7, 0)
	Unit:GossipMenuAddItem(0,"The Frost Queen's Lair", 8, 0)
	Unit:GossipSendMenu(player)
end

function Gossip_Submenus(Unit, event, player, id, intid, code)
	if(intid == 0) then
		Unit:GossipCreateMenu(101, player, 0)
		Unit:GossipMenuAddItem(0,"Light's Hammer", 1, 0)
		Unit:GossipMenuAddItem(0,"Oratory of the Damned", 2, 0)
		Unit:GossipMenuAddItem(0,"Rampart of Skulls", 3, 0)
		Unit:GossipMenuAddItem(0,"Deathbringer's Rise", 4, 0)
		Unit:GossipMenuAddItem(0,"The Plagueworks", 5, 0)
		Unit:GossipMenuAddItem(0,"The Crimson Hall", 6, 0)
		Unit:GossipMenuAddItem(0,"The Frostwing Halls", 7, 0)
		Unit:GossipMenuAddItem(0,"The Frost Queen's Lair", 8, 0)
		Unit:GossipSendMenu(player)
	end
		elseif(intid == 1) then
			player:Teleport(631, -17.856115, 2211.640137, 30.115812)
		elseif(intid == 2) then
			player:Teleport(631, -503.632599, 2211.219971, 62.823246)
		elseif(intid == 3) then
			player:Teleport(631, -615.098267, 2211.509766, 199.973083)
		elseif(intid == 4) then
			player:Teleport(631, -549.151001, 2211.463967, 539.290222)
		elseif(intid == 5) then
			player:Teleport(631, 4356.780273, 2863.636230, 349.337982)
		elseif(intid == 6) then
			player:Teleport(631, 4453.248535, 2769.325684, 349.347473)
	elseif(intid == 7) then
		player:Teleport(631, 4356.853516, 2674.143311, 349.340118)
	else
		player:Teleport(631, 4356.527344, 2402.710205, 220.462723)
	end
end
RegisterUnitGossipEvent(, 1, "On_Gossip")
RegisterUnitGossipEvent(, 2, "Gossip_Submenus")]]--