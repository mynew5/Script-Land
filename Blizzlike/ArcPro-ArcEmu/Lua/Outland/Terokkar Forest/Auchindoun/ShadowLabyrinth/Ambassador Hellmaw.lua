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
	local cage = Unit:GetGameObjectNearestCoords(-63.400253,42.193386,0.195916,182943)
	if(cage) then
		cage:Open()
	end
	Unit:CreateCustomWaypoint(1, Unit:GetX()+math.cos(Unit:GetO())*10, Unit:GetY()+math.sin(Unit:GetO())*10, Unit:GetZ(), Unit:GetO(), 0, 0x100)
	Unit:MoveToWaypoint(1)
	self[tostring(Unit)] = { }
	Unit:PlaySoundToSet(10473)
	Unit:SendChatMessage(14, 0, "Infidels have invaded the sanctuary! Sniveling pests... You have yet to learn the true meaning of agony!")
end

function OnReachWp(Unit, Event, _, wp, foward)
	if(wp == 1) then
		local vars = self[tostring(Unit)]
		vars.ritualists = {}
		local rad = Unit:GetO()-(math.pi/2)
		for i = 1,3 do
			table.insert(vars.ritualists, Unit:SpawnCreature(18794, Unit:GetX()+math.cos(rad)*10, Unit:GetY()+math.sin(rad)*10, Unit:GetZ(), Unit:GetO(), 0, 0))
			rad = rad+(math.pi/2)
		end
		for _,v in pairs(vars.ritualists) do
			v:SetCreator(Unit)
			v:ChannelSpell(38469, Unit)
		end
		vars.banished = true
		Unit:FullCastSpell(32567)
		Unit:SetUnattackable()
		Unit:DisableCombat(true)
		Unit:RegisterAIUpdateEvent(1000)
	elseif(wp == 10) then
		Unit:DeleteWaypoints()
		Unit:CreateCustomWaypoint(2, -153.943848, 40.034931, 6.970896, 0.823673, 0, 0x0)
		Unit:CreateCustomWaypoint(3, -138.720352, 58.846767, 4.951912, 0.890432, 0, 0x0)
		Unit:CreateCustomWaypoint(4, -111.456299, 62.348598, 3.447638, 0.065764, 0, 0x0)
		Unit:CreateCustomWaypoint(5, -87.320633, 60.646305, 2.967573, 6.176163, 0, 0x0)
		Unit:CreateCustomWaypoint(6, -69.841942, 47.791355, 0.964065, 5.626387, 0, 0x0)
		Unit:SetMovementType(5)
	end
end

function OnCombat(Unit, Event)
	local say = math.random(1,3)
	if(say == 1) then
		Unit:PlaySoundToSet(10475)
		Unit:SendChatMessage(14, 0, "Pathetic mortals! You will pay dearly!")
	elseif(say == 2) then
		Unit:PlaySoundToSet(10476)
		Unit:SendChatMessage(14, 0, "I will break you!")
	else
		Unit:SendChatMessage(14, 0, "Finally, something to relieve the tedium.")
		Unit:PlaySoundToSet(10477)
	end
	local ref = self[tostring(Unit)]
	ref.fear = 25
	ref.acid = math.random(2,10)
	ref.enrage = 180
	Unit:RegisterAIUpdateEvent(1000)
end

function OnWipe(Unit, Event)
	self[tostring(Unit)] = nil
	Unit:RemoveAIUpdateEvent()
	if(Unit:IsAlive()) then
		Unit:Despawn(1000, 1)
	end
	Unit:DeleteWaypoints()
end

function OnKill(Unit, Event)
	local say = math.random(1,2)
	if(say == 1) then
		Unit:SendChatMessage(14, 0, "Do you fear death?")
		Unit:PlaySoundToSet(10478)
	else
		Unit:SendChatMessage(14, 0, "This is the part I enjoy most...")
		Unit:PlaySoundToSet(10479)
	end
end

function OnDeath(Unit, Event)
	Unit:PlaySoundToSet(10480)
	Unit:SendChatMessage(14, 0, "Do not...grow...overconfident, mortal.")
end

