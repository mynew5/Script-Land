--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

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