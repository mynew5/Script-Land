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

function OnCombat(Unit, Event)
	self[tostring(Unit)] = {
		ribbon = math.random(2,5),
		scream = math.random(5,10),
		avatar = true,
		ssteal = 1
	}
	local say_text = math.random(1,3)
	if(say_text == 1) then
		Unit:SendChatMessage(14, 0, "You will pay with your life!")
		Unit:PlaySoundToSet(10513)
	elseif(say_text == 2) then
		Unit:SendChatMessage(14, 0, "There's no turning back now!")
		Unit:PlaySoundToSet(10514)
	else
		Unit:SendChatMessage(14, 0, "Serve your penitence!")
		Unit:PlaySoundToSet(10515)
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
		Unit:SendChatMessage(14, 0, "These walls will be your doom.")
		Unit:PlaySoundToSet(10516)
	else
		Unit:SendChatMessage(14, 0, "Now you will stay for eternity")
		Unit:PlaySoundToSet(10517)
	end
end

function OnDeath(Unit, Event)
	Unit:SendChatMessage(14, 0, "This is... where I belong.")
	Unit:PlaySoundToSet(10518)
	Unit:RegisterLuaEvent(SpawnDore, 10000, 1)
end

function AIUpdate(Unit, Event)
	if(Unit:IsCasting()) then
		return
	end
	if(Unit:GetNextTarget() == nil) then
		Unit:WipeThreatList()
	end
	local vars = self[tostring(Unit)]
	vars.ribbon = vars.ribbon -1
	vars.scream = vars.scream - 1
	vars.ssteal = vars.ssteal - 1
	if(vars.ribbon <= 0) then
		local target = Unit:GetRandomEnemy()
		Unit:FullCastSpellOnTarget(32422, target)
		vars.ribbon = math.random(10,20)
	elseif(vars.scream <= 0) then
		Unit:FullCastSpell(32421)
		vars.scream = math.random(20,30)
		local second_hated = Unit:GetSecondHated()
		if(second_hated) then
			Unit:SetNextTarget( Unit:GetSecondHated())
		end
	elseif(vars.ssteal <= 0) then
		local say_text = math.random(1,3)
		if(say_text == 1) then
			Unit:SendChatMessage(14, 0, "Rise, my fallen brothers. Take form and fight!")
			Unit:PlaySoundToSet(10512)
		elseif(say_text == 2) then
			Unit:SendChatMessage(14, 0, "Stare into the darkness of your soul.")
			Unit:PlaySoundToSet(10511)
		else
			Unit:SendChatMessage(14, 0, "Let your mind be clouded.")
			Unit:PlaySoundToSet(10510)
		end
		local target = Unit:GetRandomEnemy()
		Unit:FullCastSpellOnTarget(32346, target)
		local soul = Unit:SpawnLocalCreature(18441, Unit:GetFaction(), 0)
		soul:SetCreator(target)
		vars.ssteal = math.random(20,30)
	end
	if(vars.avatar and Unit:GetHealthPct() <= 25) then
		Unit:FullCastSpell(32424)
		vars.avatar = false
	end
end

function SpawnDore(Unit, Event)
local dore = Unit:SpawnCreature(19412, 27.188200, -388.435730, 26.584007, 6.282297, 0, 0)
	dore:FullCastSpell(7765)
end

RegisterUnitEvent(18373, 1, "OnCombat")
RegisterUnitEvent(18373, 2, "OnWipe")
RegisterUnitEvent(18373, 3, "OnTargetKill")
RegisterUnitEvent(18373, 4, "OnDeath")
RegisterUnitEvent(18373, 21, "AIUpdate")

