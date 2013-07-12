--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Drakkari_Rhino_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Drakkari_Rhino_Charge", math.random(15000,18000), 0)
	pUnit:RegisterEvent("Drakkari_Rhino_Deafening_Roar", math.random(20000,23000), 0)
end

function Drakkari_Rhino_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkari_Rhino_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkari_Rhino_Charge(pUnit, Event)
	pUnit:FullCastSpellOnTarget(55530, pUnit:GetRandomPlayer(0))
end

function Drakkari_Rhino_Deafening_Roar(pUnit, Event)
	pUnit:FullCastSpell(55663)
end

RegisterUnitEvent(29838, 1, "Drakkari_Rhino_OnCombat")
RegisterUnitEvent(29838, 2, "Drakkari_Rhino_OnLeaveCombat")
RegisterUnitEvent(29838, 4, "Drakkari_Rhino_OnDeath")