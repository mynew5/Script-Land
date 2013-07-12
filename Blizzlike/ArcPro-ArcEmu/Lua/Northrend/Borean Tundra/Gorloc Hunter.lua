--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GorlocHunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("GorlocHunter_ParalyzingSlime", 7000, 0)
end

function GorlocHunter_ParalyzingSlime(Unit, Event) 
	Unit:FullCastSpellOnTarget(50523, Unit:GetMainTank()) 
end

function GorlocHunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GorlocHunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25700, 1, "GorlocHunter_OnCombat")
RegisterUnitEvent(25700, 2, "GorlocHunter_OnLeaveCombat")
RegisterUnitEvent(25700, 4, "GorlocHunter_OnDied")