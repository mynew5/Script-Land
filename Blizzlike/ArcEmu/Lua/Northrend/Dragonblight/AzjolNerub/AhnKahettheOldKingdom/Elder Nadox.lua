--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local CHAT_MSG_MONSTER_YELL = 14
local LANG_UNIVERSAL = 0

function ElderNadox_OnEnterCombat(pUnit, Event)
	math.randomseed(os.time())
	pUnit:SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "The secrets of the deep shall remain hidden.")
	pUnit:RegisterEvent("ElderNadox_Summon", 20000, 1)
	pUnit:RegisterEvent("ElderNadox_BroodPlague", 8000, 1)
end

function ElderNadox_Summon(pUnit, Event)
	pUnit:SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "The young must not grow hungry.")
	local x,y,z,o = pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO()
	pUnit:SpawnCreature(30176, x,y,z,o, 14, 60000)
end

function ElderNadox_BroodPlague(pUnit, Event)
	if(Unit:IsInCombat() == true) then
		local plr = Unit:GetClosestPlayer()
		if((type(plr) == "userdata") and (plr:IsAlive() == true)) then
			pUnit:FullCastSpellOnTarget(56130,plr)
			pUnit:RegisterEvent("ElderNadox_BroodPlague", 8000, 1)
		elseif(type(plr) ~= "userdata") then
			ElderNadox_BroodPlague(pUnit,Event)
		end
	end
end

function ElderNadox_OnKilledTarget(pUnit, Event)
local chance = math.random(1,3)
	if(chance == 1) then
		pUnit:SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "Sleep now, in the cold dark.")
	elseif(chance == 2) then	
		pUnit:SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "For the Lich King!")
	elseif(chance == 3) then
		pUnit:SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "Perhaps we will be allies soon. ")	
	end
end

function ElderNadox_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()	
end

function ElderNadox_OnDied(pUnit, Event, player)
	pUnit:SendChatMessage(CHAT_MSG_MONSTER_YELL, LANG_UNIVERSAL, "Master, is my service complete?")	
	pUnit:RemoveEvents()
end

RegisterUnitEvent(29309, 1, "ElderNadox_OnEnterCombat")
RegisterUnitEvent(29309, 2, "ElderNadox_OnLeaveCombat")
RegisterUnitEvent(29309, 4, "ElderNadox_OnDied")
RegisterUnitEvent(29309, 3, "ElderNadox_OnKilledTarget")