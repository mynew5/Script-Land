--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Doomclaw_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Doomclaw_Swipe", 1000, 0)
    Unit:RegisterEvent("Doomclaw_Claw", 1100, 0)
    Unit:RegisterEvent("Doomclaw_Slime", 1000, 0)
end

function Doomclaw_Swipe(Unit, Event)
    Unit:FullCastSpellOnTarget(36205, Unit:ClosestPlayer())
end

function Doomclaw_Claw(Unit, Event)
    Unit:FullCastSpellOnTarget(36996, Unit:ClosestPlayer())
end

function Doomclaw_Slime(Unit, Event)
    Unit:FullCastSpellOnTarget(34261, Unit:ClosestPlayer())
end

function Doomclaw_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Doomclaw_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19738, 1, "Doomclaw_OnEnterCombat")
RegisterUnitEvent(19738, 2, "Doomclaw_OnLeaveCombat")
RegisterUnitEvent(19738, 4, "Doomclaw_OnDied")