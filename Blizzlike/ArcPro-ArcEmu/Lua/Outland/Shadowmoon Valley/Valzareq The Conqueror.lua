--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ValzareqTheConqueror_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Uylaru_Shoot", 2000, 3)
end

function ValzareqTheConqueror_Shoot(Unit,Event)
	Unit:FullCastSpellOnTarget(38094, Unit:GetClosestPlayer())
end

function ValzareqTheConqueror_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function ValzareqTheConqueror_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21979, 1, "ValzareqTheConqueror_OnEnterCombat")
RegisterUnitEvent(21979, 2, "ValzareqTheConqueror_OnLeaveCombat")
RegisterUnitEvent(21979, 4, "ValzareqTheConqueror_OnDied")