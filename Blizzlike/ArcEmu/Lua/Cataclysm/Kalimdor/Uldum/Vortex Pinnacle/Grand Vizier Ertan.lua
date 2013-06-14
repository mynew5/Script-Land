--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Grimton1337; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2011 - 2013. ]]

--Hey, Jesper..Due to this... ENGINE, I can't really do this Blizzlike, cause I can't get the Players to do player:IsTargeting() or some shit. :/ Sorry.

local Vizier = nil
local Tempest = nil

Vizier = {}
function Vizier_OnSpawn(pUnit, event)
Vizier = pUnit
end

RegisterUnitEvent(43878, 18, "Vizier_OnSpawn")

Tempest = {}
function Tempest_OnSpawn(pUnit, event)
Tempest = pUnit
Tempest:RegisterEvent(Lightning_Bolt1, 5000, 0)
Tempest:RegisterEvent(Lurk, 22000, 0)
Tempest:RegisterEvent(LeaveBattleField, math.random(10000, 20000), 0)
end

RegisterUnitEvent(45704, 18, "Tempest_OnSpawn")

function Vizier_OnCombat(pUnit, event)
Vizier:SendChatMessage(14, 0, "Filthy beasts! Your presence in Skywall will not be tolerated!")
Vizier:PlaySoundToSet(20876)
Vizier:FullCastSpell(86292)
Vizier:RegisterEvent(Lightning_Bolt, math.random(12000, 22000), 0)
Vizier:RegisterEvent(Summon_Tempest, math.random(30000, 35000), 0)
end

RegisterUnitEvent(43878, 1, "Vizier_OnCombat")

function Lightning_Bolt(pUnit, event)
local player = Vizier:GetRandomPlayer(0)
Vizier:FullCastSpellOnTarget(403, player)
end

function Summon_Tempest(pUnit, event)
Vizier:SendChatMessage(14, 0, "Ravaged!")
Vizier:PlaySoundToSet(20877)
Vizier:FullCastSpell(86340)
end

function Vizier_OnLeaveCombat(pUnit, event)
Vizier:RemoveEvents()
end

RegisterUnitEvent(43878, 3, "Vizier_OnLeaveCombat")

function Vizier_OnDeath(pUnit, event)
Vizier:RemoveEvents()
end

RegisterUnitEvent(43878, 4, "Vizier_OnDeath")

function Lightning_Bolt1(pUnit, event)
local player = Tempest:GetRandomPlayer(0)
Tempest:FullCastSpellOnTarget(89105, player)
end

function Lurk(pUnit, event)
Vizier:FullCastSpell(85467)
end

function LeaveBattleField(pUnit, event)
Tempest:SendChatMessage(16, 0, "Lurking Tempest realizes it's been spotted and quickly plays dead!")
Tempest:Kill(Tempest)
Tempest:RemoveEvents()
end