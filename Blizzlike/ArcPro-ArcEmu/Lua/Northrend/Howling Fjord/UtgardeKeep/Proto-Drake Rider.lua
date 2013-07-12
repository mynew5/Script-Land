--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ProtoDrake_Rider_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("ProtoDrake_Rider_Piercing_Jab", math.random(16000,18000), 0)
	pUnit:RegisterEvent("ProtoDrake_Rider_Throw", math.random(6000,8000), 0)
	pUnit:RegisterEvent("ProtoDrake_Rider_Wing_Clip", 12000, 0)
end

function ProtoDrake_Rider_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function ProtoDrake_Rider_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function ProtoDrake_Rider_Piercing_Jab(pUnit, Event)
	pUnit:FullCastSpellOnTarget(31551, pUnit:GetMainTank())
end

function ProtoDrake_Rider_Throw(pUnit, Event)
	pUnit:FullCastSpellOnTarget(43665, pUnit:GetRandomPlayer(0))
end

function ProtoDrake_Rider_Wing_Clip(pUnit, Event)
	pUnit:FullCastSpellOnTarget(32908, pUnit:GetMainTank())
end

RegisterUnitEvent(24849, 1, "ProtoDrake_Rider_OnCombat")
RegisterUnitEvent(24849, 2, "ProtoDrake_Rider_OnLeaveCombat")
RegisterUnitEvent(24849, 4, "ProtoDrake_Rider_OnDeath")