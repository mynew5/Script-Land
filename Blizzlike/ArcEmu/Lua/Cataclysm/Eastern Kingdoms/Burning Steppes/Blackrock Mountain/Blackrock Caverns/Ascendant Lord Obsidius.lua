--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Grimton1337; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2011 - 2013. ]]

local Obsidius = nil

Obsidius = {}
function Obsidius_OnSpawn(pUnit, event)
Obsidius = pUnit
end

RegisterUnitEvent(39705, 18, "Obsidius_OnSpawn")

function Obsidius_OnCombat(pUnit, event)
Obsidius:SendChatMessage(14, 0, "You come seeking answers? Then have them! Look upon your answer to living!")
Obsidius:PlaySoundToSet(18899)
Obsidius:RegisterEvent(Stone_Blow, math.random(20000, 30000), 0)
Obsidius:RegisterEvent(Transformation, math.random(30000, 40000), 0)
Obsidius:RegisterEvent(Twilight_Corruption, math.random(27000, 45000), 0)
end

RegisterUnitEvent(39705, 1, "Obsidius_OnCombat")

function Stone_Blow(pUnit, event)
local tank = Obsidius:GetMainTank()
Obsidius:FullCastSpellOnTarget(76185, tank)
end

function Transformation(pUnit, event)
Obsidius:SendChatMessage(42, 0, "Ascendant Lord Obsidius prepares to trade places with one of his shadows!")
Obsidius:SendChatMessage(14, 0, "Earth can be shaped, molded... You cannot! You are useless!")
Obsidius:PlaySoundToSet(18905)
Obsidius:FullCastSpell(76274)
Obsidius:FullCastSpell(76200)
Obsidius:FullCastSpell(76242)
end

function Twilight_Corruption(pUnit, event)
local player = Obsidius:GetRandomPlayer(0)
Obsidius:FullCastSpellOnTarget(76188, player)
end

function Obsidius_OnKilledPlayer(pUnit, event)
Obsidius:SendChatMessage(14, 0, "Your kind has no place in the master's world!")
Obsidius:PlaySoundToSet(18901)
end

RegisterUnitEvent(39705, 3, "Obsidius_OnKilledPlayer")

function Obsidius_OnDeath(pUnit, event)
Obsidius:SendChatMessage(14, 0, "I cannot be destroyed... Only de... layed...")
Obsidius:PlaySoundToSet(18902)
end

RegisterUnitEvent(39705, 4, "Obsidius_OnDeath")