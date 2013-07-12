--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Hobb_OnEnterCombat(Unit,Event)
	Unit:FullCastSpellOnTarget(41440, Unit:GetClosestPlayer())
	Unit:RegisterEvent("Hobb_Spell1", 10000, 0)
	Unit:RegisterEvent("Hobb_Spell2", 30000, 0)
end

function Hobb_Spell1(Unit,Event)
	Unit:FullCastSpellOnTarget(41448, Unit:GetClosestPlayer())
end

function Hobb_Spell1(Unit,Event)
	Unit:FullCastSpellOnTarget(38370, Unit:GetClosestPlayer())
end

function Hobb_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Hobb_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(23434, 1, "Hobb_OnEnterCombat")
RegisterUnitEvent(23434, 2, "Hobb_OnLeaveCombat")
RegisterUnitEvent(23434, 4, "Hobb_OnDied")