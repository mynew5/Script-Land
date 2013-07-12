--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Marathelle_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Marathelle_Tempest", 4500, 0)
    Unit:RegisterEvent("Marathelle_Ring", 20000, 0)
end

function Marathelle_Tempest(Unit, Event)
    Unit:FullCastSpellOnTarget(35843, Unit:ClosestPlayer())
end   

function Marathelle_Ring(Unit, Event)
    Unit:FullCastSpellOnTarget(35831, Unit:RandomPlayer(0))
end

function Marathelle_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Marathelle_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19926, 1, "Marathelle_OnEnterCombat")
RegisterUnitEvent(19926, 2, "Marathelle_OnLeaveCombat")
RegisterUnitEvent(19926, 4, "Marathelle_OnDied")