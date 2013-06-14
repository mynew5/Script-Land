--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Azolex; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
	
function Keleseth_OnEnterCombat(Unit,Event)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Your blood is mine!")
	Unit:RegisterEvent("Keleseth_ShadowBolt", 3000, 0) 
	Unit:RegisterEvent("Keleseth_Summon", 15000, 0)
	Unit:RegisterEvent("Keleseth_FrostTomb",20000, 0)
end

function Keleseth_ShadowBolt(Unit,Event)
	Unit:FullCastSpellOnTarget(43667, Unit:GetRandomPlayer(0))
end

function Keleseth_FrostTomb(Unit,Event)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Not so fast.")
	local plr =	Unit:GetRandomPlayer(0)
	if(type(plr) == "userdata") then
		Unit:FullCastSpellOnTarget(48400, Unit:GetRandomPlayer(0))
	end
end

function Keleseth_Summon(Unit,Event)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Aranal, lidel! Their fate shall be yours!")
	Unit:SpawnCreature(23970, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14, 60000)
	Unit:SpawnCreature(23970, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14, 60000)
	Unit:SpawnCreature(23970, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14, 60000)
	Unit:SpawnCreature(23970, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14, 60000)
	Unit:SpawnCreature(23970, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14, 60000)
end

function Keleseth_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()	
end

function Keleseth_OnDied(Unit, event, player)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "I join... the night.")
	Unit:RemoveEvents()
end

RegisterUnitEvent(23953, 1, "Keleseth_OnEnterCombat")
RegisterUnitEvent(23953, 2, "Keleseth_OnLeaveCombat")
RegisterUnitEvent(23953, 4, "Keleseth_OnDied")