--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MindlessWight_OnCombat(Unit, Event)
	Unit:RegisterEvent("MindlessWight_Smash", 6000, 0)
end

function MindlessWight_Smash(Unit, Event) 
	Unit:FullCastSpellOnTarget(51334, Unit:GetMainTank()) 
end

function MindlessWight_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MindlessWight_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27287, 1, "MindlessWight_OnCombat")
RegisterUnitEvent(27287, 2, "MindlessWight_OnLeaveCombat")
RegisterUnitEvent(27287, 4, "MindlessWight_OnDied")