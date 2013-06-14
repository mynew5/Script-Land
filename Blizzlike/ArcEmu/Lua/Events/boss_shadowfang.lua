BOSS_HUMMEL = 36296
NPC_FRYE = 36272
NPC_BAXTER = 36565
NPC_CRAZED = 36568
SPELL_ALURING_SPRAY = 68607
SPELL_CHAIN_REACTION = 68821
SPELL_COLONGE = 68841
SPELL_PERFUME = 68799
SPELL_IRRESISTABLE_SPRAY = 68948

local self = getfenv(1)

function OnGossip(pUnit, event, plr)
pUnit:GossipCreateMenu(15040, plr, 0)
pUnit:GossipMenuAddItem(0, "Start the battle.", 1, 0)
pUnit:GossipSendMenu(plr)
end

function OnSelect(pUnit, event, plr, id, intid, code)
if(intid == 1)then
	pUnit:SendChatMessage(12, 0, "Did they bother to tell you who I am and why I am doing this?")
	pUnit:SetUInt32Value(59, 2)
	pUnit:SetFaction(14)
	local frye = pUnit:GetCreatureNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), NPC_FRYE)
	if(frye ~= nil)then
		frye:SetMovementFlags(1)
		frye:MoveTo(-205.0296, 2180.4275, 79.765, 4.6034)
	end
	local baxter = pUnit:GetCreatureNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), NPC_BAXTER)
	if(baxter ~= nil)then
		baxter:SetMovementFlags(1)
		baxter:MoveTo(-220.7208, 2203.8157, 79.763, 2.0697)
	end
	pUnit:RegisterEvent("event1", 5000, 1)
	plr:GossipComplete()
end
end

function event1(pUnit, event)
pUnit:SendChatMessage(12, 0, "...or are they just using you like they do everybody else?")
pUnit:RegisterEvent("event2", 5000, 1)
end

function event2(pUnit, event)
pUnit:SendChatMessage(12, 0, "But what does it matter. It is time for this to end.")
pUnit:RegisterEvent("event3", 2000, 1)
end

function event3(pUnit,event)
pUnit:SetUInt32Value(59, 0)
end


function OnCombat(pUnit, event)
	self[tostring(pUnit)] = {
	spray = math.random(9,11),
	reaction = math.random(15,17),
	summon = math.random(10,20),
	call1 = 10,
	call2 = 20
}
pUnit:RegisterAIUpdateEvent(1000)
end

function AIUpdate(pUnit)
if(pUnit == nil)then
	pUnit:RemoveAIUpdateEvent()
end
	local vars = self[tostring(pUnit)]
	vars.spray = vars.spray - 1
	vars.reaction = vars.reaction - 1
	if(vars.call1 > - 100)then
		vars.call1 = vars.call1 - 1
	end
	if(vars.call2 > - 100)then
		vars.call2 = vars.call2 - 1
	end
	if(vars.spray <= 0)then
		pUnit:FullCastSpellOnTarget(SPELL_ALURING_SPRAY, pUnit:GetMainTank())
		vars.spray = math.random(9,11)
	elseif(vars.reaction <= 0)then
		pUnit:FullCastSpellOnTarget(SPELL_CHAIN_REACTION, pUnit:GetMainTank())
		vars.reaction = math.random(15,17)
	elseif(vars.summon <= 0)then
		location = math.random(1,3)
		if(location == 1)then
			pUnit:SpawnCreature(NPC_CRAZED, -213.928, 2235.641, 79.763, 5.096, 14, 6000, 5285, 0, 0)
		elseif(location == 2)then
			pUnit:SpawnCreature(NPC_CRAZED, -177.491, 2218.664, 79.7512, 3.364, 14, 6000, 5285, 0, 0)
		elseif(location == 3)then
			pUnit:SpawnCreature(NPC_CRAZED, -212.059, 2170.1702, 79.767, 1.337, 14, 6000, 5285, 0, 0)
		end
		vars.summon = math.random(10,20)
	elseif(vars.call1 <= 0 and vars.call1 > -100)then
		pUnit:SendChatMessage(12, 0, "Baxter! Get in there and help! NOW!")
		for k,v in pairs(pUnit:GetInRangeUnits())do
			if(v:IsCreature() and v:GetEntry() == NPC_BAXTER)then
				v:SetMovementFlags(1)
				v:SetFaction(14)
				local p1 = v:GetClosestPlayer()
				v:MoveTo(p1:GetX(), p1:GetY(), p1:GetZ(), p1:GetO())
			end
		end
		vars.call1 = - 200
	elseif(vars.call2 <= 0 and vars.call2 > -100)then
		pUnit:SendChatMessage(12, 0, "It is time, Frye! Attack!")
		for k,v in pairs(pUnit:GetInRangeUnits())do
			if(v:IsCreature() and v:GetEntry() == NPC_FRYE)then
				v:SetMovementFlags(1)
				v:SetFaction(14)
				local p2 = v:GetClosestPlayer()
				v:MoveTo(p2:GetX(), p2:GetY(), p2:GetZ(), p2:GetO())
			end
		end
		vars.call2 = - 200
	end
