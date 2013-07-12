--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SnorttheHeckler_OnCombat(Unit, Event)
	Unit:RegisterEvent("SnorttheHeckler_ToxicSpit", 6000, 0)
end

function SnorttheHeckler_ToxicSpit(Unit, Event) 
	Unit:FullCastSpellOnTarget(7951, Unit:GetMainTank()) 
end

function SnorttheHeckler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SnorttheHeckler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5829, 1, "SnorttheHeckler_OnCombat")
RegisterUnitEvent(5829, 2, "SnorttheHeckler_OnLeaveCombat")
RegisterUnitEvent(5829, 4, "SnorttheHeckler_OnDied")