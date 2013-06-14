--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Aberration_OnCombat(Unit, Event)
	Unit:RegisterEvent("Aberration_Shield", 1000, 1)
	Unit:RegisterEvent("Aberration_Storm", 20000, 0)
end

function Aberration_Shield(Unit, Event) 
	Unit:CastSpell(36640) 
end

function Aberration_Storm(Unit, Event)
    Unit:CastSpell(36577)
    Unit:SpawnCreature(21322, Unit:GetX()-1, Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14)
end

function Aberration_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Aberration_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18865, 1, "Aberration_OnCombat")
RegisterUnitEvent(18865, 2, "Aberration_OnLeaveCombat")
RegisterUnitEvent(18865, 4, "Aberration_OnDied")