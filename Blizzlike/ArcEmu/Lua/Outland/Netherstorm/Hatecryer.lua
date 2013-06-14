--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Hatecryer_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Hatecryer_Curse", 1000, 0)
    Unit:RegisterEvent("Hatecryer_Rain", 1000, 0)
end

function Hatecryer_Curse(Unit, Event)
    Unit:FullCastSpellOnTarget(36541, Unit:ClosestPlayer())
end

function Hatecryer_Rain(Unit, Event)
    Unit:FullCastSpellOnTarget(34017, Unit:ClosestPlayer())
end

function Hatecryer_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Hatecryer_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20930, 1, "Hatecryer_OnEnterCombat")
RegisterUnitEvent(20930, 2, "Hatecryer_OnLeaveCombat")
RegisterUnitEvent(20930, 4, "Hatecryer_OnDied")