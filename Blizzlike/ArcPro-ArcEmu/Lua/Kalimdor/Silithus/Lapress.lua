--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Lapress_OnCombat(Unit, Event)
	Unit:RegisterEvent("Lapress_Rend", 8000, 0)
end

function Lapress_Rend(Unit, Event) 
	Unit:FullCastSpellOnTarget(13455, Unit:GetMainTank()) 
end

function Lapress_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Lapress_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14473, 1, "Lapress_OnCombat")
RegisterUnitEvent(14473, 2, "Lapress_OnLeaveCombat")
RegisterUnitEvent(14473, 4, "Lapress_OnDied")