--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Uvuros_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Uvuros_Bite", 4000, 0)
	Unit:RegisterEvent("Uvuros_DoubleBreath", 8000, 0)
	Unit:RegisterEvent("Uvuros_Growl", 20000, 0)
	Unit:RegisterEvent("Uvuros_LavaBreath", 10000, 0)
	Unit:RegisterEvent("Uvuros_TerrifyingRoar", 27000, 0)
end

function Uvuros_Bite(Unit,Event)
	Unit:FullCastSpellOnTarget(27050, Unit:GetClosestPlayer())
end

function Uvuros_DoubleBreath(Unit,Event)
	Unit:FullCastSpellOnTarget(38361, Unit:GetClosestPlayer())
end

function Uvuros_Growl(Unit,Event)
	Unit:FullCastSpellOnTarget(27047, Unit:GetClosestPlayer())
end

function Uvuros_LavaBreath(Unit,Event)
	Unit:FullCastSpellOnTarget(58610, Unit:GetClosestPlayer())
end

function Uvuros_TerrifyingRoar(Unit,Event)
	Unit:FullCastSpellOnTarget(37939, Unit:GetClosestPlayer())
end

function Uvuros_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Uvuros_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21102, 1, "Uvuros_OnEnterCombat")
RegisterUnitEvent(21102, 2, "Uvuros_OnLeaveCombat")
RegisterUnitEvent(21102, 4, "Uvuros_OnDied")