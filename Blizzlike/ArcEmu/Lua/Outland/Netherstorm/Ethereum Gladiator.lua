--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Gladiator_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Gladiator_Cleave", 1000, 0)
    Unit:RegisterEvent("Gladiator_Hamstring", 1000, 0)
    Unit:RegisterEvent("Gladiator_Strike", 1000, 0)
end

function Gladiator_Cleave(Unit, Event)
    Unit:FullCastSpellOnTarget(15284, Unit:ClosestPlayer())
end

function Gladiator_Hamstring(Unit, Event)
    Unit:FullCastSpellOnTarget(9080, Unit:ClosestPlayer())
end

function Gladiator_Strike(Unit, Event)
    Unit:FullCastSpellOnTarget(16856, Unit:ClosestPlayer())
end

function Gladiator_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Gladiator_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20854, 1, "Gladiator_OnEnterCombat")
RegisterUnitEvent(20854, 2, "Gladiator_OnLeaveCombat")
RegisterUnitEvent(20854, 4, "Gladiator_OnDied")