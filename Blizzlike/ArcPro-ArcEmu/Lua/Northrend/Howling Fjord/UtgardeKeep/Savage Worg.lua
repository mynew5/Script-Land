--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Savage_Worg_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Savage_Worg_Pounce", 31000, 0)
end

function Savage_Worg_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Savage_Worg_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Savage_Worg_Pounce(pUnit, Event)
	pUnit:FullCastSpellOnTarget(55077, pUnit:GetMainTank())
end

RegisterUnitEvent(29735, 1, "Savage_Worg_OnCombat")
RegisterUnitEvent(29735, 2, "Savage_Worg_OnLeaveCombat")
RegisterUnitEvent(29735, 4, "Savage_Worg_OnDeath")