--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OvermineFlayer_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("OvermineFlayer_Rend", 30000, 0)
	Unit:RegisterEvent("OvermineFlayer_RockShell", 18000, 0)
end

function OvermineFlayer_Rend(Unit,Event)
	Unit:FullCastSpellOnTarget(13443, Unit:GetClosestPlayer())
end

function OvermineFlayer_RockShell(Unit,Event)
	Unit:CastSpell(33810)
end

function OvermineFlayer_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function OvermineFlayer_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(23264, 1, "OvermineFlayer_OnEnterCombat")
RegisterUnitEvent(23264, 2, "OvermineFlayer_OnLeaveCombat")
RegisterUnitEvent(23264, 4, "OvermineFlayer_OnDied")