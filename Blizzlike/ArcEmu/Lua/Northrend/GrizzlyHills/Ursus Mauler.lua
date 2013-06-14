--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function UrsusMauler_OnCombat(Unit, Event)
	Unit:RegisterEvent("UrsusMauler_Maul", 5000, 0)
end

function UrsusMauler_Maul(Unit, Event) 
	Unit:FullCastSpellOnTarget(12161, Unit:GetMainTank()) 
end

function UrsusMauler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function UrsusMauler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26644, 1, "UrsusMauler_OnCombat")
RegisterUnitEvent(26644, 2, "UrsusMauler_OnLeaveCombat")
RegisterUnitEvent(26644, 4, "UrsusMauler_OnDied")