--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WitherbarkHeadhunter_OnEnterCombat(Unit,Event)
local choice = math.random(1,2)
	if (choice == 1) then
		Unit:FullCastSpellOnTarget(4974, Unit:GetMainTank())
		Unit:RegisterEvent("Execute", 1000, 1)
		Unit:RegisterEvent("Net", 8000, 0)
	elseif (choice == 2) then
		Unit:RegisterEvent("Execute", 1000, 1)
		Unit:RegisterEvent("Net", 8000, 0)
	end
end

function Execute(Unit,Event)
	if(Unit:GetMainTank():GetHealthPct() == 20) then
		Unit:FullCastSpellOnTarget(7160, Unit:GetMainTank())
	end
end

function Net(Unit,Event)
	Unit:FullCastSpellOnTarget(6533, Unit:GetMainTank())
end

function WitherbarkHeadhunter_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function WitherbarkHeadhunter_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2605, 1, "WitherbarkHeadhunter_OnEnterCombat")
RegisterUnitEvent(2605, 2, "WitherbarkHeadhunter_OnLeaveCombat")
RegisterUnitEvent(2605, 4, "WitherbarkHeadhunter_OnDied")