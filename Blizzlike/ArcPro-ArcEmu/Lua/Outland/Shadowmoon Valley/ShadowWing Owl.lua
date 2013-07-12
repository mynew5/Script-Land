--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ShadowwingOwl_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("ShadowwingOwl_EagleClaw", 30000, 0)
end

function ShadowwingOwl_EagleClaw(Unit,Event)
	Unit:FullCastSpellOnTarget(15496, Unit:GetClosestPlayer())
end

function ShadowwingOwl_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function ShadowwingOwl_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22265, 1, "ShadowwingOwl_OnEnterCombat")
RegisterUnitEvent(22265, 2, "ShadowwingOwl_OnLeaveCombat")
RegisterUnitEvent(22265, 4, "ShadowwingOwl_OnDied")