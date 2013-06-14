--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CaldemereSnapper_OnCombat(Unit, Event)
	Unit:RegisterEvent("CaldemereSnapper_ClawGrasp", 10000, 0)
end

function CaldemereSnapper_ClawGrasp(Unit, Event) 
	Unit:FullCastSpellOnTarget(49978, Unit:GetMainTank()) 
end

function CaldemereSnapper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CaldemereSnapper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24287, 1, "CaldemereSnapper_OnCombat")
RegisterUnitEvent(24287, 2, "CaldemereSnapper_OnLeaveCombat")
RegisterUnitEvent(24287, 4, "CaldemereSnapper_OnDied")