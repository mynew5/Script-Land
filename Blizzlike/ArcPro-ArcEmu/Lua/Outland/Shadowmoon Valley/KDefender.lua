--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function KDefender_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("KDefender_Cleave", 11000, 0)
end

function KDefender_Cleave(Unit,Event)
	Unit:FullCastSpellOnTarget(15496, Unit:GetMainTank())
end

function KDefender_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function KDefender_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19362, 1, "KDefender_OnEnterCombat")
RegisterUnitEvent(19362, 2, "KDefender_OnLeaveCombat")
RegisterUnitEvent(19362, 4, "KDefender_OnDied")