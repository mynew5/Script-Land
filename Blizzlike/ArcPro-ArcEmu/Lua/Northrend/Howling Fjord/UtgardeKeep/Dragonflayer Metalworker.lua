--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Dragonflayer_Metalworker_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Dragonflayer_Metalworker_Enrage", math.random(30000,34000), 1)
	pUnit:RegisterEvent("Dragonflayer_Metalworker_Sunder_Armor", math.random(9000,12000), 0)
end

function Dragonflayer_Metalworker_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Metalworker_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Metalworker_Enrage(pUnit, Event)
	pUnit:FullCastSpell(8599)
end

function Dragonflayer_Metalworker_Sunder_Armor(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15572, pUnit:GetMainTank())
end

RegisterUnitEvent(24078, 1, "Dragonflayer_Metalworker_OnCombat")
RegisterUnitEvent(24078, 2, "Dragonflayer_Metalworker_OnLeaveCombat")
RegisterUnitEvent(24078, 4, "Dragonflayer_Metalworker_OnDeath")