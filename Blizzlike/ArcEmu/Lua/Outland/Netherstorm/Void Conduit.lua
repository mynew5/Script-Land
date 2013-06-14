--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Conduit_OnCombat(Unit, Event)
	Unit:RegisterEvent("Conduit_Dummy", 9000, 0)
end

function Conduit_Dummy(Unit, Event) 
	Unit:FullCastSpellOnTarget(36780, Unit:GetMainTank()) 
end

function Conduit_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Conduit_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20899, 1, "Conduit_OnCombat")
RegisterUnitEvent(20899, 2, "Conduit_OnLeaveCombat")
RegisterUnitEvent(20899, 4, "Conduit_OnDied")