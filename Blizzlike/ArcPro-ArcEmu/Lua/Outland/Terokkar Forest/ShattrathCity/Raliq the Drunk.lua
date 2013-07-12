--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Drunk_OnCombat(Unit, Event)
	Unit:RegisterEvent("Drunk_Knock", 8000, 0)
end

function Drunk_Knock(Unit, Event) 
	Unit:FullCastSpellOnTarget(10966, Unit:GetMainTank()) 
end

function Drunk_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Drunk_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18585, 1, "Drunk_OnCombat")
RegisterUnitEvent(18585, 2, "Drunk_OnLeaveCombat")
RegisterUnitEvent(18585, 4, "Drunk_OnDied")