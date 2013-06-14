--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Windwatcher_OnCombat(Unit, Event)
	Unit:RegisterEvent("Windwatcher_Cyclone", 15000, 0)
	Unit:RegisterEvent("Windwatcher_Totem", 10000, 0)
end

function Windwatcher_Totem(pUnit, Event)
    pUnit:CastSpell(25000)
    pUnit:SpawnCreature(15363, pUnit:GetX()-1, pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 14, pUnit:GetO())
end

function Windwatcher_Cyclone(pUnit, Event) 
	pUnit:CastSpell(8606) 
end

function Windwatcher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Windwatcher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6176, 1, "Windwatcher_OnCombat")
RegisterUnitEvent(6176, 2, "Windwatcher_OnLeaveCombat")
RegisterUnitEvent(6176, 4, "Windwatcher_OnDied")