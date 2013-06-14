--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function King_OnEnterCombat(Unit, Event)
    if(Unit:GetHealthPct() == 99) then
		Unit:RegisterEvent("King_Phase1", 1000, 0)
	end
end

function King_Phase1(Unit, Event)
    Unit:RegisterEvent("King_Damagebuff", 1000, (1))
    Unit:RegisterEvent("King_Gravity", 2500, 0)
    Unit:RegisterEvent("King_Statis", 12000, 0)
    Unit:RegisterEvent("King_Phase2", 1000, 0)
end

function King_Dambagebuff(Unit, Event)
    Unit:CastSpell(37075)
end   
   
function King_Gravity(Unit, Event)
    Unit:CastSpell(36533)
end

function King_Statis(Unit, Event)
    Unit:FullCastSpellOnTarget(36527, Unit:RandomPlayer(0))
    Unit:FullCastSpellOnTarget(36527, Unit:RandomPlayer(0))
end

function King_Phase2(Unit, Event)
    if(Unit:GetHealthPct() == 50) then
		Unit:RegisterEvent("King_Damagebuff", 1000, (1))
		Unit:RegisterEvent("King_Gravity", 2500, 0)
		Unit:RegisterEvent("King_Statis", 6000, 0)
		Unit:RegisterEvent("King_Mirror1", 1000, (1))
		Unit:RegisterEvent("King_Mirror2", 1000, (1))
	end
end
    
function King_Mirror1(Unit, Event)
    Unit:CastSpell(36847)
    Unit:SpawnCreature(21425, Unit:GetX()-1, Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14)
end

function King_Mirror2(Unit, Event)
    Unit:CastSpell(36848)
    Unit:SpawnCreature(21425, Unit:GetX()-1, Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14)
end
    
function King_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function King_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20454, 1, "King_OnEnterCombat")
RegisterUnitEvent(20454, 2, "King_OnLeaveCombat")
RegisterUnitEvent(20454, 4, "King_OnDied")