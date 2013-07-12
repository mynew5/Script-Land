--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Markaru_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Markaru_Spit", 2500, 0)
end

function Markaru_Spit(Unit, Event)
    Unit:FullCastSpellOnTarget(36627, Unit:ClosestPlayer())
end

function Markaru_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Markaru_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20775, 1, "Markaru_OnEnterCombat")
RegisterUnitEvent(20775, 2, "Markaru_OnLeaveCombat")
RegisterUnitEvent(20775, 4, "Markaru_OnDied")