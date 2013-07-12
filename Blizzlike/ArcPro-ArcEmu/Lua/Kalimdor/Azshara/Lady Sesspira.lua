--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LadySesspira_OnCombat(Unit, Event)
	Unit:RegisterEvent("LadySesspira_ForkedLightning", 8000, 0)
	Unit:RegisterEvent("LadySesspira_Shoot", 6000, 0)
end

function LadySesspira_ForkedLightning(pUnit, Event) 
	pUnit:CastSpell(20299) 
end

function LadySesspira_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, 	pUnit:GetMainTank()) 
end

function LadySesspira_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LadySesspira_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6649, 1, "LadySesspira_OnCombat")
RegisterUnitEvent(6649, 2, "LadySesspira_OnLeaveCombat")
RegisterUnitEvent(6649, 4, "LadySesspira_OnDied")