--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HumarthePridelord_OnCombat(Unit, Event)
	Unit:RegisterEvent("HumarthePridelord_AgonizingPain", 10000, 0)
end

function HumarthePridelord_AgonizingPain(Unit, Event) 
	Unit:FullCastSpellOnTarget(3247, Unit:GetMainTank()) 
end

function HumarthePridelord_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HumarthePridelord_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5828, 1, "HumarthePridelord_OnCombat")
RegisterUnitEvent(5828, 2, "HumarthePridelord_OnLeaveCombat")
RegisterUnitEvent(5828, 4, "HumarthePridelord_OnDied")