function StolenSoulOnCombat(Unit, Event)
local class = Unit:GetCreator():GetPlayerClass()
	Unit:FullCastSpell(32395)
	if(class == "Warrior") then
		Unit:RegisterLuaEvent(StolenSoul_Cast, math.random(15,20)*1000, 0, 37335, 0x2)
	elseif(class == "Paladin") then
		Unit:RegisterLuaEvent(StolenSoul_Cast, math.random(25,30)*1000, 0, 37369, 0x2)
	elseif(class == "Hunter") then
		Unit:RegisterLuaEvent(StolenSoul_Cast, math.random(15,20)*1000, 0, 37368, 0x1)
	elseif(class == "Druid") then
		Unit:RegisterLuaEvent(StolenSoul_Cast, 1000, 0, 37368, 0x3)
		Unit:RegisterLuaEvent(StolenSoulAI_Runner, 5000, 0)
	elseif(class == "Warlock") then
		Unit:RegisterLuaEvent(StolenSoul_Cast, 5000, 0, 37334, 0x3)
	elseif(class == "Mage") then
		Unit:RegisterLuaEvent(StolenSoul_Cast, 3500, 0, 37329, 0x3)
	elseif(class == "Rogue") then
		Unit:RegisterLuaEvent(StolenSoul_Cast, math.random(3,5)*1000, 0, 37331, 0x2)
	elseif(class == "Shaman") then
		Unit:RegisterLuaEvent(StolenSoul_Cast, math.random(5,8)*1000, 0, 37322, 0x3)
	elseif(class == "Priest") then
		Unit:RegisterLuaEvent(StolenSoul_Cast, 3500, 0, 37330, 0x3)
		Unit:RegisterLuaEvent(StolenSoul_Cast, math.random(20,30)*1000, 0, 22884, 0x1)
	elseif(class == "Death Knight") then
		Unit:RegisterLuaEvent(StolenSoul_Cast, math.random(10,15)*1000, 0, 58839, 0x2)
	end
end

function StolenSoulOnWipe(Unit, Event)
	Unit:StopMovement(1000)
	Unit:RemoveLuaEvents()
	Unit:FullCastSpell(33326)
	Unit:Despawn(1000, 0)
end

function StolenSoul_Cast(Unit, Event, spell, cast_flags)
	if(Unit:GetNextTarget() == nil) then
		Unit:WipeThreatList()
		return
	end
	if(cast_flags == 0x1) then
		Unit:FullCastSpell(spell)
	elseif(cast_flags == 0x2) then
		Unit:FullCastSpellOnTarget(spell, Unit:GetMainTank())
	elseif(cast_flags == 0x3) then
		Unit:FullCastSpellOnTarget(spell, Unit:GetRandomEnemy())
	end
end

function StolenSoulAI_Runner(Unit, Event)
	if(math.random(1,2) == 1) then
		Unit:MoveTo(Unit:GetRandomEnemy():GetX()+math.cos(math.pi)*5, Unit:GetRandomEnemy():GetY()+math.sin(math.pi)*5, Unit:GetZ(), Unit:GetO())
	else
		Unit:MoveTo(Unit:GetX()+math.cos(math.random(0,360))*10, Unit:GetY()+math.sin(math.random(0,360))*10, Unit:GetZ(), Unit:GetO())
	end
end

RegisterUnitEvent(18441, 1, "StolenSoulOnCombat")
RegisterUnitEvent(18441, 2, "StolenSoulOnWipe")

function AvatarOnSpawn(Unit, Event)
local creator = Unit:GetLocalCreature(18373)
	if(creator ~= nil) then
		Unit:AttackReaciton(creator:GetNextTarget(), 1, 0)
	else
		Unit:AttackReaction( Unit:GetClosestEnemy(), 1, 0)
	end
	Unit:RegisterLuaEvent(StolenSoul_Cast, math.random(15,20)*1000, 0, 16856, 0x2)
	Unit:RegisterLuaEvent(StolenSoul_Cast, math.random(10,15)*1000, 0, 16145, 0x2)
end

function AvatarOnWipe(Unit, Event)
	Unit:RemoveLuaEvents()
end

RegisterUnitEvent(18478, 18, "AvatarOnSpawn")
RegisterUnitEvent(18478, 2, "AvatarOnWipe")