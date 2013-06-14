--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Drakkisath_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Cleave", 7000, 0)
	pUnit:RegisterEvent("Conflagration", 14000, 0)
	pUnit:RegisterEvent("Flamestrike", 21000, 0)
	pUnit:RegisterEvent("Pierce_Armor", 28000, 0)
	pUnit:RegisterEvent("Rage", 35000, 0)
end

function Cleave(pUnit, Event)
	pUnit:CastSpellOnTarget(15284)
end

function Conflagration(pUnit, Event)
	pUnit:CastSpellOnTarget(16805)
end

function Flamestrike(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16419)
end

function Pierce_Armor(pUnit, Event)
	pUnit:CastSpellOnTarget(6016, pUnit:GetRandomPlayer())
end

function Rage(pUnit, Event)
	pUnit:CastSpell(16789)
end

function Drakkisath_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkisath_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(10584, 1, "Drakkisath_OnCombat")
RegisterUnitEvent(10584, 2, "Drakkisath_OnLeaveCombat")
RegisterUnitEvent(10584, 4, "Drakkisath_OnDeath")