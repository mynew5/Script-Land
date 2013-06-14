local ChatMsg = "#d"
-- local Space = " "

function DeejChatSystem(event, player, message, type, language)
	if (message:find(ChatMsg.." ") == 1) then
		local text = message:gsub(ChatMsg.." ", "") 
				local plrs = GetPlayersInWorld()
				for k, v in pairs(plrs) do
								local GMname = player:GetName()
								if (GMname == 'deej') then
									v:SendBroadcastMessage("|cFFFF0000<Head-Admin Of Infinity>|cffffff00["..player:GetName().."]: |cFF00FFFF"..text.."")
								end
			end
		return 0
	end	
end

RegisterServerHook(16, "DeejChatSystem")