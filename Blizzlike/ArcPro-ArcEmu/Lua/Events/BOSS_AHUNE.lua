local BOSS_AHUNE				= 25740
local NPC_AHUNE_BOTTLE_BUNNY	= 26346
local NPC_AHUNE_ICE_BUNNY		= 25985
local NPC_GHOST_OF_AHUNE		= 26239
local NPC_LOOT_LOC_BUNNY		= 25746
local NPC_HAILSTONE				= 25755
local NPC_COLDWAVE				= 25756
local NPC_FROZENCORE			= 25865
local NPC_FROSTWIND				= 25757
local OBJECT_ICE_STONE			= 187882
local OBJECT_SNOW_PILE			= 188187
local QUEST_SUMMON_AHUNE		= 11691
 -- Spells
 -- Ahune intro and visual
local SPELL_AHUNE_FLOOR_AMBIENT	= 46314
local SPELL_AHUNE_FLOOR			= 45945
local SPELL_AHUNE_BONFIRE		= 45930
local SPELL_AHUNE_RESURFACE		= 46402
local SPELL_AHUNE_GHOST_MODEL	= 46786
local SPELL_AHUNE_BEAM_ATT_1	= 46336
local SPELL_AHUNE_GHOST_BURST	= 46809
local SPELL_AHUNE_STAND			= 37752
local SPELL_AHUNE_SUBMERGED		= 37751
local SPELL_SUMMONING1_VISUAL	= 45937
 -- Combat spells.
local SPELL_AHUNE_1_MINION		= 46103
local SPELL_AHUNE_SHIELD		= 45954
local SPELL_AHUNE_COLD_SLAP		= 46145
local SPELL_AHUNE_STUN			= 46416
 -- End spells
local SPELL_AHUNE_SUMM_LOOT		= 45939
local SPELL_AHUNE_SUMM_LOOT_H	= 46622
local TEXT_AHUNE_SUBMERGE = "Ahune Retreats. His defenses diminish."
local TEXT_AHUNE_EMERGE_W = "Ahune will soon resurface."
local self = getfenv(1)

function IceStone_OnUse(pGO, event, pPlayer)
	pGO:GossipCreateMenu(15864, pPlayer, 0)
	if(pPlayer:HasQuest(QUEST_SUMMON_AHUNE))then
		pGO:GossipMenuAddItem(0, "Disturb the stone and summon Lord Ahune.", 1, 0)
	end
	pGO:GossipSendMenu(pPlayer)
end

function OnSelect(pGO, event, pPlayer, id, intid, code)
if(intid == 1)then
	pGO:SpawnCreature(BOSS_AHUNE,-95.57,-240.801,-1.222,1.566,14,3600000,0,0,0,1,0)
	pGO:Despawn(1,0)
end
end

function AhuneOnLoad(pUnit)
pUnit:FullCastSpell(SPELL_AHUNE_FLOOR_AMBIENT)
pUnit:FullCastSpell(SPELL_SUMMONING1_VISUAL)
pUnit:FullCastSpell(SPELL_AHUNE_FLOOR)
pUnit:FullCastSpell(SPELL_AHUNE_STAND)
pUnit:Root()
pUnit:SetStandState(10)
pUnit:RegisterEvent("StandState", 1500, 1)
end

function StandState(pUnit)
pUnit:SetStandState(0)
end

function AhuneOnCombat(pUnit, event)
self[tostring(pUnit)] = {
spear = math.random(8,10),
summon1 = math.random(8,9),
summon2 = math.random(3,5),
emerged_timer = 30,
phase = 1,
summonwave = 0
}
pUnit:FullCastSpell(SPELL_AHUNE_SHIELD)
pUnit:RegisterAIUpdateEvent(1000)
end

function AhuneAIUpdate(pUnit)
if(pUnit == nil)then
	pUnit:RemoveAIUpdateEvent()
end
if(pUnit:GetNextTarget() == nil)then
	pUnit:WipeThreatList()
	return
