--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Assassin_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Assassin_Kick", 1000, 0)
    Unit:RegisterEvent("Assassin_Warp", 1000, 0)
end

function Assassin_Kick(Unit, Event)
    Unit:FullCastSpellOnTarget(34802, Unit:ClosestPlayer())
end

function Assassin_Warp(Unit, Event)
    Unit:FullCastSpellOnTarget(32920, Unit:ClosestPlayer())
end

function Assassin_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Assassin_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20452, 1, "Assassin_OnEnterCombat")
RegisterUnitEvent(20452, 2, "Assassin_OnLeaveCombat")
RegisterUnitEvent(20452, 4, "Assassin_OnDied")