--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: DARKI
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Radioactive_mg_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Dazed", 7000, 0)
	pUnit:RegisterEvent("Electrified_Net", 14000, 0)
end

function Dazed(pUnit, Event)
	pUnit:CastSpellOnTarget(1604, pUnit:GetClosestPlayer(1))
end

function Electrified_Net(pUnit, Event)
	pUnit:FullCastSpellOnTarget(11820, pUnit:GetClosestPlayer(1))
end

function Radioactive_mg_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Radioactive_mg_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6234, 1, "Radioactive_mg_OnCombat")
RegisterUnitEvent(6234, 2, "Radioactive_mg_OnLeaveCombat")
RegisterUnitEvent(6234, 4, "Radioactive_mg_OnDied")