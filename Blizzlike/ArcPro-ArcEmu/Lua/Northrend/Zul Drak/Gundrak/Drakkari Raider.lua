--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Drakkari_Raider_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Drakkari_Raider_Cleave", math.random(14000,22000), 0)
end

function Drakkari_Raider_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkari_Raider_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkari_Raider_Cleave(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15496, pUnit:GetMainTank())
end

RegisterUnitEvent(29982, 1, "Drakkari_Raider_OnCombat")
RegisterUnitEvent(29982, 2, "Drakkari_Raider_OnLeaveCombat")
RegisterUnitEvent(29982, 4, "Drakkari_Raider_OnDeath")