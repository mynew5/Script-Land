--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Doomguard_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Doomguard_Strike", 1000, 0)
    Unit:RegisterEvent("Doomguard_Stomp", 1000, 0)
end

function Doomguard_Strike(Unit, Event)
    Unit:FullCastSpellOnTarget(32736, Unit:ClosestPlayer())
end

function Doomguard_Stomp(Unit, Event)
    Unit:FullCastSpellOnTarget(35238, Unit:ClosestPlayer())
end

function Doomguard_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Doomguard_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19853, 1, "Doomguard_OnEnterCombat")
RegisterUnitEvent(19853, 2, "Doomguard_OnLeaveCombat")
RegisterUnitEvent(19853, 4, "Doomguard_OnDied")