--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Gatewatcher Gyro-Kill yells: An unforeseen... contingency.
Gatewatcher Gyro-Kill yells: I predict a painful death.
Gatewatcher Gyro-Kill yells: If my division is correct... you should be quite dead.
Gatewatcher Gyro-Kill yells: Measure twice; cut once.
Gatewatcher Gyro-Kill yells: Yes, the only logical outcome.
Gatewatcher Gyro-Kill yells: Your strategy was flawed.]]

function gyrokill(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("gyrokill_shadow_power_gkill", 20000, 0)
	Unit:RegisterEvent("gyrokill_steam_of_mahcine_flid_gkill", 25000, 0)
	Unit:RegisterEvent("gyrokill_saw_blade", 30000, 0)
end

function gyrokill_shadow_power_gkill(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(35322, Unit:GetClosestPlayer())
end

function gyrokill_steam_of_mahcine_flid_gkill(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(35311, Unit:GetClosestPlayer())
end

function gyrokill_saw_blade(Unit)
	Unit:FullCastSpell(35318)
end

RegisterUnitEvent(19218, 1, "gyrokill")