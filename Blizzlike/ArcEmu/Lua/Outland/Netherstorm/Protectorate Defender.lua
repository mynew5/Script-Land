--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Defender_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Defender_Claive", 4000, 0)
    Unit:RegisterEvent("Defender_Hamstring", 5000, 0)
end

function Defender_Claive(Unit, Event)
    Unit:FullCastSpellOnTarget(36500, Unit:MainTank())
end   
    
function Defender_Hamstring(Unit, Event)
    Unit:FullCastSpellOnTarget(31553, Unit:MainTank())
end 
    
function Defender_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Defender_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20984, 1, "Defender_OnEnterCombat")
RegisterUnitEvent(20984, 2, "Defender_OnLeaveCombat")
RegisterUnitEvent(20984, 4, "Defender_OnDied")