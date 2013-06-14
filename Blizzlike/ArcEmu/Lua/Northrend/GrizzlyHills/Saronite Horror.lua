--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SaroniteHorror_OnCombat(Unit, Event)
	Unit:RegisterEvent("SaroniteHorror_SeethingEvil", 3000, 1)
end

function SaroniteHorror_SeethingEvil(Unit, Event) 
	Unit:CastSpell(52342) 
end

function SaroniteHorror_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SaroniteHorror_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26646, 1, "SaroniteHorror_OnCombat")
RegisterUnitEvent(26646, 2, "SaroniteHorror_OnLeaveCombat")
RegisterUnitEvent(26646, 4, "SaroniteHorror_OnDied")