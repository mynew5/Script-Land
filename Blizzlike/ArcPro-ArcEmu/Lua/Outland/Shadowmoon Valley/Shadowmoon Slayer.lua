--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ShadowmoonSlayer_OnEnterCombat(Unit,Event)
	Unit:FullCastSpellOnTarget(3019, Unit:GetClosestPlayer())
	Unit:RegisterEvent("ShadowmoonSlayer_DebilitatingStrike", 20000, 0)
end

function ShadowmoonSlayer_DebilitatingStrike(Unit,Event)
	Unit:FullCastSpellOnTarget(37577, Unit:GetClosestPlayer())
end

function ShadowmoonSlayer_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function ShadowmoonSlayer_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22082, 1, "ShadowmoonSlayer_OnEnterCombat")
RegisterUnitEvent(22082, 2, "ShadowmoonSlayer_OnLeaveCombat")
RegisterUnitEvent(22082, 4, "ShadowmoonSlayer_OnDied")