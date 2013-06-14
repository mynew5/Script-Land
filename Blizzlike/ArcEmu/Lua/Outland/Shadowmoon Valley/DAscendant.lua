--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DAscendant_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("DAscendant_Cleave", 40000, 0)
	Unit:RegisterEvent("DAscendant_MortalStrike", 15000, 0)
	Unit:RegisterEvent("DAscendant_Uppercut", 23000, 0)
end

function DAscendant_Cleave(Unit,Event)
	Unit:FullCastSpellOnTarget(15496, Unit:GetClosestPlayer())
end

function DAscendant_MortalStrike(Unit,Event)
	Unit:FullCastSpellOnTarget(17547, Unit:GetClosestPlayer())
end

function DAscendant_Uppercut(Unit,Event)
	Unit:FullCastSpellOnTarget(10966, Unit:GetClosestPlayer())
end

function DAscendant_LeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function DAscendant_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22253, 1, "DAscendant_OnEnterCombat")
RegisterUnitEvent(22253, 2, "DAscendant_LeaveCombat")
RegisterUnitEvent(22253, 4, "DAscendant_OnDied")