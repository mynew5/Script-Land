--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GraymistHunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("GraymistHunter_Gore", 10000, 0)
end

function GraymistHunter_Gore(Unit, Event) 
	Unit:FullCastSpellOnTarget(32019, Unit:GetMainTank()) 
end

function GraymistHunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GraymistHunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26592, 1, "GraymistHunter_OnCombat")
RegisterUnitEvent(26592, 2, "GraymistHunter_OnLeaveCombat")
RegisterUnitEvent(26592, 4, "GraymistHunter_OnDied")