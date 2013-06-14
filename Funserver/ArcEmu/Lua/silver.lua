local MSG_REVIVE = "#silver"

function SilverOnChat(event, player, message, type, language)
	if(message == MSG_REVIVE) then
		local GMrank = player:GetGmRank()
		if (GMrank == 'vi') then
			player:AddItem(28987, 1)
			player:AddItem(28988, 1)
			player:AddItem(28985, 1)
			player:AddItem(28684, 1)
			player:AddItem(28686, 1)
			player:AddItem(28687, 1)
			player:AddItem(28688, 1)
			player:AddItem(28685, 1)
			player:AddItem(28986, 1)
			player:Emote(10)
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500Congratulations with your SILVER DONOR gear!")
		else
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
			player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be VIP to use this command!")
		end
	end
end

RegisterServerHook(16, "SilverOnChat")
