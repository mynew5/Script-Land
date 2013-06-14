--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function thLegionElite_OnCombat(Unit, Event)
	Unit:RegisterEvent("thLegionElite_Net", 8000, 0)
	Unit:RegisterEvent("thLegionElite_Shoot", 6000, 0)
end

function thLegionElite_Net(Unit, Event) 
	Unit:FullCastSpellOnTarget(6533, Unit:GetMainTank()) 
end

function thLegionElite_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(50092, Unit:GetMainTank()) 
end

function thLegionElite_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function thLegionElite_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27588, 1, "thLegionElite_OnCombat")
RegisterUnitEvent(27588, 2, "thLegionElite_OnLeaveCombat")
RegisterUnitEvent(27588, 4, "thLegionElite_OnDied")