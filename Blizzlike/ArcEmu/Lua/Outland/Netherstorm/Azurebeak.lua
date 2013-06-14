--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Azure_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Azure_Screech", 1000,0)
end

function Azure_Screech(Unit, Event)
    Unit:FullCastSpellOnTarget(31273, Unit:GetClosestPlayer())
end

function Azure_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Azure_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21005, 1, "Azure_OnEnterCombat")
RegisterUnitEvent(21005, 2, "Azure_OnLeaveCombat")
RegisterUnitEvent(21005, 4, "Azure_OnDied")