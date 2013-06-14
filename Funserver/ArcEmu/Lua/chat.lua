local ChatMsg = "#c"
-- local Space = " "
local Commands = "#commands"

function ChatSystem(event, player, message, type, language)
	if (message:find(ChatMsg.." ") == 1) then
		local text = message:gsub(ChatMsg.." ", "") 
				local plrs = GetPlayersInWorld()
				for k, v in pairs(plrs) do
							if (player:GetTeam() == 0) then -- Alliance
								local GMrank = player:GetGmRank()
								if (GMrank == 'az') then
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cFFFFA500[Admin] |cffffff00["..player:GetName().."]: |cff00ff00"..text.."")
								elseif (GMrank == 'a') then
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cFFFFA500[GM] |cffffff00["..player:GetName().."]: |cff00ff00"..text.."")
								elseif (GMrank == 'v') then
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cFFFFA500[B-VIP] |cffffff00["..player:GetName().."]: |cff00ff00"..text.."")
									elseif (GMrank == 'vi') then
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cFFFFA500[S-VIP] |cffffff00["..player:GetName().."]: |cff00ff00"..text.."")
									elseif (GMrank == 'vip') then
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cFFFFA500[G-VIP] |cffffff00["..player:GetName().."]: |cff00ff00"..text.."")
									elseif (GMrank == 'vipd') then
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cFFFFA500[Diamond] |cffffff00["..player:GetName().."]: |cff00ff00"..text.."")
									elseif (GMrank == 'vg') then
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cFFFFA500[GMH] |cffffff00["..player:GetName().."]: |cff00ff00"..text.."")
								else 
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cff00ff00[A] |cffffff00["..player:GetName().."]: |cff00ff00"..text.."")
								end
							elseif (player:GetTeam() == 1) then -- Horde
								local GMrank = player:GetGmRank()
								if (GMrank == 'az') then
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cFFFFA500[Admin] |cffffff00["..player:GetName().."]: |cffff0000"..text.."")
								elseif (GMrank == 'a') then
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cFFFFA500[GM] |cffffff00["..player:GetName().."]: |cffff0000"..text.."")
								elseif (GMrank == 'v') then
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cFFFFA500[B-VIP] |cffffff00["..player:GetName().."]: |cffff0000"..text.."")
									elseif (GMrank == 'vi') then
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cFFFFA500[S-VIP] |cffffff00["..player:GetName().."]: |cffff0000"..text.."")
									elseif (GMrank == 'vip') then
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cFFFFA500[G-VIP] |cffffff00["..player:GetName().."]: |cffff0000"..text.."")
									elseif (GMrank == 'vipd') then
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cFFFFA500[Diamond] |cffffff00["..player:GetName().."]: |cffff0000"..text.."")
									elseif (GMrank == 'vg') then
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cFFFFA500[GMH] |cffffff00["..player:GetName().."]: |cffff0000"..text.."")
								else 
									v:SendBroadcastMessage("|cFF00FFFF[Infinity Chat] |cffff0000[H] |cffffff00["..player:GetName().."]: |cffff0000"..text.."")
								end
	
			end
		end
		return 0
	end	
	if (message == Commands) then
		if (player:CanUseCommand("a") == true) then
			player:SendBroadcastMessage("|cFFFF0000Other Commands:")
			player:SendBroadcastMessage("|cFF00FFFFVIP info: |cFFFFA500Type #vip commands - To see the powers of each VIP rank.")
			player:SendBroadcastMessage("|cFF00FFFFStaff List: |cFFFFA500Type #staff - To see the InfinityGaming administration team.")
			player:SendBroadcastMessage("|cFF00FFFFOnline Players: |cFFFFA500Type #server info - to see how many players is online.")
			player:SendBroadcastMessage("|cFF00FFFFUnstuck Command: |cFFFFA500Type #unstuck to get unstucked. If your dead type /g #unstuck.")
			player:SendBroadcastMessage("|cFF00FFFFGet To Mall: |cFFFFA500Type #Mall - to get to your mall.")
			player:SendBroadcastMessage("|cFF00FFFFRessurrect Your Self: |cFFFFA500Type #ressurrect - to get revived, but you need 1       |cFF00FFFF[Revive Stone]|cFFFFA500 or else it wont work.")
			player:SendBroadcastMessage("|cFFFF0000Chat Commands:")
			player:SendBroadcastMessage("|cFF00FFFF"..ChatMsg..": |cFFFFA500Type "..ChatMsg.." text to write in world chat.")
		else
			player:SendBroadcastMessage("|cFF00FFFFOther Commands:")
			player:SendBroadcastMessage("|cFF00FFFFVIP info: |cFFFFA500Type #vip commands - To see the powers of each VIP rank.")
			player:SendBroadcastMessage("|cFF00FFFFStaff List: |cFFFFA500Type #staff - To see the InfinityGaming administration team.")
			player:SendBroadcastMessage("|cFF00FFFFOnline Players: |cFFFFA500Type #online - to see how many players is online.")
			player:SendBroadcastMessage("|cFF00FFFFGet To Mall: |cFFFFA500Type #Mall - to get to your mall.")
			player:SendBroadcastMessage("|cFF00FFFFUnstuck Command: |cFFFFA500Type #unstuck to get unstucked. If your dead type /g #unstuck.")
			player:SendBroadcastMessage("|cFF00FFFFRessurrect Your Self: |cFFFFA500Type #ressurrect - to get revived, but you need 1       |cFF00FFFF[Revive Stone]|cFFFFA500 or else it wont work.")
			player:SendBroadcastMessage("|cFF00FFFFChat Commands:")
			player:SendBroadcastMessage("|cFF00FFFF"..ChatMsg..": |cFFFFA500Type "..ChatMsg.." text to write in world chat.")
		end
		return 0
	end		
end	

RegisterServerHook(16, "ChatSystem")