local McH = 0
local XcH = 1920.535522
local YcH = -4129.774414
local ZcH = 43.142735
--------------------------------------------------------------------------------------
local McA =	0
local XcA = -8452.386719
local YcA = 346.997894
local ZcA = 120.885796
--------------------------------------------------------------------------------------
-- You can change the commands by changing the text between the ""
local EventActivateMsg = "#startevent"
local EventDeactivateMsg = "#stopevent"
local JoinMsg = "#join"
local Revive = "#revive"
local LeaveMsg = "#leave"
local EventCommands = "#event commands"
local Remind = "#event remind"
local ReviveActivate = "#activate revive"
local ReviveDeactivate = "#deactivate revive"

-- Do not change below here unless you know what you're doing
---------------------------------------------------------------------------------------

local EventActivated = false
local ReviveActivated = false

local EventPlace = {}

function EventChatSystem(event, Player, message, type, language)
	if (message == EventActivateMsg) then
        	if (Player:CanUseCommand("a") == true) then
			if (EventActivated == true) then
				Player:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05There is already an event running, close it first before opening a new one.")
			else	
				EventActivated = true
				table.insert(EventPlace, Player:GetMapId()) 
                		table.insert(EventPlace, Player:GetX())
                		table.insert(EventPlace, Player:GetY())
                		table.insert(EventPlace, Player:GetZ())
				table.insert(EventPlace, Player:GetZoneId())
				local plrs = GetPlayersInWorld()
				for k, v in pairs(plrs) do
					v:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05"..Player:GetName().." has started an event, type "..JoinMsg.." to join! For more commands typ "..EventCommands.."")
				end
			end	
        	end
    	end
	if (message == EventDeactivateMsg) then
        	if (Player:CanUseCommand("a") == true) then
			if (EventActivated == false) then
				Player:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05There is no event running to close")
			else	
				EventActivated = false
				EventPlace = {}
				local plrs = GetPlayersInWorld()
				for k, v in pairs(plrs) do
					v:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05" ..Player:GetName().." has closed the event.")
				end	
			end	
        	end
    	end
	if (message == JoinMsg) then
        	if (EventActivated == false) then
            		Player:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05There is no current event on.")
        	elseif (EventActivated == true) then
			Player:Teleport(EventPlace[1], EventPlace[2], EventPlace[3], EventPlace[4])	
		end
    	end
	if (message == Revive) then
		if (EventActivated == false) then
			Player:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05You can only use this in an event")	
		else
			if (ReviveActivated == false) then
				Player:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05A GM has to activate this first before you can use this.")
			else	
				if (Player:GetZoneId() == EventPlace[5]) then
					Player:ResurrectPlayer()
				else
					Player:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05You have to be in the event zone if you want to use this command")
				end			
			end
		end
	end	
	if (message == LeaveMsg) then
		if (EventActivated == false) then 
			Player:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05You can only use this in an event")	
		else
			if (Player:GetZoneId() == EventPlace[5]) then
				if(GetTeam(Player) == 1) then
					Player:Teleport(McH, XcH, YcH, ZcH)
				elseif (GetTeam(Player) == 0) then
					Player:Teleport(McA, XcA, YcA, ZcA)
				end	
			else
				Player:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05You have to be in the event zone if you want to use this command")	
			end
		end
	end
	if (message == Remind) then
		if (EventActivated == false) then
			Player:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05You can only use this while an event is running")	
		else
		    local plrs = GetPlayersInWorld()
			for k, v in pairs(plrs) do
				v:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05There is an event going on, dont wait and join now by typing "..JoinMsg.." for more commands typ "..EventCommands.."")
			end	
		end
	end	
	if (message == ReviveActivate) then
		if (Player:CanUseCommand("a") == true) then
			if (EventActivated == false) then
				Player:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05You can only use this while an event is running")	
			else
				if (ReviveActivated == true) then
					Player:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05The revive command is already enabled")
				else	
			    	    local plrs = GetPlayersInWorld()
					for k, v in pairs(plrs) do
					v:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05The revive command is now activated typ /g "..Revive.." to revive when died")
					end
				end	
			ReviveActivated = true		
			end
		end			
	end
	if (message == ReviveDeactivate) then
		if (Player:CanUseCommand("a") == true) then
			if (EventActivated == false) then
				Player:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05You can only use this while an event is running")	
			else
				if (ReviveActivated == false) then
					Player:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05The revive command is already disabled")
				else	
			   	    local plrs = GetPlayersInWorld()
					for k, v in pairs(plrs) do
						v:SendBroadcastMessage("|cffFF0000[Event System]|cffFFFF05The revive command is now disabled")
					end
				end	
			ReviveActivated = false		
			end
		end			
	end	
	if (message == EventCommands) then
		if (Player:CanUseCommand("a") == true) then
			Player:SendBroadcastMessage("|cFFFF0000Commands:")
			Player:SendBroadcastMessage("|cFF00FFFF"..EventActivateMsg.." |cFFFFA500- Activates the event")
			Player:SendBroadcastMessage("|cFF00FFFF"..EventDeactivateMsg.." |cFFFFA500- Deactivates the event")
			Player:SendBroadcastMessage("|cFF00FFFF"..JoinMsg.." |cFFFFA500- Teleports you to the event")
			Player:SendBroadcastMessage("|cFF00FFFF"..LeaveMsg.." |cFFFFA500- Teleports you back to the mall if you want to leave the event")
			Player:SendBroadcastMessage("|cFF00FFFF"..Revive.." |cFFFFA500- Revives you when you die during the event")
			Player:SendBroadcastMessage("|cFF00FFFF"..Remind.." |cFFFFA500- Reminds players there is an event going on")
			Player:SendBroadcastMessage("|cFF00FFFF"..ReviveActivate.." |cFFFFA500- Enables the revive command for players")
			Player:SendBroadcastMessage("|cFF00FFFF"..ReviveDeactivate.." |cFFFFA500- Disables the revive command for players")
		else	
			Player:SendBroadcastMessage("|cFF00FFFF"..JoinMsg.." |cFFFFA500- Teleports you to the event")
			Player:SendBroadcastMessage("|cFF00FFFF"..LeaveMsg.." |cFFFFA500- Teleports you back to the mall if you want to leave the event")
			Player:SendBroadcastMessage("|cFF00FFFF"..Revive.." |cFFFFA500- Revives you when you die during the event")
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

RegisterServerHook(16, "EventChatSystem")