--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DSmith_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("DSmith_ChaosNova", 6000, 0)
	Unit:RegisterEvent("DSmith_DrillArmor", 6000, 0)
end

function DSmith_ChaosNova(Unit,Event)
	Unit:FullCastSpellOnTarget(36225, Unit:GetClosestPlayer())
end

function DSmith_DrillArmor(Unit,Event)
	Unit:FullCastSpellOnTarget(37580, Unit:GetClosestPlayer())
end

function DSmith_LeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function DSmith_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19756, 1, "DSmith_OnEnterCombat")
RegisterUnitEvent(19756, 2, "DSmith_LeaveCombat")
RegisterUnitEvent(19756, 4, "DSmith_OnDied")