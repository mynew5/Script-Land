--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LegionCommanderTyralion_OnCombat(Unit, Event)
	Unit:RegisterEvent("LegionCommanderTyralion_Shoot", 5000, 0)
end

function LegionCommanderTyralion_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(15620, Unit:GetMainTank()) 
end

function LegionCommanderTyralion_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LegionCommanderTyralion_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27844, 1, "LegionCommanderTyralion_OnCombat")
RegisterUnitEvent(27844, 2, "LegionCommanderTyralion_OnLeaveCombat")
RegisterUnitEvent(27844, 4, "LegionCommanderTyralion_OnDied")