--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Sharptalon_OnCombat(Unit, Event)
	Unit:RegisterEvent("Sharptalon_PierceArmor", 6000, 0)
end

function Sharptalon_PierceArmor(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12097, pUnit:GetMainTank()) 
end

function Sharptalon_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Sharptalon_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12676, 1, "Sharptalon_OnCombat")
RegisterUnitEvent(12676, 2, "Sharptalon_OnLeaveCombat")
RegisterUnitEvent(12676, 4, "Sharptalon_OnDied")