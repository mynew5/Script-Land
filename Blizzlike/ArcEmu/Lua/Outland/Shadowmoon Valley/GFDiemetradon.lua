--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GFDiemetradon_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("GFDiemetradon_FelFireball", 11000, 0)
	Unit:RegisterEvent("GFDiemetradon_FlamingWound", 51000, 0)
end

function GFDiemetradon_FelFireball(Unit,Event)
	Unit:FullCastSpellOnTarget(37945, Unit:GetClosestPlayer())
end

function GFDiemetradon_FlamingWound(Unit,Event)
	Unit:FullCastSpellOnTarget(37941, Unit:GetClosestPlayer())
end

function GFDiemetradon_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function GFDiemetradon_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21462, 1, "GFDiemetradon_OnEnterCombat")
RegisterUnitEvent(21462, 2, "GFDiemetradon_OnLeaveCombat")
RegisterUnitEvent(21462, 4, "GFDiemetradon_OnDied")