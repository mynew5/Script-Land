--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OnslaughtScout_OnCombat(Unit, Event)
	Unit:RegisterEvent("OnslaughtScout_Sprint", 4000, 1)
end

function OnslaughtScout_Sprint(Unit, Event) 
	Unit:CastSpell(48594) 
end

function OnslaughtScout_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OnslaughtScout_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27332, 1, "OnslaughtScout_OnCombat")
RegisterUnitEvent(27332, 2, "OnslaughtScout_OnLeaveCombat")
RegisterUnitEvent(27332, 4, "OnslaughtScout_OnDied")