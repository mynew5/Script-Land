QUEST_PERFECT_PERFUME = 24629
QUEST_CLASSY_COLONGE = 24635
QUEST_BONBON_BITZ = 24636
QUEST_HOT_ON_THE_TRIAL_A = 24849
QUEST_HOT_ON_THE_TRIAL_H = 24851
QUEST_A_FRIENDLY_CHAT_H = 24576
QUEST_A_FRIENDLY_CHAT_A = 24657
SPELL_ROMANTIC_PICNIC = 45123
SPELL_LUCKY_CHARM_COLLECTOR = 69510
SPELL_LUCKY_CHARM = 69511
SPELL_PERFUME_SPRITZ_CREDIT = 71002
SPELL_HEAVY_PERFUMED = 71520
SPELL_CREATE_LEDGER = 70646
SPELL_SEARCH_AUCTION_HOUSE_A = 71760
SPELL_SEARCH_BANK_A = 71713
SPELL_SEARCH_BARBERSHOP_A = 71758
SPELL_SEARCH_AUCTION_HOUSE_H = 71745
SPELL_SEARCH_BANK_H = 71759
SPELL_SEARCH_BARBERSHOP_H = 71752
GO_PICNIC_BASKET = 187267
GO_STRANGE_VIAL = 181015
ITEM_CHARM_COLLECTOR = 49661
ITEM_LEDGER = 49915
AT_S_AUCTION_HOUSE = 5711
AT_S_BARBER_HOUSE = 5712
AT_S_BANK = 5710
AT_O_AUCTION_HOUSE = 5714
AT_O_BARBER_HOUSE = 5716
AT_O_BANK = 5715
NPC_A_GUARD = 68
NPC_H_GUARD = 3296
NPC_PARFUME_GURAD_TRIGGER = 38288
NPC_SNIVEL = 37715

function SpellCast(event, pPlayer, SpellId, pSpellObject)
if(SpellId == SPELL_PERFUME_SPRITZ_CREDIT)then
	if(pPlayer:GetQuestObjectiveCompletion(QUEST_PERFECT_PERFUME, 0) < 10)then
		pPlayer:AdvanceQuestObjective(QUEST_PERFECT_PERFUME, 0)
	end
	if(pPlayer:GetQuestObjectiveCompletion(QUEST_CLASSY_COLONGE, 0) < 10)then
		pPlayer:AdvanceQuestObjective(QUEST_CLASSY_COLONGE, 0)
	end
	if(pPlayer:GetQuestObjectiveCompletion(QUEST_BONBON_BITZ, 0) < 10)then
		pPlayer:AdvanceQuestObjective(QUEST_BONBON_BITZ, 0)
	end
end
end

function OnUse(pGameObject, event, pPlayer)
pPlayer:FullCastSpell(SPELL_ROMANTIC_PICNIC)
pPlayer:Emote(13, 4000)
end

function KillCreature(event, pKiller, pDied)
if(pKiller:IsPlayer() and pDied:IsPlayer() == false)then
	if(pKiller:HasItem(ITEM_CHARM_COLLECTOR) and pDied:IsDead())then
		pKiller:CastSpell(SPELL_LUCKY_CHARM_COLLECTOR)
	end
end
end

function OnLoad(pUnit)
for k,v in pairs(pUnit:GetInRangeUnits())do
	if(v:IsCreature())then
		if(v:GetEntry() == NPC_A_GUARD or v:GetEntry() == NPC_H_GUARD)then
			if(v:HasAura(SPELL_HEAVY_PERFUMED) == false)then
				v:CastSpell(SPELL_HEAVY_PERFUMED)
			end
		end
	end
end
pUnit:RegisterAIUpdateEvent(600000)
end

function AIUpdate(pUnit)
if(pUnit == nil)then
	pUnit:RemoveAIUpdateEvent()
end
for k,v in pairs(pUnit:GetInRangeUnits())do
	if(v:IsCreature())then
		if(v:GetEntry() == NPC_A_GUARD or v:GetEntry() == NPC_H_GUARD)then
			if(v:HasAura(SPELL_HEAVY_PERFUMED) == false)then
				v:CastSpell(SPELL_HEAVY_PERFUMED)
			end
		end
	end
