--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Azarad_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Azarad_Rage", 12000, 0)
end

function Azarad_Rage(Unit, Event)
    Unit:CastSpell(35491)
end   
    
function Azarad_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Azarad_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20685, 1, "Azarad_OnEnterCombat")
RegisterUnitEvent(20685, 2, "Azarad_OnLeaveCombat")
RegisterUnitEvent(20685, 4, "Azarad_OnDied")