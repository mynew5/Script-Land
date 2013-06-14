--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SunreaverHawkrider_OnCombat(Unit, Event)
	Unit:RegisterEvent("SunreaverHawkrider_Shoot", 6000, 0)
end

function SunreaverHawkrider_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function SunreaverHawkrider_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SunreaverHawkrider_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(30265, 1, "SunreaverHawkrider_OnCombat")
RegisterUnitEvent(30265, 2, "SunreaverHawkrider_OnLeaveCombat")
RegisterUnitEvent(30265, 4, "SunreaverHawkrider_OnDied")