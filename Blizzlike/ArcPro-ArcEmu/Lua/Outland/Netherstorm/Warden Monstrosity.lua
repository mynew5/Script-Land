--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Monstrosity_OnCombat(Unit, Event)
	Unit:RegisterEvent("Monstrosity_Arcane", 6000, 0)
	Unit:RegisterEvent("Monstrosity_Storm", 20000, 0)
end

function Monstrosity_Arcane(Unit, Event) 
	Unit:FullCastSpellOnTarget(13901, Unit:GetMainTank()) 
end

function Monstrosity_Storm(Unit, Event)
    Unit:CastSpell(36577)
    Unit:SpawnCreature(21322, Unit:GetX()-1, Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14)
end

function Monstrosity_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Monstrosity_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20516, 1, "Monstrosity_OnCombat")
RegisterUnitEvent(20516, 2, "Monstrosity_OnLeaveCombat")
RegisterUnitEvent(20516, 4, "Monstrosity_OnDied")