--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Deathclasp_OnCombat(Unit, Event)
	Unit:RegisterEvent("Deathclasp_KnockAway", 6000, 0)
	Unit:RegisterEvent("Deathclasp_ParalyzingPoison", 12000, 0)
end

function Deathclasp_KnockAway(Unit, Event) 
	Unit:FullCastSpellOnTarget(18670, Unit:GetMainTank()) 
end

function Deathclasp_ParalyzingPoison(Unit, Event) 
	Unit:FullCastSpellOnTarget(3609, Unit:GetRandomPlayer(0)) 
end

function Deathclasp_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Deathclasp_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15196, 1, "Deathclasp_OnCombat")
RegisterUnitEvent(15196, 2, "Deathclasp_OnLeaveCombat")
RegisterUnitEvent(15196, 4, "Deathclasp_OnDied")