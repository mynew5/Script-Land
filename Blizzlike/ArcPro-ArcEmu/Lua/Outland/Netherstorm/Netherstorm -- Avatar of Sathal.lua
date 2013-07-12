--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Avatar_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Avatar_Rain", 1000, 0)
    Unit:RegisterEvent("Avatar_Bolt", 3000, 0)
end

function Avatar_Rain(Unit, Event)
    Unit:FullCastSpellOnTarget(34017, Unit:GetClosestPlayer())
end

function Avatar_Bolt(Unit, Event)
    Unit:FullCastSpellOnTarget(12471, Unit:GetClosestPlayer())
end

function Avatar_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Avatar_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21925, 1, "Avatar_OnEnterCombat")
RegisterUnitEvent(21925, 2, "Avatar_OnLeaveCombat")
RegisterUnitEvent(21925, 4, "Avatar_OnDied")
