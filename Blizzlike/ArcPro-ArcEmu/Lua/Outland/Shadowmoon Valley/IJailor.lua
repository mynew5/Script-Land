--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function IJailor_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("IJailor_FelShackles", 24000, 0)
end

function IJailor_FelShackles(Unit,Event)
	Unit:FullCastSpellOnTarget(38051, Unit:GetClosestPlayer())
end

function IJailor_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function IJailor_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21520, 1, "IJailor_OnEnterCombat")
RegisterUnitEvent(21520, 2, "IJailor_OnLeaveCombat")
RegisterUnitEvent(21520, 4, "IJailor_OnDied")