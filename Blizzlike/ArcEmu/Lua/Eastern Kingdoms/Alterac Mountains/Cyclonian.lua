--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function cyclonian_gustofwind(pUnit, Event)
	pUnit:CastSpell(6982)
end

function cyclonian_whirlwind(pUnit, Event)
	pUnit:CastSpell(15576)
end

function cyclonianknock_away(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(18670, pUnit:GetClosestPlayer())
	end
end

function cyclonian_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("cyclonian_gustofwind", 20000, 0)
	pUnit:RegisterEvent("cyclonian_whirlwind", 30000, 0)
	pUnit:RegisterEvent("cyclonianknock_away", 15000, 0)
end

function cyclonian_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6239, 1, "cyclonian_OnCombat")
RegisterUnitEvent(6239, 2, "cyclonian_OnLeaveCombat")