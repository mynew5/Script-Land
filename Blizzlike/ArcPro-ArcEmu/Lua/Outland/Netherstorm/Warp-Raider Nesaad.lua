--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Nesaad_OnCombat(Unit, Event)
	Unit:RegisterEvent("Nesaad_Flux", 7000, 0)
end

function Nesaad_Flux(Unit, Event) 
	Unit:CastSpell(35924) 
end

function Nesaad_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Nesaad_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(19641, 1, "Nesaad_OnCombat")
RegisterUnitEvent(19641, 2, "Nesaad_OnLeaveCombat")
RegisterUnitEvent(19641, 4, "Nesaad_OnDied")