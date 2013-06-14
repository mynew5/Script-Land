local MSG_REVIVE = "#skills"

function SkillsOnChat(event, player, message, type, language)
	if(message == MSG_REVIVE) then
		local GMrank = player:GetGmRank()
		if ((GMrank == "vi") or (GMrank == "vip")  or (GMrank == "a") or (GMrank == "az") or (GMrank == "vg") or (GMrank == "vipd")) then
			player:AdvanceSkill(43,1275)
			player:AdvanceSkill(44,1275)
			player:AdvanceSkill(45,1275)
			player:AdvanceSkill(46,1275)
			player:AdvanceSkill(54,1275)
			player:AdvanceSkill(55,1275)
			player:AdvanceSkill(95,1275)
			player:AdvanceSkill(136,1275)
			player:AdvanceSkill(160,1275)
			player:AdvanceSkill(162,1275)
			player:AdvanceSkill(172,1275)
			player:AdvanceSkill(173,1275)
			player:AdvanceSkill(176,1275)
			player:AdvanceSkill(226,1275)
			player:AdvanceSkill(228,1275)
			player:AdvanceSkill(229,1275)
			player:AdvanceSkill(473,1275)
			player:SendBroadcastMessage("|cFF00FFFF[vNexus Commander]|cFFFFA500Your skills has been updated to max!")
			player:SendAreaTriggerMessage("|cFF00FFFF[vNexus Commander]|cFFFFA500Your skills has been updated to max!")
		else
			player:SendBroadcastMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Silver or Gold VIP to use this command, go donate on www.infinitygaming.org for VIP rank!!")
			player:SendAreaTriggerMessage("|cFF00FFFF[VIP System]|cFFFFA500|cFFFFA500You must be Silver or Gold VIP to use this command!")
		end
	end
end

RegisterServerHook(16, "SkillsOnChat")
