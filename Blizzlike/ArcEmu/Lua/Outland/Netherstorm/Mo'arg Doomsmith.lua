--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Doomsmith_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Doomsmith_Doomsaw", 1300, 0)
end

function Doomsmith_Doomsaw(Unit, Event)
    Unit:FullCastSpellOnTarget(36200, Unit:ClosestPlayer())
end

function Doomsmith_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Doomsmith_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(16944, 1, "Doomsmith_OnEnterCombat")
RegisterUnitEvent(16944, 2, "Doomsmith_OnLeaveCombat")
RegisterUnitEvent(16944, 4, "Doomsmith_OnDied")