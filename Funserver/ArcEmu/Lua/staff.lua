local MSG_ONLINE = "#staff"

function PlayersOnlineOnChat(event, plr, message, type, language)
	if(message == MSG_ONLINE) then
		if (Size == 1) then
			plr:SendBroadcastMessage("|cFFFFA500[Server Owner]|cFF00FFFFXGames-WoW Owner: |cFFFFA500EvoX I Strew")
			plr:SendBroadcastMessage("|cFFFFA500[Co-Owners]|cFF00FFFFCo-Owners: |cFFFFA500Zeus |cFF00FFFFand |cFFFFA500Eismann.")
			plr:SendBroadcastMessage("|cFFFFA500[Head Admin]|cFF00FFFFHead Admin: |cFFFFA500Atraxx.")
			plr:SendBroadcastMessage("|cFFFFA500[Admins]|cFF00FFFFAdmins: |cFFFFA500Atraxx |cFF00FFFF")
			plr:SendBroadcastMessage("|cFFFFA500[Core Developers]|cFF00FFFFCore Developers: |cFFFFA500Kibblebit |cFF00FFFF& |cFFFFA500Ahlmo")
			plr:SendBroadcastMessage("|cFFFFA500[Website Developers]|cFF00FFFFWebsite Developers: |cFFFFA500EvoX I Strew.|cFF00FFFF ")
			plr:SendBroadcastMessage("|cFFFFA500[GameMasters]|cFF00FFFFGameMasters: |cFFFFA500Darkside & Vendetta.")
			plr:SendBroadcastMessage("|cFFFFA500[Novice GMs]|cFF00FFFFNovice GMs: |cFFFFA500Magnus |cFF00FFFFand |cFFFFA500Chloe.")
			plr:SendBroadcastMessage("|cffFF0000[Reminder]|cffFFFF05Don't forget to support our server by |cffFF0000voting|cffFFFF05 and |cffFF0000donating|cffFFFF05 on |cffFF0000www.infinitygaming.org!")
		else
			plr:SendBroadcastMessage("|cFFFFA500[Server Owner]|cFF00FFFFXGames-WoW Owner: |cFFFFA500EvoX I Strew")
			plr:SendBroadcastMessage("|cFFFFA500[Co-Owners]|cFF00FFFFCo-Owners: |cFFFFA500Zeus |cFF00FFFFand |cFFFFA500Eismann.")
			plr:SendBroadcastMessage("|cFFFFA500[Head Admin]|cFF00FFFFHead Admin: |cFFFFA500Atraxx.")
			plr:SendBroadcastMessage("|cFFFFA500[Admins]|cFF00FFFFAdmins: |cFFFFA500Atraxx |cFF00FFFF")
			plr:SendBroadcastMessage("|cFFFFA500[Core Developers]|cFF00FFFFCore Developers: |cFFFFA500Kibblebit |cFF00FFFF& |cFFFFA500Ahlmo")
			plr:SendBroadcastMessage("|cFFFFA500[Website Developers]|cFF00FFFFWebsite Developers: cFF00FFFFWebsite Developers: |cFFFFA500EvoX I Strew.")
			plr:SendBroadcastMessage("|cFFFFA500[GameMasters]|cFF00FFFFGameMasters: |cFFFFA500Darkside & Vendetta.")
			plr:SendBroadcastMessage("|cFFFFA500[Novice GMs]|cFF00FFFFNovice GMs: |cFFFFA500Mario |cFF00FFFFand |cFFFFA500Chloe.")
			plr:SendBroadcastMessage("|cffFF0000[Reminder]|cffFFFF05Don't forget to support our server by |cffFF0000voting|cffFFFF05 and |cffFF0000donating|cffFFFF05 on |cffFF0000www.infinitygaming.org!")
		end
	end
end

RegisterServerHook(16, "PlayersOnlineOnChat")
