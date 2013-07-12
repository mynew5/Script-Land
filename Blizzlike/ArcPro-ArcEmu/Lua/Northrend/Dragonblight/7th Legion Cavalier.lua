--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function thLegionCavalier_OnCombat(Unit, Event)
	Unit:RegisterEvent("thLegionCavalier_MortalStrike", 8000, 0)
	Unit:RegisterEvent("thLegionCavalier_SnapKick", 6000, 0)
end

function thLegionCavalier_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(19643, Unit:GetMainTank()) 
end

function thLegionCavalier_SnapKick(Unit, Event) 
	Unit:FullCastSpellOnTarget(15618, Unit:GetMainTank()) 
end

function thLegionCavalier_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function thLegionCavalier_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27161, 1, "thLegionCavalier_OnCombat")
RegisterUnitEvent(27161, 2, "thLegionCavalier_OnLeaveCombat")
RegisterUnitEvent(27161, 4, "thLegionCavalier_OnDied")