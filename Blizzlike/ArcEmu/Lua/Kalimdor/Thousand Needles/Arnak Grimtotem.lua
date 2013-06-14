--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ArnakGrimtotem_OnCombat(Unit, Event)
	Unit:RegisterEvent("ArnakGrimtotem_Rend", 10000, 0)
	Unit:RegisterEvent("ArnakGrimtotem_Uppercut", 6000, 0)
end

function ArnakGrimtotem_Rend(Unit, Event) 
	Unit:FullCastSpellOnTarget(11977, Unit:GetMainTank()) 
end

function ArnakGrimtotem_Uppercut(Unit, Event) 
	Unit:FullCastSpellOnTarget(10966, Unit:GetMainTank()) 
end

function ArnakGrimtotem_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ArnakGrimtotem_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10896, 1, "ArnakGrimtotem_OnCombat")
RegisterUnitEvent(10896, 2, "ArnakGrimtotem_OnLeaveCombat")
RegisterUnitEvent(10896, 4, "ArnakGrimtotem_OnDied")