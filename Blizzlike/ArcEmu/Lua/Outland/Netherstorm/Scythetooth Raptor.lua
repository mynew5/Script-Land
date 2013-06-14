--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Raptor_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Raptor_Enrage", 20000, 0)
end

function Raptor_Enrage(Unit, Event)
    Unit:CastSpell(8599)
end   
    
function Raptor_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Raptor_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20634, 1, "Raptor_OnEnterCombat")
RegisterUnitEvent(20634, 2, "Raptor_OnLeaveCombat")
RegisterUnitEvent(20634, 4, "Raptor_OnDied")