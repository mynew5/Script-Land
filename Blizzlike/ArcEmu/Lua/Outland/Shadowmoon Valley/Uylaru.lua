--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Uylaru_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Uylaru_CorruptedSearingTotem", 20000, 0)
	Unit:RegisterEvent("Uylaru_FlameShock", 16000, 0)
end

function Uylaru_CorruptedSearingTotem(Unit,Event)
	Unit:FullCastSpellOnTarget(38581, Unit:GetClosestPlayer())
end

function Uylaru_FlameShock(Unit,Event)
	Unit:FullCastSpellOnTarget(15039, Unit:GetClosestPlayer())
end

function Uylaru_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Uylaru_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21710, 1, "Uylaru_OnEnterCombat")
RegisterUnitEvent(21710, 2, "Uylaru_OnLeaveCombat")
RegisterUnitEvent(21710, 4, "Uylaru_OnDied")