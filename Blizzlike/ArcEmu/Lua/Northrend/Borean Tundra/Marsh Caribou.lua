--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MarshCaribou_OnCombat(Unit, Event)
	Unit:RegisterEvent("MarshCaribou_Gore", 8000, 0)
end

function MarshCaribou_Gore(Unit, Event) 
	Unit:FullCastSpellOnTarget(32019, Unit:GetMainTank()) 
end

function MarshCaribou_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MarshCaribou_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25680, 1, "MarshCaribou_OnCombat")
RegisterUnitEvent(25680, 2, "MarshCaribou_OnLeaveCombat")
RegisterUnitEvent(25680, 4, "MarshCaribou_OnDied")