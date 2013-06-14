--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WarpHuntressKula_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarpHuntressKula_ShootGun", 6000, 0)
end

function WarpHuntressKula_ShootGun(Unit, Event) 
	Unit:FullCastSpellOnTarget(61353, Unit:GetMainTank()) 
end

function WarpHuntressKula_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarpHuntressKula_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(32711, 1, "WarpHuntressKula_OnCombat")
RegisterUnitEvent(32711, 2, "WarpHuntressKula_OnLeaveCombat")
RegisterUnitEvent(32711, 4, "WarpHuntressKula_OnDied")