--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Cannon_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Cannon_Blast", 3000, 0)
end

function Cannon_Blast(Unit, Event)
    Unit:FullCastSpellOnTarget(36238, Unit:ClosestPlayer())
end

function Cannon_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Cannon_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21233, 1, "Cannon_OnEnterCombat")
RegisterUnitEvent(21233, 2, "Cannon_OnLeaveCombat")
RegisterUnitEvent(21233, 4, "Cannon_OnDied")