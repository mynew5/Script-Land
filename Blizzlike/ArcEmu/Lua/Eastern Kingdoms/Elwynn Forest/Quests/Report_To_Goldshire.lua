function Quest_Report_To_Goldshire_OnAccept(event, pPlayer, QuestId, pQuestGiver)
if (pQuestGiver:GetEntry() == 197) then
if (QuestId == 54) then
local Name = pPlayer:GetName()
pQuestGiver:SendChatMessage(12, 0, "You are dismissed, "..Name..".")
pQuestGiver:Emote(66, 0)
end
end
end

RegisterServerHook(14, "Quest_Report_To_Goldshire_OnAccept")