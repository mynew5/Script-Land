--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--Warder Stilgiss
function FDV_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("FrostArmor", 7000, 0)
	pUnit:RegisterEvent("Chilled", 14000, 0)
	pUnit:RegisterEvent("FrostNova", 21000, 0)
	pUnit:RegisterEvent("FrostWard", 28000, 0)
	pUnit:RegisterEvent("Frostbolt", 35000, 0)
end

function FrostArmor(pUnit, Event)
	pUnit:CastSpell(12544)
end

function Chilled(pUnit, Event)
	pUnit:FullCastSpell(6136)
end

function FrostNova(pUnit, Event)
	pUnit:CastSpell(12674)
end

function FrostWard(pUnit, Event)
	pUnit:FullCastSpell(15044)
end

function Frostbolt(pUnit, Event)
	pUnit:FullCastSpellonTarget(12675)
end

function FDV_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function FDV_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9041, 1, "FDV_OnCombat")
RegisterUnitEvent(9041, 2, "FDV_OnLeaveCombat")
RegisterUnitEvent(9041, 4, "FDV_OnDeath")

--Verek
function Verek_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("CurseOfBlood", 7000, 0)
	pUnit:RegisterEvent("Enrage", 14000, 0)
end

function CurseOfBlood(pUnit, Event)
	pUnit:CastSpell(15042)
end

function Enrage(pUnit, Event)
	pUnit:CastSpell(8599)
end

function Verek_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Verek_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9042, 1, "Verek_OnCombat")
RegisterUnitEvent(9042, 2, "Verek_OnLeaveCombat")
RegisterUnitEvent(9042, 4, "Verek_OnDeath")