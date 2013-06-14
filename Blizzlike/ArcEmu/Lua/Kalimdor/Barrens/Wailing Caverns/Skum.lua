--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Skum_OnCombat(Unit, Event)
	Unit:RegisterEvent("Bolt", 7000, 0)
end

function Bolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(6254, Unit:GetMainTank()) 
end

function Skum_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Skum_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3674, 1, "Skum_OnCombat")
RegisterUnitEvent(3674, 2, "Skum_OnLeaveCombat")
RegisterUnitEvent(3674, 4, "Skum_OnDied")