--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Relay_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Relay_Shadowform", 1000, 0)
end

function Relay_Shadowform(Unit, Event)
    Unit:CastSpell(16592)
end

function Relay_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Relay_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20619, 1, "Relay_OnEnterCombat")
RegisterUnitEvent(20619, 2, "Relay_OnLeaveCombat")
RegisterUnitEvent(20619, 4, "Relay_OnDied")