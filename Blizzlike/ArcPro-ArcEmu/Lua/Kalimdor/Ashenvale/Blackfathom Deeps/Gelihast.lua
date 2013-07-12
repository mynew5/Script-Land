--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Gelihast_OnCombat(pUnit, event)
	pUnit:RegisterEvent("Net", 7000, 0)
end
 
function Net(pUnit, Event)
	pUnit:FullCastSpellOnTarget(6533, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Net", 7000, 0)
end
 
function Gelihast_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Gelihast_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(6243, 1, "Gelihast_OnCombat")
RegisterUnitEvent(6243, 2, "Gelihast_OnLeaveCombat")
RegisterUnitEvent(6243, 4, "Gelihast_OnDeath")