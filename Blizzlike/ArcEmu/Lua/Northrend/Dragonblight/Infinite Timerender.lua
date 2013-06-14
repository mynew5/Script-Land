--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function InfiniteTimerender_OnCombat(Unit, Event)
	Unit:RegisterEvent("InfiniteTimerender_TimeLapse", 7000, 0)
end

function InfiniteTimerender_TimeLapse(Unit, Event) 
	Unit:FullCastSpellOnTarget(51020, Unit:GetMainTank()) 
end

function InfiniteTimerender_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function InfiniteTimerender_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27900, 1, "InfiniteTimerender_OnCombat")
RegisterUnitEvent(27900, 2, "InfiniteTimerender_OnLeaveCombat")
RegisterUnitEvent(27900, 4, "InfiniteTimerender_OnDied")