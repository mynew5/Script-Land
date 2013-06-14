--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Dragonflayer_Strategist_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Dragonflayer_Strategist_Blind", math.random(12000,15000), 0)
	pUnit:RegisterEvent("Dragonflayer_Strategist_Hurl_Dagger", math.random(3000,6000), 0)
	pUnit:RegisterEvent("Dragonflayer_Strategist_Ticking_Bomb", math.random(20000,24000), 0)
end

function Dragonflayer_Strategist_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Strategist_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Strategist_Blind(pUnit, Event)
	pUnit:FullCastSpellOnTarget(42972, pUnit:GetRandomPlayer(0))
end

function Dragonflayer_Strategist_Hurl_Dagger(pUnit, Event)
	pUnit:FullCastSpellOnTarget(42772, pUnit:GetMainTank())
end

function Dragonflayer_Strategist_Ticking_Bomb(pUnit, Event)
	pUnit:FullCastSpellOnTarget(54955, pUnit:GetRandomPlayer(0))
end

RegisterUnitEvent(23956, 1, "Dragonflayer_Strategist_OnCombat")
RegisterUnitEvent(23956, 2, "Dragonflayer_Strategist_OnLeaveCombat")
RegisterUnitEvent(23956, 4, "Dragonflayer_Strategist_OnDeath")