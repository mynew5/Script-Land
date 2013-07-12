--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Jailor_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Jailor_Presence", 1000, 0)
end

function Jailor_Presence(Unit, Event)
    Unit:CastSpell(36513)
end

function Jailor_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Jailor_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(23008, 1, "Jailor_OnEnterCombat")
RegisterUnitEvent(23008, 2, "Jailor_OnLeaveCombat")
RegisterUnitEvent(23008, 4, "Jailor_OnDied")