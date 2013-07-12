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

function OnSpawn(Event)
	Unit:SetHealthPct(40)
	Unit:RegisterEvent(Murmur_Wrath, 5000, 1)
end

function OnCombat(Event, _, mAggro)
	self[tostring(Unit)] = {
		boom = math.random(30,40),
		touch = math.random(20,30),
		shockwave = math.random(15,30),
		sonic = math.random(2,5),
		resonance = 5,
		touched_plr = nil,
		storm = math.random(15,20),
		isHeroic = (mAggro:IsPlayer() and mAggro:IsHeroic())
	}
	Unit:RegisterAIUpdateEvent(1000)
	Unit:Root()
	if(mAggro:IsHeroic()) then
		print("Is heroic")
	else
		print("Not heroic")
	end
end

function OnWipe(Event)
	self[tostring(Unit)] = nil
	Unit:RemoveAIUpdateEvent()
	if( Event:IsAlive()) then
		Unit:Despawn(100, 10000)
	end
end

function AIUpdate(Event)
	if( Event:IsCasting()) then
		return
	end
	if( Event:GetNextTarget() == nil) then
		Unit:WipeThreatList()
		return
	end
	local vars = self[tostring(Unit)]
	vars.boom = vars.boom - 1
	vars.touch = vars.touch - 1
	vars.shockwave = vars.shockwave - 1
	vars.sonic = vars.sonic - 1
	vars.resonance = vars.resonance - 1
	--vars.storm = vars.storm - 1
	if(vars.boom <= 0) then
		Unit:FullCastSpell(33923)
		Unit:SendChatMessahe(16, 0, Unit:GetName().." draws energy from the air!")
		vars.boom = math.random(30,40)
	elseif(vars.shockwave <= 0) then
		if(vars.isHeroic and vars.touched_plr ~= nil) then
			local dummy = Unit:SpawnCreature(18654, vars.touched_plr:GetLocation(), Unit:GetFaction(), 0)
			dummy:SetUnselectable()
			for _,v in pairs(Unit:GetInRangeEnemies()) do
				dummy:FullCastSpellOnTarget(33689, v)
			end
			dummy:Despawn(1, 0)
		elseif(vars.isHeroic == false) then
			Unit:FullCastSpellOnTarget(33689, Unit:GetRandomEnemy())
			Unit:FullCastSpell(33686)
		end
		vars.shockwave = math.random(15,30)
	elseif(vars.isHeroic and vars.sonic <= 0) then
		Unit:FullCastSpellOnTarget(38797, Unit:GetRandomEnemy())
		vars.sonic = math.random(10,15)
--	elseif(vars.isHeroic and vars.storm <= 0) then
	elseif(vars.touch <= 0) then
		if(vars.isHeroic) then
			Unit:FullCastSpellOnTarget(38794, Unit:GetRandomEnemy())
			Unit:GetRandomEnemy():RegisterLuaEvent(Murmur_Touch, 7000, 1)
		else
			Unit:FullCastSpellOnTarget(33711, Unit:GetRandomEnemy())
			Unit:GetRandomEnemy():RegisterLuaEvent(Murmur_Touch, 14000, 1)
		end
		vars.touched_plr = Unit:GetRandomEnemy()
		vars.touch = math.random(15,30)
	end
	if(Event:GetDistanceYards(Unit:GetMainTank()) > 25 and vars.resonance <= 0) then
		Unit:FullCastSpell(33657)
		vars.resonance = 5
	end
end

function Murmur_Touch(victim)
	victim:FullCastSpell(46402)
end

function Murmur_Wrath(Event)
	local Units = Unit:GetInRangeUnits()
	for _,v in pairs(Events) do
		if(Event:GetDistanceYards(v) <= 100 and v:IsAlive()) then
			Unit:FullCastSpellOnTarget(33331, v)
			Unit:Kill(v)
		end
	end
end

function SonicBoom_Dummy(_, spell)
	for _,v in pairs(spell:GetCaster():GetInRangeEnemies()) do
		if(spell:GetCaster():GetDistanceYards(v) <= 34) then
			local pct = math.random(90,95)
			local hp = v:GetHealth() * pct / 100
			spell:GetCaster():DealDamage(v, hp, 33666)
		end
	end
	spell:GetCaster():FullCastSpell(33666)
end

RegisterUnitEvent(18708, 18, "OnSpawn")
RegisterUnitEvent(18708, 1, "OnCombat")
RegisterUnitEvent(18708, 2, "OnWipe")
RegisterUnitEvent(18708, 21, "AIUpdate")
RegisterDummySpell(33923, "SonicBoom_Dummy")