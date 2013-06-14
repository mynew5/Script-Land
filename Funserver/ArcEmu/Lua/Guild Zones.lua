--[[

	Guild zone system.
	Scripted by Grandelf.
	Updated to work with 322+ by Icefreze.
	
		This system is using area id's not zone ids. Reason behind this is because zones are way to big.
		You have to run this query into your char DB:
		
			DROP TABLE IF EXISTS `guild`;
			CREATE TABLE `guild` (
			  `GuildId` int(19) default NULL,
			  `Zone1` int(19) default NULL,
			  `Zone2` int(19) default NULL,
			  `Zone3` int(19) default NULL,
			  `Zone4` int(19) default NULL,
			  `Zone5` int(19) default NULL,
			  `Map` int(8) default NULL,
			  `PosX` float default NULL,
			  `PosY` float default NULL,
			  `PosZ` float default NULL
			) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
		
		Also make sure you have added this line in your optional.conf:
			
			<LuaHypArc AllowCharDBQueries="1">

]]--

GUILD = {}

local BuyZone = "#buy zone"
local SellZone = "#sell zone"
local AddTele = "#add tele"
local TeleMsg = "#area tele"
local ZoneInfo = "#zone info"
local OwnedZones = "#owned zones"
local Buff = "#buff"
local Commands = "#guild commands"

local BUYPRICE = 50000 			-- Money needed to buy a zone, in copper.
local SELLPRICE = 50000			-- Money player gets when he sells a zone.

-- Add AREA ID's here players can't buy. So not the zone id, but the area id. You dont have to added instances, they are all blocked.
local NotBuyableAreas = {
	1741, -- Gurubashi Tribune
	2177, -- Gurubashi Ring
}
	

