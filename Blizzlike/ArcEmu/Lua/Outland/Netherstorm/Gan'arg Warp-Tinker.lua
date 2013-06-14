--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Tinker_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Tinker_Bomb", 2000, 0)
    Unit:RegisterEvent("Tinker_Steal", 1000, 0)
end

function Tinker_Bomb(Unit, Event)
    Unit:FullCastSpellOnTarget(36846, Unit:ClosestPlayer())
end

function Tinker_Steal(Unit, Event)
    Unit:FullCastSpellOnTarget(36208, Unit:ClosestPlayer())
end

function Tinker_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Tinker_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20285, 1, "Tinker_OnEnterCombat")
RegisterUnitEvent(20285, 2, "Tinker_OnLeaveCombat")
RegisterUnitEvent(20285, 4, "Tinker_OnDied")