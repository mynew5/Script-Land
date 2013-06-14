local MSG_REVIVE = "#gold"

function GoldOnChat(event, player, message, type, language)
	if(message == MSG_REVIVE) then
		local GMrank = player:GetGmRank()
		if (GMrank == 'vip') then
			player:AddItem(28069, 1)
			player:AddItem(28679, 1)
			player:AddItem(28681, 1)
			player:AddItem(28680, 1)
			player:AddItem(28724, 1)
			player:AddItem(28683, 1)
			player:AddItem(15813, 1)
			player:AddItem(29811, 1)
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500Congratulations with your GOLD DONOR gear!")
		else
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
			player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be VIP to use this command!")
		end
	end
end

RegisterServerHook(16, "GoldOnChat")
