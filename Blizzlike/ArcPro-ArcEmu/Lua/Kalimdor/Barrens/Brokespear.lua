--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Brokespear_OnCombat(Unit, Event)
	Unit:RegisterEvent("Brokespear_SlowingPoison", 15000, 0)
	Unit:RegisterEvent("Brokespear_Throw", 5000, 0)
end

function Brokespear_SlowingPoison(Unit, Event) 
	Unit:FullCastSpellOnTarget(7992, Unit:GetMainTank()) 
end

function Brokespear_Throw(Unit, Event) 
	Unit:FullCastSpellOnTarget(10277, Unit:GetMainTank()) 
end

function Brokespear_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Brokespear_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5838, 1, "Brokespear_OnCombat")
RegisterUnitEvent(5838, 2, "Brokespear_OnLeaveCombat")
RegisterUnitEvent(5838, 4, "Brokespear_OnDied")