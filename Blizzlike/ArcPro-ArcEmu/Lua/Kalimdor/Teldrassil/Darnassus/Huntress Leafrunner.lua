--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HuntressLeafrunner_OnCombat(Unit, Event)
	Unit:RegisterEvent("HuntressLeafrunner_HookedNet", 13000, 0)
	Unit:RegisterEvent("HuntressLeafrunner_SunderArmor", 8000, 0)
end

function HuntressLeafrunner_HookedNet(Unit, Event) 
	Unit:FullCastSpellOnTarget(14030, Unit:GetMainTank()) 
end

function HuntressLeafrunner_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(15572, Unit:GetMainTank()) 
end

function HuntressLeafrunner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HuntressLeafrunner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14380, 1, "HuntressLeafrunner_OnCombat")
RegisterUnitEvent(14380, 2, "HuntressLeafrunner_OnLeaveCombat")
RegisterUnitEvent(14380, 4, "HuntressLeafrunner_OnDied")