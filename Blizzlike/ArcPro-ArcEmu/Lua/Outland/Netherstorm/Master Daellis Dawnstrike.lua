--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Master_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Master_Arrow", 1000, 0)
    Unit:RegisterEvent("Master_Clip", 1000, 0)
    Unit:RegisterEvent("Master_Shoot", 1000, 0)
end

function Master_Arrow(Unit, Event)
    Unit:FullCastSpellOnTarget(35964, Unit:ClosestPlayer())
end

function Master_Clip(Unit, Event)
    Unit:FullCastSpellOnTarget(35963, Unit:ClosestPlayer())
end

function Master_Shoot(Unit, Event)
    Unit:FullCastSpellOnTarget(6660, Unit:ClosestPlayer())
end

function Master_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Master_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19705, 1, "Master_OnEnterCombat")
RegisterUnitEvent(19705, 2, "Master_OnLeaveCombat")
RegisterUnitEvent(19705, 4, "Master_OnDied")