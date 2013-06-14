--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function mugthol_strike(pUnit, Event)
local plr = pUnit:GetClosestPlayer()
	if (plr ~= nil) then
		pUnit:FullCastSpellOnTarget(11976, plr)
	end
end

function mugthol_demoralizing(pUnit, Event)
	pUnit:CastSpell(13730)
end

function mugthol_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("mugthol_demoralizing", 2000, 1)
	pUnit:RegisterEvent("mugthol_strike", 20000, 0)
end

function mugthol_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2257, 1, "mugthol_OnCombat")
RegisterUnitEvent(2257, 2, "mugthol_OnLeaveCombat")