--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Overlord_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Cleave", 7000, 0)
	pUnit:RegisterEvent("Demoralizing_Shout", 14000, 0)
	pUnit:RegisterEvent("Sweeping_Slam", 21000, 0)
end

function Cleave(pUnit, Event)
	pUnit:CastSpellOnTarget(15284)
end

function Demoralizing_Shout(pUnit, Event)
	pUnit:CastSpell(16244)
end

function Sweeping_Slam(pUnit, Event)
	pUnit:CastSpellOnTarget(12887)
end

function Overlord_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Overlord_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9736, 1, "Overlord_OnCombat")
RegisterUnitEvent(9736, 2, "Overlord_OnLeaveCombat")
RegisterUnitEvent(9736, 4, "Overlord_OnDied")