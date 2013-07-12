--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]


function WestfallBrigadeElite_OnCombat(Unit, Event)
	Unit:RegisterEvent("WestfallBrigadeElite_Hamstring", 10000, 0)
	Unit:RegisterEvent("WestfallBrigadeElite_Strike", 8000, 0)
end

function WestfallBrigadeElite_Hamstring(Unit, Event) 
	Unit:FullCastSpellOnTarget(9080, Unit:GetMainTank()) 
end

function WestfallBrigadeElite_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(11976, Unit:GetMainTank()) 
end

function WestfallBrigadeElite_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WestfallBrigadeElite_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27549, 1, "WestfallBrigadeElite_OnCombat")
RegisterUnitEvent(27549, 2, "WestfallBrigadeElite_OnLeaveCombat")
RegisterUnitEvent(27549, 4, "WestfallBrigadeElite_OnDied")