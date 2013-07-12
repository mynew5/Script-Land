--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GorlocWaddler_OnCombat(Unit, Event)
	Unit:RegisterEvent("GorlocWaddler_GorlocStomp", 7000, 0)
end

function GorlocWaddler_GorlocStomp(Unit, Event) 
	Unit:FullCastSpellOnTarget(50522, Unit:GetMainTank()) 
end

function GorlocWaddler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GorlocWaddler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25685, 1, "GorlocWaddler_OnCombat")
RegisterUnitEvent(25685, 2, "GorlocWaddler_OnLeaveCombat")
RegisterUnitEvent(25685, 4, "GorlocWaddler_OnDied")