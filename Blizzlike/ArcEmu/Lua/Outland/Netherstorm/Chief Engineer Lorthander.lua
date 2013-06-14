--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Chief_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Chief_Glaive", 1000, 0)
end

function Chief_Glaive(Unit, Event)
    Unit:FullCastSpellOnTarget(38204, Unit:ClosestPlayer())
end

function Chief_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Chief_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18697, 1, "Chief_OnEnterCombat")
RegisterUnitEvent(18697, 2, "Chief_OnLeaveCombat")
RegisterUnitEvent(18697, 4, "Chief_OnDied")