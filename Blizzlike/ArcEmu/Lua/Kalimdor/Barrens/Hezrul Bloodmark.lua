--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HezrulBloodmark_OnCombat(Unit, Event)
	Unit:RegisterEvent("HezrulBloodmark_BloodLeech", 6000, 0)
end

function HezrulBloodmark_BloodLeech(Unit, Event) 
	Unit:FullCastSpellOnTarget(6958, Unit:GetMainTank()) 
end

function HezrulBloodmark_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HezrulBloodmark_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3396, 1, "HezrulBloodmark_OnCombat")
RegisterUnitEvent(3396, 2, "HezrulBloodmark_OnLeaveCombat")
RegisterUnitEvent(3396, 4, "HezrulBloodmark_OnDied")