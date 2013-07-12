--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BloodsporeHarvester_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodsporeHarvester_BloodsporeHaze", 10000, 0)
end

function BloodsporeHarvester_BloodsporeHaze(Unit, Event) 
	Unit:FullCastSpellOnTarget(50380, Unit:GetMainTank()) 
end

function BloodsporeHarvester_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BloodsporeHarvester_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25467, 1, "BloodsporeHarvester_OnCombat")
RegisterUnitEvent(25467, 2, "BloodsporeHarvester_OnLeaveCombat")
RegisterUnitEvent(25467, 4, "BloodsporeHarvester_OnDied")