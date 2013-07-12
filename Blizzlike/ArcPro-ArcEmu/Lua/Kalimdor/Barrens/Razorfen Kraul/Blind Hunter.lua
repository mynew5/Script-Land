--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
 
function Blind_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Blind_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4425, 2, "Blind_OnLeaveCombat")
RegisterUnitEvent(4425, 4, "Blind_OnDeath")