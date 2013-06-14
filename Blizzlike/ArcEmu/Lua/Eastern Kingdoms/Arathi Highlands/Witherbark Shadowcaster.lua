--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WitherbarkShadowcaster_OnSpawn(Unit,Event)
	Unit:CastSpell(11939)
end

function WitherbarkShadowcaster_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Shadowbolt", 7000, 0)
end

function ShadowBolt(Unit,Event)
	if(Unit:GetMainTank() ~= nil) then
		return
	else
		Unit:FullCastSpellOnTarget(20816, Unit:GetMainTank())
	end
end

function WitherbarkShadowcaster_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function WitherbarkShadowcaster_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2553, 18, "WitherbarkShadowcaster_OnSpawn")
RegisterUnitEvent(2553, 1, "WitherbarkShadowcaster_OnEnterCombat")
RegisterUnitEvent(2553, 2, "WitherbarkShadowcaster_OnLeaveCombat")
RegisterUnitEvent(2553, 4, "WitherbarkShadowcaster_OnDied")