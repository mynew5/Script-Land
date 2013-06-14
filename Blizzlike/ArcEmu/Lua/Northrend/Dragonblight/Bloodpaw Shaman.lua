--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BloodpawShaman_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodpawShaman_Bloodlust", 4000, 1)
	Unit:RegisterEvent("BloodpawShaman_EarthShock", 6000, 0)
	Unit:RegisterEvent("BloodpawShaman_Stormstrike", 8000, 0)
end

function BloodpawShaman_Bloodlust(Unit, Event) 
	Unit:CastSpell(6742) 
end

function BloodpawShaman_EarthShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(13281, Unit:GetMainTank()) 
end

function BloodpawShaman_Stormstrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(51876, Unit:GetMainTank()) 
end

function BloodpawShaman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BloodpawShaman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27343, 1, "BloodpawShaman_OnCombat")
RegisterUnitEvent(27343, 2, "BloodpawShaman_OnLeaveCombat")
RegisterUnitEvent(27343, 4, "BloodpawShaman_OnDied")