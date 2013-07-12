--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Sunfury_Archer_OnCombat(Unit, Event)
	Unit:RegisterEvent("Sunfury_Archer_Net", 8000, 0)
	Unit:RegisterEvent("Sunfury_Archer_Immolation_Arrow", 6000, 0)
	Unit:RegisterEvent("Sunfury_Archer_Shoot", 6000, 0)
end

function Sunfury_Archer_Immolation_Arrow(Unit, Event) 
	Unit:FullCastSpellOnTarget(37847, Unit:GetMainTank()) 
end

function Sunfury_Archer_Net(Unit, Event) 
	Unit:FullCastSpellOnTarget(12024, Unit:GetMainTank()) 
end

function Sunfury_Archer_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function Sunfury_Archer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Sunfury_Archer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(19707, 1, "Sunfury_Archer_OnCombat")
RegisterUnitEvent(19707, 2, "Sunfury_Archer_OnLeaveCombat")
RegisterUnitEvent(19707, 4, "Sunfury_Archer_OnDied")