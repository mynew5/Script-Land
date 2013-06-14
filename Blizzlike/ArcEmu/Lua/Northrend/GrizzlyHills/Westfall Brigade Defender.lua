--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]


function WestfallBrigadeDefender_OnCombat(Unit, Event)
	Unit:RegisterEvent("WestfallBrigadeDefender_Strike", 6000, 0)
end

function WestfallBrigadeDefender_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(14516, Unit:GetMainTank()) 
end

function WestfallBrigadeDefender_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WestfallBrigadeDefender_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27758, 1, "WestfallBrigadeDefender_OnCombat")
RegisterUnitEvent(27758, 2, "WestfallBrigadeDefender_OnLeaveCombat")
RegisterUnitEvent(27758, 4, "WestfallBrigadeDefender_OnDied")