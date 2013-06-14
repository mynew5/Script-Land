--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TempusWyrm_OnCombat(Unit, Event)
	Unit:RegisterEvent("TempusWyrm_TimeShock", 5000, 0)
end

function TempusWyrm_TimeShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(60076, Unit:GetMainTank()) 
end

function TempusWyrm_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TempusWyrm_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(32180, 1, "TempusWyrm_OnCombat")
RegisterUnitEvent(32180, 2, "TempusWyrm_OnLeaveCombat")
RegisterUnitEvent(32180, 4, "TempusWyrm_OnDied")