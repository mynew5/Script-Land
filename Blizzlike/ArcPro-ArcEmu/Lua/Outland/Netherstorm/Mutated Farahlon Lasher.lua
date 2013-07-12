--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Lasher_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Lasher_Growth", 1500, 0)
end

function Lasher_Growth(Unit, Event)
    Unit:FullCastSpellOnTarget(36604, Unit:ClosestPlayer())
end

function Lasher_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Lasher_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20983, 1, "Lasher_OnEnterCombat")
RegisterUnitEvent(20983, 2, "Lasher_OnLeaveCombat")
RegisterUnitEvent(20983, 4, "Lasher_OnDied")