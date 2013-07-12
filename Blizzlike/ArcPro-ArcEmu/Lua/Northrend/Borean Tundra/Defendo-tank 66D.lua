--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: AscendScripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Defendotank66D_OnCombat(Unit, Event)
	Unit:RegisterEvent("Defendotank66D_MachineGun", 8000, 0)
	Unit:RegisterEvent("Defendotank66D_Shoot", 6000, 0)
end

function Defendotank66D_MachineGun(Unit, Event) 
	Unit:FullCastSpellOnTarget(49981, Unit:GetMainTank()) 
end

function Defendotank66D_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(49987, Unit:GetMainTank()) 
end

function Defendotank66D_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Defendotank66D_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25758, 1, "Defendotank66D_OnCombat")
RegisterUnitEvent(25758, 2, "Defendotank66D_OnLeaveCombat")
RegisterUnitEvent(25758, 4, "Defendotank66D_OnDied")