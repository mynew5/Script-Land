--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Lord_OnCombat(Unit, Event)
	Unit:RegisterEvent("Lord_Cleave", 6000, 0)
end

function Lord_Cleave(Unit, Event) 
	Unit:FullCastSpellOnTarget(15496, Unit:GetMainTank()) 
end

function Lord_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Lord_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20929, 1, "Lord_OnCombat")
RegisterUnitEvent(20929, 2, "Lord_OnLeaveCombat")
RegisterUnitEvent(20929, 4, "Lord_OnDied")