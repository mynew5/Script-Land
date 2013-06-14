--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ArcaneSerpent_OnCombat(Unit, Event)
	Unit:RegisterEvent("ArcaneSerpent_ArcaneJolt", 8000, 0)
end

function ArcaneSerpent_ArcaneJolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(50504, Unit:GetMainTank()) 
end

function ArcaneSerpent_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ArcaneSerpent_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25721, 1, "ArcaneSerpent_OnCombat")
RegisterUnitEvent(25721, 2, "ArcaneSerpent_OnLeaveCombat")
RegisterUnitEvent(25721, 4, "ArcaneSerpent_OnDied")