--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WarleaderKrazzilak_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarleaderKrazzilak_Backhand", 8000, 0)
	Unit:RegisterEvent("WarleaderKrazzilak_Hamstring", 15000, 0)
	Unit:RegisterEvent("WarleaderKrazzilak_InfectedWound", 20000, 1)
end

function WarleaderKrazzilak_Backhand(Unit, Event) 
	Unit:FullCastSpellOnTarget(18103, Unit:GetMainTank()) 
end

function WarleaderKrazzilak_Hamstring(Unit, Event) 
	Unit:FullCastSpellOnTarget(9080, Unit:GetMainTank()) 
end

function WarleaderKrazzilak_InfectedWound(Unit, Event) 
	Unit:FullCastSpellOnTarget(17230, Unit:GetMainTank()) 
end

function WarleaderKrazzilak_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarleaderKrazzilak_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8199, 1, "WarleaderKrazzilak_OnCombat")
RegisterUnitEvent(8199, 2, "WarleaderKrazzilak_OnLeaveCombat")
RegisterUnitEvent(8199, 4, "WarleaderKrazzilak_OnDied")