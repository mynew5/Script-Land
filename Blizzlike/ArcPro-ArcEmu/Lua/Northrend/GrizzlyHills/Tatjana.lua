--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Tatjana_OnCombat(Unit, Event)
	Unit:RegisterEvent("Tatjana_Cutdown", 8000, 0)
end

function Tatjana_Cutdown(Unit, Event) 
	Unit:FullCastSpellOnTarget(32009, Unit:GetMainTank()) 
end

function Tatjana_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Tatjana_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27627, 1, "Tatjana_OnCombat")
RegisterUnitEvent(27627, 2, "Tatjana_OnLeaveCombat")
RegisterUnitEvent(27627, 4, "Tatjana_OnDied")