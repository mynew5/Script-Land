--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Setis_OnCombat(Unit, Event)
	Unit:RegisterEvent("Setis_CrowdPummel", 8000, 0)
	Unit:RegisterEvent("Setis_WarStomp", 10000, 0)
end

function Setis_CrowdPummel(Unit, Event) 
	Unit:CastSpell(10887) 
end

function Setis_WarStomp(Unit, Event) 
	Unit:CastSpell(16727) 
end

function Setis_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Setis_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14471, 1, "Setis_OnCombat")
RegisterUnitEvent(14471, 2, "Setis_OnLeaveCombat")
RegisterUnitEvent(14471, 4, "Setis_OnDied")