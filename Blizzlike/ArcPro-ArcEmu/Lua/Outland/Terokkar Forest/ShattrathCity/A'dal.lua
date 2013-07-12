--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Adal_OnCombat(Unit, Event)
	Unit:RegisterEvent("Adal_Ultimate", 1000, 1)
end

function Adal_Ultimate(Unit, Event) 
	Unit:CastSpell(35076) 
end

function Adal_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Adal_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18481, 1, "Adal_OnCombat")
RegisterUnitEvent(18481, 2, "Adal_OnLeaveCombat")
RegisterUnitEvent(18481, 4, "Adal_OnDied")