--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Master_OnCombat(Unit, Event)
	Unit:RegisterEvent("Master_Beam", 6000, 0)
end

function Master_Beam(Unit, Event) 
	Unit:FullCastSpellOnTarget(35919, Unit:GetMainTank()) 
end

function Master_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Master_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18857, 1, "Master_OnCombat")
RegisterUnitEvent(18857, 2, "Master_OnLeaveCombat")
RegisterUnitEvent(18857, 4, "Master_OnDied")