--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OverseerDurval_OnCombat(Unit, Event)
	Unit:RegisterEvent("OverseerDurval_RuneofDestruction", 8000, 0)
end

function OverseerDurval_RuneofDestruction(Unit, Event) 
	Unit:FullCastSpellOnTarget(52715, Unit:GetMainTank()) 
end

function OverseerDurval_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OverseerDurval_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26920, 1, "OverseerDurval_OnCombat")
RegisterUnitEvent(26920, 2, "OverseerDurval_OnLeaveCombat")
RegisterUnitEvent(26920, 4, "OverseerDurval_OnDied")