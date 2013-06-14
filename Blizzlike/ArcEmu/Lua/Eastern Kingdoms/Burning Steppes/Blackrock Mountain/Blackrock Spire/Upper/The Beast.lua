--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Beast_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Berserker_Charge", 7000, 0)
	pUnit:RegisterEvent("Fire_Blast", 14000, 0)
	pUnit:RegisterEvent("Fireball", 21000, 0)
	pUnit:RegisterEvent("Flamebreak", 28000, 0)
	pUnit:RegisterEvent("Immolate", 35000, 0)
	pUnit:RegisterEvent("Summon_Player", 42000, 0)
	pUnit:RegisterEvent("Terrifying_Roar", 49000, 0)
end

function Berserker_Charge(pUnit, Event)
	pUnit:CastSpellOnTarget(16636)
end

function Fire_Blast(pUnit, Event)
	pUnit:CastSpellOnTarget(16144)
end

function Fireball(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16788)
end

function Flamebreak(pUnit, Event)
	pUnit:CastSpellOnTarget(16785)
end

function Immolate(pUnit, Event)
	pUnit:CastSpellOnTarget(15570)
end

function Summon_Player(pUnit, Event)
	pUnit:CastSpellOnTarget(20477, pUnit:GetRandomPlayer())
end

function Terrifying_Roar(pUnit, Event)
	pUnit:CastSpellOnTarget(14100)
end

function Beast_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Beast_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(10430, 1, "Beast_OnCombat")
RegisterUnitEvent(10430, 2, "Beast_OnLeaveCombat")
RegisterUnitEvent(10430, 4, "Beast_OnDeath")