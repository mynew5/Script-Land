--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function PlagueEruptor_OnCombat(Unit, Event)
	Unit:RegisterEvent("PlagueEruptor_PlagueCloud", 10000, 0)
end

function PlagueEruptor_PlagueCloud(Unit, Event) 
	Unit:FullCastSpellOnTarget(49350, Unit:GetMainTank()) 
end

function PlagueEruptor_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function PlagueEruptor_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27611, 1, "PlagueEruptor_OnCombat")
RegisterUnitEvent(27611, 2, "PlagueEruptor_OnLeaveCombat")
RegisterUnitEvent(27611, 4, "PlagueEruptor_OnDied")