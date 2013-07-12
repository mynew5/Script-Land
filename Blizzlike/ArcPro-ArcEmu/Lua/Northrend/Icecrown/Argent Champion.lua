--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
-- Temporary Script

function Gossiper_GossipHello(pUnit, event, player)
	pUnit:GossipCreateMenu(100, player, 0)
	pUnit:GossipMenuAddItem(10, "I'm ready to fight!", 1, 0)
	pUnit:GossipSendMenu(player)
end
	
function Gossiper_OnGossipSelect(pUnit, event, player, intid, id, code, pMisc)
	if(intid == 1) then
		pUnit:SetFaction(14)
		player:GossipComplete()
	end
end

RegisterUnitGossipEvent(33707, 1, Gossiper_GossipHello)
RegisterUnitGossipEvent(33707, 2, Gossiper_OnGossipSelect)