Chat = {}
Chat.Syntax = {}
--[[ 
		Credits to Icefreze
								]]
								


																
																
																
																
																
-------------------------------------------
----------------Configs-------------------- -- [[ REMEMBER TO READ THE TEXT BEFORE CHANGING ANYTHING! ]]
-------------------------------------------

Chat.Syntax.Chat_Prefix = "#g"    	-- Set what you should type to use the global chat here between the two " " (resets to !G if no input is added) this may not be '#chat' !

--

Chat.Syntax.Chat_Prefix2 = "!g"		-- This is the second syntax should also be placed between the two " ". (resets to !G if no input is added) this may not be '#chat' !

--

Chat.Syntax.Donor_Rank = "v"			-- Set the rank of the donors on your server here! should also be placed between the two " "

--

Chat.Syntax.Enable_Vote_kick = 1        -- set 1 if you want to enable vote-kick. 0 if you dont want to.

--

Chat.Syntax.Filelogging = 1      		-- set 1 if you want the script to log everything said in the chat to a text file in your ArcEmu folder. Should be 0 for no.

--

Chat.Syntax.Chat_Admin = ""     		-- Set your desired mark for chat admins here. default is no marks. (note the mark will be coloured in margenta) 

--

Chat.Syntax.Spam_Reset = 2     			-- This is the amount of seconds there will pass, after the last message sent by the player, before the count resets.

--

Chat.Syntax.Spam_Trigger = 5 			-- This is the max amount of messages you can send before its marked as spam.

-------------------------------------------
--------------End of configs--------------- -- [[ REMEMBER TO READ THE TEXT BEFORE CHANGING ANYTHING! ]]
-------------------------------------------





								

Chat.Kick = {}
Chat.Kick.Time = {}
Chat.vote = {}
Chat.vote.yes = {}
Chat.vote.no = {}
Chat.Spam = {} 
Chat.Spam.Time = {} 
Chat.Time = {}	
Chat.vote.has_voted = {}
Chat.Instant = {}

function Chat.global(event, player, message, Type)
if string.find(player:GetAccountName(), "[%a%b]") == nil then
	error("The player:GetAccountName() is bugged in your core. It will cause this script not to work. Remove script..", 0)
end
local Admin = WorldDBQuery("select `chat_admin` from `global_chat` where `account_name` = '"..player:GetAccountName().."'"):GetColumn(0):GetUByte()
	if WorldDBQuery("Select `account_name` from `global_chat` where `account_name` = '"..player:GetAccountName().."'") == nil then
	WorldDBQuery("insert into `global_chat` (`account_name`) values ('"..player:GetAccountName().."')")
	end 
	------------------------------------------------------------------------------------------------------------
	-- Only script below this line!!! --------------------------------------------------------------------------
	------------------------------------------------------------------------------------------------------------
	
	
