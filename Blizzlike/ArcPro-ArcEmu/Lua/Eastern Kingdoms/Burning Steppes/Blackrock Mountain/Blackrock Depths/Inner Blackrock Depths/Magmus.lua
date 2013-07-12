--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Magmus_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Emperor Thaurissan does not wish to be disturbed! Turn back now or face your doom, weak mortals!")
    pUnit:RegisterEvent("FieryBurst", 7000, 0)
    pUnit:RegisterEvent("WarStomp", 14000, 0)
end
 
function FieryBurst(pUnit, Event)
    pUnit:FullCastSpellOnTarget(15668)
end
 
function WarStomp(pUnit, Event)
    pUnit:CastSpell(15593)
end
 
function Magmus_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end
 
function Magmus_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end
 
RegisterUnitEvent(9938, 1, "Magmus_OnCombat")
RegisterUnitEvent(9938, 2, "Magmus_OnLeaveCombat")
RegisterUnitEvent(9938, 4, "Magmus_OnDeath")