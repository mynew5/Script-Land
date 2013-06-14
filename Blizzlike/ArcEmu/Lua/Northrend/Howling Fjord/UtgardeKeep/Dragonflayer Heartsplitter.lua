--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Dragonflayer_Heartsplitter_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Dragonflayer_Heartsplitter_Piercing_Jab", math.random(16000,18000), 0)
	pUnit:RegisterEvent("Dragonflayer_Heartsplitter_Throw", math.random(5000,7000), 0)
	pUnit:RegisterEvent("Dragonflayer_Heartsplitter_Wing_Clip", 13000, 0)
end

function Dragonflayer_Heartsplitter_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Heartsplitter_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Heartsplitter_Piercing_Jab(pUnit, Event)
	pUnit:FullCastSpellOnTarget(31551, pUnit:GetMainTank())
end

function Dragonflayer_Heartsplitter_Throw(pUnit, Event)
	pUnit:FullCastSpellOnTarget(43665, pUnit:GetRandomPlayer(0))
end

function Dragonflayer_Heartsplitter_Wing_Clip(pUnit, Event)
	pUnit:FullCastSpellOnTarget(32908, pUnit:GetClosestPlayer())
end

RegisterUnitEvent(24071, 1, "Dragonflayer_Heartsplitter_OnCombat")
RegisterUnitEvent(24071, 2, "Dragonflayer_Heartsplitter_OnLeaveCombat")
RegisterUnitEvent(24071, 4, "Dragonflayer_Heartsplitter_OnDeath")