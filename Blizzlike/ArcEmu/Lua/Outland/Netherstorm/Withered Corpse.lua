--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Corpse_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Corpse_Rend", 15000, 0)
    Unit:RegisterEvent("Corpse_Parasite_Spell", 6000, 0)
    Unit:RegisterEvent("Corpse_Parasite_Spawn", 36000, 0)
end

function Corpse_Rend(Unit, Event)
    Unit:FullCastSpellOnTarget(13443, Unit:GetMainTank())
end

function Corpse_Parasite_Spell(Unit, Event)
    Unit:FullCastSpellOnTarget(36469, Unit:GetRandomPlayer(0))
end

function Corpse_Parasite_Spawn(Unit, Event)
    Unit:CastSpell(36468)
    Unit:SpawnCreature(21265, Unit:GetX()-1, Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14)
end

function Corpse_OnLeaveCombat(Unit, Event)
    Unit:RemoveEvents()
end

function Corpse_OnDied(Unit, Event)
    Unit:RemoveEvents()
end

RegisterUnitEvent(20561,1,"Corpse_OnEnterCombat")
RegisterUnitEvent(20561,2,"Corpse_OnLeaveCombat")
RegisterUnitEvent(20561,4,"Corpse_OnDied")