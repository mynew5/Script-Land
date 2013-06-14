local MSG_REVIVE = "#mall"

function MallOnChat(event, player, message, type, language)
	if(message == MSG_REVIVE) then
		if(player:GetPlayerLevel() <= 20) then
			player:SendBroadcastMessage("|cFF00FFFF[Teleport System]|cFFFFA500You must be level 20 to access this command!")
			player:SendAreaTriggerMessage("|cFF00FFFF[Teleport System]|cFFFFA500You must be level 20 to access this command!")
		else
			if (player:IsInCombat() == true) then
				player:SendBroadcastMessage("|cFF00FFFF[Teleport System]|cFFFFA500you cant use this in combat!")
				player:SendAreaTriggerMessage("|cFF00FFFF[Teleport System]|cFFFFA500you cant use this in combat!")
			else
				if race==2 or race==5 or race==6 or race==8 or race==10 then
					player:Teleport(1, 1920.535522, -4129.774414, 43.142735)
					player:SendBroadcastMessage("|cFF00FFFF[Teleport System]|cFFFFA500|cFFFFA500Teleportation complete!")
					player:SendBroadcastMessage("|cffFF0000[Reminder]|cffFFFF05Don't forget to support our server by |cffFF0000voting|cffFFFF05 and |cffFF0000donating|cffFFFF05 on |cffFF0000www.infinitygaming.org!")
				local race=player:GetPlayerRace()
				elseif race==1 or race==3 or race==4 or race==7 or race==11 then
					player:Teleport(0, -8452.386719, 346.997894, 120.885796)
					player:SendBroadcastMessage("|cFF00FFFF[Teleport System]|cFFFFA500|cFFFFA500Teleportation complete!")
					player:SendBroadcastMessage("|cffFF0000[Reminder]|cffFFFF05Don't forget to support our server by |cffFF0000voting|cffFFFF05 and |cffFF0000donating|cffFFFF05 on |cffFF0000www.infinitygaming.org!")
				end
			end		
		end
	end
end

RegisterServerHook(16, "MallOnChat")
