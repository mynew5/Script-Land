--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function PMLG_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("SearingTotems", 7000, 0)
	pUnit:RegisterEvent("FireWard", 14000, 0)
	pUnit:RegisterEvent("MoltenBlast", 21000, 0)
	pUnit:RegisterEvent("FlameShock", 28000, 0)
end
 
function SearingTotems(pUnit, Event)
	pUnit:FullCastSpell(15038)
end
 
function FireWard(pUnit, Event)
	pUnit:FullCastSpell(15041)
end

function MoltenBlast(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15095)
end

function FlameShock(Unit, Event)
	pUnit:CastSpellOnTarget(15616)
end
 
function PMLG_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end
 
function PMLG_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(9024, 1, "PMLG_OnCombat")
RegisterUnitEvent(9024, 2, "PMLG_OnLeaveCombat")
RegisterUnitEvent(9024, 3, "PMLG_OnDeath")