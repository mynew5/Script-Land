--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function PMBB_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Heal", 21000, 0)
	pUnit:RegisterEvent("MindBlast", 7000, 0)
	pUnit:RegisterEvent("SWPain", 14000, 0)
	pUnit:RegisterEvent("Renew", 35000, 0)
	pUnit:RegisterEvent("ShadowBolt", 28000, 0)
end
 
function Heal(pUnit, Event)
	pUnit:FullCastSpell(15586)
end
 
function MindBlast(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15587)
end

function SWPain(pUnit, Event)
	pUnit:CastSpellOnTarget(15654)
end

function ShadowBolt(Unit, Event)
	pUnit:FullCastSpellOnTarget(15537)
end

function Renew(Unit, Event)
	pUnit:FullCastSpell(8362)
end
 
function PMBB_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end
 
function PMBB_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(8929, 1, "PMBB_OnCombat")
RegisterUnitEvent(8929, 2, "PMBB_OnLeaveCombat")
RegisterUnitEvent(8929, 4, "PMBB_OnDeath")