--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Veronia_OnCombat(Unit, Event)
	Unit:RegisterEvent("Veronia_Fight", 8000, 0)
end

function Veronia_Fight(Unit, Event) 
	Unit:CastSpell(34905) 
end

function Veronia_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Veronia_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20162, 1, "Veronia_OnCombat")
RegisterUnitEvent(20162, 2, "Veronia_OnLeaveCombat")
RegisterUnitEvent(20162, 4, "Veronia_OnDied")