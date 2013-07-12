--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ESpellbinder_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("ESpellbinder_SummonArcane", 11000, (1))
	Unit:RegisterEvent("ESpellbinder_ArcaneMissle", 16000, 0)
end

function ESpellbinder_SummonArcane(Unit,Event)
	Unit:CastSpell(38171)
end

function ESpellbinder_ArcaneMissle(Unit,Event)
	Unit:FullCastSpellOnTarget(34447, Unit:GetClosestPlayer())
end

function ESpellbinder_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function ESpellbinder_OnDeath(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22017, 1, "ESpellbinder_OnEnterCombat")
RegisterUnitEvent(22017, 2, "ESpellbinder_OnLeaveCombat")
RegisterUnitEvent(22017, 4, "ESpellbinder_OnDeath")