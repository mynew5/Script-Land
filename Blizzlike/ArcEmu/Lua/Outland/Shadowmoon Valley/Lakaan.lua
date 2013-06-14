--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Lakaan_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Lakaan_WaterBolt", 4000, 0)
end

function Lakaan_WaterBolt(Unit,Event)
	Unit:FullCastSpellOnTarget(32011, Unit:GetClosestPlayer())
end

function Lakaan_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Lakaan_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21416, 1, "Lakaan_OnEnterCombat")
RegisterUnitEvent(21416, 2, "Lakaan_OnLeaveCombat")
RegisterUnitEvent(21416, 4, "Lakaan_OnDied")