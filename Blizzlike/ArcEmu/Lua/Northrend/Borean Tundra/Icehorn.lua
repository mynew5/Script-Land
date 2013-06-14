--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Icehorn_OnCombat(Unit, Event)
	Unit:RegisterEvent("Icehorn_Romp", 8000, 0)
end

function Icehorn_Romp(Unit, Event) 
	Unit:CastSpell(57468) 
end

function Icehorn_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Icehorn_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(32361, 1, "Icehorn_OnCombat")
RegisterUnitEvent(32361, 2, "Icehorn_OnLeaveCombat")
RegisterUnitEvent(32361, 4, "Icehorn_OnDied")