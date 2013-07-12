--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Destroyer_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Destroyer_Knock", 1000, 0)
    Unit:RegisterEvent("Destroyer_Strike", 1000, 0)
end

function Destroyer_Knock(Unit, Event)
    Unit:FullCastSpellOnTarget(11428, Unit:ClosestPlayer())
end

function Destroyer_Strike(Unit, Event)
    Unit:FullCastSpellOnTarget(13737, Unit:ClosestPlayer())
end

function Destroyer_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Destroyer_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20403, 1, "Destroyer_OnEnterCombat")
RegisterUnitEvent(20403, 2, "Destroyer_OnLeaveCombat")
RegisterUnitEvent(20403, 4, "Destroyer_OnDied")