--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BBOD_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("BBOD_Spell", 60000, 0)
end

function BBOD_Spell(Unit,Event)
	Unit:FullCastSpellOnTarget(7279, Unit:GetClosestPlayer())
end

function BBOD_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function BBOD_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(23286, 1, "BBOD_OnEnterCombat")
RegisterUnitEvent(23286, 2, "BBOD_OnLeaveCombat")
RegisterUnitEvent(23286, 4, "BBOD_OnDied")