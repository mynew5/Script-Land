--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function KotCistern_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("KotCistern_Waterbolt", 4000, 0)
end

function KotCistern_Waterbolt(Unit,Event)
	Unit:FullCastSpellOnTarget(32011, Unit:GetClosestPlayer())
end

function KotCistern_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function KotCistern_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20795, 1, "KotCistern_OnEnterCombat")
RegisterUnitEvent(20795, 2, "KotCistern_OnLeaveCombat")
RegisterUnitEvent(20795, 4, "KotCistern_OnDied")