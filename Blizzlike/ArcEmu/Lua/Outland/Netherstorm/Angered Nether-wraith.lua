--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Angered_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Angered_Bolt", 1000, 0)
    Unit:RegisterEvent("Angered_Blast", 6000, 0)
end

function Angered_Bolt(Unit, Event)
    Unit:FullCastSpellOnTarget(39337, Unit:GetClosestPlayer())
end

function Angered_Blast(Unit, Event)
    Unit:FullCastSpellOnTarget(38205, Unit:GetClosestPlayer())
end

function Angered_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Angered_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17870, 1, "Angered_OnEnterCombat")
RegisterUnitEvent(17870, 2, "Angered_OnLeaveCombat")
RegisterUnitEvent(17870, 4, "Angered_OnDied")