--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DiseasedDrakkari_OnCombat(Unit, Event)
	Unit:RegisterEvent("DiseasedDrakkari_FeveredDisease", 10000, 0)
end

function DiseasedDrakkari_FeveredDisease(Unit, Event) 
	Unit:FullCastSpellOnTarget(34363, Unit:GetMainTank()) 
end

function DiseasedDrakkari_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DiseasedDrakkari_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26457, 1, "DiseasedDrakkari_OnCombat")
RegisterUnitEvent(26457, 2, "DiseasedDrakkari_OnLeaveCombat")
RegisterUnitEvent(26457, 4, "DiseasedDrakkari_OnDied")