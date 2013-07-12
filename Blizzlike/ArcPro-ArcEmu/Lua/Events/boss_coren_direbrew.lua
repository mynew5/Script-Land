BOSS_DIREBREW = 23872
NPC_ILSA = 26764
NPC_URSULA = 26822
NPC_MINION = 26776
SPELL_DISARM = 47310
SPELL_SUMMON_MINION = 47375

local self = getfenv(1)

function OnGossip(pUnit,  event, pPlayer)
	pUnit:GossipCreateMenu(15858, pPlayer, 0)
	pUnit:GossipMenuAddItem(0, "Insult Coren Direbrew's brew.", 1, 0)
	pUnit:GossipSendMenu(pPlayer)
end

function OnSelect(pUnit, event, pPlayer, id, intid, code)
if(intid == 1)then
	pUnit:GossipCreateMenu(15859, pPlayer, 0)
	pUnit:GossipMenuAddItem(0, "Attack!", 2, 0)
	pUnit:GossipMenuAddItem(0, "Sorry!", 3, 0)
	pUnit:GossipSendMenu(pPlayer)
elseif(intid == 2)then
	pUnit:SendChatMessage(12, 0, "You'll pay for this insult, "..pPlayer:GetPlayerClass().."!")
	local adds = pUnit:GetInRangeFriends()
	for k,v in pairs(adds) do
	if(v ~= nil and v:IsCreature() and v:IsAlive())then
		if(v:GetEntry() == NPC_ILSA or v:GetEntry() == NPC_URSULA)then
			v:SetFaction(736)
			v:SetMovementFlags(1)
			v:MoveTo(pUnit:GetX() + 2, pUnit:GetY() + 2, pUnit:GetZ(), pUnit:GetO())
		end
	end
	end
	pUnit:SetFaction(736)
	pPlayer:GossipComplete()
elseif(intid == 3)then
	pPlayer:GossipComplete()
end
end

function OnCombat(pUnit, event)
self[tostring(pUnit)] = {
disarm = math.random(13,25),
summon = math.random(9,12)
}
pUnit:RegisterAIUpdateEvent(1000)
end

function AIUpdate(pUnit)
if(pUnit:IsCasting() ) then return end
	if(pUnit:GetNextTarget() == nil)then
		pUnit:WipeThreatList()
		return
	end
local vars = self[tostring(pUnit)]
vars.disarm = vars.disarm - 1
vars.summon = vars.summon - 1
if(vars.disarm <= 0)then
	pUnit:FullCastSpell(SPELL_DISARM)
	vars.disarm = math.random(13,25)
elseif(vars.summon <= 0)then
	pUnit:CastSpell(SPELL_SUMMON_MINION)
	vars.summon = math.random(9,12)
end
end

function OnLeaveCombat(pUnit, event)
pUnit:RemoveEvents()
pUnit:RemoveAIUpdateEvent()
pUnit:SetFaction(35)
local adds = pUnit:GetInRangeFriends()
for k,v in pairs(adds) do
if(v ~= nil and v:IsCreature() and v:IsAlive())then
	if(v:GetEntry() == NPC_ILSA or v:GetEntry() == NPC_URSULA)then
		v:SetFaction(35)
	elseif(v:GetEntry() == NPC_MINION)then
		v:Despawn(1000,0)
	end
end
end
end

function OnDeath(pUnit, event)
pUnit:RemoveEvents()
pUnit:RemoveAIUpdateEvent()
end

RegisterUnitEvent(BOSS_DIREBREW,1,OnCombat)
RegisterUnitEvent(BOSS_DIREBREW,2,OnLeaveCombat)
RegisterUnitEvent(BOSS_DIREBREW,4,OnDeath)
RegisterUnitEvent(BOSS_DIREBREW,21,AIUpdate)
RegisterUnitGossipEvent(BOSS_DIREBREW, 1, OnGossip)
RegisterUnitGossipEvent(BOSS_DIREBREW, 2, OnSelect)
