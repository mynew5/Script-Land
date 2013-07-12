--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Grimton1337; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2011 - 2013. ]]

local Asaad = nil
local star = nil

Asaad = {}
function Asaad_OnSpawn(pUnit, event)
Asaad = pUnit
end

RegisterUnitEvent(43875, 18, "Asaad_OnSpawn")

star = {}
function star_OnSpawn(pUnit, event)
star = pUnit
star:RegisterEvent(Arcane_Barrage, math.random(5000, 10000), 0)
end

RegisterUnitEvent(52019, 18, "star_OnSpawn")

function Asaad_OnCombat(pUnit, event)
if (Asaad:GetDungeonDifficulty() == 1)
Asaad:SendChatMessage(14, 0, "YOU tread upon the sacrosanct! Mortals have no please amidst the clouds.")
Asaad:RegisterEvent(Unstable_Grounding_Field, math.random(15000, 30000), 0)
Asaad:RegisterEvent(Supremacy_of_the_Storm, 30000, 0)
Asaad:RegisterEvent(Chain_Lightning, math.random(20000, 30000), 0)
Asaad:RegisterEvent(Skyfall_Star, 25000, 0)
else
Asaad:SendChatMessage(14, 0, "YOU tread upon the sacrosanct! Mortals have no please amidst the clouds.")
Asaad:RegisterEvent(Unstable_Grounding_Field, math.random(15000, 20000), 0)
Asaad:RegisterEvent(Supremacy_of_the_Storm, 30000, 0)
Asaad:RegisterEvent(Chain_Lightning, math.random(20000, 30000), 0)
Asaad:RegisterEvent(Skyfall_Star, 25000, 0)
Asaad:RegisterEvent(Static_Cling, math.random(45000, 50000), 0)
end

RegisterUnitEvent(43875, 1, "Asaad_OnCombat")

function Unstable_Grounding_Field(pUnit, event)
Asaad:SendChatMessage(14, 0, "Al'Akir, your servant calls for aid!")
Asaad:FullCastSpell(86911)
end

function Supremacy_of_the_Storm(pUnit, event)
Asaad:FullCastSpell(86715)
end

function Chain_Lightning(pUnit, event)
local player = Asaad:GetRandomPlayer(0)
Asaad:FullCastSpellOnTarget(421, player)
end

function Skyfall_Star(pUnit, event)
Asaad:FullCastSpell(45932)
end

function Static_Cling(pUnit, event)
Asaad:FullCastSpell(87618)
end

function Arcane_Barrage(pUnit, event)
local player = star:GetRandomPlayer(0)
star:FullCastSpellOnTarget(87854, player)
end

function star_OnLeaveCombat(pUnit, event)
star:RemoveEvents()
end

RegisterUnitEvent(52019, 3, "star_OnLeaveCombat")

function star_OnDeath(pUnit, event)
star:RemoveEvents()
end

RegisterUnitEvent(52019, 4, "star_OnDeath")

function Asaad_OnLeaveCombat(pUnit, event)
Asaad:RemoveEvents()
end

RegisterUnitEvent(43875, 3, "Asaad_OnLeaveCombat")

function Asaad_OnDeath(pUnit, event)
Asaad:SendChatMessage(14, 0, "The winds take me!")
Asaad:RemoveEvents()
end

RegisterUnitEvent(43875, 4, "Asaad_OnDeath")