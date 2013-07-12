--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

math.randomseed(os.time())

function Ysondre_OnCombat(Unit, Event)
	setvars(Unit,{deadplrs = {}})
	Unit:SendChatMessage(13, 0, "The strands of LIFE have been severed! The Dreamers must be avenged!")
	Unit:RegisterEvent("Ysondre_DruidSpawn", 5000, 0)
	Unit:RegisterEvent("Ysondre_Breath", math.random(9000,10000), 1)
	Unit:RegisterEvent("Ysondre_TailSweep", math.random(2000,2500),1)
	Unit:RegisterEvent("Ysondre_LightningWave", math.random(15000, 18000), 1)
end

function Ysondre_DruidSpawn(Unit, Event)
	local hp = Unit:GetHealthPct()
	local player = Unit:GetRandomPlayer(0);
	if((hp <= 75) and (phase == nil)) then
		Unit:SendChatMessage(13, 0, "Come forth, ye Dreamers - and claim your vengeance!")
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
	phase=1;
	return;
	end
	if((hp <= 50) and (phase == 1)) then
		Unit:SendChatMessage(14, 0, "Come forth, ye Dreamers - and claim your vengeance!")
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
	phase=2;
	return;
	end
	if((hp <= 25) and (phase == 2)) then
		Unit:SendChatMessage(14, 0, "Come forth, ye Dreamers - and claim your vengeance!")
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
		Unit:SpawnCreature(15260, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0)
	phase=3;
	return;
	end
end

function Ysondre_LightningWave(Unit, Event)
    Unit:FullCastSpellOnTarget(24819, Unit:GetRandomPlayer(0))
	Unit:RegisterEvent("Ysondre_LightningWave", math.random(15000, 18000), 1)
end

function Ysondre_OnWipe(Unit, Event)
	Unit:RemoveEvents()
	--[[local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if v:GetEntry() == 15224 then
			v:Despawn(100, 0)
		end
	end]]
end
--[[
function Emeriss_Fog(Unit, Event)
	Unit:AddAssistTarget(Unit:SpawnCreature(15224, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(),14, 120000))
	Unit:RegisterEvent("Emeriss_Fog",120000, 1)
end
]]
function Ysondre_OnKill(Unit, Event, pMisc)
	local args = getvars(Unit)
	if(pMisc:IsPlayer() == true) then
		Unit:FullCastSpellOnTarget(25040, pMisc)
		table.insert(args.deadplrs, pMisc)
	end
end

function Ysondre_OnDeath(Unit, Event)
	Unit:RemoveEvents()
end

function Ysondre_Breath(Unit, Event)
	Unit:StopMovement(3000)
	Unit:SetAttackTimer(3000,0)
	Unit:FullCastSpell(24818)
	Unit:RegisterEvent("Ysondre_Breath", math.random(9000,10000), 1)
end

function Ysondre_TailSweep(Unit, Event)
	local tbl = Unit:GetInRangePlayers()
	for k,v in pairs(tbl) do
		if(Unit:GetDistance(v) <= 50) then
			if(v:IsInBack(Unit) == true) then
				Unit:SetAttackTimer(3000, 0)
				Unit:FullCastSpell(15847)
			end
			break
		end
	end
	Unit:RegisterEvent("Ysondre_TailSweep", math.random(2000,3000), 1)
end

RegisterUnitEvent(14887,1,"Ysondre_OnCombat")
RegisterUnitEvent(14887,2,"Ysondre_OnWipe")
RegisterUnitEvent(14887,3,"Ysondre_OnKill")
RegisterUnitEvent(14887,4,"Ysondre_OnDeath")

--[[
function Emeriss_Immune(Unit, Event)
	if(Unit:HasAura(24871) == true) then
		Unit:RemoveAura(24871)
	end
end

function Emeriss_MTRange(Unit, Event)
	if(Unit:GetDistance(tank) >= 100) then
		Unit:GetMainTank():Teleport(0, Unit:GetX(), Unit:GetY(), Unit:GetZ())
		Unit:PlaySpellVisual(Unit:GetMainTank(), 24776)
	end
	Unit:RegisterEvent("Emeriss_MTRange", 1000, 1)
end

RegisterUnitEvent(15224, 18, "DreamFog_OnSpawn")
RegisterUnitEvent(15224, 19, "DreamFog_OnReachWp")

function DreamFog_OnSpawn(Unit, Event)
	Unit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE)
	Unit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_2)
	Unit:SetModel(18075)
	Unit:CastSpell(24777)
	Unit:SetCombatMeleeCapable(1)
	Unit:SetCombatTargetingCapable(1)
	Unit:WipeTargetList()
	Unit:ModifyWalkSpeed(9)
	Unit:RegisterEvent("DreamFog_Patrol",100, 1)
end

function DreamFog_Patrol(Unit, Event)
	local tbl = Unit:GetInRangePlayers()
	local no = math.random(1,table.getn(tbl))
	Unit:CreateCustomWaypointMap()
	Unit:CreateWaypoint(tbl[no]:GetX(),tbl[no]:GetY(),tbl[no]:GetZ(),Unit:GetO(),0,0,0)
	Unit:MoveToWaypoint(1)
	Unit:RegisterEvent("DreamFog_MarkCheck", 1000, 1)
end

function DreamFog_MarkCheck(Unit, Event)
	local plr = Unit:GetClosestPlayer()
	if((plr ~= nil) and (Unit:GetDistance(plr) <= 20)) then
		if(plr:HasAura(25040) == true) then
			if(plr:HasAura(25043) == false) then
				Unit:FullCastSpellOnTarget(25043, plr)
				plr:RemoveAura(24778)
			else
				Unit:RemoveEvents()
			end
		else
			Unit:RemoveEvents()
		end
	else
		Unit:RemoveEvents()
	end
	Unit:RegisterEvent("DreamFog_MarkCheck", 1000, 1)
end

function DreamFog_OnReachWp(Unit, Event,pMisc, wp)
	Unit:RemoveEvents()
	if(wp == 1) then
		Unit:DestroyCustomWaypointMap()
		Unit:RegisterEvent("DreamFog_Patrol", 100, 1)
	end
end
]]
--Demented Druid Spirit AI
function Druid_Moonfire(pUnit, Event)
    pUnit:FullCastSpellOnTarget(24957, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Druid_Moonfire", math.random(6000, 9000), 1)
end

function Druid_Silence(pUnit, Event)
    pUnit:FullCastSpellOnTarget(6726, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Druid_Silence", math.random(8000, 12000), 1)
end

function Druid_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Druid_Moonfire", math.random(6000, 9000), 1)
	pUnit:RegisterEvent("Druid_Silence", math.random(8000, 12000), 1)
end

RegisterUnitEvent(15260, 1, "Druid_OnEnterCombat")

function Druid_OnWipe(pUnit, Event)
    pUnit:RemoveEvents()
	pUnit:Despawn(100, 0)
end

RegisterUnitEvent(15260, 2, "Druid_OnWipe")