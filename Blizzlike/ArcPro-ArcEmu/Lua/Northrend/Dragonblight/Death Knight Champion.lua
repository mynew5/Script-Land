--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DeathKnightChampion_OnCombat(Unit, Event)
	Unit:RegisterEvent("DeathKnightChampion_BloodPresence", 1000, 1)
	Unit:RegisterEvent("DeathKnightChampion_PlagueStrike", 8000, 0)
end

function DeathKnightChampion_BloodPresence(Unit, Event) 
	Unit:CastSpell(50689) 
end

function DeathKnightChampion_PlagueStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(50688, Unit:GetMainTank()) 
end

function DeathKnightChampion_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DeathKnightChampion_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27288, 1, "DeathKnightChampion_OnCombat")
RegisterUnitEvent(27288, 2, "DeathKnightChampion_OnLeaveCombat")
RegisterUnitEvent(27288, 4, "DeathKnightChampion_OnDied")