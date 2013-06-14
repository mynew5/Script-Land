--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Aggem_OnCombat(pUnit, event)
	pUnit:CastSpell(8286)
	pUnit:RegisterEvent("Battle", 7000, 0)
	pUnit:RegisterEvent("Heal", 14000, 0)
end
 
function Battle(pUnit, Event)
	pUnit:CastSpell(6192)
	pUnit:RegisterEvent("Battle", 7000, 0)
end
 
function Heal(pUnit, Event)
	pUnit:CastSpell(14900)
	pUnit:RegisterEvent("Heal", 14000, 0)
end
 
function Aggem_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Aggem_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4832, 1, "Aggem_OnCombat")
RegisterUnitEvent(4832, 2, "Aggem_OnLeaveCombat")
RegisterUnitEvent(4832, 4, "Aggem_OnDeath")