end
local vars = self[tostring(pUnit)]
local closestplr = pUnit:GetClosestPlayer()
if(closestplr and vars.phase == 1)then
	if(pUnit:GetDistanceYards(closestplr) < 3)then
	local randomize = math.random(1,4)
		if(randomize == 2)then
			pUnit:FullCastSpellOnTarget(SPELL_AHUNE_COLD_SLAP,closestplr)
		end
	end
end
vars.emerged_timer = vars.emerged_timer - 1
if(vars.emerged_timer > 0 and vars.emerged_timer < 30)then
	vars.spear = vars.spear - 1
	vars.summon1 = vars.summon1 - 1
	vars.summon2 = vars.summon2 - 1
	if(vars.spear <= 0)then
		local player = pUnit:GetRandomPlayer(0)
		if(player)then
			pUnit:SpawnCreature(NPC_AHUNE_ICE_BUNNY,player:GetX(),player:GetY(),player:GetZ(),player:GetO(),14,5,0,0,0,1,0)
			vars.spear = math.random(8,10)
		end
	elseif(vars.summon1 <= 0)then
		if(vars.summonwave == 0)then
			pUnit:SpawnCreature(NPC_HAILSTONE,pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),pUnit:GetO(),14,360000,0,0,0,1,0)
		elseif(vars.summonwave == 1)then
			local randomadd = math.random(1,2)
			if(randomadd == 1)then
				pUnit:SpawnCreature(NPC_FROSTWIND,pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),pUnit:GetO(),14,360000,0,0,0,1,0)
			elseif(randomadd == 2)then
				pUnit:SpawnCreature(NPC_HAILSTONE,pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),pUnit:GetO(),14,360000,0,0,0,1,0)
			end
		end
		vars.summon1 = math.random(8,9)
	elseif(vars.summon2 <= 0)then
		pUnit:SpawnCreature(NPC_COLDWAVE,pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),pUnit:GetO(),14,360000,0,0,0,1,0)
		pUnit:SpawnCreature(NPC_COLDWAVE,pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),pUnit:GetO(),14,360000,0,0,0,1,0)
		vars.summon2 = math.random(3,5)
	end
elseif(vars.emerged_timer == 0)then
	pUnit:SendChatMessage(42, 0, TEXT_AHUNE_SUBMERGE)
	pUnit:FullCastSpell(SPELL_AHUNE_SUBMERGED)
	pUnit:SetStandState(9)
	pUnit:DisableMelee(true)
	vars.phase = 2
	pUnit:SetUInt32Value(59, 33554432)
	pUnit:SpawnCreature(NPC_FROZENCORE,pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),pUnit:GetO(),14,360000,0,0,0,1,0)
	local core = pUnit:GetCreatureNearestCoords(pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),NPC_FROZENCORE)
	if(core)then
		if(core:IsAlive())then
			local healthcore = core:GetHealthPct()
			local ahealth = pUnit:GetHealthPct()
			local tank = pUnit:GetMainTank()
			core:SetHealthPct(ahealth)
			if(tank)then
				core:ModThreat(tank,100)
			end
		end
	end
elseif(vars.emerged_timer > -30 and vars.emerged_timer < 0)then
	local core = pUnit:GetCreatureNearestCoords(pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),NPC_FROZENCORE)
	if(core)then
		if(core:IsAlive())then
			local healthcore = core:GetHealthPct()
			local ahealth = pUnit:GetHealthPct()
			if(healthcore > ahealth)then
				core:SetHealthPct(ahealth)
			elseif(ahealth > healthcore)then
				pUnit:SetHealthPct(healthcore)
			end
		else
			pUnit:SetUInt32Value(59, 0)
			pUnit:SetStandState(0)
			local playerkill = pUnit:GetRandomPlayer(0)
			if(playerkill)then
				playerkill:Kill(pUnit)
			else
				pUnit:Kill(pUnit)
			end
		end
	end
	if(vars.emerged_timer == -20)then
		pUnit:SendChatMessage(42, 0, TEXT_AHUNE_EMERGE_W)
	end
