--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Azurous_OnCombat(Unit, Event)
	Unit:RegisterEvent("Azurous_Breath", 8000, 0)
end

function Azurous_Breath(Unit, Event) 
	Unit:FullCastSpellOnTarget(16099, Unit:GetMainTank()) 
end

function Azurous_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Azurous_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10202, 1, "Azurous_OnCombat")
RegisterUnitEvent(10202, 2, "Azurous_OnLeaveCombat")
RegisterUnitEvent(10202, 4, "Azurous_OnDied")