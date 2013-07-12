--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Dragonflayer_Forge_Master_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Dragonflayer_Forge_Master_Burning_Brand", math.random(7000,12000), 0)
end

function Dragonflayer_Forge_Master_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Forge_Master_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Forge_Master_Burning_Brand(pUnit, Event)
	pUnit:FullCastSpell(43757)
end

RegisterUnitEvent(24079, 1, "Dragonflayer_Forge_Master_OnCombat")
RegisterUnitEvent(24079, 2, "Dragonflayer_Forge_Master_OnLeaveCombat")
RegisterUnitEvent(24079, 4, "Dragonflayer_Forge_Master_OnDeath")