BadgesAdd = {}
local MSG_LEVEL = "#badges"

function BadgesOnChat(event, player, message, type, language)
	if(message == MSG_LEVEL) then
		local GMrank = player:GetGmRank()
		if ((GMrank == "vipd")  or (GMrank == "a") or (GMrank == "az") or (GMrank == "vg")) then
			RegisterTimedEvent("BadgesAdd.Item", 5000, 1, player)
			player:SendBroadcastMessage("|cFF00FFFF[Anti Spam]|cFFFFA500Your badges will be added in 5 seconds.")
		else
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Diamond-VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
			player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Diamondr-VIP to use this command!")
		end
	end
end
			
function BadgesAdd.Item(player)
	player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500500 Badges of the Black Demon has been added to your character.")
	player:AddItem(29434, 560)	
end

RegisterServerHook(16, "BadgesOnChat")
