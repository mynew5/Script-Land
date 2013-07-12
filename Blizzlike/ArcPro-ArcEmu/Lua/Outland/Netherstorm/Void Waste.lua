--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Waste_OnCombat(Unit, Event)
	Unit:RegisterEvent("Waste_Toxic", 3000, 0)
end

function Waste_Toxic(Unit, Event) 
	Unit:FullCastSpellOnTarget(36519, Unit:GetMainTank()) 
end

function Waste_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Waste_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20778, 1, "Waste_OnCombat")
RegisterUnitEvent(20778, 2, "Waste_OnLeaveCombat")
RegisterUnitEvent(20778, 4, "Waste_OnDied")