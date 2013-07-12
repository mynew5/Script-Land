--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Drakkari_Lancer_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Drakkari_Lancer_Disarm", math.random(17000,26000), 0)
	pUnit:RegisterEvent("Drakkari_Lancer_Impale", math.random(13000,16000), 0)
	pUnit:RegisterEvent("Drakkari_Lancer_Retaliation", 30000, 0)
end

function Drakkari_Lancer_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkari_Lancer_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkari_Lancer_Disarm(pUnit, Event)
	pUnit:FullCastSpellOnTarget(6713, pUnit:GetMainTank())
end

function Drakkari_Lancer_Impale(pUnit, Event)
	pUnit:FullCastSpellOnTarget(55622, pUnit:GetMainTank())
end

function Drakkari_Lancer_Retaliation(pUnit, Event)
	pUnit:FullCastSpell(40546)
end

RegisterUnitEvent(29819, 1, "Drakkari_Lancer_OnCombat")
RegisterUnitEvent(29819, 2, "Drakkari_Lancer_OnLeaveCombat")
RegisterUnitEvent(29819, 4, "Drakkari_Lancer_OnDeath")