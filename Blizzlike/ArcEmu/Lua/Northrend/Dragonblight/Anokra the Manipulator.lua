--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AnokratheManipulator_OnCombat(Unit, Event)
	Unit:RegisterEvent("AnokratheManipulator_MindBlast", 6000, 0)
	Unit:RegisterEvent("AnokratheManipulator_MindFlay", 8000, 0)
	Unit:RegisterEvent("AnokratheManipulator_WaveringWill", 2000, 1)
end

function AnokratheManipulator_MindBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(13860, Unit:GetMainTank()) 
end

function AnokratheManipulator_MindFlay(Unit, Event) 
	Unit:FullCastSpellOnTarget(16568, Unit:GetMainTank()) 
end

function AnokratheManipulator_WaveringWill(Unit, Event) 
	Unit:FullCastSpellOnTarget(51676, Unit:GetMainTank()) 
end

function AnokratheManipulator_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AnokratheManipulator_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26769, 1, "AnokratheManipulator_OnCombat")
RegisterUnitEvent(26769, 2, "AnokratheManipulator_OnLeaveCombat")
RegisterUnitEvent(26769, 4, "AnokratheManipulator_OnDied")