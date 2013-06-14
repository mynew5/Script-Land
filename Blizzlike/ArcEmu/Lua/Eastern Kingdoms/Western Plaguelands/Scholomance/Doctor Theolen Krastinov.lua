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
local REND = 18106
local CLEAVE = 15584
local FRENZY = 28371

function Doctor_OnCombat(Unit, Event)
local rend = 8000+math.random(1, 2000)
local cleave = 9000+math.random(1, 1000)
local frenzy = math.random(1, 8000)
	pUnit:SendChatMessage(12, 0, "The doctor is in!")
	Unit:RegisterEvent("Doctor_Rend", rend, 0)
	Unit:RegisterEvent("Doctor_Cleave", cleave, 0)
	Unit:RegisterEvent("Doctor_Frenzy", frenzy, 0)
end

function Doctor_Rend(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(REND, RandomPlayer)
end

function Doctor_Cleave(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(CLEAVE, RandomPlayer)
end

function Doctor_Frenzy(Unit, Event)
	Unit:CastSpell(FRENZY)
	--Textemote: verwandelt sich in einen t\195\182dlichen Frenzy!Need translate
end

function Doctor_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Doctor_OnDied(Unit, Event)
	Unit:RemoveEvents()
	Unit:SpawnCreature(1853, 180.73, -9.43856, 75.507, 0, 0)
end

RegisterUnitEvent(11261, 1, "Doctor_OnCombat")
RegisterUnitEvent(11261, 2, "Doctor_OnLeaveCombat")
RegisterUnitEvent(11261, 4, "Doctor_OnDied")