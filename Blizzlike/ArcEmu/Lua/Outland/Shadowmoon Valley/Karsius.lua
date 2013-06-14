--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Karsius_OnEnterCombat(Unit,Event)
	Unit:FullCastSpellOnTarget(37789, Unit:GetClosestPlayer())
end

function Karsius_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Karsius_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21877, 1, "Karsius_OnEnterCombat")
RegisterUnitEvent(21877, 2, "Karsius_OnLeaveCombat")
RegisterUnitEvent(21877, 4, "Karsius_OnDied")