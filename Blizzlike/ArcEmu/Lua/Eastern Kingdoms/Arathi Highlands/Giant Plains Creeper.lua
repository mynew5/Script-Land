--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GiantPlainsCreeper_OnEnterCombat(Unit,Event)
local plr =	Unit:GetMainTank()
	Unit:RegisterEvent("EncasingWebs", 18000, 0)
	Unit:RegisterEvent("Poison", 5000, 1)
end

function EncasingWebs(Unit,Event)
	Unit:FullCastSpellOnTarget(4962, plr)
end

function Poison(Unit,Event)
	Unit:FullCastSpellOnTarget(744, plr)
end

function GiantPlainsCreeper_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function GiantPlainsCreeper_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2565, 1, "GiantPlainsCreeper_OnEnterCombat")
RegisterUnitEvent(2565, 2, "GiantPlainsCreeper_OnLeaveCombat")
RegisterUnitEvent(2565, 4, "GiantPlainsCreeper_OnDied")