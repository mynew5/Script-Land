--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Drakkari_Fire_Weaver_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Drakkari_Fire_Weaver_Blast_Wave", math.random(19000,23000), 0)
	pUnit:RegisterEvent("Drakkari_Fire_Weaver_Lava_Burst", math.random(25000,27000), 0)
	pUnit:RegisterEvent("Drakkari_Fire_Weaver_Flame_Shock", math.random(12000,14000), 0)
end

function Drakkari_Fire_Weaver_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkari_Fire_Weaver_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkari_Fire_Weaver_Blast_Wave(pUnit, Event)
	pUnit:FullCastSpell(15744)
end

function Drakkari_Fire_Weaver_Lava_Burst(pUnit, Event)
	pUnit:FullCastSpellOnTarget(55659, pUnit:GetRandomPlayer(0))
end

function Drakkari_Fire_Weaver_Flame_Shock(pUnit, Event)
	pUnit:FullCastSpellOnTarget(55613, pUnit:GetRandomPlayer(0))
end

RegisterUnitEvent(29822, 1, "Drakkari_Fire_Weaver_OnCombat")
RegisterUnitEvent(29822, 2, "Drakkari_Fire_Weaver_OnLeaveCombat")
RegisterUnitEvent(29822, 4, "Drakkari_Fire_Weaver_OnDeath")