--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Sire_OnCombat(Unit, Event)
	Unit:RegisterEvent("Sire_Stomp", 6000, 0)
end

function Sire_Stomp(Unit, Event) 
	Unit:FullCastSpellOnTarget(32023, Unit:GetMainTank()) 
end

function Sire_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Sire_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20777, 1, "Sire_OnCombat")
RegisterUnitEvent(20777, 2, "Sire_OnLeaveCombat")
RegisterUnitEvent(20777, 4, "Sire_OnDied")