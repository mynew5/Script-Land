--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Commander_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Commander_Cleave", 1000, 0)
    Unit:RegisterEvent("Commander_Spellbreaker", 1000, 0)
end

function Commander_Cleave(Unit, Event)
    Unit:FullCastSpellOnTarget(35473, Unit:ClosestPlayer())
end

function Commander_Spellbreaker(Unit, Event)
    Unit:FullCastSpellOnTarget(35871, Unit:ClosestPlayer())
end

function Commander_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Commander_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19831, 1, "Commander_OnEnterCombat")
RegisterUnitEvent(19831, 2, "Commander_OnLeaveCombat")
RegisterUnitEvent(19831, 4, "Commander_OnDied")