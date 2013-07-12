--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function KelThuzad_OnCombat(Unit, Event)
	Unit:RegisterEvent("KelThuzad_SoulFlay", 15000, 0)
	Unit:RegisterEvent("KelThuzad_UnholyFrenzy", 20000, 0)
end

function KelThuzad_SoulFlay(Unit, Event) 
	Unit:FullCastSpellOnTarget(50319, Unit:GetMainTank()) 
end

function KelThuzad_UnholyFrenzy(Unit, Event) 
	Unit:FullCastSpellOnTarget(50312, Unit:GetMainTank()) 
end

function KelThuzad_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KelThuzad_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25465, 1, "KelThuzad_OnCombat")
RegisterUnitEvent(25465, 2, "KelThuzad_OnLeaveCombat")
RegisterUnitEvent(25465, 4, "KelThuzad_OnDied")