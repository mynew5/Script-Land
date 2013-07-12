--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ScorchshellPincer_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("ScorchshellPincer_BurningPoison", 000, 0)
end

function ScorchshellPincer_BurningPoison(Unit,Event)
	Unit:FullCastSpellOnTarget(15284, Unit:GetClosestPlayer())
end

function ScorchshellPincer_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function ScorchshellPincer_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21864, 1, "ScorchshellPincer_OnEnterCombat")
RegisterUnitEvent(21864, 2, "ScorchshellPincer_OnLeaveCombat")
RegisterUnitEvent(21864, 4, "ScorchshellPincer_OnDied")