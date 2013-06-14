--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WaterSpirit_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("WaterSpirit_Waterbolt", 4300, 0)
end

function Waterspirit_WaterBolt(Unit,Event)
	Unit:FullCastSpellOnTarget(31707, Unit:GetClosestPlayer())
end

function WaterSpirit_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function WaterSpirit_OnDeath(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21029, 1, "WaterSpirit_OnEnterCombat")
RegisterUnitEvent(21029, 2, "WaterSpirit_OnLeaveCombat")
RegisterUnitEvent(21029, 4, "WaterSpirit_OnDeath")

function WaterSpirit1_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("WaterSpirit_Stormbolt", 12000, 0)
end

function WaterSpirit_Stormbolt(Unit,Event)
	Unit:FullCastSpellOnTarget(38032, Unit:GetClosestPlayer())
end

RegisterUnitEvent(21059, 1, "WaterSpirit_OnEnterCombat")
RegisterUnitEvent(21059, 2, "WaterSpirit_OnLeaveCombat")
RegisterUnitEvent(21059, 4, "WaterSpirit_OnDeath")