--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Dragonflayer_Runecaster_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Dragonflayer_Runecaster_Bolthorns_Rune_of_Flame", 10000, 0)
	pUnit:RegisterEvent("Dragonflayer_Runecaster_Njords_Rune_of_Protection", math.random(20000,25000), 0)
end

function Dragonflayer_Runecaster_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Runecaster_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Runecaster_Bolthorns_Rune_of_Flame(pUnit, Event)
	pUnit:FullCastSpell(54965)
end

function Dragonflayer_Runecaster_Njords_Rune_of_Protection(pUnit, Event)
	pUnit:FullCastSpell(42740)
end

RegisterUnitEvent(23960, 1, "Dragonflayer_Runecaster_OnCombat")
RegisterUnitEvent(23960, 2, "Dragonflayer_Runecaster_OnLeaveCombat")
RegisterUnitEvent(23960, 4, "Dragonflayer_Runecaster_OnDeath")