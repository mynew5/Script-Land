--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: DARKI
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Radioactive_VF_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Corrosive_Ooze", 7000, 0)
	pUnit:RegisterEvent("Radiation_Cloud", 14000, 0)
end

function Corrosive_Ooze(pUnit, Event)
	pUnit:FullCastSpellOnTarget(9459, pUnit:GetClosestPlayer(1))
end

function Radiation_Cloud(pUnit, Event)
	pUnit:FullCastSpellOnTarget(10341, pUnit:GetClosestPlayer(1))
end

function Radioactive_VF_saw_blade(pUnit, Event)
	pUnit:FullCastSpell(35318)
end

function Radioactive_VF_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Radioactive_VF_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(7079, 1, "Radioactive_VF_OnCombat")
RegisterUnitEvent(7079, 2, "Radioactive_VF_OnLeaveCombat")
RegisterUnitEvent(7079, 4, "Radioactive_VF_OnDied")