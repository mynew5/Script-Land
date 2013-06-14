local MSG_HONOR = "#increase arena"

function ArenaOnChat(event, player, message, type, language)
	if(message == MSG_HONOR) then
			if (player:GetArenaPoints() >= 50000) then
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500Your arena points are at its max!")
			player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500Note: this is a VIP command. If you don't have this rank go donate on www.infinitygaming.org!")
			else
			local GMrank = player:GetGmRank()
			if GMrank == "vip"  or GMrank == "a" or GMrank == "az" or GMrank == "vg" or GMrank == "vipd" then
			player:AddArenaPoints(2500)
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500Added 2500 more arena points to your character.")
			else
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Gold-VIP or Diamond-VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
			player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Gold-VIP or Diamond-VIP to use this command!")
			end
		end
	end
end

RegisterServerHook(16, "ArenaOnChat")