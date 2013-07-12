--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function InfiniteTimebreaker_OnCombat(Unit, Event)
	Unit:RegisterEvent("InfiniteTimebreaker_Enrage", 8000, 0)
	Unit:RegisterEvent("InfiniteTimebreaker_TimeStop", 12000, 2)
end

function InfiniteTimebreaker_Enrage(Unit, Event) 
	Unit:CastSpell(60075) 
end

function InfiniteTimebreaker_TimeStop(Unit, Event) 
	Unit:FullCastSpellOnTarget(60074, Unit:GetMainTank()) 
end

function InfiniteTimebreaker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function InfiniteTimebreaker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(32186, 1, "InfiniteTimebreaker_OnCombat")
RegisterUnitEvent(32186, 2, "InfiniteTimebreaker_OnLeaveCombat")
RegisterUnitEvent(32186, 4, "InfiniteTimebreaker_OnDied")