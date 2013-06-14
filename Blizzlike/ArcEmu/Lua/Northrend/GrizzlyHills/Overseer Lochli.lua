--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OverseerLochli_OnCombat(Unit, Event)
	Unit:RegisterEvent("OverseerLochli_Thunderstorm", 11000, 0)
end

function OverseerLochli_Thunderstorm(Unit, Event) 
	Unit:CastSpell(52717) 
end

function OverseerLochli_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OverseerLochli_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26922, 1, "OverseerLochli_OnCombat")
RegisterUnitEvent(26922, 2, "OverseerLochli_OnLeaveCombat")
RegisterUnitEvent(26922, 4, "OverseerLochli_OnDied")