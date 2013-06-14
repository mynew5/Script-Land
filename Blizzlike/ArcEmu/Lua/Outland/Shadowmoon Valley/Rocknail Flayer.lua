--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RocknailFlayer_OnEnterCombat(Unit,Event)
	Unit:RegisterUnitEvent("RocknailFlayer_FlayedFlesh", 30000, 0)
end

function RocknailFlayer_FlayedFlesh(Unit,Event)
	Unit:FullCastSpellOnTarget(37937, Unit:GetClosestPlayer())
end

function RocknailFlayer_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function RocknailFlayer_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21477, 1, "RocknailFlayer_OnEnterCombat")
RegisterUnitEvent(21477, 2, "RocknailFlayer_OnLeaveCombat")
RegisterUnitEvent(21477, 4, "RocknailFlayer_OnDied")