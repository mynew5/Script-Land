--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Zigris_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Drink_Healing_Potion", 7000, 0)
	pUnit:RegisterEvent("Hooked_Net", 14000, 0)
	pUnit:RegisterEvent("Shoot", 21000, 0)
	pUnit:RegisterEvent("Stun_Bomb", 28000, 0)
end

function Drink_Healing_Potion(pUnit, Event)
	pUnit:CastSpell(15504)
end

function Hooked_Net(pUnit, Event)
	pUnit:CastSpellOnTarget(15609)
end

function Shoot(pUnit, Event)
	pUnit:CastSpellOnTarget(59146)
end

function Stun_Bomb(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16497)
end

function Zigris_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Zigris_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9736, 1, "Zigris_OnCombat")
RegisterUnitEvent(9736, 2, "Zigris_OnLeaveCombat")
RegisterUnitEvent(9736, 4, "Zigris_OnDied")