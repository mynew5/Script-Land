--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RisenLongrunner_OnCombat(Unit, Event)
	Unit:RegisterEvent("RisenLongrunner_GhostStrike", 8000, 0)
end

function RisenLongrunner_GhostStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(36093, Unit:GetMainTank()) 
end

function RisenLongrunner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RisenLongrunner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25350, 1, "RisenLongrunner_OnCombat")
RegisterUnitEvent(25350, 2, "RisenLongrunner_OnLeaveCombat")
RegisterUnitEvent(25350, 4, "RisenLongrunner_OnDied")