--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Cragskaar_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Cragskaar_Knock", 45000, 0)
end

function Cragskaar_Knock(Unit, Event)
    Unit:FullCastSpellOnTarget(32959, Unit:GetClosestPlayer())
end

function Cragskaar_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Cragskaar_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20202, 1, "Cragskaar_OnEnterCombat")
RegisterUnitEvent(20202, 2, "Cragskaar_OnLeaveCombat")
RegisterUnitEvent(20202, 4, "Cragskaar_OnDied")