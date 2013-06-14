--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[Spells ]]
local IMMOLATE = 20294
local VEILOFSHADOW = 17820

function Lord_OnCombat(Unit, Event)
local immolate = 7000+math.random(1, 5000)
local shadow = 15000+math.random(1, 5000)
	Unit:RegisterEvent("Lord_Immolate", immolate, 0)
	Unit:RegisterEvent("Lord_Shadow", shadow, 0)
end

function Lord_Immolate(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(IMMOLATE, RandomPlayer)
end

function Lord_Shadow(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(VEILOFSHADOW, RandomPlayer)
end

function Lord_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Lord_OnDied(Unit, Event)
	Unit:RemoveEvents()
	Unit:SpawnCreature(1853, 180.73, -9.43856, 75.507, 0, 0)
end 

RegisterUnitEvent(10504, 1, "Lord_OnCombat")
RegisterUnitEvent(10504, 2, "Lord_OnLeaveCombat")
RegisterUnitEvent(10504, 4, "Lord_OnDied")