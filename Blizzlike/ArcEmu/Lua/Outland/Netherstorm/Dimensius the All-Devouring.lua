--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Dimensius_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Dimensius_Trick", 1000, (1))
    Unit:RegisterEvent("Dimensius_Spiral", 3000, 0)
    Unit:RegisterEvent("Dimensius_Vault", 1000, 0)
end

function Dimensius_Trick(Unit, Event)
    Unit:CastSpell(37425)
end

function Dimensius_Spiral(Unit, Event)
    Unit:FullCastSpellOnTarget(37500, Unit:ClosestPlayer())
end

function Dimensius_Vault(Unit, Event)
    Unit:FullCastSpellOnTarget(37412, Unit:ClosestPlayer())
end

function Dimensius_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Dimensius_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19554, 1, "Dimensius_OnEnterCombat")
RegisterUnitEvent(19554, 2, "Dimensius_OnLeaveCombat")
RegisterUnitEvent(19554, 4, "Dimensius_OnDied")