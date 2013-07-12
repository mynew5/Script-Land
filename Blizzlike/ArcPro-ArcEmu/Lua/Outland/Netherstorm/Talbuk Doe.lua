--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Doe_OnCombat(Unit, Event)
	Unit:RegisterEvent("Doe_Gore", 5000, 0)
end

function Doe_Gore(Unit, Event) 
	Unit:FullCastSpellOnTarget(32019, Unit:GetMainTank()) 
end

function Doe_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Doe_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20610, 1, "Doe_OnCombat")
RegisterUnitEvent(20610, 2, "Doe_OnLeaveCombat")
RegisterUnitEvent(20610, 4, "Doe_OnDied")