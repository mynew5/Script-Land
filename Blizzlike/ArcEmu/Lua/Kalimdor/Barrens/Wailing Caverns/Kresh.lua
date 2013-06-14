--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Kresh_OnCombat(Unit, Event)
	Unit:RegisterEvent("Bite", 7000, 0)
end

function Bite(Unit, Event) 
	Unit:CastSpellOnTarget(80362, Unit:GetMainTank()) 
end

function Kresh_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Kresh_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3653, 1, "Kresh_OnCombat")
RegisterUnitEvent(3653, 2, "Kresh_OnLeaveCombat")
RegisterUnitEvent(3653, 4, "Kresh_OnDied")