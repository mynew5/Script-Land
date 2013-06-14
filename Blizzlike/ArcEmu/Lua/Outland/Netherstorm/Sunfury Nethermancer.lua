--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Nethermancer_OnCombat(Unit, Event)
	Unit:RegisterEvent("Nethermancer_Surge", 10000, 0)
	Unit:RegisterEvent("Nethermancer_Bolt", 5000, 0)
	Unit:RegisterEvent("Nethermance_Summon", 20000, 0)
end

function Nethermancer_Surge(Unit, Event) 
	Unit:CastSpell(35778) 
end

function Nethermance_Summon(Unit, Event)
    Unit:CastSpell(36477)
    Unit:SpawnCreature(21267, Unit:GetX()-1, Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14)
end

function Nethermancer_Bolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank()) 
end

function Nethermancer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Nethermancer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20248, 1, "Nethermancer_OnCombat")
RegisterUnitEvent(20248, 2, "Nethermancer_OnLeaveCombat")
RegisterUnitEvent(20248, 4, "Nethermancer_OnDied")
