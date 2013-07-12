--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local mod = getfenv(1)
local self = getfenv(1)

function OnSpawn(Unit, Event)
	Unit:SendChatMessage(14, 0, "Keep your minds focused for the days of reckoning are close at hand. Soon, the destroyer of worlds will return to make good on his promise. Soon the destruction of all that is will begin!")
	Unit:PlaySoundToSet(10522)
	Unit:RegisterEvent(RandomEmote, 3500, 0)
end

function OnCombat(Unit, Event, _, mAggro)
	Unit:RemoveEvents()
	self[tostring(Unit)] = {
		draw = math.random(20,30),
		volley = math.random(2,5),
		rain = nil,
		banish = math.random(15,30),
		rifts = {},
		enrage = false,
		isHeroic = (mAggro:IsPlayer() and mAggro:IsHeroic() )
	}
	local say = math.random(1,3)
	if(say == 1) then
		Unit:PlaySoundToSet(10524)
		Unit:SendChatMessage(14, 0, "I'll make an offering of your blood.")
	elseif(say == 2) then
		Unit:SendChatMessage(14, 0, "You'll be a fine example for the others.")
		Unit:PlaySoundToSet(10525)
	else
		Unit:SendChatMessage(14, 0, "Good! A worthy sacrifice!")
		Unit:PlaySoundToSet(10526)
	end
	Unit:RegisterAIUpdateEvent(1000)
	Unit:RegisterEvent(SummonPortals, math.random(7,9)*1000, 1)
	local allies = Unit:GetInRangeFriends()
	for _,v in pairs(allies) do
		if( Unit:GetDistanceYards(v) <= 100) then
			v:AttackReaction(mAggro, 1, 0)
		end
	end
end

function RandomEmote(Unit, Event)
	local emote_type = math.random(1,4)
	if(emote_type == 1) then
		Unit:Emote(LCF.EMOTE_ONESHOT_ROAR, 0)
	elseif(emote_type == 2) then
		Unit:Emote(LCF.EMOTE_ONESHOT_TALK, 0)
	elseif(emote_type == 3) then
		Unit:Emote(LCF.EMOTE_ONESHOT_EXCLAMATION, 0)
	else
		Unit:Emote(LCF.EMOTE_ONESHOT_NO,0)
	end
end

function SummonPortals(Unit, Event)
	Unit:PlaySoundToSet(10523)
	Unit:SendChatMessage(14, 0, "Come to my aid! Heed your master now!")
	local summon_spells = {33582, 33583, 33584, 33585, 33586}
	local portal_coords = {
		{-304.642212, -252.788239, 12.683180},
		{-305.964783, -269.496185, 12.682022},
		{-280.969879, -242.080200, 12.682602},
		{-266.907715, -289.525787, 12.682111},
		{-222.894775, -262.996704, 17.086409}
	}
	local angle = 0
	for i = 1,5 do
		local x,y,z = portal_coords[i][1],portal_coords[i][2],portal_coords[i][3]
		Unit:CastSpellAoF(x,y,z, 33566)
		local portal = Unit:GetCreatureNearestCoords(x,y,z, 19224)
		if(portal) then
			portal:SetUInt32Value(LCF.Unit_CHANNEL_SPELL,summon_spells[i])
			portal:CastSpell(33569)
		end
	end
end

function TeleportPlayers(Unit, Event)
	local x,y,z,o = Unit:GetSpawnLocation()
	for _,v in pairs(Unit:GetInRangeEnemies()) do
		if(v:IsCreature()) then
			v:TeleportCreature(x,y,z,o)
		else
			v:Teleport(Unit:GetMapId(), x,y,z,o)
		end
	end
	Unit:TeleportCreature(x,y,z)
end

function OnWipe(Unit, Event)
	self[tostring(Unit)] = nil
	Unit:RemoveAIUpdateEvent()
	for _,v in pairs(Unit:GetInRangeUnits()) do
		if(v:GetEntry() == 19226) then
			v:Despawn(1, 0)
		end
	end
	if(Unit:IsAlive()) then
		Unit:SendChatMessage(14, 0, "Fools!")
	end
end

function OnKill(Unit)
	local say = math.random(1,2)
	if(say == 1) then
		Unit:SendChatMessage(14, 0, "I serve with pride!")
		Unit:PlaySoundToSet(10527)
	else
		Unit:SendChatMessage(14, 0, "Your death is for the greater cause!")
		Unit:PlaySoundToSet(10528)
	end
	local gate = Unit:GetGameObjectNearestCoords(-160.663055, -310.451263, 17.086189, 183295)
	if(gate) then
		gate:Open()
	end
end

function OnDeath(Unit)
	Unit:SendChatMessage(14, 0, "I give my life... gladly...")
	Unit:PlaySoundToSet(10529)
end

