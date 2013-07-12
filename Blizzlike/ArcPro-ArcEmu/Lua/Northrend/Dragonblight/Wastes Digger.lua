--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WastesDigger_OnCombat(Unit, Event)
	Unit:RegisterEvent("WastesDigger_CarnivorousBite", 4000, 0)
end

function WastesDigger_CarnivorousBite(Unit, Event) 
	Unit:FullCastSpellOnTarget(30639, Unit:GetMainTank()) 
end

function WastesDigger_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WastesDigger_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26492, 1, "WastesDigger_OnCombat")
RegisterUnitEvent(26492, 2, "WastesDigger_OnLeaveCombat")
RegisterUnitEvent(26492, 4, "WastesDigger_OnDied")