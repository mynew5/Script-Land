--[[
How does it work:
- First the player is casting a spell to launch a rocket
- This spell is summoning a rocket NPC (!)
- The code is looking for the nearest firework launcher and moves the rocket NPC there
- After that the rocket NPC is casting a spell that does the visual effect

]]--

local NPC_OMEN = 15467
local NPC_FIREWORK_BLUE = 15879
local NPC_FIREWORK_GREEN = 15880
local NPC_FIREWORK_PURPLE = 15881
local NPC_FIREWORK_RED = 15882
local NPC_FIREWORK_YELLOW = 15883
local NPC_FIREWORK_WHITE = 15884
local NPC_FIREWORK_BIG_BLUE = 15885
local NPC_FIREWORK_BIG_GREEN = 15886
local NPC_FIREWORK_BIG_PURPLE = 15887
local NPC_FIREWORK_BIG_RED = 15888
local NPC_FIREWORK_BIG_YELLOW = 15889
local NPC_FIREWORK_BIG_WHITE = 15890

local NPC_CLUSTER_BLUE = 15872
local NPC_CLUSTER_RED = 15873
local NPC_CLUSTER_GREEN = 15874
local NPC_CLUSTER_PURPLE = 15875
local NPC_CLUSTER_WHITE = 15876
local NPC_CLUSTER_YELLOW = 15877
local NPC_CLUSTER_BIG_BLUE = 15911
local NPC_CLUSTER_BIG_GREEN = 15912
local NPC_CLUSTER_BIG_PURPLE = 15913
local NPC_CLUSTER_BIG_RED = 15914
local NPC_CLUSTER_BIG_WHITE = 15915
local NPC_CLUSTER_BIG_YELLOW = 15916
local NPC_CLUSTER_ELUNE = 15918

local GO_FIREWORK_LAUNCHER_1 = 180771
local GO_FIREWORK_LAUNCHER_2 = 180868
local GO_FIREWORK_LAUNCHER_3 = 180850
local GO_CLUSTER_LAUNCHER_1  = 180772
local GO_CLUSTER_LAUNCHER_2 = 180859
local GO_CLUSTER_LAUNCHER_3 = 180869
local GO_CLUSTER_LAUNCHER_4 = 180874

local SPELL_ROCKET_BLUE = 26344
local SPELL_ROCKET_GREEN = 26345
local SPELL_ROCKET_PURPLE = 26346
local SPELL_ROCKET_RED = 26347
local SPELL_ROCKET_WHITE = 26348
local SPELL_ROCKET_YELLOW = 26349
local SPELL_ROCKET_BIG_BLUE = 26351
local SPELL_ROCKET_BIG_GREEN = 26352
local SPELL_ROCKET_BIG_PURPLE = 26353
local SPELL_ROCKET_BIG_RED = 26354
local SPELL_ROCKET_BIG_WHITE = 26355
local SPELL_ROCKET_BIG_YELLOW = 26356
local SPELL_LUNAR_FORTUNE = 26522
local SPELL_LUNAR_INVITATION = 26373

local ZONE_MOONGLADE = 493