if (player:GetGmRank() == "az") or (Admin == 1)  then
	if string.find(string.lower(message), ".chat command") == 1 and 13 then
		for k,v in pairs(Chat.Admin_Commands) do
			player:SendBroadcastMessage(k.." - "..v)
		end
		return 0
	end
	if string.find(string.lower(message), ".chat ban") == 1 and 9 then
		local _, endpos = string.find(message.." ", "%s", 11)
		local target = string.sub(message, 11, endpos-1)
		local duration = string.sub(message, endpos+1, #message)
		if (duration == nil) or (string.find(duration, "%d")) == nil then
			duration = 0
		elseif string.find(duration, "0") == nil then
			duration = duration+os.time()
		else 
			duration = 0
		end
		if duration ~= nil and string.find(duration, "[%a%p]") == nil  then
		WorldDBQuery("update `global_chat` set `banned` = '1' where `account_name` = '"..target.."'")
		WorldDBQuery("update `global_chat` set `ban_time` = '"..duration.."' where `account_name` = '"..target.."'")
		player:SendBroadcastMessage(target.." is now banned from the chat")
		else
		player:SendBroadcastMessage("Wrong syntax. The correct syntax is: .chat ban (Account_Name) [(duration)]   set duration to 0 for a permanant ban.")
		end
		return 0	
	elseif string.find(string.lower(message), ".chat mute") == 1 and 10 then
		local _, endpos = string.find(message.." ", "%s", 12)
		local target = string.sub(message, 12, endpos-1)
		local duration = string.sub(message, endpos+1, #message)
		if (duration == nil) or (string.find(duration, "%d")) == nil then
			duration = 0
		elseif string.find(duration, "0") == nil then
			duration = duration+os.time()
		else 
			duration = 0
		end
		if duration ~= nil and string.find(duration, "[%a%p]") == nil then
		WorldDBQuery("update `global_chat` set `mute_time` = '"..tonumber(duration)+os.time().."' where `account_name` = '"..target.."'")
		WorldDBQuery("update `global_chat` set `Gm_muted` = '1' where `account_name` = '"..target.."'")
		player:SendBroadcastMessage(target.." is now muted from the channel")
		else
		player:SendBroadcastMessage("Wrong syntax. The correct syntax is: .chat mute (Account_Name) [(duration)]")
		end
		return 0
	elseif string.find(string.lower(message), ".chat unmute") == 1 and 12 then
		local _, endpos = string.find(message.." ", "%s", 14)
		local target = string.sub(message, 14, endpos-1 or #message)
		WorldDBQuery("update `global_chat` set `GM_muted` = '0' where `Account_name` = '"..target.."'")
		WorldDBQuery("update `global_chat` set `Mute_time` = '0' where `account_name` = '"..target.."'")
		player:SendBroadcastMessage("You have now unmuted "..target)
		return 0
	elseif string.find(string.lower(message), ".chat unban") == 1 and 11 then
		local _, endpos = string.find(message.." ", "%s", 13)
		local target = string.sub(message, 13, endpos-1 or #message)
		WorldDBQuery("update `global_chat` set `banned` = '0' where `account_name` = '"..target.."'")
		player:SendBroadcastMessage("You have now unbanned "..target)
		return 0
	end
	if player:GetGmRank() == "az" then
	if string.find(string.lower(message), ".chat setadmin") == 1 and 14 then
		local _, endpos = string.find(message.." ", "%s", 16)
		local target = string.sub(message, 16, endpos-1)
		WorldDBQuery("update `global_chat` set `Chat_admin` = '1' where `account_name` = '"..target.."'")
		player:SendBroadcastMessage(target.." is now an admin of the global chat")
		return 0
	end
	if string.find(string.lower(message), ".chat desetadmin") == 1 and 16 then
		local _, endpos = string.find(message.." ", "%s", 18)
		local target = string.sub(message, 18, endpos-1)
		WorldDBQuery("update `global_chat` set `Chat_admin` = '0' where `account_name` = '"..target.."'")
		player:SendBroadcastMessage(target.." is demoted from admin.")
		return 0
	end
	end
	
end

			local chatOnOff = WorldDBQuery("Select `activated` from `global_chat` where `account_name` = '"..player:GetAccountName().."'"):GetColumn(0):GetByte()
		if (string.find(string.lower(message), "#chat") == 1 and 5) or (string.find(string.lower(message), "!chat") == 1 and 5) then
			if string.find(string.lower(message), "on") == 7 and 8 then
				if chatOnOff == 0 then
					WorldDBQuery("update `global_chat` set `activated` = '1' where `account_name` = '"..player:GetAccountName().."'")
					player:SendBroadcastMessage("The worldchat is now enabled.")
				elseif chatOnOff == 1 then
					player:SendBroadcastMessage("The worldchat is already enabled!")
				else
					player:SendBroadcastMessage("You had an unknown flag. Resetting to 0. If this happens again contact the devs. Redo the command.")
				end
					return 0
			end
				if string.find(string.lower(message), "instant") == 7 and 13 then
					if string.find(string.lower(message), "on") == 15 and 16 then
						Chat.Instant[player:GetName()] = true
						player:SendBroadcastMessage("Instant messaging is now turned on.")
					elseif string.find(string.lower(message), "off") == 15 and 17 then
						Chat.Instant[player:GetName()] = false
						player:SendBroadcastMessage("Instant messaging is now turned off.")
					end
				end
				if string.find(string.lower(message), "off") == 7 and 9 then
					if chatOnOff == 1 then
						WorldDBQuery("update `global_chat` set `activated` = '0' where `account_name` = '"..player:GetAccountName().."'")
						player:SendBroadcastMessage("The worldchat is now disabled.")
					elseif chatOnOff == 0 then
						player:SendBroadcastMessage("The worldchat is already disabled!")
					else
						player:SendBroadcastMessage("You had an unknown flag. Resetting to 0. If this happens again contact the devs. Redo the command.")
					end
						return 0
				end
					if (string.find(string.lower(message), "kick") == 7 and 10) then
						if (Chat.Syntax.Enable_Vote_kick == 1) then
						local _, endpost = string.find(message.." ", "%s", 12)
						local KickTarget = (string.sub(message, 12, endpost-1))
							local Online_player = false
						for _,v in pairs(GetPlayersInWorld()) do
							if string.lower(v:GetName()) == string.lower(KickTarget) then
							 Online_player = true;
								local account = v:GetAccountName()
								if (WorldDBQuery("Select `activated` from `global_chat` where `account_name` = '"..account.."'"):GetColumn(0):GetByte() == 1) then
									if VoteStarted ~= 1 then
										VoteStarted = 1
										for k,v in pairs(GetPlayersInWorld()) do
											if WorldDBQuery("select `activated` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetByte() == 1 then
												v:SendBroadcastMessage("|cffFF4400"..player:GetName().." has started a vote-kick against "..KickTarget.." Type #Chat yes if you want to kick him or type #Chat no if you want him to stay")
											end
										end
										RegisterTimedEvent("VoteKick", 30000, 1, KickTarget, account)
									else
										player:SendBroadcastMessage("A vote kick is already started")
									end
								else 
									player:SendBroadcastMessage("The player is not in the global chat.")
								end
							break
							end
						end
						if Online_player == false then
							player:SendBroadcastMessage("The player is not online.")
						end
						else
						player:SendBroadcastMessage("The kick command is disabled.")
						end
						return 0
						end
					
					if Chat.vote.has_voted[player:GetAccountName()] == 1 then
						player:SendBroadcastMessage("You can only vote once!")
						return 0
					else
						if (string.find(string.lower(message), "yes") == 7 and 9) and VoteStarted == 1 then
							table.insert(Chat.vote.yes, player:GetAccountName())
							Chat.vote.has_voted[player:GetAccountName()] = 1
							player:SendBroadcastMessage("Thank you for helping us keep the chat clean.")
							return 0
						elseif (string.find(string.lower(message), "yes") == 7 and 9) and VoteStarted ~= 1 then
							player:SendBroadcastMessage("There is no current vote-kicks running.")
							return 0
						end
																					
						if (string.find(string.lower(message), "no") == 7 and 8) and VoteStarted == 1 then
						Chat.vote.has_voted[player:GetAccountName()] = 1
							table.insert(Chat.vote.no, 0)
							player:SendBroadcastMessage("Thank you for helping us keep the chat clean.")
								return 0
						elseif (string.find(string.lower(message), "no") == 7 and 9) and VoteStarted ~= 1 then
							player:SendBroadcastMessage("There is no current vote-kicks running.")
							return 0
						end
					end
						
						if (string.find(string.lower(message), "unignore") == 7 and 15) then
							local _,space_find = string.find(message, "%s", 16)
							local UnMutePlayer = string.sub(message, 16, space_find or #message)
							local exist = WorldDBQuery("select `muted list` from `global_chat` where `account_name` = '"..player:GetAccountName().."'"):GetColumn(0):GetString()
							if string.find(exist, UnMutePlayer) ~= nil then
								local input = string.gsub(exist, UnMutePlayer, "", 1)
								WorldDBQuery("update `global_chat`set `muted list` = '"..input.." ' where `account_name` = '"..player:GetAccountName().."'")
								player:SendBroadcastMessage("You have now unignored "..UnMutePlayer..".")
							else
								player:SendBroadcastMessage("You have not ignored that player.")
							end
							return 0
						end
					if (string.find(string.lower(message), "ignore") == 7 and 13) and (string.find(string.lower(message), "ignorelist") == nil) and (string.find(string.lower(message), "unignore") == nil) then
						local _,space_find = string.find(message, "%s", 15)
						local MutePlayer = string.sub(message, 14, space_find or #message)
						local exist_player = WorldDBQuery("select `muted list` from `global_chat` where `account_name` = '"..player:GetAccountName().."'"):GetColumn(0):GetString()
							if string.find(exist_player, MutePlayer) == nil then
								WorldDBQuery("update `global_chat`set `muted list` = '"..exist_player..MutePlayer.." ' where `account_name` = '"..player:GetAccountName().."'")
								player:SendBroadcastMessage("You have now ignored "..MutePlayer..".")
							else 
								player:SendBroadcastMessage("A player with that name is already ignored by you.") -- Not sure if this is needed exept the script is bugged (it should block the player who spams if you ignored him)
							end
						return 0
					end
					if (string.find(string.lower(message), "ignorelist") == 7 and 16) then
						if (WorldDBQuery("select `muted list` from `global_chat` where `account_name` = '"..player:GetAccountName().."'") ~= nil) and (string.find(WorldDBQuery("select `muted list` from `global_chat` where `account_name` = '"..player:GetAccountName().."'"):GetColumn(0):GetString(), "%a") ~= nil) then
								local Ignorelist = WorldDBQuery("select `muted list` from `global_chat` where `account_name` = '"..player:GetAccountName().."'"):GetColumn(0):GetString()
								local ignorelist = {}
								
							for word in string.gmatch(Ignorelist, "%a+") do
								table.insert(ignorelist, word)
							end
								player:SendBroadcastMessage("You have ignored following players:")
								for i=1,#ignorelist do
									player:SendBroadcastMessage(ignorelist[i])
								end
							
						else 
							player:SendBroadcastMessage("You havn't ignored any players yet.")
							return 0
						end
						return 0
					end
					if (string.find(string.lower(message), "command") == 7) then
						for k,v in pairs(Chat.Commands) do
							player:SendBroadcastMessage(k.." - "..v)
						end
					end
					return 0
		end
					
	



	local Spam_Warns = WorldDBQuery("Select `Spam_warns` from `global_chat` where `account_name` = '"..player:GetAccountName().."'"):GetColumn(0):GetUByte()
	local Mute = WorldDBQuery("Select `GM_muted` from `global_chat` where `account_name` = '"..player:GetAccountName().."'"):GetColumn(0):GetUByte()
	local Ban = WorldDBQuery("Select `banned` from `global_chat` where `account_name` = '"..player:GetAccountName().."'"):GetColumn(0):GetUByte()
	local Mute_time = WorldDBQuery("Select `mute_time` from `global_chat` where `account_name` = '"..player:GetAccountName().."'"):GetColumn(0):GetLong()
	local Ban_time = WorldDBQuery("Select `mute_time` from `global_chat` where `account_name` = '"..player:GetAccountName().."'"):GetColumn(0):GetLong()
	local GlobalChat = io.open("GlobalChat.txt", "a+")
	local banone = os.time()+300
	local bantwo = os.time()+1800
	local banttree = os.time()+(60*24*3)
	local Name = player:GetAccountName()
	local startpos,_ = string.find(string.lower(message), Chat.Syntax.Chat_Prefix)
	local Startpos,_ = string.find(string.lower(message), Chat.Syntax.Chat_Prefix2)
	local count_reset = Chat.Syntax.Spam_Reset
	
		if (startpos == 1) or (Startpos == 1) or (Type == 4 and Chat.Instant[player:GetName()] == true) then
				
		if startpos == 1 then
			Chat.Syntax.Chat_Prefix_end = Chat.Syntax.Chat_Prefix_end1
		elseif Startpos == 1 then
				Chat.Syntax.Chat_Prefix_end = Chat.Syntax.Chat_Prefix_end2
		elseif Type == 4 and Chat.Instant[player:GetName()] == true then
			Chat.Syntax.Chat_Prefix_end = 0
		end
			if Chat.Kick[player:GetAccountName()] == 1 then
				player:SendBroadcastMessage("You are kicked from the global chat.")
			
			elseif chatOnOff == 0 then
					player:SendBroadcastMessage("You cant use the global chat when you've disabled it!")
			
			elseif Mute == 1 and Mute_time >= os.time() then
				player:SendBroadcastMessage("You are muted from the chat.")
				elseif Mute == 1 and Mute_time >= os.time() then
				
					WorldDBQuery("update `global_chat` set `GM_muted` = '0' where `account_name` = '"..player:GetAccountName().."'")
					WorldDBQuery("update `global_chat` set `Mute_time` = '0' where `account_name` = '"..player:GetAccountName().."'")
						Chat.global(event, player, message, Type)
					return 0
			elseif Ban == 1 and Ban_time >= os.time() then
			WorldDBQuery("update `global_chat` set `banned` = '0' where `account_name` = '"..player:GetAccountName().."'")
					WorldDBQuery("update `global_chat` set `ban_time` = '0' where `account_name` = '"..player:GetAccountName().."'")
					Chat.global(event, player, message, Type)
					return 0
					elseif Ban == 1 and Ban_time <= os.time() then
						player:SendBroadcastMessage("You are banned from the chat.")
						
				elseif Ban == 1 and Ban_time == 0 then
					player:SendBroadcastMessage("You are permanant banned from the chat. If you belive this is wrong post at the forums.")
					elseif Ban == 1 and Ban_time >= os.time() then
						player:SendBroadcastMessage("You are banned from the chat.")
			else
			
					if Chat.Spam[Name] ~= nil and Chat.Spam[Name] >= Chat.Syntax.Spam_Trigger then
						if Spam_Warns == 0 then
							player:SendBroadcastMessage(" 1'st spam detected. You are kicked from the chat for 5 min.")
							player:SendAreaTriggerMessage("Spam detected. You are kicked from the chat for 5 min.")
							WorldDBQuery("update `global_chat` set `GM_muted` = '1' where `account_name` = '"..player:GetAccountName().."'")
							WorldDBQuery("update `global_chat` set `mute_time` = '"..banone.."' where `account_name` = '"..player:GetAccountName().."'")
							WorldDBQuery("update `global_chat` set `Spam_warns` = '1' where `account_name` = '"..player:GetAccountName().."'")
						
				
						elseif Spam_Warns == 1 then
							player:SendBroadcastMessage("2'nd spam detected. You are kicked from the chat for 30 min.")
							player:SendAreaTriggerMessage("Spam detected. You are kicked from the chat for 30 min.")
							WorldDBQuery("update `global_chat` set `GM_muted` = '1' where `account_name` = '"..player:GetAccountName().."'")
							WorldDBQuery("update `global_chat` set `mute_time` = '"..bantwo.."' where `account_name` = '"..player:GetAccountName().."'")
							WorldDBQuery("update `global_chat` set `Spam_warns` = '2' where `account_name` = '"..player:GetAccountName().."'")
						elseif Spam_Warns >= 2 then
							player:SendBroadcastMessage("3'rd spam detected. You are now banned from the chat for 3 days.")
							player:SendAreaTriggerMessage("3'rd spam detected. You are now banned from the chat for 3 days.")
							WorldDBQuery("update `global_chat` set `GM_muted` = '1' where `account_name` = '"..player:GetAccountName().."'")
							WorldDBQuery("update `global_chat` set `mute_time` = '"..bantwo.."' where `account_name` = '"..player:GetAccountName().."'")
							WorldDBQuery("update `global_chat` set `Spam_warns` = '3' where `account_name` = '"..player:GetAccountName().."'")
						end
					else
							
						if player:GetGmRank() == "az" then
							for k,v in pairs(GetPlayersInWorld()) do
								if (WorldDBQuery("select `activated` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetByte() == 1) and (string.find(string.lower(WorldDBQuery("select `muted list` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetString()), string.lower(player:GetName())) == nil) and (WorldDBQuery("Select `banned` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetUByte() == 0) then
									v:SendBroadcastMessage(string.gsub(message, string.sub(message, 1, Chat.Syntax.Chat_Prefix_end), "|cffFF0000<Admin>|r"..player:GetName()..":|cff33FF00",1))
								end
							end
							if Chat.Syntax.Filelogging == 1 then
							GlobalChat:write(string.gsub(message, string.sub(message, 1, Chat.Syntax.Chat_Prefix_end), "<Admin>"..player:GetName()..":", 1).."\n")
							GlobalChat:flush()
							end
						elseif player:GetGmRank() == "a" then
							for k,v in pairs(GetPlayersInWorld()) do
								if (WorldDBQuery("select `activated` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetByte() == 1) and (string.find(string.lower(WorldDBQuery("select `muted list` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetString()), string.lower(player:GetName())) == nil) and (WorldDBQuery("Select `banned` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetUByte() == 0) then
									v:SendBroadcastMessage(string.gsub(message, string.sub(message, 1, Chat.Syntax.Chat_Prefix_end), "|cff3399FF<GM>|r|cff33FF00"..player:GetName()..":|r",1))
								end
							end
								if Chat.Syntax.Filelogging == 1 then
								GlobalChat:write(string.gsub(message, string.sub(message, 1, Chat.Syntax.Chat_Prefix_end), "<GM>"..player:GetName()..":", 1).."\n")
								GlobalChat:flush()
								end
						elseif string.lower(player:GetGmRank()) == Chat.Syntax.Donor_Rank then
							for k,v in pairs(GetPlayersInWorld()) do
								if (WorldDBQuery("select `activated` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetByte() == 1) and (string.find(string.lower(WorldDBQuery("select `muted list` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetString()), string.lower(player:GetName())) == nil) and (WorldDBQuery("Select `banned` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetUByte() == 0) then
									v:SendBroadcastMessage(string.gsub(message, string.sub(message, 1, Chat.Syntax.Chat_Prefix_end), "|cffFFFF00{DONATOR}|r|cff66CCFF"..player:GetName().."|r:",1))
								end
							end
								if Chat.Syntax.Filelogging == 1 then
								GlobalChat:write(string.gsub(message, string.sub(message, 1, Chat.Syntax.Chat_Prefix_end), "<DONOR>"..player:GetName()..":", 1).."\n")
								GlobalChat:flush()
								end
							if Chat.Spam[Name] == nil then
															Chat.Spam[Name] = 1
															Chat.Spam.Time[Name] = os.time()+count_reset
							else
																	Chat.Spam[Name] = Chat.Spam[Name]+1
																	Chat.Spam.Time[Name] = os.time()+count_reset
							end
											
											
						elseif Admin == 1 then
							for k,v in pairs(GetPlayersInWorld()) do
								if (WorldDBQuery("select `activated` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetByte() == 1) and (string.find(string.lower(WorldDBQuery("select `muted list` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetString()), string.lower(player:GetName())) == nil) and (WorldDBQuery("Select `banned` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetUByte() == nil or 0) then
									v:SendBroadcastMessage(string.gsub(message, string.sub(message, 1, Chat.Syntax.Chat_Prefix_end), "|cff9900FF"..Chat.Syntax.Chat_Admin.."|r|cffCC88FF"..player:GetName()..":|r", 1))
								end
							end
							if Chat.Syntax.Filelogging == 1 then
								GlobalChat:write(string.gsub(message, string.sub(message, 1, Chat.Syntax.Chat_Prefix_end), Chat.Syntax.Chat_Admin..player:GetName()..":", 1).."\n")
								GlobalChat:flush()
								end
							else
								for k,v in pairs(GetPlayersInWorld()) do
									if (WorldDBQuery("select `activated` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetByte() == 1) and (string.find(string.lower(WorldDBQuery("select `muted list` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetString()), string.lower(player:GetName())) == nil) and (WorldDBQuery("Select `banned` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetUByte() == nil or 0) then
											v:SendBroadcastMessage(string.gsub(message, string.sub(message, 1, Chat.Syntax.Chat_Prefix_end), "|cffBBBBBB"..player:GetName()..":|r",1))
									end
								end
											if Chat.Syntax.Filelogging == 1 then
											GlobalChat:write(string.gsub(message, string.sub(message, 1, Chat.Syntax.Chat_Prefix_end), player:GetName()..":", 1).."\n")
											GlobalChat:flush()
											end
						end
							if Chat.Spam[Name] == nil then
															Chat.Spam[Name] = 1
															Chat.Spam.Time[Name] = os.time()+count_reset
							else
																	Chat.Spam[Name] = Chat.Spam[Name]+1
																	Chat.Spam.Time[Name] = os.time()+count_reset
							end	
							Chat.Syntax.Chat_Prefix_end = nil
					end
				end
			return 0;	
			end
end

function Chat.Spam_Filter()
for k,v in pairs(Chat.Spam.Time) do
if os.time() >= v then
Chat.Spam[k] = 0
Chat.Spam.Time[k] = 0
end
end
for k,v in pairs(Chat.Kick.Time) do
if v <= os.time() then
Chat.Kick[k] = 0
Chat.Kick.Time[k] = nil
end
end
end

function VoteKick(target, account)
local yes = #Chat.vote.yes
local no = #Chat.vote.no
if yes <= no then
for k,v in pairs(GetPlayersInWorld()) do
if WorldDBQuery("select `activated` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetByte() == 1 then
v:SendBroadcastMessage(target.." didnt get kicked this time.")
end
end
elseif yes > no then
Chat.Kick[account] = 1
Chat.Kick.Time[account] = os.time()+300
for k,v in pairs(GetPlayersInWorld()) do
if WorldDBQuery("select `activated` from `global_chat` where `account_name` = '"..v:GetAccountName().."'"):GetColumn(0):GetByte() == 1 then
v:SendBroadcastMessage(target.." got kicked from the global chat.")
end
end
end
VoteStarted = nil
Chat.vote.yes = nil
Chat.vote.no = nil
Chat.vote.has_voted = nil
Chat.vote.has_voted = {}
Chat.vote.yes = {}
Chat.vote.no = {}
end

function Chat.Syntax.Dealer()
logcol(12)
if (Chat.Syntax.Spam_Trigger == nil) or (type(Chat.Syntax.Spam_Trigger) ~= "number") then
	print("Chat.Syntax.Spam_Trigger have to be a number! .. resseting..")
		Chat.Syntax.Spam_Trigger = 5
end
if (Chat.Syntax.Spam_Reset == nil) or (type(Chat.Syntax.Spam_Reset) ~= "number") then
	print("Chat.Syntax.Spam_Reset have to be a number!  .. resseting.. ")
		 Chat.Syntax.Spam_Reset = 2
	end
if type(Chat.Syntax.Chat_Admin) ~= "string" then
	print"Chat.Syntax.Chat_Admin have to be between the two " " .. resetting.."
		Chat.Syntax.Chat_Admin = ""
elseif Chat.Syntax.Chat_Admin == nil then
	print"Chat.Syntax.Chat_Admin was nil!  ..resetting.."
	Chat.Syntax.Chat_Admin = ""
end
if type(Chat.Syntax.Chat_Prefix) ~= "string" then
	print('Chat.Syntax.Chat_Prefix have to be a between the two " "	 .. resetting..', 0)
	Chat.Syntax.Chat_Prefix = "#g"
	Chat.Syntax.Chat_Prefix_end1 = #Chat.Syntax.Chat_Prefix
elseif string.find(string.lower(Chat.Syntax.Chat_Prefix), "#chat") ~= nil then
	print("Chat.Syntax.Chat_Prefix May not be #chat ! ..resetting..")
	Chat.Syntax.Chat_Prefix = nil
end
	if Chat.Syntax.Chat_Prefix ~= nil then
				Chat.Syntax.Chat_Prefix = string.lower(Chat.Syntax.Chat_Prefix)
				-- local Non_Space,_ = string.find(Chat.Syntax.Chat_Prefix.." ", "%s", string.find(Chat.Syntax.Chat_Prefix, "[%a%d]")
				Chat.Syntax.Chat_Prefix_end1 = #Chat.Syntax.Chat_Prefix
	else
		Chat.Syntax.Chat_Prefix = "#g"
		Chat.Syntax.Chat_Prefix_end1 = #Chat.Syntax.Chat_Prefix
	end
if type(Chat.Syntax.Chat_Prefix2) ~= "string" then
	print('Chat.Syntax.Chat_Prefix2 have to be a between the two " " .. resetting..', 0) -- REMEMBER TO SET TO DEFAULT AFTER THIS
	Chat.Syntax.Chat_Prefix2 = "!g"
			hat.Syntax.Chat_Prefix_end2 = #Chat.Syntax.Chat_Prefix2
elseif string.find(string.lower(Chat.Syntax.Chat_Prefix2), "#chat") ~= nil then
	print("Chat.Syntax.Chat_Prefix2 May not be #chat ! ..resetting..")
	Chat.Syntax.Chat_Prefix2 = nil
end
	if Chat.Syntax.Chat_Prefix2 ~= nil then
			Chat.Syntax.Chat_Prefix2 = string.lower(Chat.Syntax.Chat_Prefix2)
			Chat.Syntax.Chat_Prefix_end2 = #Chat.Syntax.Chat_Prefix2
		else
			Chat.Syntax.Chat_Prefix2 = "!g"
			Chat.Syntax.Chat_Prefix_end2 = #Chat.Syntax.Chat_Prefix2
	end
	if type(Chat.Syntax.Donor_Rank) ~= "string" then
		print('Chat.Syntax.Donor_Rank be a between the two " " .. resetting..', 0)
		Chat.Syntax.Donor_Rank = "v"
	end
		if Chat.Syntax.Donor_Rank ~= nil then
			Chat.Syntax.Donor_Rank = string.lower(Chat.Syntax.Donor_Rank)
		else
			Chat.Syntax.Donor_Rank = "v"
		end
	if Chat.Syntax.Filelogging == nil then
		Chat.Syntax.Filelogging = 1
		
	elseif Chat.Syntax.Filelogging ~= 1 and Chat.Syntax.Filelogging ~= 0 then
			print("Chat.Syntax.Filelogging has to be 1 or 0 .. resetting to 0...", 0)
			Chat.Syntax.Filelogging = 0
	end
	if Chat.Syntax.Enable_Vote_kick == nil then
		Chat.Syntax.Enable_Vote_kick = 1
	elseif Chat.Syntax.Enable_Vote_kick ~= 1 and Chat.Syntax.Enable_Vote_kick ~= 0 then
		print("Chat.Syntax.Enable_Vote_kick has to be 1 or 0 .. resetting to 1...", 0)
		Chat.Syntax.Enable_Vote_kick = 1
	end
	Chat.Commands = {["#chat on/off"] = "turns the chat on or off", ["#chat kick"] = "starts a vote kick", ["#chat ignore"] = "ignores a player", ["#chat unignore"] = "unignores a player", ["#chat ignorelist"] = "shows your ignored players", [Chat.Syntax.Chat_Prefix] = "the 1'st option to use the global chat with.", [Chat.Syntax.Chat_Prefix2] = "The 2'nd option to use the global chat with", ["#chat commands"] = "shows you this list!", ["#chat instant on/off"] = "turns the instant messaging on or off.",}
	Chat.Admin_Commands = {[".chat ban (acc) [duration]"] = "Bans the player with account_name. Duration is entered in seconds but is optional.", [".chat mute (acc) [duration]"] = "mutes the player with account name. Duration is entered in miliseconds but is optional.", [".chat unmute (acc)"] = "unmutes player with account name.", [".chat unban (acc)"] = "unbans the player with account name.", }
	logcol(7)
end

RegisterTimedEvent("Chat.Spam_Filter", 100, 0)
RegisterServerHook(16, "Chat.global")
Chat.Syntax.Dealer()