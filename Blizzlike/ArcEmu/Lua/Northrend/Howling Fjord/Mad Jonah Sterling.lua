--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MadJonahSterling_OnCombat(Unit, Event)
	Unit:RegisterEvent("MadJonahSterling_WildlyFlailing", 6000, 0)
end

function MadJonahSterling_WildlyFlailing(Unit, Event) 
	Unit:FullCastSpellOnTarget(50188, Unit:GetMainTank()) 
end

function MadJonahSterling_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MadJonahSterling_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24742, 1, "MadJonahSterling_OnCombat")
RegisterUnitEvent(24742, 2, "MadJonahSterling_OnLeaveCombat")
RegisterUnitEvent(24742, 4, "MadJonahSterling_OnDied")