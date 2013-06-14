local MSG_COMMAND = "#diamond commands"

function DiamondCommandsOnChat(event, player, message, type, language)
	if(message == MSG_COMMAND) then
		player:SendBroadcastMessage("|cFFFF0000Diamond Rank Commands:")
		player:SendBroadcastMessage("|cFF00FFFFOnline Players: |cFFFFA500Type #online - to see how many players is online.")
		player:SendBroadcastMessage("|cFF00FFFFUnstuck Command: |cFFFFA500Type #unstuck to get unstucked. If your dead type /g #unstuck.")
		player:SendBroadcastMessage("|cFF00FFFFGet To Trainer: |cFFFFA500Type #train - to get to your class trainer.")
		player:SendBroadcastMessage("|cFF00FFFFRessurrect Your Self: |cFFFFA500Type #ressurrect - to get revived, but you need 1       |cFF00FFFF[Revive Stone]|cFFFFA500 or else it wont work.")
		player:SendBroadcastMessage("|cFF00FFFFLevel 80: |cFFFFA500 Type: #level 80 - Makes you level 80!")
		player:SendBroadcastMessage("|cFF00FFFFLevel 100: |cFFFFA500 Type: #level 100 - Makes you level 100!")
		player:SendBroadcastMessage("|cFF00FFFFLevel 150: |cFFFFA500 Type: #level 150 - Makes you level 150!")
		player:SendBroadcastMessage("|cFF00FFFFLevel 200: |cFFFFA500 Type: #level 200 - Makes you level 200!")
		player:SendBroadcastMessage("|cFF00FFFFLevel 255: |cFFFFA500 Type: #level 255 - Makes you level 255!")
		player:SendBroadcastMessage("|cFF00FFFFFull Badges: |cFFFFA500 Type: #badges - Gives you 500 Badges!")
		player:SendBroadcastMessage("|cFF00FFFFDiamond Gear: |cFFFFA500 Type: #diamond - Gives you full Diamond VIP gear!")
		player:SendBroadcastMessage("|cFF00FFFFIncrease Gold: |cFFFFA500 Type: #increase gold - Gives you more gold!")
		player:SendBroadcastMessage("|cFF00FFFFIncrease Skills: |cFFFFA500 Type: #skills - Maxes out your skills!")
		player:SendBroadcastMessage("|cFF00FFFFDonor Mall: |cFFFFA500 Type: #donormall - Ports you to donor mall!")
		player:SendBroadcastMessage("|cFF00FFFFIncrease Honor: |cFFFFA500 Type: #increase honor - Adds your char +2500 honor points!")
		player:SendBroadcastMessage("|cFF00FFFFIncrease Arena: |cFFFFA500 Type: #increase arean - Adds your char +2500 arena points!")
		player:SendBroadcastMessage("|cFF00FFFFReset Talents: |cFFFFA500 Type: #reset talents - Resets your talents!")
		player:SendBroadcastMessage("|cFF00FFFFBuffs: |cFFFFA500 Type: #buffs - Adds the player alot of buffs!")
		player:SendBroadcastMessage("|cFF00FFFFMale or Female: |cFFFFA500 Type: #gender - To switch between male or female!")
		player:SendBroadcastMessage("|cFF00FFFFVIP Class: |cFFFFA500 Type: #class - Ports you to VIP classroom!")
		player:SendBroadcastMessage("|cFF00FFFFGM Commands:")
		player:SendBroadcastMessage("|cFF00FFFFcommands: |cFFFFA500 Type: .commands - to see all the GM commands DIAMOND has unlocked!")
		player:SendBroadcastMessage("|cffFF0000[Reminder]|cffFFFF05Don't forget to support our server by |cffFF0000voting|cffFFFF05 and |cffFF0000donating|cffFFFF05 on |cffFF0000www.infinitygaming.org!")

	end
end
	
RegisterServerHook(16, "DiamondCommandsOnChat")
