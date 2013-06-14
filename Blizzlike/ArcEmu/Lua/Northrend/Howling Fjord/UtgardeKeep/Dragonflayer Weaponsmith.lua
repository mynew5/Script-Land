--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Dragonflayer_Weaponsmith_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Dragonflayer_Weaponsmith_Cleave", math.random(14000,16000), 0)
	pUnit:RegisterEvent("Dragonflayer_Weaponsmith_Concussion_Blow", 30000, 0)
	pUnit:RegisterEvent("Dragonflayer_Weaponsmith_Disarm", math.random(17000,24000), 0)
end

function Dragonflayer_Weaponsmith_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Weaponsmith_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Weaponsmith_Cleave(pUnit, Event)
	pUnit:FullCastSpellOnTarget(42724, pUnit:GetMainTank())
end

function Dragonflayer_Weaponsmith_Concussion_Blow(pUnit, Event)
	pUnit:FullCastSpellOnTarget(22427, pUnit:GetMainTank())
end

function Dragonflayer_Weaponsmith_Disarm(pUnit, Event)
	pUnit:FullCastSpellOnTarget(6713, pUnit:GetMainTank())
end

RegisterUnitEvent(24080, 1, "Dragonflayer_Weaponsmith_OnCombat")
RegisterUnitEvent(24080, 2, "Dragonflayer_Weaponsmith_OnLeaveCombat")
RegisterUnitEvent(24080, 4, "Dragonflayer_Weaponsmith_OnDeath")