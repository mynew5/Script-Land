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
    Unit:RegisterEvent("Dimensius_Feed", 5000, 0)
end

function Dimensius_Feed(Unit, Event)
    Unit:FullCastSpellOnTarget(37450, Unit:MainTank())
end   

function Dimensius_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Dimensius_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21780, 1, "Dimensius_OnEnterCombat")
RegisterUnitEvent(21780, 2, "Dimensius_OnLeaveCombat")
RegisterUnitEvent(21780, 4, "Dimensius_OnDied")