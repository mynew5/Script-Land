--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TurgidtheVile_OnCombat(Unit, Event)
	Unit:RegisterEvent("TurgidtheVile_ScourgeHook", 6000, 0)
	Unit:RegisterEvent("TurgidtheVile_VileVommit", 8000, 0)
end

function TurgidtheVile_ScourgeHook(Unit, Event) 
	Unit:FullCastSpellOnTarget(50335, Unit:GetMainTank()) 
end

function TurgidtheVile_VileVommit(Unit, Event) 
	Unit:FullCastSpellOnTarget(51356, Unit:GetMainTank()) 
end

function TurgidtheVile_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TurgidtheVile_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27808, 1, "TurgidtheVile_OnCombat")
RegisterUnitEvent(27808, 2, "TurgidtheVile_OnLeaveCombat")
RegisterUnitEvent(27808, 4, "TurgidtheVile_OnDied")