local MSG_ONLINE = "#staff"

function PlayersOnlineOnChat(event, plr, message, type, language)
if(message == MSG_ONLINE) then
			if (Size == 1) then
					plr:SendBroadcastMessage("|cFFFFA500[Server Owner]|cFF00FFFFInfinityGaming Owner: |cFFFFA500Nexus")
					plr:SendBroadcastMessage("|cFFFFA500[Co-Owners]|cFF00FFFFCo-Owners: |cFFFFA500Lee |cFF00FFFFand |cFFFFA500Kibblebit.")
					plr:SendBroadcastMessage("|cFFFFA500[Head Admin]|cFF00FFFFHead Admin: |cFFFFA500Deej.")
					plr:SendBroadcastMessage("|cFFFFA500[Admins]|cFF00FFFFAdmins: |cFFFFA500Drakonis |cFF00FFFF")
					plr:SendBroadcastMessage("|cFFFFA500[Core Developers]|cFF00FFFFCore Developers: |cFFFFA500Kibblebit |cFF00FFFF& |cFFFFA500Ahlmo")
					plr:SendBroadcastMessage("|cFFFFA500[Website Developers]|cFF00FFFFWebsite Developers: |cFFFFA500None.|cFF00FFFF Apply for website developer on forum.")
					plr:SendBroadcastMessage("|cFFFFA500[GameMasters]|cFF00FFFFGameMasters: |cFFFFA500Minichez |cFF00FFFFand |cFFFFA500Roxx.")
					plr:SendBroadcastMessage("|cFFFFA500[Novice GMs]|cFF00FFFFNovice GMs: |cFFFFA500Magnus |cFF00FFFFand |cFFFFA500Chloe.")
					plr:SendBroadcastMessage("|cffFF0000[Reminder]|cffFFFF05Don't forget to support our server by |cffFF0000voting|cffFFFF05 and |cffFF0000donating|cffFFFF05 on |cffFF0000www.infinitygaming.org!")
				else
					plr:SendBroadcastMessage("|cFFFFA500[Server Owner]|cFF00FFFFInfinityGaming Owner: |cFFFFA500Nexus")
					plr:SendBroadcastMessage("|cFFFFA500[Co-Owners]|cFF00FFFFCo-Owners: |cFFFFA500Lee |cFF00FFFFand |cFFFFA500Kibblebit.")
					plr:SendBroadcastMessage("|cFFFFA500[Head Admin]|cFF00FFFFHead Admin: |cFFFFA500Deej.")
					plr:SendBroadcastMessage("|cFFFFA500[Admins]|cFF00FFFFAdmins: |cFFFFA500Drakonis |cFF00FFFF")
					plr:SendBroadcastMessage("|cFFFFA500[Core Developers]|cFF00FFFFCore Developers: |cFFFFA500Kibblebit |cFF00FFFF& |cFFFFA500Ahlmo")
					plr:SendBroadcastMessage("|cFFFFA500[Website Developers]|cFF00FFFFWebsite Developers: |cFFFFA500None.|cFF00FFFF Apply for website developer on forum.")
					plr:SendBroadcastMessage("|cFFFFA500[GameMasters]|cFF00FFFFGameMasters: |cFFFFA500Minichez |cFF00FFFFand |cFFFFA500Roxx |cFF00FFFFand |cFFFFA500Imanato.")
					plr:SendBroadcastMessage("|cFFFFA500[Novice GMs]|cFF00FFFFNovice GMs: |cFFFFA500Mario |cFF00FFFFand |cFFFFA500Chloe.")
					plr:SendBroadcastMessage("|cffFF0000[Reminder]|cffFFFF05Don't forget to support our server by |cffFF0000voting|cffFFFF05 and |cffFF0000donating|cffFFFF05 on |cffFF0000www.infinitygaming.org!")
				end
		end
end

RegisterServerHook(16, "PlayersOnlineOnChat")