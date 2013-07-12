--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ardonis_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Ardonis_Shadows", 10000, 0)
    Unit:RegisterEvent("Ardonis_Desecration", 1000, 0)
end

function Ardonis_Shadows(Unit, Event)
    Unit:CastSpell(36472)
end

function Ardonis_Desecration(Unit, Event)
    Unit:FullCastSpellOnTarget(36473, Unit:GetClosestPlayer())
end

function Ardonis_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Ardonis_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19830, 1, "Ardonis_OnEnterCombat")
RegisterUnitEvent(19830, 2, "Ardonis_OnLeaveCombat")
RegisterUnitEvent(19830, 4, "Ardonis_OnDied")