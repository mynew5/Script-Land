--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NerubarTunneler_OnCombat(Unit, Event)
	Unit:RegisterEvent("NerubarTunneler_RockShield", 8000, 0)
end

function NerubarTunneler_RockShield(Unit, Event) 
	Unit:CastSpell(50364) 
end

function NerubarTunneler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NerubarTunneler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25622, 1, "NerubarTunneler_OnCombat")
RegisterUnitEvent(25622, 2, "NerubarTunneler_OnLeaveCombat")
RegisterUnitEvent(25622, 4, "NerubarTunneler_OnDied")