function OnSummon(pUnit, event)
local entry = pUnit:GetEntry()
if(entry == NPC_FIREWORK_BLUE or entry == NPC_FIREWORK_GREEN or entry == NPC_FIREWORK_PURPLE or entry == NPC_FIREWORK_RED or entry == NPC_FIREWORK_YELLOW or entry == NPC_FIREWORK_WHITE or entry == NPC_FIREWORK_BIG_BLUE or entry == NPC_FIREWORK_BIG_GREEN or entry == NPC_FIREWORK_BIG_PURPLE or entry == NPC_FIREWORK_BIG_RED or entry == NPC_FIREWORK_BIG_YELLOW or entry == NPC_FIREWORK_BIG_WHITE)then
	local Obj1 = pUnit:GetGameObjectNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), GO_FIREWORK_LAUNCHER_1)
	local Obj2 = pUnit:GetGameObjectNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), GO_FIREWORK_LAUNCHER_2)
	local Obj3 = pUnit:GetGameObjectNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), GO_FIREWORK_LAUNCHER_3)
	if(Obj1 ~= nil or Obj2 ~= nil or Obj3 ~= nil)then
		if(Obj1 ~= nil)then
			local O1X, O1Y, O1Z, _ = Obj1:GetSpawnLocation()
			pUnit:TeleportCreature(O1X, O1Y, O1Z)
		elseif(Obj2 ~= nil)then
			local O2X, O2Y, O2Z, _ = Obj2:GetSpawnLocation()
			pUnit:TeleportCreature(O2X, O2Y, O2Z)
		elseif(Obj3 ~= nil)then
			local O3X, O3Y, O3Z, _ = Obj3:GetSpawnLocation()
			pUnit:TeleportCreature(O3X, O3Y, O3Z)
		end
		if(entry == NPC_FIREWORK_BLUE)then
			pUnit:FullCastSpell(SPELL_ROCKET_BLUE)
		elseif(entry == NPC_FIREWORK_GREEN)then
			pUnit:FullCastSpell(SPELL_ROCKET_GREEN)
		elseif(entry == NPC_FIREWORK_PURPLE)then
			pUnit:FullCastSpell(SPELL_ROCKET_PURPLE)
		elseif(entry == NPC_FIREWORK_RED)then
			pUnit:FullCastSpell(SPELL_ROCKET_RED)
		elseif(entry == NPC_FIREWORK_WHITE)then
			pUnit:FullCastSpell(SPELL_ROCKET_WHITE)
		elseif(entry == NPC_FIREWORK_YELLOW)then
			pUnit:FullCastSpell(SPELL_ROCKET_YELLOW)
		elseif(entry == NPC_FIREWORK_BIG_BLUE)then
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_BLUE)
		elseif(entry == NPC_FIREWORK_BIG_GREEN)then
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_GREEN)
		elseif(entry == NPC_FIREWORK_BIG_PURPLE)then
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_PURPLE)
		elseif(entry == NPC_FIREWORK_BIG_RED)then
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_RED)
		elseif(entry == NPC_FIREWORK_BIG_WHITE)then
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_WHITE)
		elseif(entry == NPC_FIREWORK_BIG_YELLOW)then
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_YELLOW)
		end
	end
