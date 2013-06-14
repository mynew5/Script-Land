--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Honor_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Honor_Cleave", 1000, 0)
end

function Honor_Cleave(Unit, Event)
    Unit:FullCastSpellOnTarget(15284, Unit:ClosestPlayer())
end

function Honor_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Honor_OnDied(Unit, Event)
    Unit:RemoveEvents()
end

RegisterUnitEvent(20199, 1, "Honor_OnEnterCombat")
RegisterUnitEvent(20199, 2, "Honor_OnLeaveCombat")
RegisterUnitEvent(20199, 4, "Honor_OnDied")