--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RexAshil_OnCombat(Unit, Event)
	Unit:RegisterEvent("RexAshil_PierceArmor", 8000, 0)
end

function RexAshil_PierceArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(12097, Unit:GetMainTank()) 
end

function RexAshil_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RexAshil_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14475, 1, "RexAshil_OnCombat")
RegisterUnitEvent(14475, 2, "RexAshil_OnLeaveCombat")
RegisterUnitEvent(14475, 4, "RexAshil_OnDied")