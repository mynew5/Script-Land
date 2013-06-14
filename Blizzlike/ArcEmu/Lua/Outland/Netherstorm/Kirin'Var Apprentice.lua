--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Apprentice_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Apprentice_Hammer", 1500, 0)
end

function Apprentice_Hammer(Unit, Event)
    Unit:FullCastSpellOnTarget(37554, Unit:ClosestPlayer())
end

function Apprentice_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Apprentice_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20409, 1, "Apprentice_OnEnterCombat")
RegisterUnitEvent(20409, 2, "Apprentice_OnLeaveCombat")
RegisterUnitEvent(20409, 4, "Apprentice_OnDied")