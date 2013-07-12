--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NPC_GossipHello(pUnit, event, pPlayer)
	pUnit:GossipCreateMenu(100, pPlayer, 0)
	pUnit:GossipMenuAddItem(0, "Brokentoe Event", 1, 0)
	pUnit:GossipMenuAddItem(0, "Twin Event", 2, 0)
	pUnit:GossipSendMenu(pPlayer)
end
 
function NPC_GossipSelect(pUnit, event, pPlayer, id, intid, code)
	if(intid == 1) then
		pUnit:SpawnCreature(18069, -704.385620, 7875.663086, 45.374313, 2.016115, 31, 300000, 0 , 0,  0, 1, 0)
	elseif(intid == 2) then
	end
	pPlayer:GossipComplete()
end
 
RegisterUnitGossipEvent(18471, 1, NPC_GossipHello)
RegisterUnitGossipEvent(18471, 2, NPC_GossipSelect)