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
assert(mod)
local self = getfenv(1)
WorldDBQuery("DELETE FROM ai_agents WHERE entry = 23035;")

function OnSpawn(Unit, Event)
	local claw = Unit:GetLocalGameObject(185554)
	if(claw) then
		claw:RemoveFromWorld()
	end
	Unit:SendChatMessage(14, 0, "No! How can this be?!")
	Unit:SendChatMessage(14, 0, "Pain will be the price for your insolence! You cannot stop me from claiming the Emerald Dream as my own!")
end

function OnCombat(Unit, Event, _, mTarget)
	self[tostring(Unit)] = {
		spell_bomb = math.random(5,15),
		cyclone = math.random(2,10),
		screech = math.random(15,30),
		m_banished = false,
		banish_phase = 1,
		banish_timer = nil,
		crows = {}
	}
	Unit:RegisterAIUpdateEvent(1000)
end

function OnWipe(Unit, Event, _, mTarget)
	Unit:RemoveAIUpdateEvent()
	Unit:RemoveLuaEvents()
	for _,v in pairs(self[tostring(Unit)].crows) do
		v:Despawn(1000, 0)
	end
	self[tostring(Unit)] = nil
end

function AIUpdate(Unit, Event)
	if(Unit:IsCasting() ) then
		return
	end
	if(Unit:GetNextTarget() == nil) then
		Unit:WipeThreatList()
		return
	end
	local vars = self[tostring(Unit)]
	--Seems casted only when he's going banishment.
	--vars.spell_bomb = vars.spell_bomb - 1
	vars.cyclone = vars.cyclone - 1
	vars.screech = vars.screech - 1
	if(vars.screech <= 0) then
		Unit:FullCastSpell(40184)
		vars.screech = math.random(20,30)
	elseif(vars.cyclone <= 0) then
		local target = Unit:GetRandomEnemy()
		--we use getrandom enemy to allow this boss to fight another npc if it's ever put in that situation
		--[[while(tostring(target) == tostring(Unit:GetMainTank())) do
			target = Unit:GetRandomEnemy()
		end]]
		Unit:FullCastSpellOnTarget(40321, target)
		vars.cyclone = math.random(15,20)
	elseif((vars.spell_bomb ~= nil) and (vars.spell_bomb <= 0)) then
		Unit:FullCastSpellOnTarget(40303, Unit:GetRandomPlayer(0))
		vars.spell_bomb = nil
		local say = math.random(1,2)
		if(say == 1) then
			Unit:MonsterWhisperToPlayer(Unit:GetRandomPlayer(0), "Yes...cast your precious little spells, ak-a-ak!")
		else
			Unit:MonsterWhisperToPlayer(Unit:GetRandomPlayer(0), "Your magics shall be your undoing... ak-a-ak..")
		end
	else
		local hp = Unit:GetHealthPct()
		if(((hp <= 66) and (vars.banish_phase ==1)) or ((hp <= 33) and (vars.banish_phase == 2))) then
			BanishEvent(Unit, 1)
			vars.banish_phase = vars.banish_phase +1
		end
	end
	if(vars.m_banished) then
		vars.banish_timer = vars.banish_timer -1 
		if(vars.banish_timer <= 0 or vars.crows == 0) then
			vars.m_banished = false
			Unit:DisableMelee(false)
			Unit:SetAttackable()
			Unit:SetSelectable()
			Unit:RemoveAura(32567)
		end
	end
end

function BanishEvent(Unit, Event, phase)
	if(phase == 1) then
		Unit:SendChatMessage(14, 0, "Awaken my children and assist your master!")
		Unit:RegisterLuaEvent(BanishEvent, 5000, 1, 2)
		Unit:DisableMelee(true)
	elseif(phase == 2) then
		local vars = self[tostring(Unit)]
		Unit:FullCastSpell(32567)
		Unit:SetUnattackable()
		Unit:SetUnselectable()
		vars.m_banished = true
		vars.banish_timer = 60
		vars.spell_bomb = 0
		Unit:RegisterLuaEvent(BanishEvent, 3000, 1)
	else
		local vars = self[tostring(Unit)]
		for i = 1,math.random(10,16) do
			table.insert(vars.crows, Unit:SpawnCreature(23132, Unit:GetX(), Unit:GetY(), Unit:GetZ()+15, Unit:GetO(), 0, 0))
		end
	end
end

function SummonRavenGod(_, pSpell) --To do: Simulate the cool entrance effects of anzu
	local claw = pSpell:GetCaster():GetLocalGameObject(185554)
	if(claw) then
		claw:SpawnLocalCreature(23035, 0, 0)
	end
end

RegisterDummySpell(40098, "SummonRavenGod")
RegisterUnitEvent(23035, 18, "OnSpawn")
RegisterUnitEvent(23035, 1, "OnCombat")
RegisterUnitEvent(23035, 2, "OnWipe")
RegisterUnitEvent(23035, 21, "AIUpdate")

function BroodOnSpawn(Unit, Event)
	Unit:SetFlying()
	Unit:ModifyFlySpeed(15)
	local angle = 0
	local radius = math.random(20)
	for i = 1,8 do
		Unit:CreateCustomWaypoint(1, Unit:GetX()+math.cos(math.rad(angle))*radius, Unit:GetY()+math.sin(math.rad(angle))*radius, Unit:GetZ(), Unit:GetO(), 0, 0x300)
		angle = angle + 45
		wp = wp + 1
	end
--	Unit:SetAIState(10)
	Unit:SetMovementType(1)
	Unit:RegisterEvent(BroodLandAndAttack, 10000, 1)
end

function BroodLandAndAttack(Unit, Event)
	Unit:DeleteWaypoints()
	Unit:AttackReaction(Unit:GetRandomEnemy(), 1, 0)
	Unit:MoveToUnit(Unit:GetRandomEnemy())
end

RegisterUnitEvent(23132, 18, "BroodOnSpawn")