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
assert(type(mod) == "table")
local self = getfenv(1)
WorldDBQuery("DELETE FROM ai_agents WHERE entry = 18344;")

function OnSpawn(Unit, Event)
	for i = 1,3 do
		Unit:FullCastSpell(32371)
	end
end

function OnCombat(Unit, Event, _, mAggro)
	self[tostring(Unit)] = {
		fireball = math.random(2,5),
		frostbolt = math.random(2,5),
		blink = math.random(20,30),
		beacon_spawn = 10,
		isHeroic = (mAggro:IsPlayer() and mAggro:IsHeroic())
	}
	local allies = Unit:GetInRangeFriends()
	for _,v in pairs(allies) do
		if(v:GetEntry() == 18431) then
			v:AttackReaction(mAggro,1,0)
		end
	end
	local say_text = math.random(1,3)
	if(say_text == 1) then
		Unit:SendChatMessage(14, 0, "We have not yet been properly introduced.")
		Unit:PlaySoundToSet(10541)
	elseif(say_text == 2) then
		Unit:SendChatMessage(14, 0, "An epic battle. How exciting!")
		Unit:PlaySoundToSet(10542)
	else
		Unit:SendChatMessage(14, 0, "I have longed for a good adventure!")
		Unit:PlaySoundToSet(10543)
	end
	Unit:RegisterAIUpdateEvent(1000)
end

function OnWipe(Unit, Event)
	Unit:RemoveAIUpdateEvent()
	self[tostring(Unit)] = nil
end

function OnTargetKill(Unit, Event)
	local say_text = math.random(1,2)
	if(say_text) then
		Unit:SendChatMessage(14, 0, "It has been... entertaining.")
		Unit:PlaySoundToSet(10544)
	else
		Unit:SendChatMessage(14, 0, "And now we part company.")
		Unit:PlaySoundToSet(10545)
	end
end

function OnDeath(Unit, Event)
	Unit:SendChatMessage(14, 0, "I must bid you... farewell.")
	Unit:PlaySoundToSet(10546)
end

function AIUpdate(Unit, Event)
	if(Unit:IsCasting()) then
		return
	end
	if(Unit:GetNextTarget() == nil) then
		Unit:WipeThreatList()
	end
	local args = self[tostring(Unit)]
	args.fireball = args.fireball -1
	args.frostbolt = args.frostbolt -1
	args.blink = args.blink -1
	args.beacon_spawn = args.beacon_spawn - 1
	if(args.beacon_spawn <= 0) then
		Unit:FullCastSpell(32371)
		local say_chance = math.random(1)
		if(say_chance) then
			Unit:SendChatMessage(14, 0, "I have such fascinating things to show you.")
			Unit:PlaySoundToSet(10540)
		end
		if(args.isHeroic) then
			args.beacon_spawn = math.random(5,8)
		else
			args.beacon_spawn = 10
		end
	elseif(args.blink <=0) then
		Unit:FullCastSpell(32365)
		Unit:FullCastSpell(33546)
		args.blink = math.random(25,35)
	elseif(args.frostbolt <= 0) then
		Unit:FullCastSpellOnTarget(32370, Unit:GetRandomEnemy())
		args.frostbolt = math.random(7,15)
	elseif(args.fireball <= 0) then
		Unit:FullCastSpellOnTarget(20420, Unit:GetRandomEnemy())
		args.fireball = math.random(7,15)
	end
end

RegisterUnitEvent(18344, 1, "OnCombat")
RegisterUnitEvent(18344, 2, "OnWipe")
RegisterUnitEvent(18344, 3, "OnTargetKill")
RegisterUnitEvent(18344, 4, "OnDeath")
RegisterUnitEvent(18344, 21, "AIUpdate")

function BeaconOnSpawn(Unit, Event)
	Unit:SetCreator(Unit:GetLocalCreature(18344))
	if(Unit:GetLocalCreature(18344):IsInCombat() == false) then
		return
	end
	Unit:AttackReaction(Unit:GetRandomEnemy(), 1, 0)
end

function BeaconOnCombat(Unit, Event)
	Unit:RegisterEvent(ArcaneBolt, 2500, 0)
	if(self[tostring(Unit:GetCreator())].isHeroic) then
		Unit:RegisterEvent(SummonApprentice, 10000, 1)
	else
		Unit:RegisterEvent(SummonApprentice, 20000, 1)
	end
end

function BeaconOnWipe(Unit, Event)
	Unit:RemoveEvents()
end

function ArcaneBolt(Unit, Event)
	Unit:FullCastSpellOnTarget(15254, Unit:GetRandomEnemy())
end

function SummonApprentice(Unit, Event)
	Unit:GetCreator():FullCastSpell(32372)
	Unit:WipeThreatList()
	Unit:Despawn(0, 0)
end

RegisterUnitEvent(18431, 18, "BeaconOnSpawn")
RegisterUnitEvent(18431, 1, "BeaconOnCombat")
RegisterUnitEvent(18431, 2, "BeaconOnWipe")

function ApprenticeOnSpawn(Unit, Event)
	Unit:AttackReaction(Unit:GetLocalCreature(18344):GetNextTarget(), 1, 0)
end

function ApprenticeOnCombat(Unit, Event)
	Unit:RegisterEvent(ApprenticeSpells, 5000, 0)
end

function ApprenticeOnWipe(Unit, Event)
	Unit:RemoveEvents()
end

function ApprenticeSpells(Unit, Event)
	if(Unit:IsCasting()) then 
		return 
	end
	if(Unit:GetNextTarget() == nil) then
		Unit:WipeThreatList()
		if(Unit:GetCreator()) then
			Unit:SetUnitToFollow(Unit:GetCreator(), 5, (45/180)*math.pi)
		end
	end
	local spelltocast = math.random(1,2)
	if(spelltocast) then
		Unit:FullCastSpellOnTarget(32369, Unit:GetRandomEnemy())
	else
		Unit:FullCastSpellOnTarget(32370, Unit:GetRandomEnemy())
	end
end

RegisterUnitEvent(18430, 18, "ApprenticeOnSpawn")
RegisterUnitEvent(18430, 1, "ApprenticeOnCombat")
RegisterUnitEvent(18430, 2, "ApprenticeOnWipe")