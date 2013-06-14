--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function thLegionElitetwo_OnCombat(Unit, Event)
	Unit:RegisterEvent("thLegionElitetwo_Net", 8000, 0)
	Unit:RegisterEvent("thLegionElitetwo_Shoot", 6000, 0)
end

function thLegionElitetwo_Net(Unit, Event) 
	Unit:FullCastSpellOnTarget(6533, Unit:GetMainTank()) 
end

function thLegionElitetwo_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(50092, Unit:GetMainTank()) 
end

function thLegionElitetwo_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function thLegionElitetwo_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27713, 1, "thLegionElitetwo_OnCombat")
RegisterUnitEvent(27713, 2, "thLegionElitetwo_OnLeaveCombat")
RegisterUnitEvent(27713, 4, "thLegionElitetwo_OnDied")