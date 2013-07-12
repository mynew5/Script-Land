--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Avenger_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Avenger_Shout", 1000, 0)
    Unit:RegisterEvent("Avenger_Charge", 1000, 0)
    Unit:RegisterEvent("Avenger_Weapons", 1000, 0)
end

function Avenger_Charge(Unit, Event)
    Unit:FullCastSpellOnTarget(32064, Unit:ClosestPlayer())
end

function Avenger_Intangible(Unit, Event)
    Unit:FullCastSpellOnTarget(36509, Unit:ClosestPlayer())
end

function Avenger_Weapons(Unit, Event)
    Unit:FullCastSpellOnTarget(39489, Unit:ClosestPlayer())
end

function Avenger_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Avenger_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22821, 1, "Avenger_OnEnterCombat")
RegisterUnitEvent(22821, 2, "Avenger_OnLeaveCombat")
RegisterUnitEvent(22821, 4, "Avenger_OnDied")