--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RisenWintergardeMiner_OnCombat(Unit, Event)
	Unit:RegisterEvent("RisenWintergardeMiner_PunctureWound", 7000, 0)
end

function RisenWintergardeMiner_PunctureWound(Unit, Event) 
	Unit:FullCastSpellOnTarget(48374, Unit:GetMainTank()) 
end

function RisenWintergardeMiner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RisenWintergardeMiner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27401, 1, "RisenWintergardeMiner_OnCombat")
RegisterUnitEvent(27401, 2, "RisenWintergardeMiner_OnLeaveCombat")
RegisterUnitEvent(27401, 4, "RisenWintergardeMiner_OnDied")