--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Engineer_OnCombat(Unit, Event)
	Unit:RegisterEvent("Engineer_Beam", 6000, 0)
end

function Engineer_Beam(Unit, Event) 
	Unit:FullCastSpellOnTarget(35919, Unit:GetMainTank()) 
end

function Engineer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Engineer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18852, 1, "Engineer_OnCombat")
RegisterUnitEvent(18852, 2, "Engineer_OnLeaveCombat")
RegisterUnitEvent(18852, 4, "Engineer_OnDied")