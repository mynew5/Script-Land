--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Theredis_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Theredis_Disarm", 8000, 0)
    Unit:RegisterEvent("Theredis_Breaker", 9000, 0)
end

function Theredis_Crystal(Unit, Event)
    Unit:FullCastSpellOnTarget(6713, Unit:MainTank())
end   
   
function Theredis_Breaker(Unit, Event)
    Unit:FullCastSpellOnTarget(35871, Unit:MainTank())
end
    
function Theredis_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Theredis_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20416, 1, "Theredis_OnEnterCombat")
RegisterUnitEvent(20416, 2, "Theredis_OnLeaveCombat")
RegisterUnitEvent(20416, 4, "Theredis_OnDied")