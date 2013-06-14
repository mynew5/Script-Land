local MSG_HONOR = "#increase honor"

function HonorOnChat(event, player, message, type, language)
	if(message == MSG_HONOR) then
		if (player:GetTotalHonor() >= 70000) then
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500Your honor is at its max!")
			player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500Note: this is a Gold command. If you don't have this rank go donate on www.infinitygaming.org!")
		else
			local GMrank = player:GetGmRank()
			if ((GMrank == "vip") or (GMrank == "vipd") or (GMrank == "a") or (GMrank == "az") or (GMrank == "vg")) then
				player:GiveHonor(2500)
				player:Emote(10)
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500Added 2500 more honor to your character.")
			else
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Gold-VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
				player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Gold-VIP to use this command!")
			end
		end
	end
end

RegisterServerHook(16, "HonorOnChat")
