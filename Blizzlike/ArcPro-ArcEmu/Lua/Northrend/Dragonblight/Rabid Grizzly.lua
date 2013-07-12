--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RabidGrizzly_OnCombat(Unit, Event)
	Unit:RegisterEvent("RabidGrizzly_Rabies", 8000, 0)
end

function RabidGrizzly_Rabies(Unit, Event) 
	Unit:FullCastSpellOnTarget(51951, Unit:GetMainTank()) 
end

function RabidGrizzly_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RabidGrizzly_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26643, 1, "RabidGrizzly_OnCombat")
RegisterUnitEvent(26643, 2, "RabidGrizzly_OnLeaveCombat")
RegisterUnitEvent(26643, 4, "RabidGrizzly_OnDied")