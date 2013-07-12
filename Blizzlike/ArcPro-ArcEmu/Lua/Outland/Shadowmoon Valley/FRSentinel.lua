--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FRSentinel_OnEnterCombat(Unit,Event)
	Unit:CastSpell(38022)
	Unit:RegisterEvent("FRSentinel_Boom", 000, 0)
	Unit:RegisterEvent("FRSentinel_WorldBreaker", 16000, 0)
end

function FRSentinel_Boom(Unit,Event)
	Unit:FullCastSpellOnTarget(38052, Unit:GetClosestPlayer())
end

function FRSentinel_WorldBreaker(Unit,Event)
	Unit:FullCastSpellOnTarget(38052, Unit:GetClosestPlayer())
end

function FRSentinel_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function FRSentinel_OnDeath(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21949, 1, "FRSentinel_OnEnterCombat")
RegisterUnitEvent(21949, 1, "FRSentinel_OnLeaveCombat")
RegisterUnitEvent(21949, 1, "FRSentinel_OnDeath")