--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TwilightKeeperExeter_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightKeeperExeter_ConcussionBlow", 10000, 0)
	Unit:RegisterEvent("TwilightKeeperExeter_MortalStrike", 8000, 0)
end

function TwilightKeeperExeter_ConcussionBlow(Unit, Event) 
	Unit:FullCastSpellOnTarget(22427, Unit:GetMainTank()) 
end

function TwilightKeeperExeter_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(16856, Unit:GetMainTank()) 
end

function TwilightKeeperExeter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightKeeperExeter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11803, 1, "TwilightKeeperExeter_OnCombat")
RegisterUnitEvent(11803, 2, "TwilightKeeperExeter_OnLeaveCombat")
RegisterUnitEvent(11803, 4, "TwilightKeeperExeter_OnDied")