--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Halycon_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Rend", 7000, 0)
	pUnit:RegisterEvent("Thrash", 14000, 0)
end

function Rend(pUnit, Event)
	pUnit:CastSpellOnTarget(13738)
end

function Thrash(pUnit, Event)
	pUnit:CastSpell(3391)
end

function Halycon_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Halycon_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9736, 1, "Halycon_OnCombat")
RegisterUnitEvent(9736, 2, "Halycon_OnLeaveCombat")
RegisterUnitEvent(9736, 4, "Halycon_OnDied")