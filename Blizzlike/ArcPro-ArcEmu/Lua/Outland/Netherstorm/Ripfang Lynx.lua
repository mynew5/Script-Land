--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Lynx_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Lynx_Dash", 5000, 0)
    Unit:RegisterEvent("Lynx_Rip", 6000, 0)
    Unit:RegisterEvent("Lynx_Swipe", 5000, 0)
end

function Lynx_Dash(Unit, Event)
    Unit:CastSpell(36589)
end   
   
function Lynx_Rip(Unit, Event)
    Unit:FullCastSpellOnTarget(36590, Unit:MainTank())
end

function Lynx_Swipe(Unit, Event)
    Unit:FullCastSpellOnTarget(31279, Unit:MainTank())
end
    
function Lynx_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Lynx_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20671, 1, "Lynx_OnEnterCombat")
RegisterUnitEvent(20671, 2, "Lynx_OnLeaveCombat")
RegisterUnitEvent(20671, 4, "Lynx_OnDied")