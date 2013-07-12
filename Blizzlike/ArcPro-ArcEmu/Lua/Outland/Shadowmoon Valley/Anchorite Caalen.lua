--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AnchoriteCaalen_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("AnchoriteCaalen_HolySmite", 1540, 0)
	Unit:RegisterEvent("AnchoriteCaalen_HolySmite", 5000, 0)
end

function AnchoriteCaalen_HolySmite(Unit,Event)
	Unit:FullCastSpellOnTarget(36176, Unit:GetClosestPlayer())
end

function AnchoriteCaalen_GreaterHeal(Unit,Event)
	Unit:FullCastSpellOnTarget(35096, Unit:GetRandomFriend())
end

function AnchoriteCaalen_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function AnchoriteCaalen_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22862, 1, "AnchoriteCaalen_OnEnterCombat")
RegisterUnitEvent(22862, 2, "AnchoriteCaalen_OnLeaveCombat")
RegisterUnitEvent(22862, 4, "AnchoriteCaalen_OnDied")