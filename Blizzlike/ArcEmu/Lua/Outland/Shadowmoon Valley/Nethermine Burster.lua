--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NethermineBurster_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("NethermineBurster_Poison", 2000, 0)
end

function NethermineBurster_Poison(Unit,Event)
	Unit:FullCastSpellOnTarget(31747, Unit:GetClosestPlayer())
end

function NethermineBurster_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function NethermineBurster_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(23285, 1, "NethermineBurster_OnEnterCombat")
RegisterUnitEvent(23285, 2, "NethermineBurster_OnLeaveCombat")
RegisterUnitEvent(23285, 4, "NethermineBurster_OnDied")