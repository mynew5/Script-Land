--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Radioactive_frostwalker_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Ice_Blast", 7000, 0)
	pUnit:RegisterEvent("Ice_Nova", 14000, 0)
end

function Ice_Blast(pUnit, Event)
	pUnit:FullCastSpellOnTarget(11264, pUnit:GetRandomPlayer(1))
end

function Ice_Nova(pUnit, Event)
	pUnit:FullCastSpellOnTarget(22519, pUnit:GetClosestPlayer(1))
end

function Radioactive_frostwalker_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Radioactive_frostwalker_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6227, 1, "Radioactive_frostwalker_OnCombat")
RegisterUnitEvent(6227, 2, "Radioactive_frostwalker_OnLeaveCombat")
RegisterUnitEvent(6227, 4, "Radioactive_frostwalker_OnDied")