--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Sundered_Rumbler_OnCombat(Unit, Event)
	Unit:RegisterEvent("Sundered_Rumbler_Summon_Sundered_Shard", 8000, 0)
end

function Sundered_Rumbler_Summon_Sundered_Shard(Unit, Event)
	Unit:CastSpell(35310)
	Unit:SpawnCreature(20498, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 35, 0)
end

function Sundered_Rumbler_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Sundered_Rumbler_OnDeath(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18881, 1, "Sundered_Rumbler_OnCombat")
RegisterUnitEvent(18881, 2, "Sundered_Rumbler_OnLeaveCombat")
RegisterUnitEvent(18881, 4, "Sundered_Rumbler_OnDeath")