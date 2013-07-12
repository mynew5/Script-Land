--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SkethylOwl_OnEnterCombat(Unit,Event)
	Unit:FullCastSpellOnTarget(38254, Unit:GetClosestPlayer())
	Unit:RegisterEvent("SkethylOwl_TerrifyingScreech", 14000, 0)
end

function SkethylOwl_TerrifyingScreech(Unit,Event)
	Unit:FullCastSpellOnTarget(38021, Unit:GetClosestPlayer())
end

function SkethylOwl_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function SkethylOwl_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21450, 1, "SkethylOwl_OnEnterCombat")
RegisterUnitEvent(21450, 2, "SkethylOwl_OnLeaveCombat")
RegisterUnitEvent(21450, 4, "SkethylOwl_OnDied")