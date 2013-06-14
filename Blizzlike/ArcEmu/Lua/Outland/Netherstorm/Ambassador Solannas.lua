--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ambassador_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Ambassador_Fireball", 3000, 0)
end

function Ambassador_Fireball(Unit, Event)
    Unit:FullCastSpellOnTarget(9053, Unit:ClosestPlayer())
end

function Ambassador_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Ambassador_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20163, 1, "Ambassador_OnEnterCombat")
RegisterUnitEvent(20163, 2, "Ambassador_OnLeaveCombat")
RegisterUnitEvent(20163, 4, "Ambassador_OnDied")