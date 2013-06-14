--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Hunter_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Hunter_DeMaterialize", 8000, 0)
    Unit:RegisterEvent("Hunter_ManaBurn", 3000, 0)
end

function Hunter_DeMaterialize(Unit, Event)
    Unit:CastSpell(34814)
    Unit:RegisterEvent("Hunter_Materialize", 3000, 0)
end   
   
function Hunter_ManaBurn(Unit, Event)
    Unit:FullCastSpellOnTarget(13321, Unit:ClosestPlayer())
end

function Hunter_Materialize(Unit, Event)
    Unit:CastSpell(34804)
end
    
function Hunter_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Hunter_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18879, 1, "Hunter_OnEnterCombat")
RegisterUnitEvent(18879, 2, "Hunter_OnLeaveCombat")
RegisterUnitEvent(18879, 4, "Hunter_OnDied")