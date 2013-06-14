--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SeethingHate_OnCombat(Unit, Event)
	Unit:RegisterEvent("SeethingHate_SeethingEvil", 3000, 1)
end

function SeethingHate_SeethingEvil(Unit, Event) 
	Unit:CastSpell(52342) 
end

function SeethingHate_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SeethingHate_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(32429, 1, "SeethingHate_OnCombat")
RegisterUnitEvent(32429, 2, "SeethingHate_OnLeaveCombat")
RegisterUnitEvent(32429, 4, "SeethingHate_OnDied")