--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EBloodwarder_OnEnterCombat(Unit,Event)
	Unit:CastSpell(38311)
	Unit:RegisterEvent("EBloodwarder_BloodLeech", 9000, 0)
end

function EBloodwarder_BloodLeech(Unit,Event)
	Unit:FullCastSpellOnTarget(37838, Unit:GetClosestPlayer())
end

function EBloodwarder_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function EBloodwarder_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19806, 1, "EBloodwarder_OnEnterCombat")
RegisterUnitEvent(19806, 2, "EBloodwarder_OnLeaveCombat")
RegisterUnitEvent(19806, 4, "EBloodwarder_OnDied")