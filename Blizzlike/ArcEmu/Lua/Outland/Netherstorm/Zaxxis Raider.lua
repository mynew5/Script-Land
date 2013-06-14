--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Raider_OnCombat(Unit, Event)
	Unit:RegisterEvent("Raider_Energy", 8000, 0)
end

function Raider_Energy(Unit, Event) 
	Unit:CastSpell(35922) 
end

function Raider_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Raider_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18875, 1, "Raider_OnCombat")
RegisterUnitEvent(18875, 2, "Raider_OnLeaveCombat")
RegisterUnitEvent(18875, 4, "Raider_OnDied")