elseif(entry == NPC_CLUSTER_BLUE or entry == NPC_CLUSTER_GREEN or entry == NPC_CLUSTER_PURPLE or entry == NPC_CLUSTER_RED or entry == NPC_CLUSTER_YELLOW or entry == NPC_CLUSTER_WHITE or entry == NPC_CLUSTER_BIG_BLUE or entry == NPC_CLUSTER_BIG_GREEN or entry == NPC_CLUSTER_BIG_PURPLE or entry == NPC_CLUSTER_BIG_RED or entry == NPC_CLUSTER_BIG_YELLOW or entry == NPC_CLUSTER_BIG_WHITE or entry == NPC_CLUSTER_ELUNE)then
	local Obj1 = pUnit:GetGameObjectNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), GO_CLUSTER_LAUNCHER_1)
	local Obj2 = pUnit:GetGameObjectNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), GO_CLUSTER_LAUNCHER_2)
	local Obj3 = pUnit:GetGameObjectNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), GO_CLUSTER_LAUNCHER_3)
	local Obj4 = pUnit:GetGameObjectNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), GO_CLUSTER_LAUNCHER_4)
	if(Obj1 ~= nil or Obj2 ~= nil or Obj3 ~= nil or Obj4 ~= nil)then
		if(Obj1 ~= nil)then
			local O1X, O1Y, O1Z, _ = Obj1:GetSpawnLocation()
			pUnit:TeleportCreature(O1X, O1Y, O1Z)
		elseif(Obj2 ~= nil)then
			local O2X, O2Y, O2Z, _ = Obj2:GetSpawnLocation()
			pUnit:TeleportCreature(O2X, O2Y, O2Z)
		elseif(Obj3 ~= nil)then
			local O3X, O3Y, O3Z, _ = Obj3:GetSpawnLocation()
			pUnit:TeleportCreature(O3X, O3Y, O3Z)
		elseif(Obj4 ~= nil)then
			local O4X, O4Y, O4Z, _ = Obj4:GetSpawnLocation()
			pUnit:TeleportCreature(O4X, O4Y, O4Z)
		end
		if(pUnit:GetZoneId() == ZONE_MOONGLADE)then
			if(pUnit:CalcToDistance(7558.993, -2839.999, 450.0214) < 100)then
				local chance = math.random(1,20)
				if(chance == 1)then
					PerformIngameSpawn(1, NPC_OMEN, 1, 7558.993, -2839.999, 450.0214, 4.46, 14, 0, 0, 0, 0, 0, 0)
				else
					PerformIngameSpawn(1, NPC_MINION_OF_OMEN, 1, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO() + math.random(-1,1), 14, 0, 0, 0, 0, 0, 0)
				end
			end
		end
		if(entry == NPC_CLUSTER_BLUE)then
			pUnit:FullCastSpell(SPELL_ROCKET_BLUE)
			pUnit:FullCastSpell(SPELL_ROCKET_BLUE)
			pUnit:FullCastSpell(SPELL_ROCKET_BLUE)
			pUnit:FullCastSpell(SPELL_ROCKET_BLUE)
		elseif(entry == NPC_CLUSTER_GREEN)then
			pUnit:FullCastSpell(SPELL_ROCKET_GREEN)
			pUnit:FullCastSpell(SPELL_ROCKET_GREEN)
			pUnit:FullCastSpell(SPELL_ROCKET_GREEN)
			pUnit:FullCastSpell(SPELL_ROCKET_GREEN)
		elseif(entry == NPC_CLUSTER_PURPLE)then
			pUnit:FullCastSpell(SPELL_ROCKET_PURPLE)
			pUnit:FullCastSpell(SPELL_ROCKET_PURPLE)
			pUnit:FullCastSpell(SPELL_ROCKET_PURPLE)
			pUnit:FullCastSpell(SPELL_ROCKET_PURPLE)
		elseif(entry == NPC_CLUSTER_RED)then
			pUnit:FullCastSpell(SPELL_ROCKET_RED)
			pUnit:FullCastSpell(SPELL_ROCKET_RED)
			pUnit:FullCastSpell(SPELL_ROCKET_RED)
			pUnit:FullCastSpell(SPELL_ROCKET_RED)
		elseif(entry == NPC_CLUSTER_WHITE)then
			pUnit:FullCastSpell(SPELL_ROCKET_WHITE)
			pUnit:FullCastSpell(SPELL_ROCKET_WHITE)
			pUnit:FullCastSpell(SPELL_ROCKET_WHITE)
			pUnit:FullCastSpell(SPELL_ROCKET_WHITE)
		elseif(entry == NPC_CLUSTER_YELLOW)then
			pUnit:FullCastSpell(SPELL_ROCKET_YELLOW)
			pUnit:FullCastSpell(SPELL_ROCKET_YELLOW)
			pUnit:FullCastSpell(SPELL_ROCKET_YELLOW)
			pUnit:FullCastSpell(SPELL_ROCKET_YELLOW)
		elseif(entry == NPC_CLUSTER_BIG_BLUE)then
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_BLUE)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_BLUE)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_BLUE)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_BLUE)
		elseif(entry == NPC_CLUSTER_BIG_GREEN)then
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_GREEN)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_GREEN)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_GREEN)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_GREEN)
		elseif(entry == NPC_CLUSTER_BIG_PURPLE)then
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_PURPLE)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_PURPLE)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_PURPLE)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_PURPLE)
		elseif(entry == NPC_CLUSTER_BIG_RED)then
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_RED)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_RED)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_RED)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_RED)
		elseif(entry == NPC_CLUSTER_BIG_WHITE)then
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_WHITE)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_WHITE)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_WHITE)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_WHITE)
		elseif(entry == NPC_CLUSTER_BIG_YELLOW)then
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_YELLOW)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_YELLOW)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_YELLOW)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_YELLOW)
		elseif(entry == NPC_CLUSTER_ELUNE)then
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_WHITE)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_WHITE)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_BLUE)
			pUnit:FullCastSpell(SPELL_ROCKET_BIG_BLUE)
			for k,v in pairs(pUnit:GetInRangePlayers())do
				if(v:HasAura(SPELL_LUNAR_FORTUNE))then
					v:RemoveAura(SPELL_LUNAR_FORTUNE)
				end
				v:AddAura(SPELL_LUNAR_FORTUNE, 3600000, false)
			end
		end
	end
end
end

