--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Annihilator_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Annihilator_Explosion", 1500, 0)
    Unit:RegisterEvent("Annihilator_Suppression", 3000, 0)
end

function Annihilator_Explosion(Unit, Event)
    Unit:FullCastSpellOnTarget(33860, Unit:GetClosestPlayer())
end

function Annihilator_Suppression(Unit, Event)
    Unit:FullCastSpellOnTarget(35892, Unit:GetClosestPlayer())
end

function Annihilator_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Annihilator_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18856, 1, "Annihilator_OnEnterCombat")
RegisterUnitEvent(18856, 2, "Annihilator_OnLeaveCombat")
RegisterUnitEvent(18856, 4, "Annihilator_OnDied")