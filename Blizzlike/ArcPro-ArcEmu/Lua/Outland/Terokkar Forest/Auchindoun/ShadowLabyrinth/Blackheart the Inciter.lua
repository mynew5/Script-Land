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
	local say = math.random(1,6)
	if(say == 1) then
		Unit:SendChatMessage(14, 0, "All flesh must burn!")
		Unit:PlaySoundToSet(10482)
	elseif(say == 2) then
		Unit:SendChatMessage(14, 0, "All creation must be unmade!")
		Unit:PlaySoundToSet(10483)
	elseif(say == 3) then
		Unit:SendChatMessage(14, 0, "Power will be yours!")
		Unit:PlaySoundToSet(10484)
	elseif(say == 4) then
		Unit:SendChatMessage(14, 0, "Be ready for Dark One's return.")
		Unit:PlaySoundToSet(10492)
	elseif(say == 5) then
		Unit:SendChatMessage(14, 0, "So we have place new universe!")
		Unit:PlaySoundToSet(10493)
	else
		Unit:SendChatMessage(14, 0, "Dark One... promise...")
		Unit:PlaySoundToSet(10494)
	end
end

function OnCombat(Unit, Event)
	self[tostring(Unit)] = {
		stomp = math.random(15,30),
		charge = math.random(15,30),
		incite = 20
	}
	local say = math.random(1,5)
	if(say == 1) then
		Unit:PlaySoundToSet(10486)
		Unit:SendChatMessage(14, 0, "You'll be sorry!")
	elseif(say == 2) then
		Unit:PlaySoundToSet(10487)
		Unit:SendChatMessage(14, 0, "Time for fun!")
	elseif(say == 3) then
		Unit:PlaySoundToSet(10488)
		Unit:SendChatMessage(14, 0, "I see dead people!")
	elseif(say == 4) then
		Unit:PlaySoundToSet(10497)
		Unit:SendChatMessage(14, 0, "Time to kill!")
	else
		Unit:PlaySoundToSet(10498)
		Unit:SendChatMessage(14, 0, "YOU be dead people.")
	end
	Unit:RegisterAIUpdateEvent(1000)
	for _,v in pairs(Unit:GetInRangeFriends()) do
		if( Unit:GetDistanceYards(v) <= 100) then
			v:AttackReaction(v:GetRandomEnemy(), 1, 0)
		end
	end
end

function OnWipe(Unit, Event)
	self[tostring(Unit)] = nil
	Unit:RemoveAIUpdateEvent(1000)
	Unit:RemoveEvents()
end

function OnKill(Unit, Event)
	local say = math.random(1,4)
	if(say == 1) then
		Unit:PlaySoundToSet(10489)
		Unit:SendChatMessage(14, 0, "NO coming back for you!")
	elseif(say == 2) then
		Unit:PlaySoundToSet(10490)
		Unit:SendChatMessage(14, 0, "Nice try!")
	elseif(say == 3) then
		Unit:PlaySoundToSet(10499)
		Unit:SendChatMessage(14, 0, "Now you gone for good!")
	else
		Unit:PlaySoundToSet(10500)
		Unit:SendChatMessage(14, 0, "You fail!")
	end
end

function OnDeath(Unit, Event)
	local say = math.random(1,2)
	if(say == 1) then
		Unit:PlaySoundToSet(10491)
		Unit:SendChatMessage(14, 0, "This no... good..")
	else
		Unit:PlaySoundToSet(10501)
		Unit:SendChatMessage(14, 0, "<screaming>")
	end
	local gate = Unit:GetGameObjectNearestCoords(-375.146210, -39.748650, 12.688822, 183296)
	if(gate) then
		gate:Open()
	end
end

function InciteEvent(Unit, Event, phase)
	if(phase == 1) then
		Unit:FullCastSpell(33676)
		Unit:RegisterLuaEvent(InciteEvent, 3000, 0, 2)
	elseif(phase == 2) then
		Unit:SetNextTarget(Unit:GetRandomEnemy())
		Unit:Emote(LCF.EMOTE_ONESHOT_LAUGH,0)
	else
		Unit:RemoveEvents()
		Unit:DisableMelee(false)
		Unit:AttackReaction(Unit:GetRandomEnemy(), 1, 0)
		Unit:RegisterAIUpdateEvent(1000)
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
	vars.stomp = vars.stomp - 1
	vars.charge = vars.charge - 1
	vars.incite = vars.incite - 1
	if(vars.incite <= 0) then
		vars.incite = 40
		Unit:RemoveAIUpdateEvent()
		Unit:DisableMelee(true)
		Unit:PlaySoundToSet(10487)
		Unit:SendChatMessage(14, 0, "Time for fun!")
		Unit:RegisterLuaEvent(InciteEvent, 3000, 1, 1)
		Unit:RegisterLuaEvent(InciteEvent, 15000, 1, 3)
	elseif(vars.stomp <= 0) then
		Unit:FullCastSpell(33707)
		vars.stomp = math.random(20,30)
		vars.charge = 1
	elseif(vars.charge <= 0) then
		Unit:FullCastSpellOnTarget(33709, Unit:GetRandomEnemy())
		vars.charge = math.random(20,30)
	end
end

RegisterUnitEvent(18667, 18, "OnSpawn")
RegisterUnitEvent(18667, 1, "OnCombat")
RegisterUnitEvent(18667, 2, "OnWipe")
RegisterUnitEvent(18667, 3, "OnKill")
RegisterUnitEvent(18667, 4, "OnDeath")
RegisterUnitEvent(18667, 21, "AIUpdate")

function InciteChaosEffect(_, spell)
	for _,v in pairs(spell:GetCaster():GetInRangeEnemies()) do
		spell:GetCaster():FullCastSpellOnTarget(33684, v)
		if(v:IsPlayer()) then
			v:UseAI(true)
		end
		v:FlagFFA(true)
		v:RegisterLuaEvent(InciteChaosEnd, 15000, 1)
	end
end

function InciteChaosEnd(victim)
	if(victim:IsPlayer()) then
		victim:UseAI(false)
	end
	victim:FlagFFA(false)
end

RegisterDummySpell(33676, "InciteChaosEffect")