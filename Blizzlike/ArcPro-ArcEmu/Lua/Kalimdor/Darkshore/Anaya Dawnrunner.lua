--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AnayaDawnrunner_OnCombat(Unit, Event)
	Unit:RegisterEvent("AnayaDawnrunner_BansheeCurse", 8000, 0)
end

function AnayaDawnrunner_BansheeCurse(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(5884, 	pUnit:GetMainTank()) 
end

function AnayaDawnrunner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AnayaDawnrunner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3667, 1, "AnayaDawnrunner_OnCombat")
RegisterUnitEvent(3667, 2, "AnayaDawnrunner_OnLeaveCombat")
RegisterUnitEvent(3667, 4, "AnayaDawnrunner_OnDied")