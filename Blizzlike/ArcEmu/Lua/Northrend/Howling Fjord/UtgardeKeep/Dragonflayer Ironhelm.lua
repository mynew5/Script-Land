--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Dragonflayer_Ironhelm_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Dragonflayer_Ironhelm_Heroic_Strike", 5000, 0)
	pUnit:RegisterEvent("Dragonflayer_Ironhelm_Ringing_Slap", math.random(12000,15000), 0)
end

function Dragonflayer_Ironhelm_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Ironhelm_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Ironhelm_Heroic_Strike(pUnit, Event)
	pUnit:FullCastSpellOnTarget(29426, pUnit:GetMainTank())
end

function Dragonflayer_Ironhelm_Ringing_Slap(pUnit, Event)
	pUnit:FullCastSpellOnTarget(42780, pUnit:GetMainTank())
end

RegisterUnitEvent(23961, 1, "Dragonflayer_Ironhelm_OnCombat")
RegisterUnitEvent(23961, 2, "Dragonflayer_Ironhelm_OnLeaveCombat")
RegisterUnitEvent(23961, 4, "Dragonflayer_Ironhelm_OnDeath")