--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function StormTempest_OnCombat(Unit, Event)
	Unit:RegisterEvent("StormTempest_ChainLightning", 8000, 0)
	Unit:RegisterEvent("StormTempest_WindShock", 6000, 0)
end

function StormTempest_ChainLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(15659, Unit:GetMainTank()) 
end

function StormTempest_WindShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(31272, Unit:GetMainTank()) 
end

function StormTempest_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function StormTempest_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26045, 1, "StormTempest_OnCombat")
RegisterUnitEvent(26045, 2, "StormTempest_OnLeaveCombat")
RegisterUnitEvent(26045, 4, "StormTempest_OnDied")