--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Daughter_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Daughter_Nova", 2000, 0)
end

function Daughter_Nova(Unit, Event)
    Unit:FullCastSpellOnTarget(36225, Unit:GetClosestPlayer())
end

function Daughter_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Daughter_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18860, 1, "Daughter_OnEnterCombat")
RegisterUnitEvent(18860, 2, "Daughter_OnLeaveCombat")
RegisterUnitEvent(18860, 4, "Daughter_OnDied")