--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Akama_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Akama_Lightning", 1540, 0)
end

function Akama_Lightning(Unit,Event)
	Unit:FullCastSpellOnTarget(39945, Unit:GetClosestPlayer())
end

function Akama_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Akama_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21700, 1, "Akama_OnEnterCombat")
RegisterUnitEvent(21700, 2, "Akama_OnLeaveCombat")
RegisterUnitEvent(21700, 4, "Akama_OnDied")