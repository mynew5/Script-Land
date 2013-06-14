--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DDrakeRider_OnEnterCombat(Unit,Event)
	Unit:FullCastSpellOnTarget(6660, Unit:GetClosestPlayer())
end

function DDrakeRider_LeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function DDrakeRider_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21719, 1, "DDrakeRider_OnEnterCombat")
RegisterUnitEvent(21719, 2, "DDrakeRider_LeaveCombat")
RegisterUnitEvent(21719, 4, "DDrakeRider_OnDied")