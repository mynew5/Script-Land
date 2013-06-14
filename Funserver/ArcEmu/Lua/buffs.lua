local MSG_BUFF = "#buffs"

function BuffsOnChat(event, player, message, type, language)
	if(message == MSG_BUFF) then
			if (player:HasAura(33077) == true) then
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You have already been buffed!")
			else
			local GMrank = player:GetGmRank()
			if GMrank == "vi" or GMrank == "vip"  or GMrank == "a" or GMrank == "az" or GMrank == "vg" or GMrank == "vipd" then
			player:CastSpell(33077)
			player:CastSpell(33078)
			player:CastSpell(33079)
			player:CastSpell(33080)
			player:CastSpell(33081)
			player:CastSpell(33082)
			player:CastSpell(24705)
			player:CastSpell(26035)
			print(""..player:GetName().." used #buffs command")
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You have been buffed!")
			player:SendBroadcastMessage("|cffFF0000[Reminder]|cffFFFF05Don't forget to support our server by |cffFF0000voting|cffFFFF05 and |cffFF0000donating|cffFFFF05 on |cffFF0000www.infinitygaming.org!")
			else
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be SILVER-VIP or GOLD-VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
			player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be SILVER-VIP or GOLD-VIP to use this command!")
			end
		end
	end
end

RegisterServerHook(16, "BuffsOnChat")