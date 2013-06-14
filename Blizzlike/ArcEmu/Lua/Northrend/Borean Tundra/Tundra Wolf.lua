--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TundraWolf_OnCombat(Unit, Event)
	Unit:RegisterEvent("TundraWolf_InfectedBite", 8000, 0)
end

function TundraWolf_InfectedBite(Unit, Event) 
	Unit:FullCastSpellOnTarget(7367, Unit:GetMainTank()) 
end

function TundraWolf_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TundraWolf_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25675, 1, "TundraWolf_OnCombat")
RegisterUnitEvent(25675, 2, "TundraWolf_OnLeaveCombat")
RegisterUnitEvent(25675, 4, "TundraWolf_OnDied")