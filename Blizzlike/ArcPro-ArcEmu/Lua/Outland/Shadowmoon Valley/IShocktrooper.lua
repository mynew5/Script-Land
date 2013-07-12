--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function IShocktrooper_OnEnterCombat(Unit,Event)
	Unit:FullCastSpellOnTarget(22120, Unit:GetClosestPlayer())
	Unit:RegisterEvent("IShocktrooper_Cleave", 31000, 0)
end

function IShocktrooper_Cleave(Unit,Event)
	Unit:FullCastSpellOnTarget(15496, Unit:GetClosestPlayer())
end

function IShocktrooper_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function IShocktrooper_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19802, 1, "IShocktrooper_OnEnterCombat")
RegisterUnitEvent(19802, 2, "IShocktrooper_OnLeaveCombat")
RegisterUnitEvent(19802, 4, "IShocktrooper_OnDied")