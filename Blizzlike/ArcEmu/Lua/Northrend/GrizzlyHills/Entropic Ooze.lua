--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EntropicOoze_OnCombat(Unit, Event)
	Unit:RegisterEvent("EntropicOoze_CrudeOoze", 7000, 0)
end

function EntropicOoze_CrudeOoze(Unit, Event) 
	Unit:FullCastSpellOnTarget(52334, Unit:GetMainTank()) 
end

function EntropicOoze_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EntropicOoze_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26366, 1, "EntropicOoze_OnCombat")
RegisterUnitEvent(26366, 2, "EntropicOoze_OnLeaveCombat")
RegisterUnitEvent(26366, 4, "EntropicOoze_OnDied")