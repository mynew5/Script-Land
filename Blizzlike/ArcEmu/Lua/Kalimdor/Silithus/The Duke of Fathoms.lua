--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TheDukeofFathoms_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheDukeofFathoms_KnockAway", 6000, 0)
	Unit:RegisterEvent("TheDukeofFathoms_Knockdown", 8000, 0)
	Unit:RegisterEvent("TheDukeofFathoms_Thrash", 5000, 0)
end

function TheDukeofFathoms_KnockAway(Unit, Event) 
	Unit:FullCastSpellOnTarget(18670, Unit:GetMainTank()) 
end

function TheDukeofFathoms_Knockdown(Unit, Event) 
	Unit:FullCastSpellOnTarget(16790, Unit:GetMainTank()) 
end

function TheDukeofFathoms_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function TheDukeofFathoms_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheDukeofFathoms_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15207, 1, "TheDukeofFathoms_OnCombat")
RegisterUnitEvent(15207, 2, "TheDukeofFathoms_OnLeaveCombat")
RegisterUnitEvent(15207, 4, "TheDukeofFathoms_OnDied")