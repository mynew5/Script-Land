--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Akumai_OnCombat(pUnit, event)
	pUnit:RegisterEvent("FrenziedRage", 7000, 0)
	pUnit:RegisterEvent("PoisonCloud", 14000, 0)
end
 
function FrenziedRage(pUnit, Event)
	pUnit:CastSpell(3490)
	pUnit:RegisterEvent("FrenziedRage", 7000, 0)
end
 
function PoisonCloud(pUnit, Event)
	pUnit:CastSpell(3815)
	pUnit:RegisterEvent("PoisonCloud", 14000, 0)
end
 
function Akumai_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Akumai_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4829, 1, "Akumai_OnCombat")
RegisterUnitEvent(4829, 2, "Akumai_OnLeaveCombat")
RegisterUnitEvent(4829, 4, "Akumai_OnDeath")