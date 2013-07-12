--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Regenerator_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Regenerator_Bolt", 2500, 0)
end

function Regenerator_Bolt(Unit, Event)
    Unit:FullCastSpellOnTarget(34232,Unit:ClosestPlayer())
end   
    
function Regenerator_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Regenerator_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21783, 1, "Regenerator_OnEnterCombat")
RegisterUnitEvent(21783, 2, "Regenerator_OnLeaveCombat")
RegisterUnitEvent(21783, 4, "Regenerator_OnDied")