--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Churn_OnCombat(Unit, Event)
	Unit:RegisterEvent("Churn_ScaldingSteam", 8000, 0)
end

function Churn_ScaldingSteam(Unit, Event) 
	Unit:FullCastSpellOnTarget(50206, 	Unit:GetMainTank()) 
end

function Churn_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Churn_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25418, 1, "Churn_OnCombat")
RegisterUnitEvent(25418, 2, "Churn_OnLeaveCombat")
RegisterUnitEvent(25418, 4, "Churn_OnDied")