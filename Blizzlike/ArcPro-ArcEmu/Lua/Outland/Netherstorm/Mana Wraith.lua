--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Wraith_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Wraith_Mana", 2000, 0)
end

function Wraith_Mana(Unit, Event)
    Unit:FullCastSpellOnTarget(29054, Unit:ClosestPlayer())
end

function Wraith_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Wraith_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18864, 1, "Wraith_OnEnterCombat")
RegisterUnitEvent(18864, 2, "Wraith_OnLeaveCombat")
RegisterUnitEvent(18864, 4, "Wraith_OnDied")