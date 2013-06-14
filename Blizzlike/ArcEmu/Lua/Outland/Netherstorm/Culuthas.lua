--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Culuthas_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Culuthas_Felfire", 3000, 0)
end

function Culuthas_Felfire(Unit, Event)
    Unit:FullCastSpellOnTarget(37089, Unit:GetClosestPlayer())
end

function Culuthas_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Culuthas_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20138, 1, "Culuthas_OnEnterCombat")
RegisterUnitEvent(20138, 2, "Culuthas_OnLeaveCombat")
RegisterUnitEvent(20138, 4, "Culuthas_OnDied")