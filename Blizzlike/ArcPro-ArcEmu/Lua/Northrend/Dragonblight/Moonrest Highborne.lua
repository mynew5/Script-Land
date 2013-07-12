--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MoonrestHighborne_OnCombat(Unit, Event)
	Unit:RegisterEvent("MoonrestHighborne_ShadowWordDeath", 6000, 0)
end

function MoonrestHighborne_ShadowWordDeath(Unit, Event) 
	Unit:FullCastSpellOnTarget(51818, Unit:GetMainTank()) 
end

function MoonrestHighborne_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MoonrestHighborne_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26455, 1, "MoonrestHighborne_OnCombat")
RegisterUnitEvent(26455, 2, "MoonrestHighborne_OnLeaveCombat")
RegisterUnitEvent(26455, 4, "MoonrestHighborne_OnDied")