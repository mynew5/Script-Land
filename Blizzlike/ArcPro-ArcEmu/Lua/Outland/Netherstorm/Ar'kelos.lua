--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ark_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Ark_Explosion", 1500, 0)
end

function Ark_Explosion(Unit, Event)
    Unit:FullCastSpellOnTarget(11975, Unit:GetClosestPlayer())
end

function Ark_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Ark_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19494, 1, "Ark_OnEnterCombat")
RegisterUnitEvent(19494, 2, "Ark_OnLeaveCombat")
RegisterUnitEvent(19494, 4, "Ark_OnDied")