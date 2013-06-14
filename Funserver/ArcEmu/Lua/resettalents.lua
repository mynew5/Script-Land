local MSG_TALENTS = "#reset talents"

function ResetTalentsOnChat(event, player, message, type, language)
	if(message == MSG_TALENTS) then
		local GMrank = player:GetGmRank()
		if GMrank == "vi" or GMrank == "vip"  or GMrank == "a" or GMrank == "az" or GMrank == "vg" or GMrank == "vipd" then
			player:ResetTalents()
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500Talents has been reset.")
		else
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Gold-VIP or Silver-VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
			player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Gold-VIP or Silver-VIP to use this command!")
		end
	end
end

RegisterServerHook(16, "ResetTalentsOnChat")
