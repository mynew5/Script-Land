--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OrkaosTheInsane_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("OrkaosTheInsane_Cleave", 14000, 0)
	Unit:RegisterEvent("OrkaosTheInsane_MortalStrike", 16000, 0)
	Unit:RegisterEvent("OrkaosTheInsane_Uppercut", 8000, 0)
end

function OrkaosTheInsane_Cleave(Unit,Event)
	Unit:FullCastSpellOnTarget(15496, Unit:GetClosestPlayer())
end

function OrkaosTheInsane_MortalStrike(Unit,Event)
	Unit:FullCastSpellOnTarget(17547, Unit:GetClosestPlayer())
end

function OrkaosTheInsane_Uppercut(Unit,Event)
	Unit:FullCastSpellOnTarget(10966, Unit:GetClosestPlayer())
end

function OrkaosTheInsane_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function OrkaosTheInsane_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(23168, 1, "OrkaosTheInsane_OnEnterCombat")
RegisterUnitEvent(23168, 2, "OrkaosTheInsane_OnLeaveCombat")
RegisterUnitEvent(23168, 4, "OrkaosTheInsane_OnDied")