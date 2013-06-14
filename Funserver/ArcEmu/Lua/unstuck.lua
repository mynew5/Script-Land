-----Local--------
local MSG_UNSTUCK = "#unstuck"

----FUNCTION-------
function GetTeam(Player)
  local r = Player:GetPlayerRace()
	if ((r == 2) or (r == 5) or (r == 6) or (r == 8) or (r == 10)) then -- horde
		return 1
	elseif ((r == 1) or (r == 3) or (r == 4) or (r == 7) or (r == 11)) then -- ally
		return 0
	end
end

function OnChat(event, player, message, type, language)
	if(message == MSG_UNSTUCK) then
		if (player:IsInCombat() == true) then
			player:SendAreaTriggerMessage("You are in combat!")
		else
            		if(GetTeam(player) == 1) then
				player:SendBroadcastMessage("|cffFF0000[Reminder]|cffFFFF05Don't forget to support our server by |cffFF0000voting|cffFFFF05 and |cffFF0000donating|cffFFFF05 on |cffFF0000www.infinitygaming.org!")
				player:SendBroadcastMessage("|cffFF0000[Unstucker]|cffFFFF05You have been unstucked, and sended back to your starting posistion.")
				player:Teleport(1, 7431.649414, -1679.512573, 194.571991) --- horde start
            		elseif(GetTeam(player) == 0) then
				player:SendBroadcastMessage("|cffFF0000[Reminder]|cffFFFF05Don't forget to support our server by |cffFF0000voting|cffFFFF05 and |cffFF0000donating|cffFFFF05 on |cffFF0000www.infinitygaming.org!")
				player:SendBroadcastMessage("|cffFF0000[Unstucker]|cffFFFF05You have been unstucked, and sended back to your starting posistion.")
				player:Teleport(1, 4632.953125, -3831.117188, 943.374512) --- Ally start
			end
		end
	end
end	

RegisterServerHook(16, "OnChat")
