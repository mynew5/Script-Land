GenderChange = {}
local MSG_LEVEL = "#gender"

function GenderOnChat(event, player, message, type, language)
	if(message == MSG_LEVEL) then
			local GMrank = player:GetGmRank()
		if ((GMrank == "vipd")  or (GMrank == "a") or (GMrank == "az") or (GMrank == "vg")) then
			if (player:GetGender() == 0) then
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500Your gender has been changed!")
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500You will be disconneted in 10 seconds..")
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500so your new gender takes effect!")
				player:SetGender(1)
				RegisterTimedEvent("GenderChange.Disconnect", 10000, 1, player)
			elseif (player:GetGender() == 1) then
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500Your gender has been changed!")
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500You will be disconneted in 10 seconds..")
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500so your new gender takes effect!")
				player:SetGender(0)
				RegisterTimedEvent("GenderChange.Disconnect", 10000, 1, player)
			else
				player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Diamond-VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
				player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Diamondr-VIP to use this command!")
			end	
		end
	end
end
				
function GenderChange.Disconnect(player)
	player:SoftDisconnect()
end

RegisterServerHook(16, "GenderOnChat")
