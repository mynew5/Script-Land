--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ScourgeSiegesmith_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScourgeSiegesmith_Bomb", 5500, 0)
end

function ScourgeSiegesmith_Bomb(Unit, Event) 
	Unit:CastSpell(22334) 
end

function ScourgeSiegesmith_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScourgeSiegesmith_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27410, 1, "ScourgeSiegesmith_OnCombat")
RegisterUnitEvent(27410, 2, "ScourgeSiegesmith_OnLeaveCombat")
RegisterUnitEvent(27410, 4, "ScourgeSiegesmith_OnDied")