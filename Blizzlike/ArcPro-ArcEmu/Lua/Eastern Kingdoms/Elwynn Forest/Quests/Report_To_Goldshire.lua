--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Quest_Report_To_Goldshire_OnAccept(event, pPlayer, QuestId, pQuestGiver)
	if(pQuestGiver:GetEntry() == 197) then
		if(QuestId == 54) then
			local name = pPlayer:GetName()
			pQuestGiver:SendChatMessage(12, 0, "You are dismissed, "..name..".")
			pQuestGiver:Emote(66, 0)
		end
	end
end

RegisterServerHook(14, "Quest_Report_To_Goldshire_OnAccept")