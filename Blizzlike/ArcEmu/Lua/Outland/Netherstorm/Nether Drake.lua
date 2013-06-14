--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Drake_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Drake_Presence", 1000, 0)
end

function Drake_Presence(Unit, Event)
    Unit:FullCastSpellOnTarget(36513, Unit:ClosestPlayer())
end

function Drake_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Drake_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18877, 1, "Drake_OnEnterCombat")
RegisterUnitEvent(18877, 2, "Drake_OnLeaveCombat")
RegisterUnitEvent(18877, 4, "Drake_OnDied")