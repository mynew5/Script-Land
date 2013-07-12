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

function OnCombat(Unit, _, mTarget)
	self[tostring(Unit)] = {
		shock = math.random(2,6),
		chain = math.random(10,15),
		summon_phase = 1,
		isHeroic = (mTarget:IsPlayer() and mTarget:IsHeroic())
	}
	Unit:RegisterAIUpdateEvent(1000)
	local say_text = math.random(1,3)
	if(say_text == 1) then
		Unit:SendChatMessage(14, 0, "Hrrmm.. Time to.. hrrm.. make my move.")
		Unit:PlaySoundToSet(10503)
	elseif(say_text == 2) then
		Unit:SendChatMessage(14, 0, "Nice pets..hrm.. Yes!")
		Unit:PlaySoundToSet(10504)
	else
		Unit:SendChatMessage(14, 0, "Nice pets have.. weapons. No so...nice.")
		Unit:PlaySoundToSet(10505)
	end
end

function OnWipe(Unit)
	Unit:RemoveAIUpdateEvent()
	self[tostring(Unit)] = nil
end

function OnTargetKill(Unit)
	local say_text = math.random(1,2)
	if(say_text == 1) then
		Unit:SendChatMessage(14, 0, "Death.. meeting life is..")
		Unit:PlaySoundToSet(10506)
	else
		Unit:SendChatMessage(14, 0, "Uhn... Be free..")
		Unit:PlaySoundToSet(10507)
	end
end

function OnDeath(Unit)
	Unit:SendChatMessage(14, 0, "No more life... hrm. No more pain.")
	Unit:PlaySoundToSet(10508)
end

function AIUpdate(Unit)
	if(Unit:IsCasting()) then
		return
	end
	if( Unit:GetNextTarget() == nil) then
		Unit:WipeThreatList()
		return
	end
	local vars = self[tostring(Unit)]
	vars.shock = vars.shock -1
	vars.chain = vars.chain - 1
	if(vars.chain <= 0) then
		if(vars.isHeroic) then
			Unit:FullCastSpellOnTarget(15659, Unit:GetRandomEnemy())
		else
			Unit:FullCastSpellOnTarget(15305, Unit:GetRandomEnemy())
		end
		vars.chain = math.random(10,20)
	elseif(vars.shock <=0) then
		local spelltocast = math.random(1,4)
		if(spelltocast == 1) then
			if(vars.isHeroic) then
				Unit:FullCastSpellOnTarget(38135, Unit:GetRandomEnemy())
			else
				Unit:FullCastSpellOnTarget(33534, Unit:GetRandomEnemy())
			end
		elseif(spelltocast == 2) then
			if(vars.isHeroic) then
				Unit:FullCastSpellOnTarget(15616, Unit:GetRandomEnemy())
			else
				Unit:FullCastSpellOnTarget(15039, Unit:GetRandomEnemy())
			end
		elseif(spelltocast == 3) then
			if(vars.isHeroic) then
				Unit:FullCastSpellOnTarget(21401, Unit:GetRandomEnemy())
			else
				Unit:FullCastSpellOnTarget(12548, Unit:GetRandomEnemy())
			end
		else
			if(vars.isHeroic) then
				Unit:FullCastSpellOnTarget(38136, Unit:GetRandomEnemy())
			else
				Unit:FullCastSpellOnTarget(33620, Unit:GetRandomEnemy())
			end
		end
		vars.shock = math.random(5,15)
	else
		local hp = Unit:GetHealthPct()
		local asummon = vars.summon_phase
		if(((hp <= 90) and (asummon == 1)) or ((hp <= 55) and (asummon == 2)) or ((hp <= 10) and (asummon == 3))) then
			local summon_spells = {33538, 33537, 33539, 33540}
			local angle = 0
			for i = 1,4 do
				local radius = math.random(5, 10)
				local x = Unit:GetX()+math.cos(math.rad(angle))*radius
				local y = Unit:GetY()+math.sin(math.rad(angle))*radius
				Unit:CastSpellAoF(x, y, Unit:GetZ(), summon_spells[i])
				angle = angle+90
			end
			Unit:SendChatMessage(14, 0, "I have pets of my own!")
			Unit:PlaySoundToSet(10502)
			vars.summon_phase = vars.summon_phase + 1
		end
	end
end

RegisterUnitEvent(18472, 1, "OnCombat")
RegisterUnitEvent(18472, 2, "OnWipe")
RegisterUnitEvent(18472, 3, "OnTargetKill")
RegisterUnitEvent(18472, 4, "OnDeath")
RegisterUnitEvent(18472, 21, "AIUpdate")

function Elemental_Cast(Unit, spell)
	Unit:FullCastSpell(spell)
end

function Elemental_OnSpawn(Unit)
	 if(Unit:GetEntry() == 19205) then
		Unit:RegisterLuaEvent(Elemental_Cast, math.random(7,15)*1000, 0, 38138)
	elseif(Unit:GetEntry() == 19203) then
		Unit:RegisterLuaEvent(Elemental_Cast, math.random(7,15)*1000, 0, 38141)
	elseif(Unit:GetEntry() == 19204) then
		Unit:RegisterLuaEvent(Elemental_Cast, math.random(7,15)*1000, 0, 38142)
	else
		Unit:RegisterLuaEvent(Elemental_Cast, math.random(7,15)*1000, 0, 38143)
	end
	if(Unit:GetCreator()) then
		Unit:AttackReaction(Unit:GetCreator():GetNextTarget(), 1, 0)
	else
		Unit:AttackReaction(Unit:GetRandomEnemy(), 1, 0)
	end
end

function Elemental_OnWipe(Unit)
	Unit:RemoveLuaEvents()
	Unit:Despawn(1000, 0)
end

RegisterUnitEvent(19205, 18, "Elemental_OnSpawn")
RegisterUnitEvent(19205, 2, "Elemental_OnWipe")
RegisterUnitEvent(19203, 18, "Elemental_OnSpawn")
RegisterUnitEvent(19203, 2, "Elemental_OnWipe")
RegisterUnitEvent(19204, 18, "Elemental_OnSpawn")
RegisterUnitEvent(19204, 2, "Elemental_OnWipe")
RegisterUnitEvent(19206, 18, "Elemental_OnSpawn")
RegisterUnitEvent(19206, 2, "Elemental_OnWipe")