--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TheRake_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheRake_MuscleTear", 8000, 0)
end

function TheRake_MuscleTear(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12166, pUnit:GetClosestPlayer()) 
end

function TheRake_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheRake_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5807, 1, "TheRake_OnCombat")
RegisterUnitEvent(5807, 2, "TheRake_OnLeaveCombat")
RegisterUnitEvent(5807, 4, "TheRake_OnDied")