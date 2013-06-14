local MSG_REVIVE = "#class"

function ClassOnChat(event, player, message, type, language)
	if(message == MSG_REVIVE) then
		if (player:IsInCombat() == true) then
			player:SendAreaTriggerMessage("|cFF00FFFF[VIP Class]|cFFFFA500You can't use this command in combat!")
			player:SendBroadcastMessage("|cFF00FFFF[VIP Class]|cFFFFA500Note: VIP command. If you arent a VIP go to www.infinitygaming.org and donate for it to unlock this mall!")
		else
			if (player:GetPlayerLevel() <= 80) then
				player:SendAreaTriggerMessage("|cFF00FFFF[VIP Class]|cFFFFA500You must be atleast level 80 to use this command!")
				player:SendBroadcastMessage("|cFF00FFFF[VIP Class]|cFFFFA500Note: VIP command. If you arent a VIP go to www.infinitygaming.org and donate for it to unlock this mall!")
			else
				local GMrank = player:GetGmRank()
				if ((GMrank == "v") or (GMrank == "vi") or (GMrank == "vip")  or (GMrank == "a") or (GMrank == "az") or (GMrank == "vg") or (GMrank == "vipd")) then
					player:Teleport(0, 1985.969971, 2543.239990, 131.253006)
					player:SendBroadcastMessage("|cffFF0000[Reminder]|cffFFFF05Don't forget to support our server by |cffFF0000voting|cffFFFF05 and |cffFF0000donating|cffFFFF05 on |cffFF0000www.infinitygaming.org!")
					player:SendBroadcastMessage("|cFF00FFFF[VIP Class]|cFFFFA500|cFFFFA500Welcome to VIP class room. When announced, you can learn about your rank and earn reward!")
				else
					player:SendBroadcastMessage("|cFF00FFFF[VIP Class]|cFFFFA500|cFFFFA500You must be VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
					player:SendAreaTriggerMessage("|cFF00FFFF[VIP Class]|cFFFFA500|cFFFFA500You must be VIP to use this command!")
				end
			end
		end
	end
end

RegisterServerHook(16, "ClassOnChat")
