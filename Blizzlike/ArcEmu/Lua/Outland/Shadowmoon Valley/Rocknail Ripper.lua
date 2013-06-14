--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RocknailRipper_OnEnterCombat(Unit,Event)
	Unit:RegisterUnitEvent("RocknailRipper_Rip", 11000, 0)
end

function RocknailRipper_Rip(Unit,Event)
	Unit:FullCastSpellOnTarget(37937, Unit:GetClosestPlayer())
end

function RocknailRipper_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function RocknailRipper_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21478, 1, "RocknailRipper_OnEnterCombat")
RegisterUnitEvent(21478, 2, "RocknailRipper_OnLeaveCombat")
RegisterUnitEvent(21478, 4, "RocknailRipper_OnDied")