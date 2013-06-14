--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function thLegionCleric_OnCombat(Unit, Event)
	Unit:RegisterEvent("thLegionCleric_Heal", 14000, 0)
	Unit:RegisterEvent("thLegionCleric_HolySmite", 6000, 0)
end

function thLegionCleric_Heal(Unit, Event) 
	Unit:CastSpell(31739) 
end

function thLegionCleric_HolySmite(Unit, Event) 
	Unit:FullCastSpellOnTarget(25054, Unit:GetMainTank()) 
end

function thLegionCleric_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function thLegionCleric_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26780, 1, "thLegionCleric_OnCombat")
RegisterUnitEvent(26780, 2, "thLegionCleric_OnLeaveCombat")
RegisterUnitEvent(26780, 4, "thLegionCleric_OnDied")