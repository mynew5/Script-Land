--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Captain_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Captain_Cleave", 1000, 0)
    Unit:RegisterEvent("Captain_Toughen", 1000, 0)
end

function Captain_Cleave(Unit, Event)
    Unit:FullCastSpellOnTarget(15576, Unit:ClosestPlayer())
end

function Captain_Thougen(Unit, Event)
    Unit:CastSpell(33962)
end

function Captain_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Captain_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20727, 1, "Captain_OnEnterCombat")
RegisterUnitEvent(20727, 2, "Captain_OnLeaveCombat")
RegisterUnitEvent(20727, 4, "Captain_OnDied")