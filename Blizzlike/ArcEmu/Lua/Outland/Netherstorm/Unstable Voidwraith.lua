--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Voidwraith_OnCombat(Unit, Event)
	Unit:RegisterEvent("Voidwraith_Spawn", 6000, 0)
	Unit:RegisterEvent("Voidwraith_Summon", 15000,0)
end

function Voidwraith_Spawn(Unit, Event) 
	Unit:CastSpell(34302) 
end

function Voidwraith_Summon(Unit, Event)
    Unit:CastSpell(36463)
    Unit:SpawnCreature(17471, Unit:GetX()-1, Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14)
end

function Voidwraith_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Voidwraith_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18869, 1, "Voidwraith_OnCombat")
RegisterUnitEvent(18869, 2, "Voidwraith_OnLeaveCombat")
RegisterUnitEvent(18869, 4, "Voidwraith_OnDied")