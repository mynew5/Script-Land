--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Grimton1337; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2011 - 2013. ]]

local Altairus = nil

Altairus = {}
function Altairus_OnSpawn(pUnit, event)
Altairus = pUnit
end

RegisterUnitEvent(43873, 18, "Altairus_OnSpawn")

function Altairus_OnCombat(pUnit, event)
if (Altairus:GetDungeonDifficulty() == 1) then
Altairus:RegisterEvent(Call_the_Wind, 30000, 0)
Altairus:RegisterEvent(Chilling_Breath, math.random(25000, 37000), 0)
Altairus:RegisterEvent(Lightning_Blast, math.random(38000, 40000), 0)
else
Altairus:RegisterEvent(Call_the_Wind, 30000, 0)
Altairus:RegisterEvent(Chilling_Breath, math.random(25000, 37000), 0)
Altairus:RegisterEvent(Lightning_Blast, math.random(38000, 40000), 0)
Altairus:RegisterEvent(Twisting_Winds, math.random(20000, 27500), 0)
end

RegisterUnitEvent(43873, 1, "Altairus_OnCombat")

function Call_the_Wind(pUnit, event)
Altairus:FullCastSpell(88244)
end

function Chilling_Breath(pUnit, event)
local player = Altairus:GetRandomPlayer(0)
Altairus:FullCastSpellOnTarget(88308, player)
end

function Lightning_Blast(pUnit, event)
local player = Altairus:GetRandomPlayer(0)
Altairus:FullCastSpellOnTarget(88357, player)
end

function Twisting_Winds(pUnit, event)
Altairus:FullCastSpell(88314)
end
end

function Altairus_OnDeath(pUnit, event)
Altairus:RemoveEvents()
end

RegisterUnitEvent(43873, 4, "Altairus_OnDeath")

function Altairus_OnLeaveCombat(pUnit, event)
Altairus:RemoveEvents()
end

RegisterUnitEvent(43873, 3, "Altairus_OnLeaveCombat")

-- I think this is a perfect script. :-)... at least for a dungeon boss. ^^