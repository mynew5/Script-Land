--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Dragonflayer_Spiritualist_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Dragonflayer_Spiritualist_Flame_Shock", math.random(9000, 12000), 0)
	pUnit:RegisterEvent("Dragonflayer_Spiritualist_Lightning_Bolt", math.random(5000, 7000), 0)
	pUnit:RegisterEvent("Dragonflayer_Spiritualist_Healing_Wave", 20000, 0)
end

function Dragonflayer_Spiritualist_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Spiritualist_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Spiritualist_Flame_Shock(pUnit, Event)
	pUnit:FullCastSpellOnTarget(51588, pUnit:GetRandomPlayer(0))
end

function Dragonflayer_Spiritualist_Lightning_Bolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(51587, pUnit:GetMainTank())
end

function Dragonflayer_Spiritualist_Healing_Wave(pUnit, Event)
	if(pUnit:GetHealthPct() <= 50) then
		pUnit:FullCastSpell(51586)
	end
end

RegisterUnitEvent(28410, 1, "Dragonflayer_Spiritualist_OnCombat")
RegisterUnitEvent(28410, 2, "Dragonflayer_Spiritualist_OnLeaveCombat")
RegisterUnitEvent(28410, 4, "Dragonflayer_Spiritualist_OnDeath")