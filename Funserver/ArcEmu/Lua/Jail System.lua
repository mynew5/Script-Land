--[[

		JAIL SYSTEM
		Scripted by : Grandelf.
		
			You need to run this query in your char DB:
			
			DROP TABLE IF EXISTS `jail`;
			CREATE TABLE `jail` (
			  `id` tinyint(3) default NULL,
			  `name` varchar(21) collate latin1_general_ci default NULL,
			  `time` int(30) default NULL,
			  `phase` tinyint(3) default NULL,
			  `active` tinyint(3) default NULL
			) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
			
			Also make sure you have added this line in your optional.conf:
			
			<LuaHypArc AllowCharDBQueries="1">

]]--

JAIL = {}

--[[

	Put the coords of your jail here. The zone id is needed, because the player can just walk arround.
	But as soon as he leaves the Jailzone he will be ported back to the coords you filled in. 
	So make sure when you port to the jail you putted in the right zone id at JailZone.

]]--

local JailZone = 
local map = 
local x = 
local y = 
local z = 

local AddJail = "#jailchar"
local RemoveJail = "#unjailchar"

function JAIL.OnChatJail(event, player, message, type, language)
	local msg = message:lower()
	if (msg:find(AddJail.." ") == 1) then
		JailTbl = GetWords(msg:gsub(AddJail.." ", ""))
		if (JailTbl[2] ~= nil) and (JailTbl[3] == nil) then
			if (player:GetGmRank() == 'a') or (player:GetGmRank() == 'az') then
				local plr = CharDBQuery("SELECT name FROM characters WHERE name = '"..JailTbl[1].."'", 0)
				if (plr ~= false) then
					local plrB = CharDBQuery("SELECT name FROM jail WHERE name = '"..JailTbl[1].."'", 0)
					if (plrB == false) then
						CharDBQuery("INSERT INTO jail(id, name, time, phase, active) VALUES ('"..GetJailId().."', '"..JailTbl[1].."', '"..JailTbl[2].."', '1', '1')", 0)
						player:SendBroadcastMessage("Player "..JailTbl[1].." is jailed for "..JailTbl[2].." minutes.")
						for k, v in pairs(GetPlayersInWorld()) do
							if (v:GetName() == plr) then
								v:SendBroadcastMessage("You are jailed for "..JailTbl[2].." minutes.")
							end
						end		
					else
						player:SendBroadcastMessage("This player is already jailed.")
					end
				else
					player:SendBroadcastMessage("This player does not exist.")
				end
			end
		else
			player:SendBroadcastMessage("Wrong usage of the command. Use: "..AddJail.." charname time.")
		end
		return 0
	end
	if (msg:find(RemoveJail.." ") == 1) then
		if (player:GetGmRank() == 'a') or (player:GetGmRank() == 'az') then
			local plr = msg:gsub(RemoveJail.." ", "")
			if (CharDBQuery("SELECT name FROM characters WHERE name = '"..plr.."'", 0) ~= false) then
				local plrB = CharDBQuery("SELECT name FROM jail WHERE name = '"..plr.."'", 0)
				if (plrB ~= false) then
					CharDBQuery("DELETE FROM jail WHERE name = '"..plr.."'", 0)
					player:SendBroadcastMessage("Player "..plr.." is removed from jail.")	
				else
					player:SendBroadcastMessage("This player is not in jail.")
				end	
			else
				player:SendBroadcastMessage("This player does not exist.")
			end
		end
		return 0	
	end
	if (msg == "#jailstatus") then
		local plr = CharDBQuery("SELECT name FROM jail WHERE name = '"..player:GetName().."'", 0)
		if (plr == false) then
			player:SendBroadcastMessage("Status: free!")
		else
			local Time = CharDBQuery("SELECT time FROM jail WHERE name = '"..player:GetName().."'", 0)
			player:SendBroadcastMessage("Status: Jailed for "..Time.." mintues.")
		end
		return 0
	end	
end

function KeepThemInJail()
	local plrs = GetPlayersInWorld()
	for k, v in pairs(plrs) do
		if (CharDBQuery("SELECT name FROM jail WHERE name = '"..v:GetName().."'", 0) ~= false) and (v:GetZoneId() ~= JailZone) then
			v:Teleport(map, x, y, z)
		end
	end
end

function JAIL.TimeJailed()
	local JailId = 1
	local MaxJailId = GetJailId()
	local Time = 0
	while (JailId < MaxJailId) do
		local Time = tonumber(CharDBQuery("SELECT time FROM jail WHERE id = '"..JailId.."'", 0))
		local NT = Time - 1
		if (NT == 0) then
			local plr = CharDBQuery("SELECT name FROM jail WHERE id = '"..JailId.."'", 0)
			CharDBQuery("DELETE FROM jail WHERE id = '"..JailId.."'", 0)
			JailId = JailId + 1
		else	
			CharDBQuery("UPDATE jail SET time = '"..NT.."' WHERE id = '"..JailId.."'", 0)
			JailId = JailId + 1
		end	
	end
end	
		
function GetJailId()
	local ID = 1
	while (CharDBQuery("SELECT id FROM jail WHERE id = '"..ID.."'", 0) ~= false) do
		ID = ID + 1
		if (CharDBQuery("SELECT id FROM jail WHERE id = '"..ID.."'", 0) == false) then
			ID = ID + 1
			if (CharDBQuery("SELECT id FROM jail WHERE id = '"..ID.."'", 0) == false) then
				ID = ID - 1
				return ID
			end	
		end
	end
	if (ID == 1) then
		return ID
	end	
end	

--[[
	This function is not written by me. (Grandelf)      
	Credits: WoWwiki (http://www.wowwiki.com/GetWords)
]]--	

function GetWords(str)
	local ret = {};
	local pos = 0;
	while (true) do
		local word;
		_,pos,word = string.find(str, "^ *([^%s]+) *", pos + 1);
		if (not word) then
			return ret;
		end
		table.insert(ret, word);
	end
end
			
RegisterServerHook(16, "JAIL.OnChatJail")
RegisterTimedEvent("KeepThemInJail", 1000, 0)
RegisterTimedEvent("JAIL.TimeJailed", 60000, 0)