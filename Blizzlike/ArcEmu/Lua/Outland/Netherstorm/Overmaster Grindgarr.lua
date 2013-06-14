--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Grindgarr_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Grindgarr_Flames", 5000, 0)
    Unit:RegisterEvent("Grindgarr_Stomp", 4000, 0)
end

function Grindgarr_Flames(Unit, Event)
    Unit:FullCastSpellOnTarget(36487, Unit:ClosestPlayer())
end   
   
function Grindgarr_Stomp(Unit, Event)
    Unit:FullCastSpellOnTarget(35238, Unit:ClosestPlayer())
end
    
function Grindgarr_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Grindgarr_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20803, 1, "Grindgarr_OnEnterCombat")
RegisterUnitEvent(20803, 2, "Grindgarr_OnLeaveCombat")
RegisterUnitEvent(20803, 4, "Grindgarr_OnDied")