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

function OnSpawn(Unit, Event)
local chest = Unit:GetGameObjectNearestCoords(80.069473, 287.675293, 26.629349, 187372)
	if(chest) then
		chest:SetUnclickable()
	end
end
function OnCombat(Unit, Event, _, mTarget)
	self[tostring(Unit)] = {
		volley = math.random(5,10),
		explosion = math.random(20,30),
		blink = math.random(20,30),
		poly = math.random(15,30),
		shield = math.random(30,45),
		slow = math.random(15,30),
		isHeroic = (mTarget:IsPlayer() and mTarget:IsHeroic())
	}
	local say_text = math.random(1,3)
	if(say_text == 1) then
		Unit:SendChatMessage(14, 0, "Mmmm you make war on Ikiss?")
		Unit:PlaySoundToSet(10554)
	elseif(say_text == 2) then
		Unit:SendChatMessage(14, 0, "Ikiss cut you pretty slice you yes!")
		Unit:PlaySoundToSet(10555)
	else
		Unit:SendChatMessage(14, 0, "No escape for you!")
		Unit:PlaySoundToSet(10556)
	end
	Unit:RegisterAIUpdateEvent(1000)
end

function OnWipe(Unit, Event)
	Unit:RemoveAIUpdateEvent()
	self[tostring(Unit)] = nil
end

function OnKill(Unit, Event)
	local say = math.random(1,2)
	if(say) then
		Unit:SendChatMessage(14, 0, "Mmmmmmmmmm!")
		Unit:PlaySoundToSet(10558)
	else
		Unit:SendChatMessage(14, 0, "You die! Stay away from trinkets!")
		Unit:PlaySoundToSet(10559)
	end
end

function OnDeath(Unit, Event)
	Unit:SendChatMessage(14, 0, "Ikiss will not... die!")
	Unit:PlaySoundToSet(10560)
	local chest = Unit:GetGameObjectNearestCoords(80.069473, 287.675293, 26.629349, 187372)
	if(chest) then
		chest:SetClickable()
	end
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
	vars.volley = vars.volley -1
	vars.explosion = vars.explosion - 1
	vars.blink = vars.blink - 1
	vars.poly = vars.poly - 1
	vars.shield = vars.shield - 1
	vars.slow = vars.slow - 1
	if(vars.explosion <= 0) then
		if(vars.isHeroic) then
			Unit:FullCastSpell(40425)
		else
			Unit:FullCastSpell(38197)
		end
		vars.explosion = math.random(20,30)
	elseif(vars.volley <= 0) then
		if(vars.isHeroic) then
			Unit:FullCastSpell(40424)
		else
			Unit:FullCastSpell(35059)
		end
		vars.volley = math.random(5,10)
	elseif(vars.blink <= 0) then
		Unit:FullCastSpell(38194)
		vars.explosion = 1
		vars.blink = math.random(30,45)
	elseif(vars.shield <= 0) then
		vars.shield = math.random(30,45)
		Unit:FullCastSpell(38151)
	elseif((vars.slow <= 0) and (vars.isHeroic)) then
		Unit:FullCastSpellOnTarget(35032, Unit:GetRandomEnemy())
		vars.slow = math.random(15,30)
	elseif(vars.poly <= 0) then
		if(vars.isHeroic) then
			Unit:FullCastSpellOnTarget(43309, Unit:GetRandomEnemy())
		else
			Unit:FullCastSpellOnTarget(38245, Unit:GetRandomEnemy())
		end
		vars.poly = math.random(10,15)
	end
end

RegisterUnitEvent(18473, 1, "OnCombat")
RegisterUnitEvent(18473, 2, "OnWipe")
RegisterUnitEvent(18473, 3, "OnKill")
RegisterUnitEvent(18473, 4, "OnDeath")
RegisterUnitEvent(18473, 21, "AIUpdate")