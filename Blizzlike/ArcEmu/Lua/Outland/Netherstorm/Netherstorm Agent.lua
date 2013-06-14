--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Agent_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Agent_Shoot", 1000, 0)
end

function Agent_Shoot(Unit, Event)
    Unit:FullCastSpellOnTarget(36246, Unit:ClosestPlayer())
end

function Agent_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Agent_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19541, 1, "Agent_OnEnterCombat")
RegisterUnitEvent(19541, 2, "Agent_OnLeaveCombat")
RegisterUnitEvent(19541, 4, "Agent_OnDied")