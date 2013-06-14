--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Kaan_OnCombat(Unit, Event)
	Unit:RegisterEvent("Kaan_Banish", 7000, 0)
end

function Kaan_Banish(Unit, Event) 
	Unit:FullCastSpellOnTarget(36642, Unit:GetMainTank()) 
end

function Kaan_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Kaan_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(23271, 1, "Kaan_OnCombat")
RegisterUnitEvent(23271, 2, "Kaan_OnLeaveCombat")
RegisterUnitEvent(23271, 4, "Kaan_OnDied")