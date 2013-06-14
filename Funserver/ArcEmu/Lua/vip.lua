local MSG_COMMAND = "#vip commands"

function VIPCommandsOnChat(event, player, message, type, language)
	if(message == MSG_COMMAND) then
		player:SendBroadcastMessage("|cFFFF0000Bronze Rank Commands:")
		player:SendBroadcastMessage("|cFF00FFFFType #bronze commands - To see all bronze commands.")
		player:SendBroadcastMessage("|cFFFF0000Silver Rank Commands:")
		player:SendBroadcastMessage("|cFF00FFFFType #silver commands - To see all silver commands.")
		player:SendBroadcastMessage("|cFFFF0000Gold Rank Commands:")
		player:SendBroadcastMessage("|cFF00FFFFType #gold commands - To see all gold commands.")
		player:SendBroadcastMessage("|cFFFF0000Diamond Rank Commands:")
		player:SendBroadcastMessage("|cFF00FFFFType #diamond commands - To see all DIAMOND commands.")
		player:SendBroadcastMessage("|cffFF0000[Reminder]|cffFFFF05Don't forget to support our server by |cffFF0000voting|cffFFFF05 and |cffFF0000donating|cffFFFF05 on |cffFF0000www.infinitygaming.org!")
	end
end
	
RegisterServerHook(16, "VIPCommandsOnChat")