function AIUpdate(Unit)
	if(	Unit:IsCasting()) then
		return
	end
	if( Unit:GetNextTarget() == nil) then
		Unit:WipeThreatList()
		return
	end
	local vars = self[tostring(Unit)]
	vars.draw = vars.draw - 1
	vars.volley = vars.volley - 1
	vars.banish = vars.banish - 1
	if((vars.isHeroic) and (vars.banish <= 0)) then
		local enemy = Unit:GetRandomEnemy()
		Unit:FullCastSpellOnTarget(38791, enemy)
		vars.banish = math.random(15,30)
	elseif(vars.draw <= 0) then
		Unit:FullCastSpell(33563)
		Unit:SendChatMessage(14, 0, "The darkness in your souls draws you ever closer...")
		vars.draw = math.random(20,30)
		vars.rain = 0
		Unit:RegisterEvent(TeleportPlayers, 1000, 1)
	elseif((vars.rain ~= nil) and (vars.rain <= 0)) then
		if(vars.isHeroic) then
			Unit:FullCastSpell(39363)
		else
			Unit:FullCastSpell(33617)
		end
		vars.rain = nil
	elseif(vars.volley <= 0) then
		Unit:FullCastSpell(33841)
		vars.volley = math.random(10,15)
	end
end

RegisterUnitEvent(18732, 18, "OnSpawn")
RegisterUnitEvent(18732, 1, "OnCombat")
RegisterUnitEvent(18732, 2, "OnWipe")
RegisterUnitEvent(18732, 3, "OnKill")
RegisterUnitEvent(18732, 4, "OnDeath")
RegisterUnitEvent(18732, 21, "AIUpdate")

function VoidRift_OnSpawn(Unit, Event)
	self[tostring(Unit)] = {
		spawn_time = math.random(2,5),
		reduce_timer = 45,
		reduce_cnt = 0
	}
	Unit:RegisterAIUpdateEvent(1000)
	Unit:FullCastSpell(33569)
	Unit:SetUnselectable()
	local vorpil = Unit:GetCreatureNearestCoords(-255.083817, -264.261200, 17.086420, 18732)
	if(vorpil) then
		Unit:SetCreator(vorpil)
	end
end

function VoidRift_Update(Unit, Event)
	local vorpil = Unit:GetCreator()
	if((vorpil:IsDead()) or (vorpil:IsInCombat() == false)) then
		Unit:RemoveAIUpdateEvent()
		self[tostring(Unit)] = nil
		Unit:Despawn(1,0)
		return
	end
	local vars = self[tostring(Unit)]
	vars.spawn_time = vars.spawn_time - 1
	vars.reduce_timer = vars.reduce_timer - 1
	if(vars.spawn_time <= 0) then
		Unit:FullCastSpell(Unit:GetUInt32Value(LCF.Unit_CHANNEL_SPELL))
		if(vars.reduce_cnt < 2) then
			vars.spawn_time = 30
		elseif(vars.reduce_cnt < 4) then
			vars.spawn_time = 25
		elseif(vars.reduce_cnt  < 6) then
			vars.spawn_time = 20
		elseif(vars.reduce_cnt > 7) then
			vars.spawn_time = 15
		end
	elseif(vars.reduce_timer <= 0) then
		vars.reduce_timer = 45
		vars.reduce_cnt = vars.reduce_cnt +1
	end
end

RegisterUnitEvent(19224, 18, "VoidRift_OnSpawn")
RegisterUnitEvent(19224, 21, "VoidRift_Update")

function Traveller_OnSpawn(Unit)
	Unit:DisableTargeting(true)
	local portal = Unit:GetLocalCreature(19224)
	if(portal:GetCreator()) then
		Unit:SetCreator(portal:GetCreator())
		Unit:ModifyRunSpeed(3)
		Unit:SetUnitToFollow(portal:GetCreator(), 1, math.pi)
		Unit:RegisterAIUpdateEvent(500)
	else
		Unit:Despawn(1000, 0)
	end
end

function Traveller_OnWipe(Unit)
	Unit:RemoveAIUpdateEvent()
end

function TravellerUpdate(Unit)
	local vorpil = Unit:GetCreator()
	if((vorpil:IsInCombat() == false) or (vorpil:IsDead())) then
		Unit:Kill(Unit)
		Unit:Despawn(0, 0)
		return
	end
	if(Unit:GetDistanceYards(vorpil) <= 5) then
		if(self[tostring(vorpil)].isHeroic) then
			vorpil:FullCastSpell(39364)
		else
			vorpil:FullCastSpell(33783)
		end
		Unit:FullCastSpell(33846)
		Unit:RemoveAIUpdateEvent()
		Unit:Despawn(1000, 0)
	end
end

RegisterUnitEvent(19226, 18, "Traveller_OnSpawn")
RegisterUnitEvent(19226, 21, "TravellerUpdate")
RegisterUnitEvent(19226, 2, "Traveller_OnWipe")