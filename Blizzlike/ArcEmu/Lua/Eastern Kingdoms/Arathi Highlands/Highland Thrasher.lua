--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HighlandThrasher_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Thrash", 7000, 0)
end

function Thrash(Unit, Event)
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank())
end

function HighlandThrasher_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function HighlandThrasher_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2560, 1, "HighlandThrasher_OnEnterCombat")
RegisterUnitEvent(2560, 2, "HighlandThrasher_OnLeaveCombat")
RegisterUnitEvent(2560, 4, "HighlandThrasher_OnDied")