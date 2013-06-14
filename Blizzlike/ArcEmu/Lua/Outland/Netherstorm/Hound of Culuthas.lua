--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Hound_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Hound_Breath", 2500, 0)
    Unit:RegisterEvent("Hound_Stomp", 1000, 0)
end

function Hound_Breath(Unit, Event)
    Unit:FullCastSpellOnTarget(36406, Unit:ClosestPlayer())
end

function Hound_Stomp(Unit, Event)
    Unit:FullCastSpellOnTarget(36405, Unit:ClosestPlayer())
end

function Hound_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Hound_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20141, 1, "Hound_OnEnterCombat")
RegisterUnitEvent(20141, 2, "Hound_OnLeaveCombat")
RegisterUnitEvent(20141, 4, "Hound_OnDied")