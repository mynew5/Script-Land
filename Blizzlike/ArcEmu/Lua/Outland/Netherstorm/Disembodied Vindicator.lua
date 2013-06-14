--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Vindicator_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Vindicator_Revenge", 1000, 0)
    Unit:RegisterEvent("Vindicator_Vindication", 1000, 0)
end

function Vindicator_Revenge(Unit, Event)
    Unit:CastSpellOnTarget(36647,GetInRangeFriends())
end

function Vindicator_Vindication(Unit, Event)
    Unit:FullCastSpellOnTarget(36002, Unit:ClosestPlayer())
end

function Vindicator_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Vindicator_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18872, 1, "Vindicator_OnEnterCombat")
RegisterUnitEvent(18872, 2, "Vindicator_OnLeaveCombat")
RegisterUnitEvent(18872, 4, "Vindicator_OnDied")