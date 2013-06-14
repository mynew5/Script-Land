--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Naberius_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Naberius_Nova", 1000, 0)
    Unit:RegisterEvent("Naberius_Bolt", 3000, 0)
end

function Naberius_Nova(Unit, Event)
    Unit:FullCastSpellOnTarget(36148, Unit:ClosestPlayer())
end

function Naberius_Bolt(Unit, Event)
    Unit:FullCastSpellOnTarget(15497, Unit:ClosestPlayer())
end

function Naberius_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Naberius_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20483, 1, "Naberius_OnEnterCombat")
RegisterUnitEvent(20483, 2, "Naberius_OnLeaveCombat")
RegisterUnitEvent(20483, 4, "Naberius_OnDied")