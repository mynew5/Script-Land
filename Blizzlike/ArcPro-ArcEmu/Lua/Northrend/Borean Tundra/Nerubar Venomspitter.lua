--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NerubarVenomspitter_OnCombat(Unit, Event)
	Unit:RegisterEvent("NerubarVenomspitter_VenomSpit", 8000, 0)
end

function NerubarVenomspitter_VenomSpit(Unit, Event) 
	Unit:FullCastSpellOnTarget(45577, Unit:GetMainTank()) 
end

function NerubarVenomspitter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NerubarVenomspitter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24563, 1, "NerubarVenomspitter_OnCombat")
RegisterUnitEvent(24563, 2, "NerubarVenomspitter_OnLeaveCombat")
RegisterUnitEvent(24563, 4, "NerubarVenomspitter_OnDied")