--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NerubarWebLord_OnCombat(Unit, Event)
	Unit:RegisterEvent("NerubarWebLord_BlindingSwarm", 8000, 0)
end

function NerubarWebLord_BlindingSwarm(Unit, Event) 
	Unit:FullCastSpellOnTarget(50284, Unit:GetMainTank()) 
end

function NerubarWebLord_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NerubarWebLord_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25294, 1, "NerubarWebLord_OnCombat")
RegisterUnitEvent(25294, 2, "NerubarWebLord_OnLeaveCombat")
RegisterUnitEvent(25294, 4, "NerubarWebLord_OnDied")