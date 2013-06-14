--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DurielMoonfire_OnCombat(Unit, Event)
	Unit:RegisterEvent("DurielMoonfire_Knockdown", 8000, 0)
	Unit:RegisterEvent("DurielMoonfire_PierceArmor", 6000, 0)
end

function DurielMoonfire_Knockdown(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11428, pUnit:GetMainTank()) 
end

function DurielMoonfire_PierceArmor(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12097, pUnit:GetMainTank()) 
end

function DurielMoonfire_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DurielMoonfire_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12860, 1, "DurielMoonfire_OnCombat")
RegisterUnitEvent(12860, 2, "DurielMoonfire_OnLeaveCombat")
RegisterUnitEvent(12860, 4, "DurielMoonfire_OnDied")