--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Peacekeeper_OnCombat(Unit, Event)
	Unit:RegisterEvent("Peacekeeper_Block", 5000, 0)
end

function Peacekeeper_Block(Unit, Event) 
	Unit:CastSpell(12169) 
end

function Peacekeeper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Peacekeeper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(19687, 1, "Peacekeeper_OnCombat")
RegisterUnitEvent(19687, 2, "Peacekeeper_OnLeaveCombat")
RegisterUnitEvent(19687, 4, "Peacekeeper_OnDied")