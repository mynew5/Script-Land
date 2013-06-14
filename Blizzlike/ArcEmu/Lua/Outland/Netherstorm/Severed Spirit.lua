--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Spirit_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Spirit_Nova", 10000, 0)
    Unit:RegisterEvent("Spirit_Bolt", 4000, 0)
end

function Spirit_Nova(Unit, Event)
    Unit:CastSpell(11831)
end   

function Spirit_Bolt(Unit, Event)
    Unit:FullCastSpellOnTarget(20822, Unit:MainTank())
end

function Spirit_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Spirit_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19881, 1, "Spirit_OnEnterCombat")
RegisterUnitEvent(19881, 2, "Spirit_OnLeaveCombat")
RegisterUnitEvent(19881, 4, "Spirit_OnDied")