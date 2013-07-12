--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CaptainOlster_OnCombat(Unit, Event)
	Unit:RegisterEvent("CaptainOlster_ConcussionBlow", 12000, 0)
	Unit:RegisterEvent("CaptainOlster_Intercept", 9000, 0)
	Unit:RegisterEvent("CaptainOlster_MortalStrike", 7000, 0)
end

function CaptainOlster_ConcussionBlow(Unit, Event) 
	Unit:FullCastSpellOnTarget(32588, Unit:GetMainTank()) 
end

function CaptainOlster_Intercept(Unit, Event) 
	Unit:FullCastSpellOnTarget(27577, Unit:GetMainTank()) 
end

function CaptainOlster_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(16856, Unit:GetMainTank()) 
end

function CaptainOlster_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CaptainOlster_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(23962, 1, "CaptainOlster_OnCombat")
RegisterUnitEvent(23962, 2, "CaptainOlster_OnLeaveCombat")
RegisterUnitEvent(23962, 4, "CaptainOlster_OnDied")