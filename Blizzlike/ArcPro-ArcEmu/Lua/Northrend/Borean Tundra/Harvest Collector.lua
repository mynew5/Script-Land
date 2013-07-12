--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HarvestCollector_OnCombat(Unit, Event)
	Unit:RegisterEvent("HarvestCollector_ClawSlash", 6000, 0)
end

function HarvestCollector_ClawSlash(Unit, Event) 
	Unit:FullCastSpellOnTarget(54185, Unit:GetMainTank()) 
end

function HarvestCollector_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HarvestCollector_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25623, 1, "HarvestCollector_OnCombat")
RegisterUnitEvent(25623, 2, "HarvestCollector_OnLeaveCombat")
RegisterUnitEvent(25623, 4, "HarvestCollector_OnDied")