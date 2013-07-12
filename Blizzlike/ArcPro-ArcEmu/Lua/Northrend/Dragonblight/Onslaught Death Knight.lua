--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OnslaughtDeathKnight_OnCombat(Unit, Event)
	Unit:RegisterEvent("OnslaughtDeathKnight_BloodPresence", 1000, 1)
	Unit:RegisterEvent("OnslaughtDeathKnight_PlagueStrike", 8000, 0)
end

function OnslaughtDeathKnight_BloodPresence(Unit, Event) 
	Unit:CastSpell(50689) 
end

function OnslaughtDeathKnight_PlagueStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(50688, Unit:GetMainTank()) 
end

function OnslaughtDeathKnight_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OnslaughtDeathKnight_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27367, 1, "OnslaughtDeathKnight_OnCombat")
RegisterUnitEvent(27367, 2, "OnslaughtDeathKnight_OnLeaveCombat")
RegisterUnitEvent(27367, 4, "OnslaughtDeathKnight_OnDied")