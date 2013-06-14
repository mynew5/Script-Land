--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CAE_OnEnterCombat(Unit,Event)
	Unit:CastSpell(35194)
	Unit:RegisterEvent("CAE_LBolt", 5000, 0)
end

function CAE_LBolt(Unit,Event)
	Unit:FullCastSpellOnTarget(9532, Unit:GetClosestPlayer())
end


function CAE_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function CAE_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21707, 1, "CAE_OnEnterCombat")
RegisterUnitEvent(21707, 2, "CAE_OnLeaveCombat")
RegisterUnitEvent(21707, 4, "CAE_OnDied")