end

function OnDied(pUnit)
pUnit:SendChatMessage(12, 0, "...please don't think less of me.")
pUnit:RemoveEvents()
pUnit:RemoveAIUpdateEvent()
end

function OnLeaveCombat(pUnit)
pUnit:SetFaction(35)
for k,v in pairs(pUnit:GetInRangeUnits())do
if(v:IsCreature())then
	if(v:GetEntry() == NPC_BAXTER or v:GetEntry() == NPC_FRYE)then
		v:SetFaction(35)
		if(v:IsDead() == false)then
			v:ReturnToSpawnPoint()
		else
			v:Despawn(1,1)
		end
	end
end
end
pUnit:RemoveEvents()
pUnit:RemoveAIUpdateEvent()
end

function FryeOnCombat(pUnit, event)
	self[tostring(pUnit)] = {
	colonge = math.random(8,13),
	summon = math.random(10,20),
	perfume = math.random(16,19)
	}
pUnit:RegisterAIUpdateEvent(1000)
end

function FryeAIUpdate(pUnit)
if(pUnit:IsCasting() ) then return end
	if(pUnit:GetNextTarget() == nil)then
		pUnit:WipeThreatList()
		return
	end
local vars = self[tostring(pUnit)]
vars.colonge = vars.colonge - 1
vars.perfume = vars.perfume - 1
if(vars.colonge <= 0)then
	pUnit:FullCastSpellOnTarget(SPELL_COLONGE, pUnit:GetMainTank())
	vars.colonge = math.random(8,13)
elseif(vars.perfume <= 0)then
	pUnit:CastSpellOnTarget(SPELL_PERFUME, pUnit:GetMainTank())
	vars.perfume = math.random(16,19)
elseif(vars.summon <= 0)then
	location = math.random(1,3)
	if(location == 1)then
		pUnit:SpawnCreature(NPC_CRAZED, -213.928, 2235.641, 79.763, 5.096, 14, 6000, 5285, 0, 0)
	elseif(location == 2)then
		pUnit:SpawnCreature(NPC_CRAZED, -177.491, 2218.664, 79.7512, 3.364, 14, 6000, 5285, 0, 0)
	elseif(location == 3)then
		pUnit:SpawnCreature(NPC_CRAZED, -212.059, 2170.1702, 79.767, 1.337, 14, 6000, 5285, 0, 0)
	end
	vars.summon = math.random(10,20)
end
end

function FryeOnDied(pUnit, event)
pUnit:SendChatMessage(12, 0, "Great. We're not gutless, we're incompetent.")
pUnit:RemoveEvents()
pUnit:RemoveAIUpdateEvent()
end

