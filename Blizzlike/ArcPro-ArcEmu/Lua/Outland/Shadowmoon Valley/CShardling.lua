--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CShardling_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("CShardling_Enrage", 5000, 0)
end

function CShardling_Enrage(Unit,Event)
	Unit:CastSpell(40743)
end

function CShardling_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function CShardling_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21936, 1, "CMMiner_OnEnterCombat")
RegisterUnitEvent(21936, 2, "CMMiner_OnLeaveCombat")
RegisterUnitEvent(21936, 4, "CMMiner_OnDied")