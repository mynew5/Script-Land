--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ChainOfShadows_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("ChainOfShadows_Spell", 5500, 0)
end

function ChainOfShadows_Spell(Unit,Event)
	Unit:FullCastSPellOnTarget(37784, Unit:GetClosestPlayer())
end

function ChainOfShadows_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function ChainOfShadows_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21876, 1, "ChainOfShadows_OnEnterCombat")
RegisterUnitEvent(21876, 2, "ChainOfShadows_OnLeaveCombat")
RegisterUnitEvent(21876, 4, "ChainOfShadows_OnDied")