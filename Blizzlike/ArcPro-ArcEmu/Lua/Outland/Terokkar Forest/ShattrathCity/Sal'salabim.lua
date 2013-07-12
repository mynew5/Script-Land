--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Salsalabim_OnCombat(Unit, Event)
	Unit:RegisterEvent("Salsalabim_Pull", 6000, 0)
end

function Salsalabim_Pull(Unit, Event) 
	Unit:FullCastSpellOnTarget(31705, Unit:GetMainTank()) 
end

function Salsalabim_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Salsalabim_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18584, 1, "Salsalabim_OnCombat")
RegisterUnitEvent(18584, 2, "Salsalabim_OnLeaveCombat")
RegisterUnitEvent(18584, 4, "Salsalabim_OnDied")