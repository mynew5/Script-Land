--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HulkingAtrocity_OnCombat(Unit, Event)
	Unit:RegisterEvent("HulkingAtrocity_InfectedBite", 7000, 0)
end

function HulkingAtrocity_InfectedBite(Unit, Event) 
	Unit:FullCastSpellOnTarget(49861, Unit:GetMainTank()) 
end

function HulkingAtrocity_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HulkingAtrocity_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26948, 1, "HulkingAtrocity_OnCombat")
RegisterUnitEvent(26948, 2, "HulkingAtrocity_OnLeaveCombat")
RegisterUnitEvent(26948, 4, "HulkingAtrocity_OnDied")