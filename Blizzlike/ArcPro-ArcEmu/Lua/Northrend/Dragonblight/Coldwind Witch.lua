--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ColdwindWitch_OnCombat(Unit, Event)
	Unit:RegisterEvent("ColdwindWitch_ColdwindBlast", 7000, 0)
end

function ColdwindWitch_ColdwindBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(51877, Unit:GetMainTank()) 
end

function ColdwindWitch_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ColdwindWitch_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26577, 1, "ColdwindWitch_OnCombat")
RegisterUnitEvent(26577, 2, "ColdwindWitch_OnLeaveCombat")
RegisterUnitEvent(26577, 4, "ColdwindWitch_OnDied")