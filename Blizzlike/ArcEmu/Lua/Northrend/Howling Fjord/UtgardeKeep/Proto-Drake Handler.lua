--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ProtoDrake_Handler_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("ProtoDrake_Handler_Debilitating_Strike", math.random(5000,7000), 0)
	pUnit:RegisterEvent("ProtoDrake_Handler_Throw", math.random(8000,9000), 0)
	pUnit:RegisterEvent("ProtoDrake_Handler_Unholy_Rage", 20000, 0)
end

function ProtoDrake_Handler_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function ProtoDrake_Handler_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function ProtoDrake_Handler_Debilitating_Strike(pUnit, Event)
	pUnit:FullCastSpellOnTarget(38621, pUnit:GetMainTank())
end

function ProtoDrake_Handler_Throw(pUnit, Event)
	pUnit:FullCastSpellOnTarget(54983, pUnit:GetRandomPlayer(0))
end

function ProtoDrake_Handler_Unholy_Rage(pUnit, Event)
	pUnit:FullCastSpell(43664)
end

RegisterUnitEvent(24082, 1, "ProtoDrake_Handler_OnCombat")
RegisterUnitEvent(24082, 2, "ProtoDrake_Handler_OnLeaveCombat")
RegisterUnitEvent(24082, 4, "ProtoDrake_Handler_OnDeath")