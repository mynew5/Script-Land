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
    Unit:RegisterEvent("Avenger_Claive", 4000, 0)
end

function Avenger_Claive(Unit, Event)
    Unit:FullCastSpellOnTarget(36500, Unit:MainTank())
end   
    
function Avenger_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Avenger_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21805, 1, "Avenger_OnEnterCombat")
RegisterUnitEvent(21805, 2, "Avenger_OnLeaveCombat")
RegisterUnitEvent(21805, 4, "Avenger_OnDied")