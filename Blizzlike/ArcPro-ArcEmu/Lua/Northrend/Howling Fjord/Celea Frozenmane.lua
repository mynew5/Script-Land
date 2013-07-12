--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CeleaFrozenmane_OnCombat(Unit, Event)
	Unit:RegisterEvent("CeleaFrozenmane_Shoot", 6000, 0)
end

function CeleaFrozenmane_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(22121, Unit:GetMainTank()) 
end

function CeleaFrozenmane_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CeleaFrozenmane_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24032, 1, "CeleaFrozenmane_OnCombat")
RegisterUnitEvent(24032, 2, "CeleaFrozenmane_OnLeaveCombat")
RegisterUnitEvent(24032, 4, "CeleaFrozenmane_OnDied")