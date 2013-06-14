--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Eye_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Eye_Bursts", 1000, 0)
end

function Eye_Bursts(Unit, Event)
    Unit:FullCastSpellOnTarget(36414, Unit:ClosestPlayer())
end

function Eye_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Eye_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20394, 1, "Eye_OnEnterCombat")
RegisterUnitEvent(20394, 2, "Eye_OnLeaveCombat")
RegisterUnitEvent(20394, 4, "Eye_OnDied")