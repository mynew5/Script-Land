--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Guardian_OnCombat(Unit, Event)
	Unit:RegisterEvent("Guardian_Banish", 10000, 0)
end

function Guardian_Banish(Unit, Event) 
	Unit:FullCastSpellOnTarget(36671, Unit:GetMainTank()) 
end

function Guardian_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Guardian_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18568, 1, "Guardian_OnCombat")
RegisterUnitEvent(18568, 2, "Guardian_OnLeaveCombat")
RegisterUnitEvent(18568, 4, "Guardian_OnDied")