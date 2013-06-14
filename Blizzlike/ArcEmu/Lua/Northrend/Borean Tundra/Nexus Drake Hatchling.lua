--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NexusDrakeHatchling_OnCombat(Unit, Event)
	Unit:RegisterEvent("NexusDrakeHatchling_IntangiblePresence", 10000, 0)
	Unit:RegisterEvent("NexusDrakeHatchling_Netherbreath", 7500, 0)
end

function NexusDrakeHatchling_IntangiblePresence(Unit, Event) 
	Unit:CastSpell(36513) 
end

function NexusDrakeHatchling_Netherbreath(Unit, Event) 
	Unit:CastSpell(36631) 
end

function NexusDrakeHatchling_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NexusDrakeHatchling_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26127, 1, "NexusDrakeHatchling_OnCombat")
RegisterUnitEvent(26127, 2, "NexusDrakeHatchling_OnLeaveCombat")
RegisterUnitEvent(26127, 4, "NexusDrakeHatchling_OnDied")