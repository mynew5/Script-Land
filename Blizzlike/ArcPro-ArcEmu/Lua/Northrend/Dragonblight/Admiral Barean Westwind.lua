--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AdmiralBareanWestwind_OnCombat(Unit, Event)
	Unit:RegisterEvent("AdmiralBareanWestwind_ProtectionSphere", 15000, 0)
end

function AdmiralBareanWestwind_ProtectionSphere(Unit, Event) 
	Unit:CastSpell(50161) 
end

function AdmiralBareanWestwind_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AdmiralBareanWestwind_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27951, 1, "AdmiralBareanWestwind_OnCombat")
RegisterUnitEvent(27951, 2, "AdmiralBareanWestwind_OnLeaveCombat")
RegisterUnitEvent(27951, 4, "AdmiralBareanWestwind_OnDied")