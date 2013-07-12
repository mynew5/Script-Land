--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ghamoora_OnCombat(pUnit, event)
	pUnit:RegisterEvent("Trample", 7000, 0)
end
 
function Trample(pUnit, Event)
	pUnit:CastSpell(5568)
	pUnit:RegisterEvent("Trample", 7000, 0)
end
 
function Ghamoora_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Ghamoora_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4887, 1, "Ghamoora_OnCombat")
RegisterUnitEvent(4887, 2, "Ghamoora_OnLeaveCombat")
RegisterUnitEvent(4887, 4, "Ghamoora_OnDeath")