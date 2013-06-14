local MSG_LEVEL = "#level 80"

function Gold1OnChat(event, player, message, type, language)
	if(message == MSG_LEVEL) then
		local GMrank = player:GetGmRank()
		if ((GMrank == "vip")  or (GMrank == "a") or (GMrank == "az") or (GMrank == "vg") or (GMrank == "vipd")) then
			player:SetLevel(80)
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500Congratulations your now level 80!")
		else
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Gold-VIP or Silver-VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
			player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Gold-VIP or Silver-VIP to use this command!")
		end
	end
end

RegisterServerHook(16, "Gold1OnChat")
