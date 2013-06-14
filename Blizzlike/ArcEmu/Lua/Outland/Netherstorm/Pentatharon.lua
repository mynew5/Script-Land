--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Pentatharon_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Pentatharon_Swarm", 4000, 0)
end

function Pentatharon_Swarm(Unit, Event)
    Unit:FullCastSpellOnTarget(36039,Unit:ClosestPlayer())
end   
    
function Pentatharon_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Pentatharon_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20215, 1, "Pentatharon_OnEnterCombat")
RegisterUnitEvent(20215, 2, "Pentatharon_OnLeaveCombat")
RegisterUnitEvent(20215, 4, "Pentatharon_OnDied")