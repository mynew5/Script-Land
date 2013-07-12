--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ChillmereCoastrunner_OnCombat(Unit, Event)
	Unit:RegisterEvent("ChillmereCoastrunner_InstantPoison", 8000, 0)
	Unit:RegisterEvent("ChillmereCoastrunner_Rupture", 10000, 0)
end

function ChillmereCoastrunner_InstantPoison(Unit, Event) 
	Unit:FullCastSpellOnTarget(28428, Unit:GetMainTank()) 
end

function ChillmereCoastrunner_Rupture(Unit, Event) 
	Unit:FullCastSpellOnTarget(14874, Unit:GetMainTank()) 
end

function ChillmereCoastrunner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ChillmereCoastrunner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24459, 1, "ChillmereCoastrunner_OnCombat")
RegisterUnitEvent(24459, 2, "ChillmereCoastrunner_OnLeaveCombat")
RegisterUnitEvent(24459, 4, "ChillmereCoastrunner_OnDied")