--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Halmgar_OnCombat(pUnit, event)
	pUnit:RegisterEvent("Lightning", 7000, 0)
	pUnit:RegisterEvent("Earth", 14000, 0)
	pUnit:RegisterEvent("Totem", 21000, 0)
end
 
function Lightning(pUnit, Event)
	pUnit:FullCastSpellOnTarget(9532, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Lightning", 7000, 0)
end
 
function Earth(pUnit, Event)
	pUnit:CastSpell(8270)
	pUnit:RegisterEvent("Earth", 14000, 0)
end
 
function Totem(pUnit, Event)
	pUnit:CastSpell(2484)
	pUnit:RegisterEvent("Totem", 14000, 0)
end
 
function Halmgar_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Halmgar_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4842, 1, "Halmgar_OnCombat")
RegisterUnitEvent(4842, 2, "Halmgar_OnLeaveCombat")
RegisterUnitEvent(4842, 4, "Halmgar_OnDeath")