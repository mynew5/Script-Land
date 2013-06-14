--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MarshFawn_OnCombat(Unit, Event)
	Unit:RegisterEvent("MarshFawn_Gore", 8000, 0)
end

function MarshFawn_Gore(Unit, Event) 
	Unit:FullCastSpellOnTarget(32019, Unit:GetMainTank()) 
end

function MarshFawn_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MarshFawn_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25829, 1, "MarshFawn_OnCombat")
RegisterUnitEvent(25829, 2, "MarshFawn_OnLeaveCombat")
RegisterUnitEvent(25829, 4, "MarshFawn_OnDied")