elseif(vars.emerged_timer == -30)then
	pUnit:FullCastSpell(SPELL_AHUNE_STAND)
	pUnit:SetStandState(0)
	pUnit:SetUInt32Value(59, 0)
	vars.emerged_timer = 30
	vars.phase = 1
	vars.summonwave = 1 -- After the first emerge the boss goes into phase 3.
	pUnit:DisableMelee(true)
	local core = pUnit:GetCreatureNearestCoords(pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),NPC_FROZENCORE)
	if(core)then
		core:Despawn(1,0)
	end
	if(pUnit:HasAura(SPELL_AHUNE_SHIELD))then
		pUnit:RemoveAura(SPELL_AHUNE_SHIELD)
	end
end
end

function OnDied(pUnit,event)
local SummonLoc = pUnit:GetGameObjectNearestCoords(pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),OBJECT_SNOW_PILE)
if(SummonLoc)then
	local x,y,z,o = SummonLoc:GetSpawnLocation()
	pUnit:SpawnCreature(NPC_LOOT_LOC_BUNNY,x,y,z,o,35,300000,0,0,0,1,0)
end
for k,v in pairs(pUnit:GetInRangeUnits())do
	if(v and v:IsCreature())then
		if(v:GetEntry() == NPC_FROZENCORE or v:GetEntry() == NPC_FROSTWIND or v:GetEntry() == NPC_HAILSTONE or v:GetEntry() == NPC_COLDWAVE or v:GetEntry() == NPC_AHUNE_ICE_BUNNY)then
			v:Despawn(1,0)
		end
	end
end
pUnit:RemoveEvents()
pUnit:RemoveAIUpdateEvent()
end

function CoreOnLoad(pUnit)
	pUnit:Root()
	pUnit:DisableMelee(true)
end

function Trash_OnSPawn(pUnit)
	local player = pUnit:GetRandomPlayer(0)
	if(player)then
		pUnit:ModThreat(player, 100)
		local x = player:GetX()
		local y = player:GetY()
		local z = player:GetZ()
		local o = player:GetO()
		pUnit:MoveTo(x, y, z, o)
	end
end

function IceBunny_OnSp(pUnit)
	pUnit:SetFaction(14)
	pUnit:SetUInt32Value(59, 33554432)
	pUnit:CastSpell(50097)
	pUnit:CastSpell(46360) -- ToDo: Find the pre effect spell and make the pre effect work.
	pUnit:Despawn(2000,0)
end

function LootBunny_Load(pUnit)
	pUnit:SetUInt32Value(59, 33554432)
	pUnit:CastSpell(SPELL_AHUNE_SUMM_LOOT)
end

RegisterGOGossipEvent(OBJECT_ICE_STONE,2,OnSelect)
RegisterGameObjectEvent(OBJECT_ICE_STONE, 4, IceStone_OnUse)
RegisterUnitEvent(BOSS_AHUNE,1,AhuneOnCombat)
RegisterUnitEvent(BOSS_AHUNE,4,OnDied)
RegisterUnitEvent(BOSS_AHUNE,18,AhuneOnLoad)
RegisterUnitEvent(BOSS_AHUNE,21,AhuneAIUpdate)
RegisterUnitEvent(NPC_FROZENCORE,18,CoreOnLoad)
RegisterUnitEvent(NPC_FROSTWIND,18,Trash_OnSPawn)
RegisterUnitEvent(NPC_HAILSTONE,18,Trash_OnSPawn)
RegisterUnitEvent(NPC_COLDWAVE,18,Trash_OnSPawn)
RegisterUnitEvent(NPC_AHUNE_ICE_BUNNY,18,IceBunny_OnSp)
RegisterUnitEvent(NPC_LOOT_LOC_BUNNY,18,LootBunny_Load)
