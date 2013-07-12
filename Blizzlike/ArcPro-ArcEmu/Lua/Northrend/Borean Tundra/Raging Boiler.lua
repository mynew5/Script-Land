--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RagingBoiler_OnCombat(Unit, Event)
	Unit:RegisterEvent("RagingBoiler_BoilingBlood", 8000, 0)
end

function RagingBoiler_BoilingBlood(Unit, Event) 
	Unit:FullCastSpellOnTarget(50207, Unit:GetMainTank()) 
end

function RagingBoiler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RagingBoiler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25417, 1, "RagingBoiler_OnCombat")
RegisterUnitEvent(25417, 2, "RagingBoiler_OnLeaveCombat")
RegisterUnitEvent(25417, 4, "RagingBoiler_OnDied")