local MSG_REVIVE = "#grow"

function Level80OnChat(event, player, message, type, language)
	if(message == MSG_REVIVE) then
		if (player:GetPlayerLevel() >= 80) then
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You cant use this command, your already level 80!")
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
		else
			local GMrank = player:GetGmRank()
			if ((GMrank == "v") or (GMrank == "vi") or (GMrank == "vip")  or (GMrank == "a") or (GMrank == "az") or (GMrank == "vg")) then
				player:SetLevel(80)
				player:Emote(10)
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500Congratulations your now level 80!")
			else
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Bronze-VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
				player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Bronze-VIP to use this command!")
			end
		end
	end
end

RegisterServerHook(16, "Level80OnChat")
