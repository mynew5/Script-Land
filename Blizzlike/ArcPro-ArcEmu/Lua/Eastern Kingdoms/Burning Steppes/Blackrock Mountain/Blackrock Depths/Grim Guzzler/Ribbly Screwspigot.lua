--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function RScrewp_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "No! Get away from me! Help!!")
	pUnit:RegisterEvent("RScrewp_Hamstring", 7000, 0)
	pUnit:RegisterEvent("RScrewp_Gouge", 14000, 0)
end

function RScrewp_Hamstring(pUnit, Event)
	pUnit:CastSpellOnTarget(9080)
end

function RScrewp_Gouge(pUnit, Event)
	pUnit:CastSpellonTarget(12540)
end

function RScrewp_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function RScrewp_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9543, 1, "RScrewp_OnCombat")
RegisterUnitEvent(9543, 2, "RScrewp_OnLeaveCombat")
RegisterUnitEvent(9543, 4, "RScrewp_OnDeath")