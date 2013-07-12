--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Unyielding_Constrictor_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Unyielding_Constrictor_Vicious_Bite", math.random(17000,19000), 0)
end

function Unyielding_Constrictor_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Unyielding_Constrictor_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Unyielding_Constrictor_Vicious_Bite(pUnit, Event)
	pUnit:FullCastSpellOnTarget(55602, pUnit:GetMainTank())
end

RegisterUnitEvent(29768, 1, "Unyielding_Constrictor_OnCombat")
RegisterUnitEvent(29768, 2, "Unyielding_Constrictor_OnLeaveCombat")
RegisterUnitEvent(29768, 4, "Unyielding_Constrictor_OnDeath")