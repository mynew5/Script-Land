--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MoArgWeaponsmith_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("MoArgWeaponsmith_ChemicalFlames", 13000, 0)
	Unit:RegisterEvent("MoArgWeaponsmith_DrillArmor", 18000, 0)
end

function MoArgWeaponsmith_ChemicalFlames(Unit,Event)
	Unit:FullCastSpellOnTarget(36253, Unit:GetClosestPlayer())
end

function MoArgWeaponsmith_DrillArmor(Unit,Event)
	Unit:FullCastSpellOnTarget(37580, Unit:GetClosestPlayer())
end

function MoArgWeaponsmith_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function MoArgWeaponsmith_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19755, 1, "MoArgWeaponsmith_OnEnterCombat")
RegisterUnitEvent(19755, 2, "MoArgWeaponsmith_OnLeaveCombat")
RegisterUnitEvent(19755, 4, "MoArgWeaponsmith_OnDied")