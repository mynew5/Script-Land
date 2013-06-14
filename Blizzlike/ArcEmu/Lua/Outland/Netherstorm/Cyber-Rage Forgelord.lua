--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Forgelord_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Forgelord_Nova", 2000, 0)
    Unit:RegisterEvent("Forgelord_Enrage", 120000, 0)
end

function Forgelord_Nova(Unit, Event)
    Unit:FullCastSpellOnTarget(36255, Unit:GetClosestPlayer())
end

function Forgelord_Enrage(Unit, Event)
    Unit:CastSpell(8599)
end

function Forgelord_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Forgelord_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(16943, 1, "Forgelord_OnEnterCombat")
RegisterUnitEvent(16943, 2, "Forgelord_OnLeaveCombat")
RegisterUnitEvent(16943, 4, "Forgelord_OnDied")