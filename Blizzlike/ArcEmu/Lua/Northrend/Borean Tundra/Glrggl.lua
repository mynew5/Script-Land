--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Glrggl_OnCombat(Unit, Event)
	Unit:RegisterEvent("Glrggl_FlipperThwack", 8000, 0)
end

function Glrggl_FlipperThwack(Unit, Event) 
	Unit:FullCastSpellOnTarget(50169, Unit:GetMainTank()) 
end

function Glrggl_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Glrggl_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25203, 1, "Glrggl_OnCombat")
RegisterUnitEvent(25203, 2, "Glrggl_OnLeaveCombat")
RegisterUnitEvent(25203, 4, "Glrggl_OnDied")