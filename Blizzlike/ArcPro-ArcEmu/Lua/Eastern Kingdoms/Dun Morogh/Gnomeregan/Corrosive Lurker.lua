--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function corrosive_lurker_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Dazed", 7000, 0)
	pUnit:RegisterEvent("Corrosive_Ooze", 14000, 0)
end

function Dazed(pUnit, Event)
	pUnit:FullCastSpellOnTarget(1604, pUnit:GetClosestPlayer())
end

function Corrosive_Ooze(pUnit, Event)
	pUnit:FullCastSpellOnTarget(9459, pUnit:GetClosestPlayer())
end

function corrosive_lurker_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function corrosive_lurker_OnDied(pUnit, Event)
	pUnit:CastSpell(10341)
	pUnit:CastSpell(11638)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6219, 1, "corrosive_lurker_OnCombat")
RegisterUnitEvent(6219, 2, "corrosive_lurker_OnLeaveCombat")
RegisterUnitEvent(6219, 4, "corrosive_lurker_OnDied")