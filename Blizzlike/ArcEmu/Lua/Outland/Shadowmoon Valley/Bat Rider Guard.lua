--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BatRiderGuard_OnEnterCombat(Unit,Event)
	Unit:FullCastSpellOnTarget(38066, Unit:GetClosestPlayer())
	Unit:RegisterEvent("BatRiderGuard_Spell", 25000, 0)
end

function BatRiderGuard_Spell(Unit,Event)
	Unit:FullCastSpellOnTarget(38066, Unit:GetClosestPlayer())
end

function BatRiderGuard_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function BatRiderGuard_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15242, 1, "BatRiderGuard_OnEnterCombat")
RegisterUnitEvent(15242, 2, "BatRiderGuard_OnLeaveCombat")
RegisterUnitEvent(15242, 4, "BatRiderGuard_OnDied")