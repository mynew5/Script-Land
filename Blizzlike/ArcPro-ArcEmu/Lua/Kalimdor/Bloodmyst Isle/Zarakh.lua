--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Zarakh_OnCombat(Unit, Event)
	Unit:RegisterEvent("Zarakh_Poison", 8000, 0)
	Unit:RegisterEvent("Zarakh_Web", 10000, 0)
end

function Zarakh_Poison(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(744, 	pUnit:GetMainTank()) 
end

function Zarakh_Web(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(745, 	pUnit:GetMainTank()) 
end

function Zarakh_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Zarakh_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17683, 1, "Zarakh_OnCombat")
RegisterUnitEvent(17683, 2, "Zarakh_OnLeaveCombat")
RegisterUnitEvent(17683, 4, "Zarakh_OnDied")