--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ScryerGuardian_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("ScryerGuardian_Fireball", 7000, 0)
	Unit:RegisterEvent("ScryerGuardian_Scorch", 5000, 0)
	Unit:RegisterEvent("ScryerGuardian_Slow", 40000, 0)
end

function ScryerGuardian_Fireball(Unit,Event)
	Unit:FullCastSpellOnTarget(15228, Unit:GetClosestPlayer())
end

function ScryerGuardian_Scorch(Unit,Event)
	Unit:FullCastSpellOnTarget(17195, Unit:GetClosestPlayer())
end

function ScryerGuardian_Slow(Unit,Event)
	Unit:FullCastSpellOnTarget(11436, Unit:GetClosestPlayer())
end

function ScryerGuardian_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function ScryerGuardian_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19504, 1, "ScryerGuardian_OnEnterCombat")
RegisterUnitEvent(19504, 2, "ScryerGuardian_OnLeaveCombat")
RegisterUnitEvent(19504, 4, "ScryerGuardian_OnDied")