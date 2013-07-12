--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SnowTrackerHaloke_OnCombat(Unit, Event)
	Unit:RegisterEvent("SnowTrackerHaloke_Shoot", 6000, 0)
end

function SnowTrackerHaloke_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function SnowTrackerHaloke_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SnowTrackerHaloke_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26768, 1, "SnowTrackerHaloke_OnCombat")
RegisterUnitEvent(26768, 2, "SnowTrackerHaloke_OnLeaveCombat")
RegisterUnitEvent(26768, 4, "SnowTrackerHaloke_OnDied")