--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Arconus_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Arconus_Shadows", 10000, 0)
    Unit:RegisterEvent("Arconus_Desecration", 1000, 0)
end

function Arconus_Shadows(Unit, Event)
    Unit:CastSpell(36472)
end

function Arconus_Desecration(Unit, Event)
    Unit:FullCastSpellOnTarget(36473, Unit:GetClosestPlayer())
end

function Arconus_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Arconus_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20554, 1, "Arconus_OnEnterCombat")
RegisterUnitEvent(20554, 2, "Arconus_OnLeaveCombat")
RegisterUnitEvent(20554, 4, "Arconus_OnDied")