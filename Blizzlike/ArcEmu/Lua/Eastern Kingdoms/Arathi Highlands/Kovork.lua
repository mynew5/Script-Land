--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Kovork_OnEnterCombat(Unit,Event)
local choice = math.random(1,2)
	if (choice == 1) then
		Unit:CastSpell(8269)
	elseif (choice == 2) then
		return
	end
end

function Kovork_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Kovork_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2603, 1, "Kovork_OnEnterCombat")
RegisterUnitEvent(2603, 2, "Kovork_OnLeaveCombat")
RegisterUnitEvent(2603, 4, "Kovork_OnDied")