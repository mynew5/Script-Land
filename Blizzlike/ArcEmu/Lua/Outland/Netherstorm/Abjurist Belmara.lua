--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Abjurist_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Abjurist_Armor", 10000, 0)
    Unit:RegisterEvent("Abjurist_Missiles", 1000, 0)
end
    
function Abjurist_Armor(Unit, Event)
    Unit:CastSpell(12544)
end

function Abjurist_Missiles(Unit, Event)
    Unit:FullCastSpellOnTarget(34447, Unit:ClosestPlayer())
end

function Abjurist_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Abjurist_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19546, 1, "Abjurist_OnEnterCombat")
RegisterUnitEvent(19546, 2, "Abjurist_OnLeaveCombat")
RegisterUnitEvent(19546, 4, "Abjurist_OnDied")