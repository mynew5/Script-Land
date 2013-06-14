--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Protector_OnCombat(Unit, Event)
	Unit:RegisterEvent("Protector_Cleave", 7000, 0)
	Unit:RegisterEvent("Protector_Flames", 5000, 0)
end

function Protector_Cleave(Unit, Event) 
	Unit:FullCastSpellOnTarget(15496, Unit:GetMainTank()) 
end

function Protector_Flames(Unit, Event) 
	Unit:FullCastSpellOnTarget(37488, Unit:GetMainTank()) 
end

function Protector_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Protector_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(21923, 1, "Protector_OnCombat")
RegisterUnitEvent(21923, 2, "Protector_OnLeaveCombat")
RegisterUnitEvent(21923, 4, "Protector_OnDied")