--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Exarch_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Exarch_Fortitude", 2000, 0)
    Unit:RegisterEvent("Exarch_Devotion", 1000, 0)
end

function Exarch_Fortitude(Unit, Event)
    Unit:CastSpellOnTarget(36004, Unit:RandomFriend())
end

function Exarch_Devotion(Unit, Event)
    Unit:CastSpell(8258)
end

function Exarch_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Exarch_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21058, 1, "Exarch_OnEnterCombat")
RegisterUnitEvent(21058, 2, "Exarch_OnLeaveCombat")
RegisterUnitEvent(21058, 4, "Exarch_OnDied")