--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Orelis_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Orelis_Shout", 1000, 0)
    Unit:RegisterEvent("Orelis_Strike", 1000, 0)
    Unit:RegisterEvent("Orelis_Rend", 1000, 0)
end

function Orelis_Shout(Unit, Event)
    Unit:FullCastSpellOnTarget(13730, Unit:ClosestPlayer())
end

function Orelis_Strike(Unit, Event)
    Unit:FullCastSpellOnTarget(29426, Unit:ClosestPlayer())
end

function Orelis_Rend(Unit, Event)
    Unit:FullCastSpellOnTarget(16509, Unit:ClosestPlayer())
end

function Orelis_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Orelis_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19466, 1, "Orelis_OnEnterCombat")
RegisterUnitEvent(19466, 2, "Orelis_OnLeaveCombat")
RegisterUnitEvent(19466, 4, "Orelis_OnDied")