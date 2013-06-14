--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Verdan_OnCombat(Unit, Event)
	Unit:RegisterEvent("Vines", 7000, 0)
end

function Vines(Unit, Event) 
	Unit:FullCastSpellOnTarget(8142, Unit:GetMainTank()) 
	Unit:RegisterEvent("Vines", 7000, 0)
end

function Verdan_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Verdan_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5775, 1, "Verdan_OnCombat")
RegisterUnitEvent(5775, 2, "Verdan_OnLeaveCombat")
RegisterUnitEvent(5775, 4, "Verdan_OnDied")