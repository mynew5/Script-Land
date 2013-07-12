--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Gibblesnik_OnCombat(Unit, Event)
	Unit:RegisterEvent("Gibblesnik_SunderArmor", 6000, 0)
end

function Gibblesnik_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(11971, Unit:GetMainTank()) 
end

function Gibblesnik_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Gibblesnik_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4093, 1, "Gibblesnik_OnCombat")
RegisterUnitEvent(4093, 2, "Gibblesnik_OnLeaveCombat")
RegisterUnitEvent(4093, 4, "Gibblesnik_OnDied")