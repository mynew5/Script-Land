--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MoloktheCrusher_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Backhand", 16000, 0)
end

function Backhand(Unit, Event)
	Unit:FullCastSpellOnTarget(6253, Unit:GetMainTank())
end

function MoloktheCrusher_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function MoloktheCrusher_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2604, 1, "MoloktheCrusher_OnEnterCombat")
RegisterUnitEvent(2604, 2, "MoloktheCrusher_OnLeaveCombat")
RegisterUnitEvent(2604, 4, "MoloktheCrusher_OnDied")