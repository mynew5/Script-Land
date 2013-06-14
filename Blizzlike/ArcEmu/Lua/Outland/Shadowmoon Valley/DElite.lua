--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DElite_OnEnterCombat(Unit,Event)
	Unit:FullCastSpellOnTarget(38858, Unit:GetClosestPlayer())
	Unit:RegisterEvent("DElite_Spell1", 36000, 0)
	Unit:RegisterEvent("DElite_Spell2", 50000, 0)
end

function DElite_Spell1(Unit,Event)
	Unit:FullCastSpellOnTarget(38861, Unit:GetClosestPlayer())
end

function DElite_Spell2(Unit,Event)
	Unit:FullCastSpellOnTarget(38859, Unit:GetClosestPlayer())
end

function DElite_LeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function DElite_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22331, 1, "DElite_OnEnterCombat")
RegisterUnitEvent(22331, 2, "DElite_LeaveCombat")
RegisterUnitEvent(22331, 4, "DElite_OnDied")