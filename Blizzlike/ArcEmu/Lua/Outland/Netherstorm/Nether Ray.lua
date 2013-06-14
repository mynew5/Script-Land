--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ray_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Ray_Drain", 1000, 0)
    Unit:RegisterEvent("Ray_Shock", 1000, 0)
    Unit:RegisterEvent("Ray_Sting", 1000, 0)
end

function Ray_Drain(Unit, Event)
    Unit:FullCastSpellOnTarget(17008, Unit:ClosestPlayer())
end

function Ray_Shock(Unit, Event)
    Unit:FullCastSpellOnTarget(35334, Unit:ClosestPlayer())
end

function Ray_Sting(Unit, Event)
    Unit:FullCastSpellOnTarget(36659, Unit:ClosestPlayer())
end

function Ray_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Ray_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18880, 1, "Ray_OnEnterCombat")
RegisterUnitEvent(18880, 2, "Ray_OnLeaveCombat")
RegisterUnitEvent(18880, 4, "Ray_OnDied")