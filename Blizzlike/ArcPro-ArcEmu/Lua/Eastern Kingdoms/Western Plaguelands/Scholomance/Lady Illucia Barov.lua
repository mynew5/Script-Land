--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: DARKI
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--[[ Spells ]]
local CURSEOFAGONY = 18671
local SHADOWSHOCK = 20603
local SILENCE = 15487
local FEAR = 6215

function Barov_OnCombat(Unit, Event)
local cursetimer = 18000+math.random(1, 12000)
local shocktimer = 9000+math.random(1, 3000)
local silencetimer = 5000+math.random(1, 9000)
	Unit:RegisterEvent("Barov_Curse", cursetimer, 0)
	Unit:RegisterEvent("Barov_Shock", shocktimer, 0)
	Unit:RegisterEvent("Barov_Silence", silencetimer, 0)
	Unit:RegisterEvent("Barov_Fear", 30000, 0)
end 

function Barov_Curse(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(CURSEOFAGONY, RandomPlayer)
end

function Barov_Shock(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(SHADOWSHOCK, RandomPlayer)
end

function Barov_Silence(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer(7)
	Unit:FullCastSpellOnTarget(SILENCE, RandomPlayer)
end

function Barov_Fear(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(FEAR, RandomPlayer)
end

function Barov_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Barov_OnDied(Unit, Event)
	Unit:RemoveEvents()
	Unit:SpawnCreature(1853, 180.73, -9.43856, 75.507, 0, 0)
end 

RegisterUnitEvent(10502, 1, "Barov_OnCombat")
RegisterUnitEvent(10502, 2, "Barov_OnLeaveCombat")
RegisterUnitEvent(10502, 4, "Barov_OnDied")