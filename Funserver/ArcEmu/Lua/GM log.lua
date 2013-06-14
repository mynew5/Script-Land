 --[[

	Gm msg script
 	Script by Grandelf.
	
		I made this because I was bored and I dont like the ticket system.
		I know something like this has been released before, but those used
		a file and wrote the players msg in there. That way only ppl that have
		acces to the host can read it, with mine everyone can.

]]--

GMM = {}

GMM["TBL"] = {
	["msg"] = {},
	["players"] = {}
}	

local Report = "#gm report" 
local Show = "#gm show"
local Delete = "#gm delete"
local GMdelete = "#gm delmsg"

function GMM.OnChatGMMsg(event, player, message, type, language)
	if (message:find(Report.." ") == 1) then
		if (GMM.PlayerCheck(player) == false) then -- Checking if the player has added a msg before.
			local text, key = message:gsub(Report.." ", ""), GMM.GetKey() -- if not we get the msg and a free slot.
			GMM["TBL"]["msg"][key] = text
			GMM["TBL"]["players"][key] = player:GetName()
			player:SendBroadcastMessage("Your msg has been send.")
		else -- The player did add a msg before.
			player:SendBroadcastMessage("You can only send one msg at a time. Wait untill a GM deletes it or delete it yourself using "..Delete..".")
		end	
		return 0
	end
	if (message == Show) then
		if (player:CanUseCommand("a") == true) then -- If the player is a GM he can use this command.
			GMM.ShowMessages(player) -- Showing the msgs.
		end	
		return 0
	end	
	if (message == Delete) then
		local key = GMM.PlayerCheck(player) -- Checking the key of the player.
		if (GMM.PlayerCheck(player) ~= false) then -- If the value is number then the player added a msg.
			GMM["TBL"]["msg"][key] = nil -- Deleting his msg
			GMM["TBL"]["players"][key] = nil -- Deleting the players name.
			player:SendBroadcastMessage("Your msg has been deleted.")
		else -- They player didnt add a msg.
			player:SendBroadcastMessage("You haven't added a msg yet.")
		end
		return 0
	end
	if (message:find(GMdelete.." ") == 1) then
		if (player:CanUseCommand("a") == true) then -- If the player is a GM he can use this command.
			local name = message:gsub(GMdelete.." ", "") 	
			if (GMM.PlayerCheck(name) ~= false) then -- If the value is number then the player added a msg.
				local key = GMM.PlayerCheck(name) -- Getting the key.
				GMM["TBL"]["msg"][key] = nil -- Removing the msg.
				GMM["TBL"]["players"][key] = nil -- Removing his name.
				player:SendBroadcastMessage("Msg from player "..name.." deleted.")
			else -- Player didnt add a msg.
				player:SendBroadcastMessage("This player didn't left any msg.")
			end
		end
		return 0		
	end	
end

function GMM.PlayerCheck(player)
	for k, v in pairs(GMM["TBL"]["players"]) do
		if (type(player) == "userdata") then -- if player is userdata
			if (v == player:GetName()) then -- Its userdata so we can use GetName().
				return k; -- Returning k if the player is in the tbl.
			end
		else -- Player is a string.
			if (v == player) then -- We dont have to use GetName() here.
				return k; -- Returning k if the player is in the tbl.
			end	
		end
	end
	return false; -- We return false if the player isn't in the tbl.
end	

function GMM.ShowMessages(player)
	local C = 0 -- Making sure we start at 0.
	for k in pairs(GMM["TBL"]["msg"]) do
		if (C == 25) then -- 25 msgs displayed.
			player:SendBroadcastMessage("25 results reached.")
			break; -- Breaking the loop because 25 msgs are displayed.
		else	
			player:SendBroadcastMessage(GMM["TBL"]["players"][k]..": "..GMM["TBL"]["msg"][k])
			C = C + 1 -- Adding one to C.
		end	
	end
	if (C == 0) then -- No msgs in tbl.
		player:SendBroadcastMessage("There are no messages to be shown.")
	end	
end	

function GMM.GetKey()
	local t = 1 -- Making sure we start at index 1.
	while (GMM["TBL"]["msg"][t] ~= nil) do -- Player slot free?
		t = t + 1 -- If not we  try another one.
	end	
	return t; -- Returning the free slot.
end	

RegisterServerHook(16, "GMM.OnChatGMMsg")