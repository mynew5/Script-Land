--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DCScorncrow_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("DCScorncrow_FrostBolt", 12000, 0)
end

function DCScorncrow_Frostbolt(Unit,Event)
	Unit:FullCastSpellOnTarget(9672, Unit:GetClosestPlayer())
end

function DCScorncrow_LeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function DCScorncrow_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21385, 1, "DCScorncrow_OnEnterCombat")
RegisterUnitEvent(21385, 2, "DCScorncrow_LeaveCombat")
RegisterUnitEvent(21385, 4, "DCScorncrow_OnDied")