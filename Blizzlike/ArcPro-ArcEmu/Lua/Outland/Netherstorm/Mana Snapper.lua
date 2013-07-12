--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Snapper_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Snapper_DeMaterialize", 1000, 0)
    Unit:RegisterEvent("Snapper_Burn", 1000, 0)
end

function Snapper_DeMaterialize(Unit, Event)
    Unit:CastSpell(34814)
end

function Snapper_Burn(Unit, Event)
    Unit:FullCastSpellOnTarget(37176, Unit:MainTank())
end

function Snapper_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Snapper_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18883, 1, "Snapper_OnEnterCombat")
RegisterUnitEvent(18883, 2, "Snapper_OnLeaveCombat")
RegisterUnitEvent(18883, 4, "Snapper_OnDied")