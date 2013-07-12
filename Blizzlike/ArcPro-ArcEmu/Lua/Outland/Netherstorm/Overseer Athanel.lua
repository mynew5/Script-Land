--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Athanel_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Athanel_Cleave", 4000, 0)
end

function Athanel_Cleave(Unit, Event)
    Unit:FullCastSpellOnTarget(15496, Unit:MainTank())
end   
    
function Athanel_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Athanel_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20435, 1, "Athanel_OnEnterCombat")
RegisterUnitEvent(20435, 2, "Athanel_OnLeaveCombat")
RegisterUnitEvent(20435, 4, "Athanel_OnDied")