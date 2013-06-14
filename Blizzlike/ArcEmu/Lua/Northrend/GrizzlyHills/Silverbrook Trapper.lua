--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SilverbrookTrapper_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilverbrookTrapper_HookedNet", 12000, 0)
	Unit:RegisterEvent("SilverbrookTrapper_Shoot", 6000, 0)
end

function SilverbrookTrapper_HookedNet(Unit, Event) 
	Unit:FullCastSpellOnTarget(13608, Unit:GetMainTank()) 
end

function SilverbrookTrapper_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function SilverbrookTrapper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilverbrookTrapper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26679, 1, "SilverbrookTrapper_OnCombat")
RegisterUnitEvent(26679, 2, "SilverbrookTrapper_OnLeaveCombat")
RegisterUnitEvent(26679, 4, "SilverbrookTrapper_OnDied")