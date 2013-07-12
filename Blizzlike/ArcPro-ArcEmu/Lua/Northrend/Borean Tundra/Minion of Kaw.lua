--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MinionofKaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("MinionofKaw_DestructiveStrike", 8000, 0)
end

function MinionofKaw_DestructiveStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(51430, Unit:GetMainTank()) 
end

function MinionofKaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MinionofKaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25880, 1, "MinionofKaw_OnCombat")
RegisterUnitEvent(25880, 2, "MinionofKaw_OnLeaveCombat")
RegisterUnitEvent(25880, 4, "MinionofKaw_OnDied")