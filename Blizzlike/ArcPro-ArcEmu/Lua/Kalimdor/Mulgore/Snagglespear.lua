--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Snagglespear_OnCombat(Unit, Event)
	Unit:RegisterEvent("Snagglespear_Net", 10000, 0)
end

function Snagglespear_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12024, pUnit:GetClosestPlayer()) 
end

function Snagglespear_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Snagglespear_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5786, 1, "Snagglespear_OnCombat")
RegisterUnitEvent(5786, 2, "Snagglespear_OnLeaveCombat")
RegisterUnitEvent(5786, 4, "Snagglespear_OnDied")