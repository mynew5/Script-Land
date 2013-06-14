--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Stalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("Stalker_Backstab", 6000, 0)
	Unit:RegisterEvent("Stalker_Warp", 8000, 0)
end

function Stalker_Backstab(Unit, Event) 
	Unit:FullCastSpellOnTarget(7159, Unit:GetMainTank()) 
end

function Stalker_Warp(Unit, Event) 
	Unit:CastSpell(32920) 
end

function Stalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Stalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(19642, 1, "Stalker_OnCombat")
RegisterUnitEvent(19642, 2, "Stalker_OnLeaveCombat")
RegisterUnitEvent(19642, 4, "Stalker_OnDied")