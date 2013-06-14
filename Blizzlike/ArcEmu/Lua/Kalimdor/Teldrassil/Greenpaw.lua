--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Gree_OnCombat(Unit, Event)
	Unit:RegisterEvent("Gree_Shock", 6000, 0)
	Unit:RegisterEvent("Gree_Rejuv", 7000, 2)
end

function Gree_Shock(Unit, Event)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(2606, Unit:GetClosestPlayer())
	end
end

function Gree_Rejuv(Unit, Event)
	Unit:CastSpell(774)
end

function Gree_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function Gree_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(1993, 1, "Gree_OnCombat")
RegisterUnitEvent(1993, 2, "Gree_OnLeaveCombat")
RegisterUnitEvent(1993, 4, "Gree_OnDied")