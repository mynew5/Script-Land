--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EarthSpirit_OnEnterCombat(Unit,Event)
	Unit:CastSpell(38365)
	Unit:RegisterEvent("EarthSpirit_Boulder", 8500, 0)
end

function EarthSpirit_Boulder(Unit,Event)
	Unit:FullCastSpellOnTarget(38498, Unit:GetClosestPlayer())
end

function EarthSpirit_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function EarthSpirit_OnDeath(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21050, 1, "EarthSpirit_OnEnterCombat")
RegisterUnitEvent(21050, 2, "EarthSpirit_OnLeaveCombat")
RegisterUnitEvent(21050, 4, "EarthSpirit_OnDeath")