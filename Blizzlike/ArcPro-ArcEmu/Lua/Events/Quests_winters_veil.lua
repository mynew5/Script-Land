RENDEER_1 = 8746
RENDEER_2 = 8762
ITEM_DUST = 21211
NPC_RENDEER = 15664
SPELL_RENDEER_DUST = 25952

function OnGossip(pUnit, event, pPlayer)
pUnit:GossipCreateMenu(8076, pPlayer, 0)
if(pPlayer:HasItem(ITEM_DUST) and pPlayer:HasQuest(RENDEER_1) and pPlayer:GetQuestObjectiveCompletion(RENDEER_1, 0) == 0)then
	pUnit:GossipMenuAddItem(0, "Sprinkle some of the reindeer dust onto Metzen.", 1, 0)
elseif(pPlayer:HasItem(ITEM_DUST) and pPlayer:HasQuest(RENDEER_2) and pPlayer:GetQuestObjectiveCompletion(RENDEER_2, 0) == 0)then
	pUnit:GossipMenuAddItem(0, "Sprinkle some of the reindeer dust onto Metzen.", 2, 0)
end
pUnit:GossipSendMenu(pPlayer)
end

function OnSelectMenu(pUnit, event, pPlayer, id, intid, code)
if(intid == 1 or intid == 2)then
	if(pPlayer:HasQuest(RENDEER_1))then
		pPlayer:AdvanceQuestObjective(RENDEER_1, 0)
	elseif(pPlayer:HasQuest(RENDEER_2))then
		pPlayer:AdvanceQuestObjective(RENDEER_2, 0)
	end
	pUnit:CastSpell(SPELL_RENDEER_DUST)
	pPlayer:GossipComplete()
end
end

RegisterUnitGossipEvent(NPC_RENDEER, 1, "OnGossip")
RegisterUnitGossipEvent(NPC_RENDEER, 2, "OnSelectMenu")
