--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Haalum_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Haalum_Chain", 15000, 0)
	Unit:RegisterEvent("Haalum_LBolt", 9000, 0)
end

function Haalum_Chain(Unit,Event)
	Unit:FullCastSpellOnTarget(12058, Unit:GetClosestPlayer())
end

function Haalum_LBolt(Unit,Event)
	Unit:FullCastSpellOnTarget(9532, Unit:GetClosestPlayer())
end

function Haalum_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Haalum_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21711, 1, "Haalum_OnEnterCombat")
RegisterUnitEvent(21711, 2, "Haalum_OnLeaveCombat")
RegisterUnitEvent(21711, 4, "Haalum_OnDied")