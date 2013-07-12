--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Gizrul_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Fatal_Bite", 7000, 0)
	pUnit:RegisterEvent("Frenzy", 14000, 0)
	pUnit:RegisterEvent("Infected_Bite", 21000, 0)
end

function Fatal_Bite(pUnit, Event)
	pUnit:CastSpellOnTarget(16495)
end

function Frenzy(pUnit, Event)
	pUnit:CastSpell(8269)
end

function Infected_Bite(pUnit, Event)
	pUnit:CastSpellOnTarget(16128)
end

function Gizrul_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Gizrul_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9736, 1, "Gizrul_OnCombat")
RegisterUnitEvent(9736, 2, "Gizrul_OnLeaveCombat")
RegisterUnitEvent(9736, 4, "Gizrul_OnDied")