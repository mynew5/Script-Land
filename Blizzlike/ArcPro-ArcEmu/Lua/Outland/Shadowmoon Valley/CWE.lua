--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CWE_OnEnterCombat(Unit,Event)
	Unit:CastSpell(35194)
	Unit:RegisterEvent("CWE_FBolt", 5000, 0)
end

function CWE_Fbolt(Unit,Event)
	Unit:FullCastSpellOnTarget(9672, Unit:GetClosestPlayer())
end

function CWE_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function CWE_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21428, 1, "CWE_OnEnterCombat")
RegisterUnitEvent(21428, 2, "CWE_OnLeaveCombat")
RegisterUnitEvent(21428, 4, "CWE_OnDied")