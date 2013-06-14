--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DNPeon_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("DNPeon_Spell", 46000, 0)
end

function DNPeon_Spell(Unit,Event)
	Unit:FullCastSpellOnTarget(15572, Unit:GetClosestPlayer())
end

function DNPeon_LeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function DNPeon_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22252, 1, "DNPeon_OnEnterCombat")
RegisterUnitEvent(22252, 2, "DNPeon_LeaveCombat")
RegisterUnitEvent(22252, 4, "DNPeon_OnDied")