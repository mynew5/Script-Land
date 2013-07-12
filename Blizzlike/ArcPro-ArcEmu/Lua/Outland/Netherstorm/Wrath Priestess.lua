--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Priestess_OnCombat(Unit, Event)
	Unit:RegisterEvent("Priestess_Rain", 9000, 0)
end

function Priestess_Rain(Unit, Event) 
	Unit:CastSpell(34017) 
end

function Priestess_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Priestess_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18859, 1, "Priestess_OnCombat")
RegisterUnitEvent(18859, 2, "Priestess_OnLeaveCombat")
RegisterUnitEvent(18859, 4, "Priestess_OnDied")