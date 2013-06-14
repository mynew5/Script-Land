--[[ StormwindGuard -- Deathknight.lua

This script was written and is protected
by the GPL v2. This script was released
by BrantX of the Blua Scripting
Project. Please give proper accredidations
when re-releasing or sharing this script
with others in the emulation community.

~~End of License Agreement
-- BrantX, February 23, 2009. ]]

-- Was playing retail the other day and was in stormind... I thought it was quite funny.
-- Maybe this occures when any Deathknight gets near a city guard?...or npc...in a city.
-- I will test once i get 55 one Retail and create a DK and test.
function StormwindGuard_OnSpawn(Unit,Event)
	Unit:RegisterEvent("StormwindGuard_Deathknight", 5000, 0)
end

function StormwindGuard_DeathKnight(Unit,Event)
local plr = Unit:GetClosestPlayer()
	if(plr == Unit:GetClass() == 6) then
		Unit:MoveTo(plr:GetX()+2,plr:GetY()+4,plr:GetZ())
		Unit:RegisterEvent("StormwindGuard_TalkToDK", 3500, 5)
		Unit:RegisterEvent("StormwindGuard_ThrowApple", 5500, 5)
	else
		return
	end
end

function StormwindGuard_ThrowApple(Unit,Event)
local plr = Unit:GetClosestPlayer()
local pname = plr:GetName()
local name = Unit:GetName()
local X,Y,Z = Unit:GetX(),Unit:GetY(),Unit:GetZ()
	if(plr == nil) then
		return
	else
		if(plr == (Unit:GetClass() == 6)) then
			Unit:FullCastSpellOnTarget(58511, plr)
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_EMOTE, LangField.LANG_UNIVERSAL, ""..name.." Throws an apple at "..pname..".")
		else
			return
		end
	end
end

function StormwindGuard_TalkToDK(Unit,Event)
local Choice = math.random(1,3)
	if(Choice == 1) then
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_SAY, LangField.LANG_UNIVERSAL, "Monster!")
	elseif(Choice == 2) then
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_SAY, LangField.LANG_UNIVERSAL, "Murderer!")
	elseif(Choice == 3) then
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_SAY, LangField.LANG_UNIVERSAL, "Get the Rope!")
	end
end

RegisterUnitEvent(1976, 18, "StormwindGuard_OnSpawn")