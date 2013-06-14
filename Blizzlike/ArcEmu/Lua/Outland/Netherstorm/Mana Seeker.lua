--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Seeker_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Seeker_Burn", 3000, 0)
    Unit:RegisterEvent("Seeker_Slow", 2000, 0)
end

function Seeker_Burn(Unit, Event)
    Unit:FullCastSpellOnTarget(11981, Unit:ClosestPlayer())
end

function Seeker_Slow(Unit, Event)
    Unit:FullCastSpellOnTarget(36843, Unit:ClosestPlayer())
end

function Seeker_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Seeker_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18867, 1, "Seeker_OnEnterCombat")
RegisterUnitEvent(18867, 2, "Seeker_OnLeaveCombat")
RegisterUnitEvent(18867, 4, "Seeker_OnDied")