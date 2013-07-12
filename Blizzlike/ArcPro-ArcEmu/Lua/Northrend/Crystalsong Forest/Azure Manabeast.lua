--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AzureManabeast_OnCombat(Unit, Event)
	Unit:RegisterEvent("AzureManabeast_ManaBite", 8000, 0)
end

function AzureManabeast_ManaBite(Unit, Event) 
	Unit:FullCastSpellOnTarget(59105, Unit:GetMainTank()) 
end

function AzureManabeast_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AzureManabeast_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(31404, 1, "AzureManabeast_OnCombat")
RegisterUnitEvent(31404, 2, "AzureManabeast_OnLeaveCombat")
RegisterUnitEvent(31404, 4, "AzureManabeast_OnDied")