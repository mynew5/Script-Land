--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Terrormaster_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Terrormaster_Cleave", 9000, 0)
	Unit:RegisterEvent("Terrormaster_Fear", 24000, 0)
end

function Terrormaster_Cleave(Unit,Event)
	Unit:FullCastSpellOnTarget(15496, Unit:GetClosestPlayer())
end

function Terrormaster_Fear(Unit,Event)
	Unit:FullCastSpellOnTarget(38154, Unit:GetClosestPlayer())
end

function Terrormaster_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Terrormaster_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21314, 1, "Terrormaster_OnEnterCombat")
RegisterUnitEvent(21314, 2, "Terrormaster_OnLeaveCombat")
RegisterUnitEvent(21314, 4, "Terrormaster_OnDied")