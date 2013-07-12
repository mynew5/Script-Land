--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Gatewatcher Iron-Hand yells: A foregone conclusion.
Gatewatcher Iron-Hand yells: Low-tech, yet quite effective.
Gatewatcher Iron-Hand yells: My calculations did not...
Gatewatcher Iron-Hand yells: The processing will continue as scheduled!
Gatewatcher Iron-Hand yells: With the precise angle and velocity...
Gatewatcher Iron-Hand yells: You have approximately five seconds to live.]]

function ironhand(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("ironhand_hammer_punch", 15000, 0)
	Unit:RegisterEvent("ironhand_steam_of_machine_fluid_ihand", 20000, 0)
	Unit:RegisterEvent("ironhand_shadow_power_ihand", 25000, 0)
	Unit:RegisterEvent("ironhand_jack_hammer", 30000, 0)
end

function ironhand_hammer_punch(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(35326, Unit:GetClosestPlayer())
end

function ironhand_steam_of_machine_fluid_ihand(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(35311, Unit:GetClosestPlayer())
end

function ironhand_shadow_power_ihand(Unit)
	Unit:FullCastSpell(35322)
end

function ironhand_jack_hammer(Unit)
	Unit:FullCastSpell(35327)
end

RegisterUnitEvent(19710, 1, "ironhand")