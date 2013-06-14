--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ZalasWitherbark_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("ShadowboltVolley", 3000, 0)
end

function ShadowboltVolley(Unit, Event)
	if(Unit:GetClosestPlayer() ~= nil) then
		return
	else
		Unit:FullCastSpellOnTarget(9081, Unit:GetClosestPlayer())
	end
end

function ZalasWitherbark_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function ZalasWitherbark_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2605, 1, "ZalasWitherbark_OnEnterCombat")
RegisterUnitEvent(2605, 2, "ZalasWitherbark_OnLeaveCombat")
RegisterUnitEvent(2605, 4, "ZalasWitherbark_OnDied")