end
end

function AreaTrigger(event, pPlayer, AreaTriggerId)
if(AreaTriggerId == AT_S_BANK)then
	if(pPlayer:GetQuestObjectiveCompletion(QUEST_HOT_ON_THE_TRIAL_A, 0) < 1)then
		pPlayer:CastSpell(SPELL_SEARCH_BANK_A)
	end
elseif(AreaTriggerId == AT_S_AUCTION_HOUSE)then
	if(pPlayer:GetQuestObjectiveCompletion(QUEST_HOT_ON_THE_TRIAL_A, 1) < 1)then
		pPlayer:CastSpell(SPELL_SEARCH_AUCTION_HOUSE_A)
	end
elseif(AreaTriggerId == AT_S_BARBER_HOUSE)then
	if(pPlayer:GetQuestObjectiveCompletion(QUEST_HOT_ON_THE_TRIAL_A, 2) < 1)then
		pPlayer:CastSpell(SPELL_SEARCH_BARBERSHOP_A)
	end
elseif(AreaTriggerId == AT_O_BANK)then
	if(pPlayer:GetQuestObjectiveCompletion(QUEST_HOT_ON_THE_TRIAL_H, 0) < 1)then
		pPlayer:CastSpell(SPELL_SEARCH_BANK_H)
	end
elseif(AreaTriggerId == AT_O_AUCTION_HOUSE)then
	if(pPlayer:GetQuestObjectiveCompletion(QUEST_HOT_ON_THE_TRIAL_H, 1) < 1)then
		pPlayer:CastSpell(SPELL_SEARCH_AUCTION_HOUSE_H)
	end
elseif(AreaTriggerId == AT_O_BARBER_HOUSE)then
	if(pPlayer:GetQuestObjectiveCompletion(QUEST_HOT_ON_THE_TRIAL_H, 2) < 1)then
		pPlayer:CastSpell(SPELL_SEARCH_BARBERSHOP_H)
	end
end
end

function OnGossip(pUnit, event, pPlayer)
pUnit:GossipCreateMenu(15188, pPlayer, 0)
if(pPlayer:HasQuest(QUEST_A_FRIENDLY_CHAT_H) or pPlayer:HasQuest(QUEST_A_FRIENDLY_CHAT_A))then
	if(pPlayer:HasItem(ITEM_LEDGER) == false)then
	pUnit:GossipMenuAddItem(0, "I have a rocket here with your mark on it, Snivel.", 1, 0)
	end
end
pUnit:GossipSendMenu(pPlayer)
end

function OnGossip_Submenus(pUnit, event, pPlayer, id, intid, code)
if(intid == 1)then
	pUnit:GossipCreateMenu(15209, pPlayer, 0)
	pUnit:GossipMenuAddItem(0, "There's a chemical inside the rocket. What is it?", 2, 0)
	pUnit:GossipSendMenu(pPlayer)
elseif(intid == 2)then
	pUnit:GossipCreateMenu(15210, pPlayer, 0)
	pUnit:GossipMenuAddItem(0, "Where were they delivered?", 3, 0)
	pUnit:GossipSendMenu(pPlayer)
elseif(intid == 3)then
	pUnit:GossipCreateMenu(15211, pPlayer, 0)
	pUnit:GossipSendMenu(pPlayer)
	pPlayer:CastSpell(SPELL_CREATE_LEDGER)
end
end

RegisterServerHook(26, "AreaTrigger")
RegisterServerHook(28, "KillCreature")
RegisterServerHook(10, "SpellCast")
RegisterGameObjectEvent(GO_PICNIC_BASKET,4,OnUse)
RegisterUnitEvent(NPC_PARFUME_GURAD_TRIGGER,18,OnLoad)
RegisterUnitEvent(NPC_PARFUME_GURAD_TRIGGER,21,AIUpdate)
RegisterUnitGossipEvent(NPC_SNIVEL,1,OnGossip)
RegisterUnitGossipEvent(NPC_SNIVEL,2,OnGossip_Submenus)