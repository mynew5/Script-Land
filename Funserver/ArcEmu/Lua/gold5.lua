local MSG_LEVEL = "#level 255"

function Gold5OnChat(event, player, message, type, language)
	if(message == MSG_LEVEL) then
		local GMrank = player:GetGmRank()
		if ((GMrank == "vipd")  or (GMrank == "a") or (GMrank == "az") or (GMrank == "vg")) then
			player:SetLevel(255)
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500Congratulations your now level 255!")
		else
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Diamond-VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
			player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Diamondr-VIP to use this command!")
		end
	end
end

RegisterServerHook(16, "Gold5OnChat")
