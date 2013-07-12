--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FumblubGearwind_OnCombat(Unit, Event)
	Unit:RegisterEvent("FumblubGearwind_MachineGun", 8000, 0)
end

function FumblubGearwind_MachineGun(Unit, Event) 
	Unit:FullCastSpellOnTarget(60906, Unit:GetMainTank()) 
end

function FumblubGearwind_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FumblubGearwind_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(32358, 1, "FumblubGearwind_OnCombat")
RegisterUnitEvent(32358, 2, "FumblubGearwind_OnLeaveCombat")
RegisterUnitEvent(32358, 4, "FumblubGearwind_OnDied")