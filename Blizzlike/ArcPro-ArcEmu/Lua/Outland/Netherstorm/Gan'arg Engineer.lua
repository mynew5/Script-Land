--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Engineer_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Engineer_Dynamite", 1000, 0)
end

function Engineer_Dynamite(Unit, Event)
    Unit:FullCastSpellOnTarget(7978, Unit:ClosestPlayer())
end

function Engineer_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Engineer_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(16948, 1, "Engineer_OnEnterCombat")
RegisterUnitEvent(16948, 2, "Engineer_OnLeaveCombat")
RegisterUnitEvent(16948, 4, "Engineer_OnDied")