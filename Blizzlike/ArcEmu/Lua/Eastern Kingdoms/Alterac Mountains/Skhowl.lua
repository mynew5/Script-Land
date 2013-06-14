--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function skhowl_demo(pUnit, Event)
	pUnit:CastSpell(15971)
end

function skhowl_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("skhowl_demo", 20000, 0)
end

function skhowl_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2452, 1, "skhowl_OnCombat")
RegisterUnitEvent(2452, 2, "skhowl_OnLeaveCombat")