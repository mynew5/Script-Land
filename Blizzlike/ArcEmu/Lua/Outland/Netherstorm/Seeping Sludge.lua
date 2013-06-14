--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Sludge_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Sludge_Split", 2500, 0)
end

function Sludge_Split(Unit, Event)
    Unit:CastSpell(36465)
    Unit:SpawnCreature(21264, Unit:GetX()-1, Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14)
end   
    
function Sludge_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Sludge_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20501, 1, "Sludge_OnEnterCombat")
RegisterUnitEvent(20501, 2, "Sludge_OnLeaveCombat")
RegisterUnitEvent(20501, 4, "Sludge_OnDied")