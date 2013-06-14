--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Shredder_OnCombat(Unit, Event)
	Unit:RegisterEvent("Shredder_Blast", 6000, 0)
	Unit:RegisterEvent("Shredder_Shield", 1000, 1)
end

function Shredder_Blast(Unit, Event) 
	Unit:FullCastSpellOnTarget(36594, Unit:GetMainTank()) 
end

function Shredder_Shield(Unit, Event) 
	Unit:CastSpell(19514) 
end

function Shredder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Shredder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20673, 1, "Shredder_OnCombat")
RegisterUnitEvent(20673, 2, "Shredder_OnLeaveCombat")
RegisterUnitEvent(20673, 4, "Shredder_OnDied")