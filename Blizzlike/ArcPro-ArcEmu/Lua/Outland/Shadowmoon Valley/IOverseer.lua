--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function IOverseer_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("IOverseer_MortalStrike", 20000, 0)
	Unit:RegisterEvent("IOverseer_Rend", 50000, 0)
end

function IOverseer_MortalStrike(Unit,Event)
	Unit:FullCastSpellOnTarget(32736, Unit:GetClosestPlayer())
end

function IOverseer_Rend(Unit,Event)
	Unit:FullCastSpellOnTarget(11977, Unit:GetClosestPlayer())
end

function IOverseer_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function IOverseer_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21808, 1, "IOverseer_OnEnterCombat")
RegisterUnitEvent(21808, 2, "IOverseer_OnLeaveCombat")
RegisterUnitEvent(21808, 4, "IOverseer_OnDied")