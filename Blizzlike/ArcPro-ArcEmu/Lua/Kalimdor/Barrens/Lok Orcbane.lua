--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LokOrcbane_OnCombat(Unit, Event)
	Unit:RegisterEvent("LokOrcbane_Hamstring", 8000, 0)
end

function LokOrcbane_Hamstring(Unit, Event) 
	Unit:FullCastSpellOnTarget(9080, Unit:GetMainTank()) 
end

function LokOrcbane_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LokOrcbane_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3435, 1, "LokOrcbane_OnCombat")
RegisterUnitEvent(3435, 2, "LokOrcbane_OnLeaveCombat")
RegisterUnitEvent(3435, 4, "LokOrcbane_OnDied")