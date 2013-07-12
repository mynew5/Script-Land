--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function IRavager_OnEnterCombat(Unit,Event)
	Unit:FullCastSpellOnTarget(33645, Unit:GetClosestPlayer())
	Unit:RegisterEvent("IRavager_Cleave", 22000, 0)
	Unit:RegisterEvent("IRavager_Cutdown", 9000, 0)
	Unit:RegisterEvent("IRavager_Shout", 60000, 0)
end

function IRavager_Cleave(Unit,Event)
	Unit:FullCastSpellOnTarget(15496, Unit:GetClosestPlayer())
end

function IRavager_Cutdown(Unit,Event)
	Unit:FullCastSpellOnTarget(32009, Unit:GetClosestPlayer())
end

function IRavager_Shout(Unit,Event)
	Unit:CastSpell(16244)
end

function IRavager_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function IRavager_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22857, 1, "IRavager_OnEnterCombat")
RegisterUnitEvent(22857, 2, "IRavager_OnLeaveCombat")
RegisterUnitEvent(22857, 4, "IRavager_OnDied")