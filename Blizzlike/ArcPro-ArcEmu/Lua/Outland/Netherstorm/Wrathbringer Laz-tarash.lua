--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Laztarash_OnCombat(Unit, Event)
	Unit:RegisterEvent("Laztarash_Hamstring", 8000, 0)
end

function Laztarash_Hamstring(Unit, Event) 
	Unit:FullCastSpellOnTarget(31553, Unit:GetMainTank()) 
end

function Laztarash_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Laztarash_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20789, 1, "Laztarash_OnCombat")
RegisterUnitEvent(20789, 2, "Laztarash_OnLeaveCombat")
RegisterUnitEvent(20789, 4, "Laztarash_OnDied")