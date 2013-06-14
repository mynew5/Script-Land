--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DSubjugator_OnEnterCombat(Unit,Event)
	Unit:FullCastSpellOnTarget(9613, Unit:GetClosestPlayer())
	Unit:RegisterEvent("DSubjugator_Shadowbolt", 9000, 0)
end

function DSubjugator_Shadowbolt(Unit,Event)
	Unit:FullCastSpellOnTarget(9613, Unit:GetClosestPlayer())
end

function DSubjugator_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end
function DSubjugator_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21718, 1, "DSubjugator_OnEnterCombat")
RegisterUnitEvent(21718, 2, "DSubjugator_OnLeaveCombat")
RegisterUnitEvent(21718, 4, "DSubjugator_OnDied")