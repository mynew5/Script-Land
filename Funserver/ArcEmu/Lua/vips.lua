local MSG_ONLINE = "#vips"

function OnlineOnChat(event, plr, message, type, language)
	if(message == MSG_ONLINE) then
		if (Size == 1) then
			plr:SendBroadcastMessage("|cFFFFA500[Diamond VIPs]|cFF00FFFFCurrent Diamond VIPs: |cFFFFA5002 players.")
			plr:SendBroadcastMessage("|cFFFFA500[Gold VIPs]|cFF00FFFFCurrent Gold VIPs: |cFFFFA5008 players.")
			plr:SendBroadcastMessage("|cFFFFA500[Silver VIPs]|cFF00FFFFCurrent Silver VIPs: |cFFFFA5003 players.")				plr:SendBroadcastMessage("|cFFFFA500[Bronze VIPs]|cFF00FFFFCurrent Bronze VIPs: |cFFFFA5004 players.")
			plr:SendBroadcastMessage("|cFFFFA500Updating...|cFF00FFFFThis list updates every hour.")
			plr:SendBroadcastMessage("|cffFF0000[Reminder]|cffFFFF05Don't forget to support our server by |cffFF0000voting|cffFFFF05 and |cffFF0000donating|cffFFFF05 on |cffFF0000www.infinitygaming.org!")
		else
			plr:SendBroadcastMessage("|cFFFFA500[Diamond VIPs]|cFF00FFFFCurrent Diamond VIPs: |cFFFFA5002 players.")
			plr:SendBroadcastMessage("|cFFFFA500[Gold VIPs]|cFF00FFFFCurrent Gold VIPs: |cFFFFA5008 players.")
			plr:SendBroadcastMessage("|cFFFFA500[Silver VIPs]|cFF00FFFFCurrent Silver VIPs: |cFFFFA5003 players.")
			plr:SendBroadcastMessage("|cFFFFA500[Bronze VIPs]|cFF00FFFFCurrent Bronze VIPs: |cFFFFA5004 players.")
			plr:SendBroadcastMessage("|cFFFFA500Updating...|cFF00FFFFThis list updates every hour.")
			plr:SendBroadcastMessage("|cffFF0000[Reminder]|cffFFFF05Don't forget to support our server by |cffFF0000voting|cffFFFF05 and |cffFF0000donating|cffFFFF05 on |cffFF0000www.infinitygaming.org!")
		end
	end
end

RegisterServerHook(16, "OnlineOnChat")
