--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CultPlaguebringer_OnCombat(Unit, Event)
	Unit:RegisterEvent("CultPlaguebringer_InjectPlague", 8000, 0)
end

function CultPlaguebringer_InjectPlague(Unit, Event) 
	Unit:FullCastSpellOnTarget(50356, Unit:GetMainTank()) 
end

function CultPlaguebringer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CultPlaguebringer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24957, 1, "CultPlaguebringer_OnCombat")
RegisterUnitEvent(24957, 2, "CultPlaguebringer_OnLeaveCombat")
RegisterUnitEvent(24957, 4, "CultPlaguebringer_OnDied")