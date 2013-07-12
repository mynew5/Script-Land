--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AshtongueWorker_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("AshtongueWorker_PierceArmor", 45000, 0)
end

function AshtongueWorker_PierceArmor(Unit,Event)
	Unit:FullCastSpellOnTarget(6016, Unit:GetClosestPlayer())
end

function AshtongueWorker_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function AshtongueWorker_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21455, 1, "AshtongueWorker_OnEnterCombat")
RegisterUnitEvent(21455, 2, "AshtongueWorker_OnLeaveCombat")
RegisterUnitEvent(21455, 4, "AshtongueWorker_OnDied")