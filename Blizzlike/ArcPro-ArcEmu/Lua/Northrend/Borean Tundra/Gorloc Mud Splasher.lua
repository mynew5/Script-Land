--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GorlocMudSplasher_OnCombat(Unit, Event)
	Unit:RegisterEvent("GorlocMudSplasher_GorlocStomp", 6000, 0)
end

function GorlocMudSplasher_GorlocStomp(Unit, Event) 
	Unit:CastSpell(50522) 
end

function GorlocMudSplasher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GorlocMudSplasher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25699, 1, "GorlocMudSplasher_OnCombat")
RegisterUnitEvent(25699, 2, "GorlocMudSplasher_OnLeaveCombat")
RegisterUnitEvent(25699, 4, "GorlocMudSplasher_OnDied")