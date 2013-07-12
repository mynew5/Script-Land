--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NorthseaMercenary_OnCombat(Unit, Event)
	Unit:RegisterEvent("NorthseaMercenary_Crazed", 5000, 1)
end

function NorthseaMercenary_Crazed(Unit, Event) 
	Unit:CastSpell(5915) 
end

function NorthseaMercenary_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NorthseaMercenary_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25839, 1, "NorthseaMercenary_OnCombat")
RegisterUnitEvent(25839, 2, "NorthseaMercenary_OnLeaveCombat")
RegisterUnitEvent(25839, 4, "NorthseaMercenary_OnDied")