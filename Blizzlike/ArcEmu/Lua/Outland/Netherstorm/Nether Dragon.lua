--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Dragon_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Dragon_Presence", 1000, 0)
    Unit:RegisterEvent("Dragon_Netherbreath", 2500, 0)
end

function Dragon_Presence(Unit, Event)
    Unit:FullCastSpellOnTarget(36513, Unit:ClosestPlayer())
end

function Dragon_Netherbreath(Unit, Event)
    Unit:FullCastSpellOnTarget(36631, Unit:ClosestPlayer())
end

function Dragon_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Dragon_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20332, 1, "Dragon_OnEnterCombat")
RegisterUnitEvent(20332, 2, "Dragon_OnLeaveCombat")
RegisterUnitEvent(20332, 4, "Dragon_OnDied")