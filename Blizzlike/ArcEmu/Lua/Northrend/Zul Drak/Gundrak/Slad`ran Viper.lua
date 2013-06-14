--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Sladran_Viper_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Slad'ran_Viper_Venomous_Bite", math.random(12000,16000), 0)
end

function Sladran_Viper_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Sladran_Viper_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Sladran_Viper_Venomous_Bite(pUnit, Event)
	pUnit:FullCastSpellOnTarget(54987, pUnit:GetMainTank())
end

RegisterUnitEvent(29680, 1, "Sladran_Viper_OnCombat")
RegisterUnitEvent(29680, 2, "Sladran_Viper_OnLeaveCombat")
RegisterUnitEvent(29680, 4, "Sladran_Viper_OnDeath")