local MSG_REVIVE = "#bronze"

function GearOnChat(event, player, message, type, language)
	if(message == MSG_REVIVE) then
		local GMrank = player:GetGmRank()
		if (GMrank == 'v') then
			player:AddItem(16453, 1)
			player:AddItem(16455, 1)
			player:AddItem(16457, 1)
			player:AddItem(33731, 1)
			player:AddItem(33729, 1)
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500Congratulations with your BRONZE DONOR gear!")
		else
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
			player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be VIP to use this command!")
		end
	end
end

RegisterServerHook(16, "GearOnChat")
