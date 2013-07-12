--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LadyMoongazer_OnCombat(Unit, Event)
	Unit:RegisterEvent("LadyMoongazer_Net", 10000, 0)
	Unit:RegisterEvent("LadyMoongazer_Shoot", 6000, 0)
end

function LadyMoongazer_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6533, 	pUnit:GetMainTank()) 
end

function LadyMoongazer_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, 	pUnit:GetMainTank()) 
end

function LadyMoongazer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LadyMoongazer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2184, 1, "LadyMoongazer_OnCombat")
RegisterUnitEvent(2184, 2, "LadyMoongazer_OnLeaveCombat")
RegisterUnitEvent(2184, 4, "LadyMoongazer_OnDied")