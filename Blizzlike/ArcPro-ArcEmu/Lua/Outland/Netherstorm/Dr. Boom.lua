--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Boom_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Boom_Dynamite", 1000, 0)
end

function Boom_Dynamite(Unit, Event)
    Unit:FullCastSpellOnTarget(35276, Unit:ClosestPlayer())
end

function Boom_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Boom_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20284, 1, "Boom_OnEnterCombat")
RegisterUnitEvent(20284, 2, "Boom_OnLeaveCombat")
RegisterUnitEvent(20284, 4, "Boom_OnDied")