function FryeOnLeaveCombat(pUnit, event)
pUnit:RemoveEvents()
pUnit:RemoveAIUpdateEvent()
end

function BaxterOnCombat(pUnit, event)
	self[tostring(pUnit)] = {
	spray = math.random(9,13),
	summon = math.random(10,20),
	reaction = math.random(15,18)
	}
pUnit:RegisterAIUpdateEvent(1000)
end

function BaxterAIUpdate(pUnit)
if(pUnit:IsCasting() ) then return end
	if(pUnit:GetNextTarget() == nil)then
		pUnit:WipeThreatList()
		return
	end
local vars = self[tostring(pUnit)]
vars.spray = vars.spray - 1
vars.reaction = vars.reaction - 1
if(vars.spray <= 0)then
	pUnit:FullCastSpellOnTarget(SPELL_IRRESISTABLE_SPRAY, pUnit:GetMainTank())
	vars.spray = math.random(9,13)
elseif(vars.reaction <= 0)then
	pUnit:CastSpellOnTarget(SPELL_CHAIN_REACTION, pUnit:GetMainTank())
	vars.reaction = math.random(15,18)
elseif(vars.summon <= 0)then
	location = math.random(1,3)
	if(location == 1)then
		pUnit:SpawnCreature(NPC_CRAZED, -213.928, 2235.641, 79.763, 5.096, 14, 6000, 5285, 0, 0)
	elseif(location == 2)then
		pUnit:SpawnCreature(NPC_CRAZED, -177.491, 2218.664, 79.7512, 3.364, 14, 6000, 5285, 0, 0)
	elseif(location == 3)then
		pUnit:SpawnCreature(NPC_CRAZED, -212.059, 2170.1702, 79.767, 1.337, 14, 6000, 5285, 0, 0)
	end
	vars.summon = math.random(10,20)
end
end

function BaxterOnDied(pUnit, event)
pUnit:SendChatMessage(12, 0, "It has been the greatest honor of my life to serve with you, Hummel.")
pUnit:RemoveEvents()
pUnit:RemoveAIUpdateEvent()
end

function BaxterOnLeaveCombat(pUnit, event)
pUnit:RemoveEvents()
pUnit:RemoveAIUpdateEvent()
end

function Crazed_OnLoad(pUnit, event)
pUnit:SetMovementFlags(1)
local pcr = pUnit:GetClosestPlayer()
pUnit:MoveTo(pcr:GetX(), pcr:GetY(), pcr:GetZ(), pcr:GetO())
end

RegisterUnitEvent(NPC_CRAZED,18,Crazed_OnLoad)
RegisterUnitEvent(NPC_BAXTER,1,BaxterOnCombat)
RegisterUnitEvent(NPC_BAXTER,2,BaxterOnLeaveCombat)
RegisterUnitEvent(NPC_BAXTER,4,BaxterOnDied)
RegisterUnitEvent(NPC_BAXTER,21,BaxterAIUpdate)
RegisterUnitEvent(NPC_FRYE,1,FryeOnCombat)
RegisterUnitEvent(NPC_FRYE,2,FryeOnLeaveCombat)
RegisterUnitEvent(NPC_FRYE,4,FryeOnDied)
RegisterUnitEvent(NPC_FRYE,21,FryeAIUpdate)
RegisterUnitEvent(BOSS_HUMMEL,1,OnCombat)
RegisterUnitEvent(BOSS_HUMMEL,2,OnLeaveCombat)
RegisterUnitEvent(BOSS_HUMMEL,4,OnDied)
RegisterUnitEvent(BOSS_HUMMEL,21,AIUpdate)
RegisterUnitEvent(BOSS_HUMMEL,25,event1)
RegisterUnitGossipEvent(BOSS_HUMMEL, 1, OnGossip)
RegisterUnitGossipEvent(BOSS_HUMMEL, 2, OnSelect)
