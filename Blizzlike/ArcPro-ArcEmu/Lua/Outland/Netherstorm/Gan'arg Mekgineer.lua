--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Mekgineer_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Mekgineer_Drain", 1000, 0)
    Unit:RegisterEvent("Mekgineer_Steal", 1000, 0)
end

function Mekgineer_Drain(Unit, Event)
    Unit:FullCastSpellOnTarget(36825, Unit:ClosestPlayer())
end

function Mekgineer_Steal(Unit, Event)
    Unit:FullCastSpellOnTarget(36208, Unit:ClosestPlayer())
end

function Mekgineer_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Mekgineer_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(16949, 1, "Mekgineer_OnEnterCombat")
RegisterUnitEvent(16949, 2, "Mekgineer_OnLeaveCombat")
RegisterUnitEvent(16949, 4, "Mekgineer_OnDied")