function GUILD.ZoneCommands(event, player, message, type, language)
	local msg = message:lower(player)
	if (msg == BuyZone) and (player:IsInGuild() == true) and (player:GetGuildLeader() == player:GetName()) then
		if (GuildAreaCheck(player) == true) then
			if (AreaCheck(player) == true) then
				if (RestrictedArea(player) == true) and (player:GetInstanceID() == nil) then
					if (player:GetCoinage() >= BUYPRICE) then
						AddArea(player)
						player:DealGoldCost(BUYPRICE)
						player:SendBroadcastMessage("You succesfully bought this zone!")
					else
						player:SendBroadcastMessage("You dont have enough gold to buy this zone.")
					end
				else
					player:SendBroadcastMessage("This zone is not for sale.")
				end	
			else
				player:SendBroadcastMessage("This zone is already bought by a guild.")
			end
		else
			player:SendBroadcastMessage("Your guild already owns the maximum of allowed zones.")
		end
		return 0	
	end	
	if (msg:find(SellZone.." ") == 1) and (player:IsInGuild() == true) and (player:GetGuildLeader() == player:GetName()) then
		local AreaId = msg:gsub(SellZone.." ", "")
		if (OwnsArea(player, AreaId) == 1) then
			CharDBQuery("UPDATE guild SET Zone1 = '0' WHERE GuildId = '"..player:GetGuildId().."'", 0)
			player:SendBroadcastMessage("You succesfully sold zone "..AreaId..".")
			player:DealGoldMerit(SELLPRICE)
		elseif (OwnsArea(player, AreaId) == 2) then 
			CharDBQuery("UPDATE guild SET Zone2 = '0' WHERE GuildId = '"..player:GetGuildId().."'", 0)
			player:DealGoldMerit(SELLPRICE)
			player:SendBroadcastMessage("You succesfully sold zone "..AreaId..".")
		elseif (OwnsArea(player, AreaId) == 3) then 
			CharDBQuery("UPDATE guild SET Zone3 = '0' WHERE GuildId = '"..player:GetGuildId().."'", 0)
			player:SendBroadcastMessage("You succesfully sold zone "..AreaId..".")
			player:DealGoldMerit(SELLPRICE)
		elseif (OwnsArea(player, AreaId) == 4) then 
			CharDBQuery("UPDATE guild SET Zone4 = '0' WHERE GuildId = '"..player:GetGuildId().."'", 0)
			player:SendBroadcastMessage("You succesfully sold zone "..AreaId..".")
			player:DealGoldMerit(SELLPRICE)
		elseif (OwnsArea(player, AreaId) == 5) then 
			CharDBQuery("UPDATE guild SET Zone5 = '0' WHERE GuildId = '"..player:GetGuildId().."'", 0)
			player:SendBroadcastMessage("You succesfully sold zone "..AreaId..".")
			player:DealGoldMerit(SELLPRICE)
		else
			player:SendBroadcastMessage("This zone is not yours!")
		end
		return 0
	end
	if (msg == AddTele) and (player:IsInGuild() == true) and (player:GetGuildLeader() == player:GetName()) then
		local AreaId = tostring(player:GetAreaId())
		if (OwnsArea(player, AreaId) == 1) or (OwnsArea(player, AreaId) == 2) or (OwnsArea(player, AreaId) == 3) or (OwnsArea(player, AreaId) == 4) or (OwnsArea(player, AreaId) == 5) then
			CharDBQuery("UPDATE guild SET Map = '"..player:GetMapId().."' WHERE GuildId = '"..player:GetGuildId().."'", 0)
			CharDBQuery("UPDATE guild SET PosX = '"..player:GetX().."' WHERE GuildId = '"..player:GetGuildId().."'", 0)
			CharDBQuery("UPDATE guild SET PosY = '"..player:GetY().."' WHERE GuildId = '"..player:GetGuildId().."'", 0)
			CharDBQuery("UPDATE guild SET PosZ = '"..player:GetZ().."' WHERE GuildId = '"..player:GetGuildId().."'", 0)
			player:SendBroadcastMessage("You and your guildmembers can now teleport here by using "..TeleMsg..".")
		else
			player:SendBroadcastMessage("This zone is not yours!")
		end
		return 0
	end
	if (msg == TeleMsg) then
		if (player:IsInGuild() == true) then
			if (CharDBQuery("SELECT PosX FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() ~= "0") then
				player:Teleport(tonumber(CharDBQuery("SELECT Map FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString()), tonumber(CharDBQuery("SELECT PosX FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString()), tonumber(CharDBQuery("SELECT PosY FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString()), tonumber(CharDBQuery("SELECT PosZ FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString()))
			else
				player:SendBroadcastMessage("Your guild does not have a zone or the guildmaster did not set a teleport position.")
			end
		else
			player:SendBroadcastMessage("You have to be in a guild in order to use this command.")
		end
		return 0
	end	
	if (msg == ZoneInfo) then
		if (RestrictedArea(player) == false) or (player:GetInstanceID() ~= nil) then
			player:SendBroadcastMessage("AreaId: "..player:GetAreaId()..".")
			player:SendBroadcastMessage("Status: Cannot be bought.")
		elseif (AreaCheck(player) == false) then	
			player:SendBroadcastMessage("AreaId: "..player:GetAreaId()..".")
			player:SendBroadcastMessage("Status: Currently not for sale.")
		else
			player:SendBroadcastMessage("AreaId: "..player:GetAreaId()..".")
			player:SendBroadcastMessage("Status: For sale.")
		end
		return 0
	end
	if (msg == OwnedZones) then
		if (CharDBQuery("SELECT Zone1 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() ~= "0") or (CharDBQuery("SELECT Zone2 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() ~= "0") or (CharDBQuery("SELECT Zone3 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() ~= "0") or (CharDBQuery("SELECT Zone4 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() ~= "0") or (CharDBQuery("SELECT Zone5 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() ~= "0") then
			player:SendBroadcastMessage("Area's your guild currently owns are:")
			if (CharDBQuery("SELECT Zone1 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() ~= "0") then
				player:SendBroadcastMessage(""..CharDBQuery("SELECT Zone1 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString().."")
			end
			if (CharDBQuery("SELECT Zone2 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() ~= "0") then
				player:SendBroadcastMessage(""..CharDBQuery("SELECT Zone2 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString().."")
			end
			if (CharDBQuery("SELECT Zone3 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() ~= "0") then
				player:SendBroadcastMessage(""..CharDBQuery("SELECT Zone3 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString().."")
			end
			if (CharDBQuery("SELECT Zone4 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() ~= "0") then
				player:SendBroadcastMessage(""..CharDBQuery("SELECT Zone4 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString().."")
			end
			if (CharDBQuery("SELECT Zone5 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() ~= "0") then
				player:SendBroadcastMessage(""..CharDBQuery("SELECT Zone5 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString().."")
			end
		else
			player:SendBroadcastMessage("Your guild does not own any zones.")
		end	
		return 0
	end	
	if (msg == Buff) then
		local AreaId = tostring(player:GetAreaId())
		if (OwnsArea(player, AreaId) == 1) or (OwnsArea(player, AreaId) == 2) or (OwnsArea(player, AreaId) == 3) or (OwnsArea(player, AreaId) == 4) or (OwnsArea(player, AreaId) == 5) then
			player:CastSpell(56525) -- Blessing of Kings
			player:CastSpell(48162) -- Prayer of Fortitude
			player:CastSpell(48074) -- Prayer of Spirit
			player:CastSpell(48470) -- Gift of the Wild
			player:CastSpell(53307) -- Thorns
		else
			player:SendBroadcastMessage("You can only use this in the areas your guild owns.")
		end
		return 0
	end
	if (msg == Commands) then
		if (player:IsInGuild() == true) and (player:GetGuildLeader() == player:GetName()) then
			player:SendBroadcastMessage("Commands available for you:")
			player:SendBroadcastMessage(""..BuyZone.." - To buy a zone.")
			player:SendBroadcastMessage(""..SellZone.." AreaId - To sell a zone.")
			player:SendBroadcastMessage(""..AddTele.." - To add a teleport you and your guild members can use.")
			player:SendBroadcastMessage(""..TeleMsg.." - Teleport to the place your guildmaster set.")
			player:SendBroadcastMessage(""..ZoneInfo.." - Displays the status + area id of the area you are at.")
			player:SendBroadcastMessage(""..OwnedZones.." - Displays the zones your guild currently owns.")
			player:SendBroadcastMessage(""..Buff.." - Buffs you while in an area your guild owns.")
		elseif (player:IsInGuild() == true) then
			player:SendBroadcastMessage("Commands available for you:")
			player:SendBroadcastMessage(""..TeleMsg.." - Teleport to the place your guildmaster set.")
			player:SendBroadcastMessage(""..ZoneInfo.." - Displays the status + area id of the area you are at.")
			player:SendBroadcastMessage(""..OwnedZones.." - Displays the zones your guild currently owns.")
			player:SendBroadcastMessage(""..Buff.." - Buffs you while in an area your guild owns.")
		end
		return 0
	end		
end	
				
function GuildAreaCheck(player)
	if (CharDBQuery("SELECT Zone5 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0) == nil) then
		CharDBQuery("INSERT INTO guild(GuildId, Zone1, Zone2, Zone3, Zone4, Zone5, Map, PosX, PosY, PosZ) VALUES ('"..player:GetGuildId().."', '0', '0', '0', '0', '0', '0', '0', '0', '0')", 0)
		return true
	elseif (CharDBQuery("SELECT Zone1 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() == "0") or (CharDBQuery("SELECT Zone2 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() == "0") or (CharDBQuery("SELECT Zone3 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() == "0") or (CharDBQuery("SELECT Zone4 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() == "0") or (CharDBQuery("SELECT Zone5 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() == "0") then
		return true
	else
		return false
	end
end	

function AreaCheck(player)
	if (CharDBQuery("SELECT Zone1 FROM guild WHERE Zone1 = '"..player:GetAreaId().."'", 0) == nil) and (CharDBQuery("SELECT Zone2 FROM guild WHERE Zone2 = '"..player:GetAreaId().."'", 0) == nil) and (CharDBQuery("SELECT Zone3 FROM guild WHERE Zone3 = '"..player:GetAreaId().."'", 0) == nil) and (CharDBQuery("SELECT Zone4 FROM guild WHERE Zone4 = '"..player:GetAreaId().."'", 0) == nil) and (CharDBQuery("SELECT Zone5 FROM guild WHERE Zone5 = '"..player:GetAreaId().."'", 0) == nil) then
		return true
	else
		return false
	end
end	

function AddArea(player)
	if (CharDBQuery("SELECT Zone1 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() == "0") then
		CharDBQuery("UPDATE guild SET Zone1 = '"..player:GetAreaId().."' WHERE GuildId = '"..player:GetGuildId().."'", 0)
	elseif (CharDBQuery("SELECT Zone2 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0) == "0") then	
		CharDBQuery("UPDATE guild SET Zone2 = '"..player:GetAreaId().."' WHERE GuildId = '"..player:GetGuildId().."'", 0)
	elseif (CharDBQuery("SELECT Zone3 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() == "0") then	
		CharDBQuery("UPDATE guild SET Zone3 = '"..player:GetAreaId().."' WHERE GuildId = '"..player:GetGuildId().."'", 0)
	elseif (CharDBQuery("SELECT Zone4 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() == "0") then	
		CharDBQuery("UPDATE guild SET Zone4 = '"..player:GetAreaId().."' WHERE GuildId = '"..player:GetGuildId().."'", 0)
	elseif (CharDBQuery("SELECT Zone5 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0) == "0") then	
		CharDBQuery("UPDATE guild SET Zone5 = '"..player:GetAreaId().."' WHERE GuildId = '"..player:GetGuildId().."'", 0)
	end
end	

function RestrictedArea(player)
	for k, v in pairs(NotBuyableAreas) do
		if (player:GetAreaId() ~= v) then
			return true
		else
			return false
		end
	end
end	
			
function OwnsArea(player, AreaId)
local AreaId = tostring(AreaId)
	if (CharDBQuery("SELECT Zone1 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() == AreaId) then
		return 1
	elseif (CharDBQuery("SELECT Zone2 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() == AreaId) then
		return 2
	elseif (CharDBQuery("SELECT Zone3 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() == AreaId) then
		return 3
	elseif (CharDBQuery("SELECT Zone4 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() == AreaId) then
		return 4
	elseif (CharDBQuery("SELECT Zone5 FROM guild WHERE GuildId = '"..player:GetGuildId().."'", 0):GetColumn(0):GetString() == AreaId) then
		return 5
	else
		return false
	end
end	

RegisterServerHook(16, "GUILD.ZoneCommands")