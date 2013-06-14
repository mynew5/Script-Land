local MSG_REVIVE = "#increase gold"

function IncreaseGoldOnChat(event, player, message, type, language)
	if(message == MSG_REVIVE) then
			local GMrank = player:GetGmRank()
			if (GMrank == "v") then
				player:AddItem(93330, 1)
				player:Emote(10)
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500Small Gold Pearl Added!")
			elseif (GMrank == "vi") then
				player:AddItem(93331, 1)
				player:Emote(10)
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500big Gold Pearl Added!")
			elseif (GMrank == "vip") then
				player:AddItem(93332, 1)
				player:Emote(10)
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500Large Gold Pearl Added!")
			elseif ((GMrank == "vipd") or (GMrank == "a") or (GMrank == "az") or (GMrank == "vg")) then
				player:AddItem(93334, 1)
				player:Emote(10)
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500Massive Gold Pearl Added!")
			else
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
				player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be VIP to use this command!")
		end
	end
end

RegisterServerHook(16, "IncreaseGoldOnChat")
