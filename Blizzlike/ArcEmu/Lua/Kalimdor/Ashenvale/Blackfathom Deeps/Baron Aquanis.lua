--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BaronAquanis_OnCombat(pUnit, event)
	pUnit:RegisterEvent("FrostNova", 7000, 0)
	pUnit:RegisterEvent("Frostbolt", 14000, 0)
end
 
function FrostNova(pUnit, Event)
	pUnit:CastSpell(15531)
	pUnit:RegisterEvent("FrostNova", 7000, 0)
end
 
function Frostbolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15043, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Frostbolt", 14000, 0)
end
 
function BaronAquanis_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function BaronAquanis_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(12876, 1, "BaronAquanis_OnCombat")
RegisterUnitEvent(12876, 2, "BaronAquanis_OnLeaveCombat")
RegisterUnitEvent(12876, 4, "BaronAquanis_OnDeath")