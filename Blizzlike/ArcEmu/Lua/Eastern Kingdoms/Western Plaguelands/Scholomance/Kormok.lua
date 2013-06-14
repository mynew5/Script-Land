--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local SHADOWBOLTVOLLEY = 20741
local BONESHIELD = 27688

function Kormok_OnCombat(Unit, Event)
local shadow = 10000+math.random(1, 5000)
local bone = 2000+math.random(1, 43000)
	Unit:RegisterEvent("Kormok_Shadow", shadow, 0)
	Unit:RegisterEvent("Kormok_Bone", bone, 0)
end

function Kormok_Shadow(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(SHADOWBOLTVOLLEY, RandomPlayer)
end

function Kormok_Bone(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(BONESHIELD, RandomPlayer)
end

function Kormok_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Kormok_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(16118, 1, "Kormok_OnCombat")
RegisterUnitEvent(16118, 2, "Kormok_OnLeaveCombat")
RegisterUnitEvent(16118, 4, "Kormok_OnDied")