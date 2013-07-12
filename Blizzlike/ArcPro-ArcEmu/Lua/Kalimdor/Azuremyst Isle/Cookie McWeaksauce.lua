--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CookieMcWeaksauce_OnCombat(Unit, Event)
	Unit:RegisterEvent("CookieMcWeaksauce_Shoot", 6000, 0)
end

function CookieMcWeaksauce_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(30221, 	pUnit:GetRandomPlayer(0)) 
end

function CookieMcWeaksauce_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CookieMcWeaksauce_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17246, 1, "CookieMcWeaksauce_OnCombat")
RegisterUnitEvent(17246, 2, "CookieMcWeaksauce_OnLeaveCombat")
RegisterUnitEvent(17246, 4, "CookieMcWeaksauce_OnDied")