--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: DARKI
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Radioactive_frostwalker_OnCombat(pUnit, event, miscpUnit, misc)
	pUnit:RegisterEvent("Ice_Blast", 10000, 0)
	pUnit:RegisterEvent("Ice_Nova", 17000, 0)
end

function Ice_Blast(pUnit, event, miscpUnit, misc)
	pUnit:FullCastSpellOnTarget(11264, pUnit:GetRandomPlayer(1))
end

function Ice_Nova(pUnit, event, miscpUnit, misc)
	pUnit:FullCastSpellOnTarget(22519, pUnit:GetClosestPlayer(1))
end

function Radioactive_frostwalker_OnLeaveCombat(pUnit)
	pUnit:RemoveEvents()
end

function Radioactive_frostwalker_OnDied(pUnit)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6227, 1, "Radioactive_frostwalker_OnCombat")
RegisterUnitEvent(6227, 2, "Radioactive_frostwalker_OnLeaveCombat")
RegisterUnitEvent(6227, 4, "Radioactive_frostwalker_OnDied")