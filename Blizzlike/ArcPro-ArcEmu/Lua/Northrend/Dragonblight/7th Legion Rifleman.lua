--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function thLegionRifleman_OnCombat(Unit, Event)
	Unit:RegisterEvent("thLegionRifleman_Net", 8000, 0)
	Unit:RegisterEvent("thLegionRifleman_Shoot", 6000, 0)
end

function thLegionRifleman_Net(Unit, Event) 
	Unit:FullCastSpellOnTarget(6533, Unit:GetMainTank()) 
end

function thLegionRifleman_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(50092, Unit:GetMainTank()) 
end

function thLegionRifleman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function thLegionRifleman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27791, 1, "thLegionRifleman_OnCombat")
RegisterUnitEvent(27791, 2, "thLegionRifleman_OnLeaveCombat")
RegisterUnitEvent(27791, 4, "thLegionRifleman_OnDied")