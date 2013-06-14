--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MSW_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Crystallize", 7000, 0)
	pUnit:RegisterEvent("MothersMilk", 14000, 0)
	pUnit:RegisterEvent("Summon", 21000, 0)
end

function Crystallize(pUnit, Event)
	pUnit:CastSpellOnTarget(16104)
end

function MothersMilk(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16468)
end

function Summon(pUnit, Event)
	pUnit:CastSpell(16103)
end

function MSW_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function MSW_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(10596, 1, "MSW_OnCombat")
RegisterUnitEvent(10596, 2, "MSW_OnLeaveCombat")
RegisterUnitEvent(10596, 4, "MSW_OnDeath")