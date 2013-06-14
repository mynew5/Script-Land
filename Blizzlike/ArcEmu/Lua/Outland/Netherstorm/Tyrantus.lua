--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Tyrantus_OnCombat(Unit, Event)
	Unit:RegisterEvent("Tyrantus_Wood", 7000, 0)
	Unit:RegisterEvent("Tyrantus_Fear", 6000, 0)
end

function Tyrantus_Wood(Unit, Event) 
	Unit:FullCastSpellOnTarget(35321, Unit:GetMainTank()) 
end

function Tyrantus_Fear(Unit, Event) 
	Unit:FullCastSpellOnTarget(36629, Unit:GetClosestPlayer()) 
end

function Tyrantus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Tyrantus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20931, 1, "Tyrantus_OnCombat")
RegisterUnitEvent(20931, 2, "Tyrantus_OnLeaveCombat")
RegisterUnitEvent(20931, 4, "Tyrantus_OnDied")