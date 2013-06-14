--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Dragonflayer_Bonecrusher_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Dragonflayer_Bonecrusher_Head_Crack", 24000, 0)
	pUnit:RegisterEvent("Dragonflayer_Bonecrusher_Knockdown_Spin", math.random(12000,16000), 0)
end

function Dragonflayer_Bonecrusher_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Bonecrusher_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Bonecrusher_Head_Crack(pUnit, Event)
	pUnit:FullCastSpellOnTarget(9791, pUnit:GetMainTank())
end

function Dragonflayer_Bonecrusher_Knockdown_Spin(pUnit, Event)
	pUnit:FullCastSpell(43935)
end

RegisterUnitEvent(24069, 1, "Dragonflayer_Bonecrusher_OnCombat")
RegisterUnitEvent(24069, 2, "Dragonflayer_Bonecrusher_OnLeaveCombat")
RegisterUnitEvent(24069, 4, "Dragonflayer_Bonecrusher_OnDeath")