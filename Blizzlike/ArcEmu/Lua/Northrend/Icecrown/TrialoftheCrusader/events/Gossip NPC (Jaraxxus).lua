--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BarrettRamseyPartTwo_OnGossipTalk(Unit, Event, Player)
	if((Player:GetPlayerRace() == 1) or (Player:GetPlayerRace() == 3) or (Player:GetPlayerRace() == 4) or (Player:GetPlayerRace() == 7) or (Player:GetPlayerRace() == 11)) then
		Unit:GossipCreateMenu(100, Player, 0)
		Unit:GossipMenuAddItem(0, "We are ready for Wilfred's challenge.", 1, 0)
		Unit:GossipSendMenu(Player)
	elseif((Player:GetPlayerRace() == 2) or (Player:GetPlayerRace() == 5) or (Player:GetPlayerRace() == 6) or (Player:GetPlayerRace() == 8) or (Player:GetPlayerRace() == 10)) then
		Unit:GossipCreateMenu(100, Player, 0)
		Unit:GossipMenuAddItem(0, "We are ready for Wilfred's challenge.", 2, 0)
		Unit:GossipSendMenu(Player)
	end
end

function BarrettRamseyPartTwo_OnGossipSelect(Unit, Event, Player, MenuId, id, Code)
	if(id == 1) then
		Unit:SpawnCreature(360956, 563, 78, 419, 4.4070, 35, 0)
		Unit:Despawn(1, 0)
		Unit:GossipComplete(Player)
	elseif(id == 2) then
		Unit:SpawnCreature(560956, 563, 78, 419, 4.4070, 35, 0)
		Unit:Despawn(1, 0)
		Unit:GossipComplete(Player)
	end
end

RegisterUnitGossipEvent(35035, 1, "BarrettRamseyPartTwo_OnGossipTalk")
RegisterUnitGossipEvent(35035, 2, "BarrettRamseyPartTwo_OnGossipSelect")