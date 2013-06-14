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
WorldDBQuery("DELETE FROM ai_agents WHERE entry = 18371;")

function OnCombat(Unit, Event, _,mAggro)
	self[tostring(Unit)] = {
		bite = math.random(8,12),
		inhibit = math.random(2,5),
		attract = math.random(20,30),
		f_fire = 2,
		isHeroic = (mAggro:IsPlayer() and mAggro:IsHeroic())
	}
	Unit:RegisterAIUpdateEvent(1000)
end

function OnWipe(Unit, Event)
	Unit:RemoveAIUpdateEvent()
	Unit:RemoveEvents()
	self[tostring(Unit)] = nil
	Unit:DisableCombat(false)
end

function AIUpdate(Unit, Event)
	if(Unit:IsCasting()) then
		return
	end
	if(Unit:GetNextTarget() == nil) then
		Unit:WipeThreatList()
		return
	end
	local vars = self[tostring(Unit)]
	vars.bite = vars.bite - 1
	vars.inhibit = vars.inhibit - 1
	vars.attract = vars.attract - 1
	vars.f_fire = vars.f_fire - 1
	if(vars.f_fire <= 0) then
		FocusFire(Unit,1)
		vars.f_fire = math.random(20,25) +3
	elseif(vars.inhibit <= 0) then
		Unit:FullCastSpell(32264)
		vars.inhibit = math.random(2,5)
	elseif(vars.bite <= 0) then
		if(vars.isHeroic) then
			Unit:FullCastSpell(39382)
		else
			Unit:FullCastSpell(36383)
		end
		vars.bite = math.random(8,12)
	elseif(vars.attract <= 0) then
		Unit:FullCastSpell(32265)
		vars.bite = 0
		vars.attract = math.random(20,30)
	end
end

function FocusFire(Unit, Event, spell_phase)
	if(spell_phase == 1) then
		local target = Unit:GetRandomEnemy()
		Unit:BossRaidEmote( Unit:GetName().." focuses his energy on "..target:GetName() )
		Unit:DisableCombat(true)
		Unit:ChannelSpell(43515, target)
		Unit:SetChannelTarget(target)
		Unit:RegisterLuaEvent(FocusFire, 4000, 1, 2)
	elseif(spell_phase == 2) then
		local target = Unit:GetChannelTarget()
		Unit:SetChannelTarget(nil)
		local focus = target:SpawnLocalCreature(18374, Unit:GetFaction(), 0)
		focus:SetUnselectable()
		focus:SetUnattackable()
		focus:DisableCombat(true)
		focus:SetModel(17200)
		Unit:FullCastSpellOnTarget(32300, focus)
		Unit:DisableCombat(false)
		Unit:SetCreator(focus)
		Unit:RegisterLuaEvent(FocusFire, 1500, 1, 3)
	elseif(spell_phase == 3) then
		local focus = Unit:GetCreator()
		Unit:SetCreator(nil)
		if(self[tostring(Unit)].isHeroic) then
			for i = 1,math.random(3,6) do
				focus:EventCastSpell(focus, 20203, i*500, 1)
			end
		else
			for i = 1,math.random(3,6) do
				focus:EventCastSpell(focus, 23462, i*500, 1)
			end
		end
		focus:Despawn(3500, 0)
	end
end

function FocusFire_Explode(Unit, Event, spell)
	Unit:FullCastSpell(spell)
end

RegisterUnitEvent(18371, 1, "OnCombat")
RegisterUnitEvent(18371, 2, "OnWipe")
RegisterUnitEvent(18371, 21, "AIUpdate")