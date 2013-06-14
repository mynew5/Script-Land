--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Roogug_OnCombat(pUnit, event)
	pUnit:RegisterEvent("Lightning", 7000, 0)
	pUnit:RegisterEvent("Earth", 14000, 0)
end
 
function Lightning(pUnit, Event)
	pUnit:FullCastSpellOnTarget(9532, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Lightning", 7000, 0)
end
 
function Earth(pUnit, Event)
	pUnit:CastSpell(8270)
	pUnit:RegisterEvent("Earth", 14000, 0)
end
 
function Roogug_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Roogug_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(6168, 1, "Roogug_OnCombat")
RegisterUnitEvent(6168, 2, "Roogug_OnLeaveCombat")
RegisterUnitEvent(6168, 4, "Roogug_OnDeath")