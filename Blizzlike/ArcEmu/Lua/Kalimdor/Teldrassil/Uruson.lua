--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Uruson_OnCombat(Unit, Event)
	Unit:RegisterEvent("Uruson_DemoralizingRoar", 10000, 0)
end

function Uruson_DemoralizingRoar(Unit, Event) 
	Unit:CastSpell(15971) 
end

function Uruson_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Uruson_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14428, 1, "Uruson_OnCombat")
RegisterUnitEvent(14428, 2, "Uruson_OnLeaveCombat")
RegisterUnitEvent(14428, 4, "Uruson_OnDied")