--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function UrsaltheMauler_OnCombat(Unit, Event)
	Unit:RegisterEvent("UrsaltheMauler_Maul", 6000, 0)
end

function UrsaltheMauler_Maul(Unit, Event) 
	Unit:FullCastSpellOnTarget(15793, Unit:GetMainTank()) 
end

function UrsaltheMauler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function UrsaltheMauler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2039, 1, "UrsaltheMauler_OnCombat")
RegisterUnitEvent(2039, 2, "UrsaltheMauler_OnLeaveCombat")
RegisterUnitEvent(2039, 4, "UrsaltheMauler_OnDied")