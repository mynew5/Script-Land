local ChatMsg = "#k"
-- local Space = " "

function KibbleChatSystem(event, player, message, type, language)
	if (message:find(ChatMsg.." ") == 1) then
		local text = message:gsub(ChatMsg.." ", "") 
		local plrs = GetPlayersInWorld()
		for k, v in pairs(plrs) do
			local GMname = player:GetName()
			if (GMname == 'Kibble') then
				v:SendBroadcastMessage("|cFFFF0000<Head Dev. Of Infinity>|cffffff00["..player:GetName().."]: |cFF00FFFF"..text.."")
			end
		end
	return 0
	end	
end

RegisterServerHook(16, "KibbleChatSystem")
