--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function VyraltheVile_OnCombat(Unit, Event)
	Unit:RegisterEvent("VyraltheVile_Fireball", 8000, 0)
	Unit:RegisterEvent("VyraltheVile_ShadowShock", 6000, 0)
end

function VyraltheVile_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(19816, Unit:GetMainTank()) 
end

function VyraltheVile_ShadowShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(17439, Unit:GetMainTank()) 
end

function VyraltheVile_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VyraltheVile_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15202, 1, "VyraltheVile_OnCombat")
RegisterUnitEvent(15202, 2, "VyraltheVile_OnLeaveCombat")
RegisterUnitEvent(15202, 4, "VyraltheVile_OnDied")