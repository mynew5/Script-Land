--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HulkingJormungar_OnCombat(Unit, Event)
	Unit:RegisterEvent("HulkingJormungar_CorrosivePoison", 4000, 1)
	Unit:RegisterEvent("HulkingJormungar_CorrosiveSpit", 6000, 1)
end

function HulkingJormungar_CorrosivePoison(Unit, Event) 
	Unit:FullCastSpellOnTarget(50293, Unit:GetMainTank()) 
end

function HulkingJormungar_CorrosiveSpit(Unit, Event) 
	Unit:FullCastSpellOnTarget(47611, Unit:GetMainTank()) 
end

function HulkingJormungar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HulkingJormungar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26293, 1, "HulkingJormungar_OnCombat")
RegisterUnitEvent(26293, 2, "HulkingJormungar_OnLeaveCombat")
RegisterUnitEvent(26293, 4, "HulkingJormungar_OnDied")