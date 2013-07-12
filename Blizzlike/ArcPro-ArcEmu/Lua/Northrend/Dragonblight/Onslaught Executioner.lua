--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OnslaughtExecutioner_OnCombat(Unit, Event)
	Unit:RegisterEvent("OnslaughtExecutioner_Hamstring", 8000, 0)
	Unit:RegisterEvent("OnslaughtExecutioner_MightyBlow", 9000, 0)
end

function OnslaughtExecutioner_Hamstring(Unit, Event) 
	Unit:FullCastSpellOnTarget(9080, Unit:GetMainTank()) 
end

function OnslaughtExecutioner_MightyBlow(Unit, Event) 
	Unit:FullCastSpellOnTarget(43673, Unit:GetMainTank()) 
end

function OnslaughtExecutioner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OnslaughtExecutioner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27211, 1, "OnslaughtExecutioner_OnCombat")
RegisterUnitEvent(27211, 2, "OnslaughtExecutioner_OnLeaveCombat")
RegisterUnitEvent(27211, 4, "OnslaughtExecutioner_OnDied")