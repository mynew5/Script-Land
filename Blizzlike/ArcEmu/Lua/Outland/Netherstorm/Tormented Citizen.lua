--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Citizen_OnCombat(Unit, Event)
	Unit:RegisterEvent("Citizen_Curse", 1000, 1)
	Unit:RegisterEvent("Citizen_Bolt", 6000, 0)
	Unit:RegisterEvent("Citizen_Immune", 6000, 0)
end

function Citizen_Curse(Unit, Event) 
	Unit:FullCastSpellOnTarget(11980, Unit:GetMainTank()) 
end

function Citizen_Bolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank()) 
end

function Citizen_Immune(Unit, Event) 
	Unit:FullCastSpellOnTarget(36153, Unit:GetMainTank()) 
end

function Citizen_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Citizen_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(21065, 1, "Citizen_OnCombat")
RegisterUnitEvent(21065, 2, "Citizen_OnLeaveCombat")
RegisterUnitEvent(21065, 4, "Citizen_OnDied")