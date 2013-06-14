--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EmeraldLasher_OnCombat(Unit, Event)
	Unit:RegisterEvent("EmeraldLasher_DreamLash", 7000, 0)
end

function EmeraldLasher_DreamLash(Unit, Event) 
	Unit:FullCastSpellOnTarget(51901, Unit:GetMainTank()) 
end

function EmeraldLasher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EmeraldLasher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27254, 1, "EmeraldLasher_OnCombat")
RegisterUnitEvent(27254, 2, "EmeraldLasher_OnLeaveCombat")
RegisterUnitEvent(27254, 4, "EmeraldLasher_OnDied")