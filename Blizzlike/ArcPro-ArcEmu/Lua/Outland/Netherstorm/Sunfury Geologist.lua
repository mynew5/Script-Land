--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Geologist_OnCombat(Unit, Event)
	Unit:RegisterEvent("Geologist_Armor", 10000, 0)
	Unit:RegisterEvent("Geologist_Rock", 6000, 0)
end

function Geologist_Armor(Unit, Event) 
	Unit:FullCastSpellOnTarget(35918, Unit:GetMainTank()) 
end

function Geologist_Rock(Unit, Event) 
	Unit:FullCastSpellOnTarget(36645, Unit:GetMainTank()) 
end

function Geologist_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Geologist_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(19779, 1, "Geologist_OnCombat")
RegisterUnitEvent(19779, 2, "Geologist_OnLeaveCombat")
RegisterUnitEvent(19779, 4, "Geologist_OnDied")