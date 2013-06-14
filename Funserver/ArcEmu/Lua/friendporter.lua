
local PortItem = 98080  			-- Put the itemID here
local FriendPorterActivated = true

function FriendporterOnUse(pUnit, event, player)
	if (player:CanUseCommand("az") == true) then
		pUnit:GossipCreateMenu(44, player, 0)
		pUnit:GossipMenuAddItem(10, "-INFINITYWOW FRIENDPORT SYSTEM-", 2, 0)
		pUnit:GossipMenuAddItem(10, "|cFF0000A0Insert the name of the friend", 1, 1)
		pUnit:GossipMenuAddItem(10, "|cFF0000A0Disable/Enable the friendporter", 3, 0)	
		pUnit:GossipMenuAddItem(10, "No thanks", 2, 0)
		pUnit:GossipSendMenu(player)
	else
		if (player:IsInCombat() == true) then
		player:SendAreaTriggerMessage("Good try idiot, you can't use this in combat!")
		else
		pUnit:GossipCreateMenu(44, player, 0)
		pUnit:GossipMenuAddItem(10, "-INFINITYWOW FRIENDPORT SYSTEM-", 2, 0)
		pUnit:GossipMenuAddItem(10, "|cFF0000A0Insert the name of your friend", 1, 1)
		pUnit:GossipMenuAddItem(10, "No thanks", 2, 0)
		pUnit:GossipSendMenu(player)
	end	
end	
end

function FriendporterOnSelect(pUnit, event, player, id, intid, code, pMisc)
	if (intid == 1) then
		if (player:IsInCombat() == false) then
			if (FriendPorterActivated == true) then
				if (player:IsFFAPvPFlagged() == false) then 
					local plrs = GetPlayersInWorld()
					for k, v in pairs(plrs) do
						if (v:GetName() == code) then
							local name = v:GetName()
							if (GetTeam(player) == GetTeam(v)) then
								if (v:IsFFAPvPFlagged() == false) then 
									if (v:CanUseCommand("ga") == false) then
										local MapId, X, Y, Z = v:GetMapId(), v:GetX(), v:GetY(), v:GetZ();
										player:Teleport(MapId, X, Y, Z)
									v:SendBroadcastMessage("|cFF00FFFF[Friendporter]|cFFFFA500 "..player:GetName().." is appearing to you.")
										player:GossipComplete()
									else
										player:SendBroadcastMessage("|cFF00FFFF[Friendporter]|cFFFFA500This player is a |cffFF0000GM |cFFFFA500or |cffFF0000Admin |cFFFFA5005and you will not be able to appear at his location!")
										player:GossipComplete()
									end

								else
									player:SendBroadcastMessage("|cFF00FFFF[Friendporter]|cFFFFA500This player is currently in |cffFF0000FFA |cffFFFF05flagged, and you will not be able to appear at his location!")
									player:GossipComplete()
								end
							else
								player:SendBroadcastMessage("|cFF00FFFF[Friendporter]|cFFFFA500You cannot teleport to a player from the opposite faction!")
								player:GossipComplete()
							end		
						else
							player:GossipComplete()
						end
					end
				else
					player:SendBroadcastMessage("|cFF00FFFF[Friendporter]|cFFFFA500You cant use this while you are in an |cffFF0000arena!")
					player:GossipComplete()
				end	
			else
				player:SendBroadcastMessage("|cFF00FFFF[Friendporter]|cFFFFA500The friendporter is disabled by an |cffFF0000Admin |cffFFFF05at this moment!")
				player:GossipComplete()
			end
		else
			player:SendAreaTriggerMessage("|cFF00FFFF[Friendporter]|cFFFFA500You are in combat!")
			player:SendBroadcastMessage("|cFF00FFFF[Friendporter]|cFFFFA500You can't use this in combat!")
			player:GossipComplete()
		end	
	elseif (intid == 2) then
		player:GossipComplete()
	elseif (intid == 3) then
		if (FriendPorterActivated == true) then
			FriendPorterActivated = false
			local plrs = GetPlayersInWorld()
			for k, v in pairs(plrs) do 
				v:SendBroadcastMessage("|cffFF0000[Server Announce]|cffFFFF05The Friendporter has been disabled by "..player:GetName().."")
				player:GossipComplete()
			end
		else
			FriendPorterActivated = true
			local plrs = GetPlayersInWorld()
			for k, v in pairs(plrs) do 
				v:SendBroadcastMessage("|cffFF0000[Server Announce]|cffFFFF05The Friendporter has been enabled by "..player:GetName().."")
				player:GossipComplete()
			end
		end
	end	
end	
				
function GetTeam(Player)
  local r = Player:GetPlayerRace()
	if (r == 2 or r == 5 or r == 6 or r == 8 or r == 10) then -- horde
		return 1
	elseif (r == 1 or r == 3 or r == 4 or r == 7 or r == 11) then -- ally
		return 0
	end
end	

RegisterItemGossipEvent(98080, 1, "FriendporterOnUse")
RegisterItemGossipEvent(98080, 2, "FriendporterOnSelect")