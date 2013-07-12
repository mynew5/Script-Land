--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function AFL_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Your reign of terror ends now! Face your doom mortals!")
	pUnit:RegisterEvent("BurningSpirit", 7000, 0)
end

function BurningSpirit(pUnit, Event)
	pUnit:CastSpell(14744)
end

function AFL_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function AFL_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9156, 1, "AFL_OnCombat")
RegisterUnitEvent(9156, 2, "AFL_OnLeaveCombat")
RegisterUnitEvent(9156, 4, "AFL_OnDeath")