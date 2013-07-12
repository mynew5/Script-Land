--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ShadowCouncilWarlock_OnEnterCombat(Unit,Event)
	Unit:SetCombatMeleeCapable(1)
	Unit:RegisterEvent("ShadowCouncilWarlock_DrainLife", 24000, 0)
	Unit:RegisterEvent("ShadowCouncilWarlock_ShadowBolt", 2500, 0)
end

function ShadowCouncilWarlock_DrainLife(Unit,Event)
	Unit:FullCastSpellOnTarget(37992, Unit:GetClosestPlayer())
end

function ShadowCouncilWarlock_ShadowBolt(Unit,Event)
	Unit:FullCastSpellOnTarget(9613, Unit:GetClosestPlayer())
end

function ShadowCouncilWarlock_OnLeaveCombat(Unit,Event)
	Unit:SetCombatMeleeCapable(0)
	Unit:RemoveEvents()
end

function ShadowCouncilWarlock_OnDied(Unit,Event)
	Unit:SetCombatMeleeCapable(0)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21302, 1, "ShadowCouncilWarlock_OnEnterCombat")
RegisterUnitEvent(21302, 2, "ShadowCouncilWarlock_OnLeaveCombat")
RegisterUnitEvent(21302, 4, "ShadowCouncilWarlock_OnDied")