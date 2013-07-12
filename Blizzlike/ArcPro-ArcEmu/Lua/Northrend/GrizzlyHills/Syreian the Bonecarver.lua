--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SyreiantheBonecarver_OnCombat(Unit, Event)
	Unit:RegisterEvent("SyreiantheBonecarver_FrostArrow", 7000, 0)
	Unit:RegisterEvent("SyreiantheBonecarver_ImprovedWingClip", 13000, 0)
	Unit:RegisterEvent("SyreiantheBonecarver_Shoot", 6000, 0)
end

function SyreiantheBonecarver_FrostArrow(Unit, Event) 
	Unit:FullCastSpellOnTarget(38952, Unit:GetMainTank()) 
end

function SyreiantheBonecarver_ImprovedWingClip(Unit, Event) 
	Unit:FullCastSpellOnTarget(47168, Unit:GetMainTank()) 
end

function SyreiantheBonecarver_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(50092, Unit:GetMainTank()) 
end

function SyreiantheBonecarver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SyreiantheBonecarver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(32438, 1, "SyreiantheBonecarver_OnCombat")
RegisterUnitEvent(32438, 2, "SyreiantheBonecarver_OnLeaveCombat")
RegisterUnitEvent(32438, 4, "SyreiantheBonecarver_OnDied")