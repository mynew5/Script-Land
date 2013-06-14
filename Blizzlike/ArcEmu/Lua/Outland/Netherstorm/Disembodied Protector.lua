--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Protector_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Protector_Strike", 1000, 0)
    Unit:RegisterEvent("Protector_Smite", 2500, 0)
end

function Protector_Strike(Unit, Event)
    Unit:FullCastSpellOnTarget(36647, Unit:ClosestPlayer())
end

function Protector_Smite(Unit, Event)
    Unit:FullCastSpellOnTarget(9734, Unit:ClosestPlayer())
end

function Protector_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Protector_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18873, 1, "Protector_OnEnterCombat")
RegisterUnitEvent(18873, 2, "Protector_OnLeaveCombat")
RegisterUnitEvent(18873, 4, "Protector_OnDied")