--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MutantHorror_OnEnterCombat(Unit,Event)
	Unit:CastSpell(8599)
	Unit:RegisterEvent("MutantHorror_MutatedBlood", 45000, 0)
end

function MutantHorror_MutatedBlood(Unit,Event)
	Unit:FullCastSpellOnTarget(37950, Unit:GetClosestPlayer())
end

function MutantHorror_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function MutantHorror_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21305, 1, "MutantHorror_OnEnterCombat")
RegisterUnitEvent(21305, 2, "MutantHorror_OnLeaveCombat")
RegisterUnitEvent(21305, 4, "MutantHorror_OnDied")