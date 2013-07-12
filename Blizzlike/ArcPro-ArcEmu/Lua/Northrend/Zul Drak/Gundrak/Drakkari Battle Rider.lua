--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Drakkari_Battle_Rider_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Drakkari_Battle_Rider_Poisoned_Spear", math.random(23000,27000), 0)
	pUnit:RegisterEvent("Drakkari_Battle_Rider_Throw", math.random(11000,15000), 0)
end

function Drakkari_Battle_Rider_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkari_Battle_Rider_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkari_Battle_Rider_Poisoned_Spear(pUnit, Event)
	pUnit:FullCastSpellOnTarget(55521, pUnit:GetRandomPlayer(0))
end

function Drakkari_Battle_Rider_Throw(pUnit, Event)
	pUnit:FullCastSpellOnTarget(55348, pUnit:GetMainTank())
end

RegisterUnitEvent(29836, 1, "Drakkari_Battle_Rider_OnCombat")
RegisterUnitEvent(29836, 2, "Drakkari_Battle_Rider_OnLeaveCombat")
RegisterUnitEvent(29836, 4, "Drakkari_Battle_Rider_OnDeath")