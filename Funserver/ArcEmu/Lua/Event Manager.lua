----------------------------------------------------
-- Event System. By Rakkorz - ZxOxZ. From Ac-Web. --
----------------------------------------------------

MallMapID = 0
MallX = 0.0
MallY = 0.0
MallZ = 0.0

----------------------------------------------------

EVENT = {}
EventPlace = {}
GmNotes = {}

----------------------------------------------------

EVENT.ActivateCommand = "#event activate"
EVENT.DeactivateCommand = "#event deactivate"
EVENT.SetLocation = "#event localization"
EVENT.JoinCommand = "#event join"
EVENT.LeaveCommand = "#event leave"
EVENT.CommandsList = "#event info"
EVENT.GmCommandsList = "#event gminfo"
EVENT.CheckStatus = "#event check"
EVENT.GmNotes = "#event setnotes"
EVENT.GetGmNotes = "#event notes"
EVENT.GmCheckNotes = "#event gmchecknotes"
EVENT.ReviveCommand = "#event revive"
EVENT.ReviveActivate = "#revive activate"
EVENT.ReviveDeactivate = "#revive deactivate"

----------------------------------------------------

local Activate = 0
local Joined = 0
local Revive = 0
local CooldownRevive = 0

----------------------------------------------------

function EVENT.OnChat(event, player, message, type, language)
	local EventMessage = message:lower()
		if (EventMessage:find(EVENT.ActivateCommand) == 1) then
			if (player:GetGmRank() == 'a') or (player:GetGmRank() == 'az') then
				if (Activate == 0) then
							Activate = 1
							Joined = 0
									print ("The Event System has been activated by: "..player:GetName().."!")
									SendWorldMessage("|CFF00ff6c|CFF00ff6c[Event System]|r|r - The Event System has been activated by "..player:GetName()..". You can join using by #Event Join!", 2)
									player:SendBroadcastMessage("|CFffba000You have activated the Event System!|r")
								table.insert(EventPlace, player:GetMapId()) 
								table.insert(EventPlace, player:GetX())
								table.insert(EventPlace, player:GetY())
								table.insert(EventPlace, player:GetZ())
								table.insert(EventPlace, player:GetO())
								table.insert(EventPlace, player:GetZoneId())
									return 0
				else
				player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - The Event System is already activated, you can Deactivate it by using "..EVENT.DeactivateCommand.."!")
				return 0
				end
			end
		end
				if (EventMessage:find(EVENT.DeactivateCommand) == 1) then
			if (player:GetGmRank() == 'a') or (player:GetGmRank() == 'az') then
				if (Activate == 1) then
							Joined = 0
							Activate = 0
								EventPlace[1] = nil
								EventPlace[2] = nil
								EventPlace[3] = nil
								EventPlace[4] = nil
								EventPlace[5] = nil
								EventPlace[6] = nil
									print ("The Event System has been deactivated by "..player:GetName().."!")							
									SendWorldMessage("|CFF00ff6c[Event System]|r - The Event System has been deactivated by "..player:GetName().."!", 2)
									player:SendBroadcastMessage("|CFffba000You have deactivated the Event System!|r")
									return 0
				else
				player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - The Event System is already deactivated, you can Activate it by using "..EVENT.ActivateCommand.."!")
				return 0
				end
			end
				end
				if (EventMessage:find(EVENT.SetLocation) == 1) then
					if (player:GetGmRank() == 'a') or (player:GetGmRank() == 'az') then
				if (Activate == 1) then
								Joined = 0
								EventPlace[1] = nil
								EventPlace[2] = nil
								EventPlace[3] = nil
								EventPlace[4] = nil
								EventPlace[5] = nil
								EventPlace[6] = nil
								table.insert(EventPlace, player:GetMapId()) 
								table.insert(EventPlace, player:GetX())
								table.insert(EventPlace, player:GetY())
								table.insert(EventPlace, player:GetZ())
								table.insert(EventPlace, player:GetO())
								table.insert(EventPlace, player:GetZoneId())
					player:SendBroadcastMessage("|CFffba000You have changed the Event Place, now players will teleport here, by using the Join Command!|r")
					return 0
				else
				player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - You can't choose a place while the Event System is deactivated!")
				return 0
				end
					end
				end
				if (EventMessage:find(EVENT.JoinCommand) == 1) then
					if (player:IsInCombat() == true) then
						player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - You can't teleport to Event while you are in combat!")
						return 0
					else
					if (Activate == 1) then
						if (Joined == 1) then
							player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - You can join to the Event only one per Event!")
							return 0
						else
						if (Joined == 0) then
							player:Teleport(EventPlace[1], EventPlace[2], EventPlace[3], EventPlace[4])
							player:SetFacing(EventPlace[5])
							player:SetOrientation(EventPlace[5])
							player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - Welcome to Event!")
								Joined = 1
						return 0
						end
						end
					else
						player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - The Event System is deactivated, you can't join right now! You have to wait for a Game Master to Activate it!")
						return 0
					end
				end
				end
				if (EventMessage:find(EVENT.LeaveCommand) == 1) then
				if (player:IsInCombat() == true) then
						player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - You can't teleport to Event while you are in combat!")
						return 0
					else
					if (Activate == 1) then
						player:Teleport(MallMapID, MallX, MallY, MallZ)
						player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - The Event System is deactivated! And you can't Teleport now!")
						return 0
					else
					if (Activate == 0) then
						player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - There is no Event Activated at the moment! You can use that Command only when the Event System is activated!")
						return 0
					end
					end
				end
				end
				if (EventMessage:find(EVENT.CheckStatus) == 1) then
					if (Activate == 1) then
						player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - The Event is Activated!")
						return 0
					else
					if (Activate == 0) then
						player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - There is no Activated Event at the Moment!")
						return 0
					end
					end
				end
				if (EventMessage:find(EVENT.CommandsList) == 1) then
					player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - Commands List:")
					player:SendBroadcastMessage("(|CFFffba00#Event Join|r) - Teleport you to Event, only when the Event System is Activated!")
					player:SendBroadcastMessage("(|CFFffba00#Event Leave|r) - Teleport you to Mall, only when the Event System is Activated!")
					player:SendBroadcastMessage("(|CFFffba00#Event Check|r) - Check if the Event System is Activated or Deactivated!")
					player:SendBroadcastMessage("(|CFFffba00#Event Revive|r) - To Revive yourself. That is working only if the Revive Command is Activated by a Gm! - Cooldown 30 Seconds!")
					player:SendBroadcastMessage("(|CFFffba00#Event Notes|r) - See Gm Notes!")
					player:SendBroadcastMessage("(|CFFffba00#Event Info|r) - See Commands List!")
					return 0
				end
				if (EventMessage:find(EVENT.GmCommandsList) == 1) then
					if (player:GetGmRank() == 'a') or (player:GetGmRank() == 'az') then
						player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - Game Master Commands List:")
						player:SendBroadcastMessage("(|CFFffba00#Event Activate|r) - To Activate the Event System!")
						player:SendBroadcastMessage("(|CFFffba00#Event Deactivate|r) - To Deactivate the Event System!")
						player:SendBroadcastMessage("(|CFFffba00#Event Localization|r) - To Change Event Coords!")
						player:SendBroadcastMessage("(|CFFffba00#Event SetNotes|r) - To set Event Notes for players!")
						player:SendBroadcastMessage("(|CFFffba00#Event GmCheckNotes|r) - To check if there are already any Gm Notes for Players!")
						player:SendBroadcastMessage("(|CFFffba00#Revive Activate|r) - To Activate Revive Command!")
						player:SendBroadcastMessage("(|CFFffba00#Revive Deactivate|r) - To Deactivate Revive Command!")
						player:SendBroadcastMessage("(|CFFffba00#Event Info|r) - For Normal Players Commands!")
						return 0
					end
				end
				if (message:find(EVENT.GmNotes.." ") == 1) then
					if (player:GetGmRank() == 'a') or (player:GetGmRank() == 'az') then
						local String = message:gsub(EVENT.GmNotes.." ", "")
							local GmName1 = player:GetName()
						GmNotes[1] = nil
						GmNotes[2] = nil
						table.insert(GmNotes, String)
						table.insert(GmNotes, GmName1)
						player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - You have set a new Gm Note: '"..String.."'.")
						return 0
					end
				end
				if (message:find(EVENT.GetGmNotes) == 1) then
					if ((GmNotes[1] and GmNotes[2]) == nil) then
						player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - There are no Gm Notes at the moment!")
						return 0
					else
					player:SendBroadcastMessage("|CFF00ff6c"..GmNotes[2].."|r - "..GmNotes[1].."!")
					return 0
				end
				end
				if (EventMessage:find(EVENT.GmCheckNotes) == 1) then
					if (player:GetGmRank() == 'a') or (player:GetGmRank() == 'az') then
						if ((GmNotes[1] and GmNotes[2]) == nil) then
							player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - There are no Gm Notes at the moment!")
								return 0
						else
							player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - There are Gm Notes, set by "..GmNotes[2]..", to see the Notes, use #Event Notes!")
								return 0
						end
					end
				end
				if (EventMessage:find(EVENT.ReviveCommand) == 1) then
					if (Revive == 0) then
						player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - Revive System is not activated, and you can't use that command yet.")
						return 0
					else
					if (Revive == 1) then
						if (player:IsDead() == false) then
							player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - You are not dead!")
							return 0
						else
							if (CooldownRevive == 1) then
								player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - The Revive Commands is on Cooldown!")
							else
							if (CooldownRevive == 0) then
						if (player:IsDead() == true) then
						if (player:GetZoneId() == EventPlace[6]) then
						player:ResurrectPlayer()
						player:CastSpell(61613)
						player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - You have just Resurrected yourself! You will can use that Command again in 30 Seconds!")
						RegisterTimedEvent("EVENT.ReviveCooldown", 30000, 1)
						CooldownRevive = 1
						return 0
						else
						player:SendBroadcastMessage("|CFF00ff6c[Event System]|r - You can use that command only in Event Zone!")
						return 0
						end
						end
					end
					end
					end
					end
					end
				end
				if (EventMessage:find(EVENT.ReviveActivate) == 1) then
					if (player:GetGmRank() == 'a') or (player:GetGmRank() == 'az') then
						if (Revive == 0) then
							Revive = 1
								player:SendBroadcastMessage("|CFffba000You have just Activated the Revive Command!|R")
									return 0
						else
						if (Revive == 1) then
							player:SendBroadcastMessage("|CFffba000The Revive Command is already Activated!")
							return 0
						end
						end
					end
				end
				if (EventMessage:find(EVENT.ReviveDeactivate) == 1) then
					if (player:GetGmRank() == 'a') or (player:GetGmRank() == 'az') then
						if (Revive == 1) then
							Revive = 0
								player:SendBroadcastMessage("|CFffba000You have just Deactivated the Revive Command!|R")
									return 0
						else
						if (Revive == 0) then
							player:SendBroadcastMessage("|CFffba000The Revive Command is already Deactivated!")
							return 0
						end
						end
					end
				end
end

----------------------------------------------------

function EVENT.ReviveCooldown(event, player)
	CooldownRevive = 0
end

----------------------------------------------------	

----------------------------------------------------

RegisterServerHook(16, "EVENT.OnChat")

----------------------------------------------------