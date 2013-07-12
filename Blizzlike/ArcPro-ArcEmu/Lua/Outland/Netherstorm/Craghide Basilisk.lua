--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Basilisk_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Basilisk_Gaze", 45000, 0)
    Unit:RegisterEvent("Basilisk_Charge", 1000, 0)
end

function Basilisk_Gaze(Unit, Event)
    Unit:FullCastSpellOnTarget(35313, Unit:GetClosestPlayer())
end

function Basilisk_Charge(Unit, Event)
    Unit:FullCastSpellOnTarget(35385, Unit:GetClosestPlayer())
end

function Basilisk_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Basilisk_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20607, 1, "Basilisk_OnEnterCombat")
RegisterUnitEvent(20607, 2, "Basilisk_OnLeaveCombat")
RegisterUnitEvent(20607, 4, "Basilisk_OnDied")