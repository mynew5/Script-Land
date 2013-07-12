--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AzureManashaper_OnCombat(Unit, Event)
	Unit:RegisterEvent("AzureManashaper_ArcaneBlast", 8000, 0)
	Unit:RegisterEvent("AzureManashaper_Slow", 7000, 0)
end

function AzureManashaper_ArcaneBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(10833, Unit:GetMainTank()) 
end

function AzureManashaper_Slow(Unit, Event) 
	Unit:FullCastSpellOnTarget(25603, Unit:GetMainTank()) 
end

function AzureManashaper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AzureManashaper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(31401, 1, "AzureManashaper_OnCombat")
RegisterUnitEvent(31401, 2, "AzureManashaper_OnLeaveCombat")
RegisterUnitEvent(31401, 4, "AzureManashaper_OnDied")