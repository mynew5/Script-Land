--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Apex_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Apex_Thunderclap", 1000, 0)
end

function Apex_Thunderclap(Unit, Event)
    Unit:FullCastSpellOnTraget(8078, Unit:GetClosestPlayer())
end

function Apex_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Apex_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19940, 1, "Apex_OnEnterCombat")
RegisterUnitEvent(19940, 2, "Apex_OnLeaveCombat")
RegisterUnitEvent(19940, 4, "Apex_OnDied")