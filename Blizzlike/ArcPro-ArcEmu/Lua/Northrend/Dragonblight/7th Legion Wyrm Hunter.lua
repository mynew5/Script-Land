--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function thLegionWyrmHunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("thLegionWyrmHunter_Shoot", 6000, 0)
end

function thLegionWyrmHunter_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(15620, Unit:GetMainTank()) 
end

function thLegionWyrmHunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function thLegionWyrmHunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26779, 1, "thLegionWyrmHunter_OnCombat")
RegisterUnitEvent(26779, 2, "thLegionWyrmHunter_OnLeaveCombat")
RegisterUnitEvent(26779, 4, "thLegionWyrmHunter_OnDied")