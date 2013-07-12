--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Arcus_OnEnterCombat(Unit,Event)
	Unit:FullCastSpellOnTarget(41440, Unit:GetClosestPlayer())
	Unit:RegisterEvent("Arcus_Spell1", 10000, 0)
	Unit:RegisterEvent("Arcus_Spell2", 30000, 0)
end

function Arcus_Spell1(Unit,Event)
	Unit:FullCastSpellOnTarget(41448, Unit:GetClosestPlayer())
end

function Arcus_Spell1(Unit,Event)
	Unit:FullCastSpellOnTarget(38370, Unit:GetClosestPlayer())
end

function Arcus_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Arcus_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(23452, 1, "Arcus_OnEnterCombat")
RegisterUnitEvent(23452, 2, "Arcus_OnLeaveCombat")
RegisterUnitEvent(23452, 4, "Arcus_OnDied")