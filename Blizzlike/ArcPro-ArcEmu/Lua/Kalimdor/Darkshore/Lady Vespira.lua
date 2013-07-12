--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LadyVespira_OnCombat(Unit, Event)
	Unit:RegisterEvent("LadyVespira_ForkedLightning", 10000, 0)
	Unit:RegisterEvent("LadyVespira_Knockdown", 9000, 0)
	Unit:RegisterEvent("LadyVespira_Shoot", 6000, 0)
end

function LadyVespira_ForkedLightning(pUnit, Event) 
	pUnit:CastSpell(12549) 
end

function LadyVespira_Knockdown(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11428, 	pUnit:GetMainTank()) 
end

function LadyVespira_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, 	pUnit:GetMainTank()) 
end

function LadyVespira_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LadyVespira_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7016, 1, "LadyVespira_OnCombat")
RegisterUnitEvent(7016, 2, "LadyVespira_OnLeaveCombat")
RegisterUnitEvent(7016, 4, "LadyVespira_OnDied")