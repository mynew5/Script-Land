--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Jargba_OnCombat(pUnit, event)
	pUnit:RegisterEvent("Shadow", 7000, 0)
	pUnit:RegisterEvent("Mind", 14000, 0)
end
 
function Shadow(pUnit, Event)
	pUnit:FullCastSpellOnTarget(9613, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Shadow", 7000, 0)
end
 
function Mind(pUnit, Event)
	pUnit:FullCastSpellOnTarget(14515, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Mind", 14000, 0)
end
 
function Jargba_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Jargba_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4428, 1, "Jargba_OnCombat")
RegisterUnitEvent(4428, 2, "Jargba_OnLeaveCombat")
RegisterUnitEvent(4428, 4, "Jargba_OnDeath")