--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Performer/Performa; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Boulderfistsaboteur_Spell(Unit, Event, MiscUnit, Misc)
    Unit:FullCastSpellOnTarget(32248, Unit:ClosestPlayer())
end

function Boulderfistsaboteur(Unit, Event, MiscUnit, Misc)
    Unit:RegisterEvent("Boulderfistsaboteur_Spell", 5000, 0)
end

function Boulderfistsaboteur_Death(Unit)
    Unit:RemoveEvents()
end

function Boulderfistsaboteur_OnLeaveCombat(Unit)
    Unit:RemoveEvents()
end

RegisterUnitEvent(18352, 1, "Boulderfistsaboteur")
RegisterUnitEvent(18352, 2, "Boulderfistsaboteur_OnLeaveCombat")
RegisterUnitEvent(18352, 3, "Boulderfistsaboteur_Death")