--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Krellack_OnCombat(Unit, Event)
	Unit:RegisterEvent("Krellack_FatalSting", 8000, 0)
end

function Krellack_FatalSting(Unit, Event) 
	Unit:FullCastSpellOnTarget(17170, Unit:GetMainTank()) 
end

function Krellack_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Krellack_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14476, 1, "Krellack_OnCombat")
RegisterUnitEvent(14476, 2, "Krellack_OnLeaveCombat")
RegisterUnitEvent(14476, 4, "Krellack_OnDied")