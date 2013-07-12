--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OnslaughtMason_OnCombat(Unit, Event)
	Unit:RegisterEvent("OnslaughtMason_SlingMortar", 6500, 0)
	Unit:RegisterEvent("OnslaughtMason_SunderArmor", 5500, 0)
end

function OnslaughtMason_SlingMortar(Unit, Event) 
	Unit:FullCastSpellOnTarget(50701, Unit:GetMainTank()) 
end

function OnslaughtMason_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(50370, Unit:GetMainTank()) 
end

function OnslaughtMason_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OnslaughtMason_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27333, 1, "OnslaughtMason_OnCombat")
RegisterUnitEvent(27333, 2, "OnslaughtMason_OnLeaveCombat")
RegisterUnitEvent(27333, 4, "OnslaughtMason_OnDied")