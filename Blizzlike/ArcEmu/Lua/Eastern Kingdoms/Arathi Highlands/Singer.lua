--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Singer_OnEnterCombat(Unit, Event)
	Unit:CastSpell(13730)
	Unit:RegisterEvent("DominateMind", 34000, 0)
end

function DominateMind(Unit, Event)
	Unit:FullCastSpellOnTarget(14515, Unit:GetMainTank())
end

function Singer_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Singer_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2600, 1, "Singer_OnEnterCombat")
RegisterUnitEvent(2600, 2, "Singer_OnLeaveCombat")
RegisterUnitEvent(2600, 4, "Singer_OnDied")