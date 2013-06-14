local MSG_REVIVE = "#ascent"

function AscentOnChat(event, player, message, type, language)
	if(message == MSG_REVIVE) then
		if (player:GetPlayerLevel() >= 150) then
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You cant use this command, your already level 150!")
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500Silver-VIP command, go donate on www.infinitygaming.org for VIP rank!!")
		else
			local GMrank = player:GetGmRank()
			if ((GMrank == "vi") or (GMrank == "vip")  or (GMrank == "a") or (GMrank == "az") or (GMrank == "vg")) then
				player:SetLevel(150)
				player:Emote(10)
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500Congratulations your now level 150!")
			else
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be SILVER-VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
				player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be SILVER-VIP to use this command!")
			end
		end
	end
end

RegisterServerHook(16, "AscentOnChat")
