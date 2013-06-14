--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Frost_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Frost_Nova", 8000, 0)
    Unit:RegisterEvent("Frost_Bolt", 3000, 0)
    Unit:RegisterEvent("Frost_Barrier", 30000, 0)
end

function Frost_Nova(Unit, Event)
    Unit:FullCastSpellOnTarget(11831, Unit:ClosestPlayer())
end

function Frost_Bolt(Unit, Event)
    Unit:FullCastSpellOnTarget(9672, Unit:ClosestPlayer())
end

function Frost_Barrier(Unit, Event)
    Unit:CastSpell(33245)
end

function Frost_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Frost_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19545, 1, "Frost_OnEnterCombat")
RegisterUnitEvent(19545, 2, "Frost_OnLeaveCombat")
RegisterUnitEvent(19545, 4, "Frost_OnDied")