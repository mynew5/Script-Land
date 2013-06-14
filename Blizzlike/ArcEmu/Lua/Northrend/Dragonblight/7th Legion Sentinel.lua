--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function thLegionSentinel_OnCombat(Unit, Event)
	Unit:RegisterEvent("thLegionSentinel_GlaiveThrow", 8000, 0)
	Unit:RegisterEvent("thLegionSentinel_Shoot", 6000, 0)
	Unit:RegisterEvent("thLegionSentinel_ShootMagicArrow", 7000, 0)
end

function thLegionSentinel_GlaiveThrow(Unit, Event) 
	Unit:FullCastSpellOnTarget(49481, Unit:GetMainTank()) 
end

function thLegionSentinel_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(15547, Unit:GetMainTank()) 
end

function thLegionSentinel_ShootMagicArrow(Unit, Event) 
	Unit:FullCastSpellOnTarget(48530, Unit:GetMainTank()) 
end

function thLegionSentinel_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function thLegionSentinel_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27162, 1, "thLegionSentinel_OnCombat")
RegisterUnitEvent(27162, 2, "thLegionSentinel_OnLeaveCombat")
RegisterUnitEvent(27162, 4, "thLegionSentinel_OnDied")