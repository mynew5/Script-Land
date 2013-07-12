--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Rhonsus_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Rhonsus_Smithery", 4000, 0)
end

function Rhonsus_Smithery(Unit, Event)
    Unit:FullCastSpellOnTarget(36103,Unit:ClosestPlayer())
end   
    
function Rhonsus_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Rhonsus_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20410, 1, "Rhonsus_OnEnterCombat")
RegisterUnitEvent(20410, 2, "Rhonsus_OnLeaveCombat")
RegisterUnitEvent(20410, 4, "Rhonsus_OnDied")