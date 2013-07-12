--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OnslaughtRavenArchon_OnCombat(Unit, Event)
	Unit:RegisterEvent("OnslaughtRavenArchon_RavenFlock", 7000, 0)
	Unit:RegisterEvent("OnslaughtRavenArchon_UnholyFrenzy", 4000, 1)
end

function OnslaughtRavenArchon_RavenFlock(Unit, Event) 
	Unit:FullCastSpellOnTarget(50740, Unit:GetMainTank()) 
end

function OnslaughtRavenArchon_UnholyFrenzy(Unit, Event) 
	Unit:CastSpell(50743) 
end

function OnslaughtRavenArchon_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OnslaughtRavenArchon_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27357, 1, "OnslaughtRavenArchon_OnCombat")
RegisterUnitEvent(27357, 2, "OnslaughtRavenArchon_OnLeaveCombat")
RegisterUnitEvent(27357, 4, "OnslaughtRavenArchon_OnDied")