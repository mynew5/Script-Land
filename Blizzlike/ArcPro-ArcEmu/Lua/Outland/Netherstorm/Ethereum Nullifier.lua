--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Nullifier_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Nullifier_Presence", 1000, 0)
end

function Nullifier_Presence(Unit, Event)
    Unit:CastSpell(36513)
end

function Nullifier_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Nullifier_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22822, 1, "Nullifier_OnEnterCombat")
RegisterUnitEvent(22822, 2, "Nullifier_OnLeaveCombat")
RegisterUnitEvent(22822, 4, "Nullifier_OnDied")