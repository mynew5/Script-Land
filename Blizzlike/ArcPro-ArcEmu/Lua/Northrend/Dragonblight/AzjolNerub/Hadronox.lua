--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Hadronox_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Hadronox_WebGrab", 15000, 0)
	pUnit:RegisterEvent("Hadronox_PierceArmor", 12000, 0)
	pUnit:RegisterEvent("Hadronox_LeechPoison", 10000, 0)
	pUnit:RegisterEvent("Hadronox_Acidcloud", 20000, 0)	
end

function Hadronox_WebGrab(pUnit, Event)
	pUnit:FullCastSpellOnTarget(53406, pUnit:GetClosestPlayer(0))
end

function Hadronox_PierceArmor(pUnit, Event)
	pUnit:FullCastSpellOnTarget(53418, pUnit:GetClosestPlayer(0))
end

function Hadronox_LeechPoison(pUnit, Event)
	pUnit:FullCastSpell(53030)
end

function Hadronox_Acidcloud(pUnit, Event)
	pUnit:FullCastSpellOnTarget(53400, pUnit:GetClosestPlayer(0))
end

function Hadronox_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()	
end

function Hadronox_OnDied(pUnit, Event, player)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(28921, 1, "Hadronox_OnEnterCombat")
RegisterUnitEvent(28921, 2, "Hadronox_OnLeaveCombat")
RegisterUnitEvent(28921, 4, "Hadronox_OnDied")