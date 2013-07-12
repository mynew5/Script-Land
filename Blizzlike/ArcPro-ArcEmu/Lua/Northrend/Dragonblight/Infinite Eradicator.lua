--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function InfiniteEradicator_OnCombat(Unit, Event)
	Unit:RegisterEvent("InfiniteEradicator_Hasten", 2000, 1)
	Unit:RegisterEvent("InfiniteEradicator_TemporalVortex", 6000, 0)
	Unit:RegisterEvent("InfiniteEradicator_WingBuffet", 8000, 0)
end

function InfiniteEradicator_Hasten(Unit, Event) 
	Unit:CastSpell(31458) 
end

function InfiniteEradicator_TemporalVortex(Unit, Event) 
	Unit:FullCastSpellOnTarget(52657, Unit:GetMainTank()) 
end

function InfiniteEradicator_WingBuffet(Unit, Event) 
	Unit:CastSpell(31475) 
end

function InfiniteEradicator_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function InfiniteEradicator_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(32185, 1, "InfiniteEradicator_OnCombat")
RegisterUnitEvent(32185, 2, "InfiniteEradicator_OnLeaveCombat")
RegisterUnitEvent(32185, 4, "InfiniteEradicator_OnDied")