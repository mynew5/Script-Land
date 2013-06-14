--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Otto_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Pummel", 12000, 0)
	Unit:RegisterEvent("Backhand", 16000, 0)
end

function Pummel(Unit, Event)
	Unit:FullCastSpellOnTarget(12555, Unit:GetMainTank())
end

function Backhand(Unit, Event)
	Unit:FullCastSpellOnTarget(6253, Unit:GetMainTank())
end

function Otto_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Otto_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2599, 1, "Otto_OnEnterCombat")
RegisterUnitEvent(2599, 2, "Otto_OnLeaveCombat")
RegisterUnitEvent(2599, 4, "Otto_OnDied")