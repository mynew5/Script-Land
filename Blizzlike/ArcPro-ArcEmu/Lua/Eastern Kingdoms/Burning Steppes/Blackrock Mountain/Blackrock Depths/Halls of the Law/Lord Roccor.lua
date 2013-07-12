--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function LordRoccor_OnCombat(pUnit, Event)
    pUnit:RegisterEvent("EarthShock", 7000, 0)
    pUnit:RegisterEvent("FlameShock", 14000, 0)
	pUnit:RegisterEvent("GroundTremor", 21000, 0)
end
 
function EarthShock(pUnit, Event)
    pUnit:FullCastSpellOnTarget(13728)
end
 
function FlameShock(pUnit, Event)
    pUnit:FullCastSpellOnTarget(13729)
end

function GroundTremor(pUnit, Event)
    pUnit:CastSpell(6524)
end
 
function LordRoccor_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end
 
function LordRoccor_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end
 
RegisterUnitEvent(9025, 1, "LordRoccor_OnCombat")
RegisterUnitEvent(9025, 2, "LordRoccor_OnLeaveCombat")
RegisterUnitEvent(9025, 3, "LordRoccor_OnDeath")