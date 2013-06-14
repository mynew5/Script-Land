--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Captured_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Captured_Glaive", 1000, 0)
    Unit:RegisterEvent("Captured_Hamstring", 10000, 0)
end

function Captured_Glaive(Unit, Event)
    Unit:FullCastSpellOnTarget(36500, Unit:ClosestPlayer())
end

function Captured_Hamstring(Unit, Event)
    Unit:FullCastSpellOnTarget(31553, Unit:ClosestPlayer())
end

function Captured_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Captured_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20763, 1, "Captured_OnEnterCombat")
RegisterUnitEvent(20763, 2, "Captured_OnLeaveCombat")
RegisterUnitEvent(20763, 4, "Captured_OnDied")