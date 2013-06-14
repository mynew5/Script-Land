--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SyndicateThief_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Backstab", 1000, 1)
	Unit:RegisterEvent("Disarm", 13000, 1)
	Unit:RegisterEvent("Poison", 20000, 1)
end

function Backstab(Unit, Event)
	Unit:FullCastSpellOnTarget(7159, Unit:GetMainTank())
end

function Disarm(Unit, Event)
	Unit:FullCastSpellOnTarget(6713, Unit:GetMainTank())
end

function Poison(Unit, Event)
	Unit:FullCastSpellOnTarget(744, Unit:GetMainTank())
end

function SyndicateThief_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function SyndicateThief_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2241, 1, "SyndicateThief_OnEnterCombat")
RegisterUnitEvent(2241, 2, "SyndicateThief_OnLeaveCombat")
RegisterUnitEvent(2241, 4, "SyndicateThief_OnDied")