function AIUpdate(Unit, Event)
	local vars = self[tostring(Unit)]
	if(vars.banished) then
		if(#vars.ritualists == 0) then
			Unit:RemoveAllAuras()
			Unit:SetAttackable()
			Unit:DisableCombat(false)
			Unit:CreateCustomWaypoint(2, Unit:GetX()+math.cos(Unit:GetO())*15, Unit:GetY()+math.sin(Unit:GetO())*15, Unit:GetZ(), Unit:GetO(), 0, 0x100)
			Unit:CreateCustomWaypoint(3, -139.871170, -20.563589, 8.072030, 4.633859, 0, 0x100)
			Unit:CreateCustomWaypoint(4, -154.723740, -37.530266, 8.072030, 4.914246, 0, 0x100)
			Unit:CreateCustomWaypoint(5, -143.254257, -65.023735, 8.072030, 4.207390, 0, 0x100)
			Unit:CreateCustomWaypoint(6, -155.118866, -87.083763, 8.072562, 4.662920, 0, 0x100)
			Unit:CreateCustomWaypoint(7, -171.746841, -58.118092, 8.072562, 2.082886, 0, 0x100)
			Unit:CreateCustomWaypoint(8, -173.280182, -23.954927, 8.072562, 1.595939, 0, 0x100)
			Unit:CreateCustomWaypoint(9, -156.422501, -3.315071, 8.072562, 1.493837, 0, 0x100)
			Unit:CreateCustomWaypoint(10, -156.080643, 20.882515, 8.072562, 1.556669, 0, 0x100)
			Unit:SetMovementType(11)
			vars.banished = false
			Unit:RemoveAIUpdateEvent()
			Unit:DisableCombat(false)
		end
		return
	end
	vars.fear = vars.fear - 1
	vars.acid = vars.acid - 1
	if(vars.enrage ~= nil) then
		vars.enrage = vars.enrage - 1
	end
	if(vars.fear <= 0) then
		Unit:FullCastSpell(33547)
		vars.fear = 25
	elseif(vars.acid <= 0) then
		Unit:FullCastSpell(33551)
		vars.acid = math.random(10,20)
	elseif(vars.enrage ~= nil and vars.enrage <= 0) then
		Unit:FullCastSpell(46587)
		vars.enrage = nil
	end
end

RegisterUnitEvent(18731, 18, "OnSpawn")
RegisterUnitEvent(18731, 1, "OnCombat")
RegisterUnitEvent(18731, 2, "OnWipe")
RegisterUnitEvent(18731, 3, "OnKill")
RegisterUnitEvent(18731, 4, "OnDeath")
RegisterUnitEvent(18731, 21, "AIUpdate")
RegisterUnitEvent(18731, 19, "OnReachWp")

function RitualistOnCombat(Unit, Event, _, mAggro)
	self[tostring(Unit)] = {
		addle = math.random(15,30),
		missile = math.random(2,10),
		blast = math.random(5,15),
		buffet = math.random(15,30),
		nova = math.random(15,30),
		bolt = math.random(5,15),
		dispel_cd = 0,
		isHeroic = (mAggro:IsPlayer() and mAggro:IsHeroic())
	}
	Unit:RegisterAIUpdateEvent(1000)
	Unit:StopChannel()
end

function RitualistOnWipe(Unit, Event)
	self[tostring(Unit)] = nil
	Unit:RemoveAIUpdateEvent()
end

function RitualistOnDeath(Unit, Event)
	if(self[tostring(hellmaw)].ritualists) then
		for k,v in pairs(self[tostring(hellmaw)].ritualists) do
			if(tostring(Unit) == tostring(v) ) then
				table.remove(self[tostring(hellmaw)].ritualists,k)
				break
			end
		end
	end
end

function RitualistAIUpdate(Unit, Event)
	if(Unit:IsCasting()) then
		return
	end
	if(Unit:GetNextTarget() == nil) then 
		Unit:WipeThreatList()
		return
	end
	local vars = self[tostring(Unit)]
	vars.addle = vars.addle - 1
	vars.missile = vars.missile - 1
	vars.blast = vars.blast - 1
	vars.buffet = vars.buffet - 1
	vars.nova = vars.nova - 1
	vars.bolt = vars.bolt - 1
	if(vars.dispel_cd > 0 ) then
		vars.dispel_cd = vars.dispel_cd - 1
	end
	local target = Unit:GetRandomEnemy()
	if(vars.addle <= 0) then
		if(Unit:GetDistanceYards(target) > 20) then
			target = Unit:GetClosestEnemy()
		end
		Unit:FullCastSpellOnTarget(33487, target)
		vars.addle = math.random(20,30)
	elseif(vars.missile <= 0) then
		if(vars.isHeroic) then
			Unit:FullCastSpellOnTarget(38364, target)
		else
			Unit:FullCastSpellOnTarget(33833, target)
		end
		vars.missle = math.random(10,15)
	elseif(vars.blast <= 0) then
		if(vars.isHeroic) then
			Unit:FullCastSpellOnTarget(20795, target)
		else
			Unit:FullCastSpellOnTarget(14145, target)
		end
		vars.blast = math.random(10,15)
	elseif(vars.buffet <= 0) then
		Unit:FullCastSpellOnTarget(9574, target)
		vars.buffet = math.random(15,30)
	elseif(vars.nova <= 0) then
		if(vars.isHeroic) then
			Unit:FullCastSpell(15532)
		else
			Unit:FullCastSpell(15063)
		end
		vars.nova = math.random(15,30)
	elseif(vars.bolt <= 0) then
		if(vars.isHeroic) then
			Unit:FullCastSpellOnTarget(15497, target)
		else
			Unit:FullCastSpellOnTarget(12675, target)
		end
		vars.bolt = math.random(5,10)
	elseif(vars.dispel_cd <= 0 and 	Unit:HasNegativeAura()) then
		Unit:FullCastSpell(17201)
		vars.dispel_cd = math.random(10,20)
	end
end

RegisterUnitEvent(18794, 1, "RitualistOnCombat")
RegisterUnitEvent(18794, 2, "RitualistOnWipe")
RegisterUnitEvent(18794, 21, "RitualistAIUpdate")
RegisterUnitEvent(18794, 4, "RitualistOnDeath")