RegisterUnitEvent(NPC_FIREWORK_BLUE,18,OnSummon)
RegisterUnitEvent(NPC_FIREWORK_GREEN,18,OnSummon)
RegisterUnitEvent(NPC_FIREWORK_PURPLE,18,OnSummon)
RegisterUnitEvent(NPC_FIREWORK_RED,18,OnSummon)
RegisterUnitEvent(NPC_FIREWORK_YELLOW,18,OnSummon)
RegisterUnitEvent(NPC_FIREWORK_WHITE,18,OnSummon)
RegisterUnitEvent(NPC_FIREWORK_BIG_BLUE,18,OnSummon)
RegisterUnitEvent(NPC_FIREWORK_BIG_GREEN,18,OnSummon)
RegisterUnitEvent(NPC_FIREWORK_BIG_PURPLE,18,OnSummon)
RegisterUnitEvent(NPC_FIREWORK_BIG_RED,18,OnSummon)
RegisterUnitEvent(NPC_FIREWORK_BIG_YELLOW,18,OnSummon)
RegisterUnitEvent(NPC_FIREWORK_BIG_WHITE,18,OnSummon)
RegisterUnitEvent(NPC_CLUSTER_BLUE,18,OnSummon)
RegisterUnitEvent(NPC_CLUSTER_GREEN,18,OnSummon)
RegisterUnitEvent(NPC_CLUSTER_PURPLE,18,OnSummon)
RegisterUnitEvent(NPC_CLUSTER_RED,18,OnSummon)
RegisterUnitEvent(NPC_CLUSTER_YELLOW,18,OnSummon)
RegisterUnitEvent(NPC_CLUSTER_WHITE,18,OnSummon)
RegisterUnitEvent(NPC_CLUSTER_BIG_BLUE,18,OnSummon)
RegisterUnitEvent(NPC_CLUSTER_BIG_GREEN,18,OnSummon)
RegisterUnitEvent(NPC_CLUSTER_BIG_PURPLE,18,OnSummon)
RegisterUnitEvent(NPC_CLUSTER_BIG_RED,18,OnSummon)
RegisterUnitEvent(NPC_CLUSTER_BIG_YELLOW,18,OnSummon)
RegisterUnitEvent(NPC_CLUSTER_BIG_WHITE,18,OnSummon)
RegisterUnitEvent(NPC_CLUSTER_ELUNE,18,OnSummon)


function NearLauncher( pUnit )
	local Obj1 = pUnit:GetGameObjectNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), GO_FIREWORK_LAUNCHER_1)
	local Obj2 = pUnit:GetGameObjectNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), GO_FIREWORK_LAUNCHER_2)
	local Obj3 = pUnit:GetGameObjectNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), GO_FIREWORK_LAUNCHER_3)
	
	if ( Obj1 ~= nil or Obj2 ~= nil or Obj3 ~= nil ) then
		return true
	end
	
	return false
end

function NearCluster( pUnit )
	local Obj1 = pUnit:GetGameObjectNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), GO_CLUSTER_LAUNCHER_1)
	local Obj2 = pUnit:GetGameObjectNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), GO_CLUSTER_LAUNCHER_2)
	local Obj3 = pUnit:GetGameObjectNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), GO_CLUSTER_LAUNCHER_3)
	local Obj4 = pUnit:GetGameObjectNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), GO_CLUSTER_LAUNCHER_4)
	
	if ( Obj1 ~= nil or Obj2 ~= nil or Obj3 ~= nil or Obj4 ~= nil ) then
		return true
	end
	
	return false
end

function LaunchRocket (event, pPlayer, SpellId, pSpellObject)

	-- spells
	local SM_RD_Rocket	= 26286  -- Small Red Rocket
	local SM_BL_Rocket	= 26291  -- Small Blue Rocket
	local SM_GN_Rocket	= 26292  -- Small Green Rocket
	local BL_FW_Cluster	= 26304  -- Blue Firework Cluster
	local GN_FW_Cluster	= 26325  -- Green Firework Cluster
	local RD_FW_Cluster	= 26327  -- Red Firework Cluster
	
	local Quest = 8867
	
	if ( pPlayer:HasQuest(Quest) ) then
	
		if ( NearLauncher(pPlayer) and (SpellId==SM_RD_Rocket or SpellId==SM_BL_Rocket or SpellId==SM_GN_Rocket) ) then
			if(pPlayer:GetQuestObjectiveCompletion(Quest, 0) < 8)then
				pPlayer:AdvanceQuestObjective(Quest, 0)
			end
		elseif ( NearCluster(pPlayer) and (SpellId==BL_FW_Cluster or SpellId==GN_FW_Cluster or SpellId==RD_FW_Cluster) ) then
			if(pPlayer:GetQuestObjectiveCompletion(Quest, 1) < 2)then		
				pPlayer:AdvanceQuestObjective(Quest, 1)
			end
		end

	end

end


function MoonTeleport( event, pPlayer, SpellId, pSpellObject )
	local Quest = 8883
	local Moonlight = 15897

	if ( pPlayer:HasQuest(Quest) ) then
		local pMoonlight = pPlayer:GetCreatureNearestCoords(pPlayer:GetX(), pPlayer:GetY(), pPlayer:GetZ(), Moonlight)
		if ( pMoonlight ~= nil and pPlayer:GetDistanceYards(pMoonlight)<1.5) then
			RegisterTimedEvent("Moonflight", 2000, 1, pPlayer)
		end
	end

end

function Moonflight(pPlayer)
	pPlayer:Teleport(1, 7935, -2624, 492.6, 0.84)
end


RegisterServerHook(10, "LaunchRocket") -- SERVER_HOOK_CAST_SPELL
RegisterServerHook(10, "MoonTeleport") -- SERVER_HOOK_CAST_SPELL
