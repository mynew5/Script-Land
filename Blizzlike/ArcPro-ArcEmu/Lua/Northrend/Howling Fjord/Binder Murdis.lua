--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BinderMurdis_OnCombat(Unit, Event)
	Unit:RegisterEvent("BinderMurdis_FlameShock", 7000, 0)
	Unit:RegisterEvent("BinderMurdis_RuneofBinding", 11000, 0)
end

function BinderMurdis_FlameShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(15039, Unit:GetMainTank()) 
end

function BinderMurdis_RuneofBinding(Unit, Event) 
	Unit:FullCastSpellOnTarget(48599, Unit:GetMainTank()) 
end

function BinderMurdis_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BinderMurdis_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24334, 1, "BinderMurdis_OnCombat")
RegisterUnitEvent(24334, 2, "BinderMurdis_OnLeaveCombat")
RegisterUnitEvent(24334, 4, "BinderMurdis_OnDied")