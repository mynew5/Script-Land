--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CorruptedRager_OnCombat(Unit, Event)
	Unit:RegisterEvent("CorruptedRager_CorrodeArmor", 8000, 0)
end

function CorruptedRager_CorrodeArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(51613, Unit:GetMainTank()) 
end

function CorruptedRager_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CorruptedRager_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(21223, 1, "CorruptedRager_OnCombat")
RegisterUnitEvent(21223, 2, "CorruptedRager_OnLeaveCombat")
RegisterUnitEvent(21223, 4, "CorruptedRager_OnDied")