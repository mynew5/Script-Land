--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DHInitiate_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("DHInitiate_SpellBreaker", 18000, 0)
end

function DHInitiate_SpellBreaker(Unit,Event)
	Unit:FullCastSpellOnTarget(35871, Unit:GetClosestPlayer())
end

function DHInitiate_LeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function DHInitiate_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21180, 1, "DHInitiate_OnEnterCombat")
RegisterUnitEvent(21180, 2, "DHInitiate_LeaveCombat")
RegisterUnitEvent(21180, 4, "DHInitiate_OnDied")